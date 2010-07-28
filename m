From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Jul 2010 09:50:50 +0200
Subject: [Buildroot] randpackageconfig builds
Message-ID: <87sk34f3j9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

With help of the nice people from the GCC compile farm
(http://gcc.gnu.org/wiki/CompileFarm) I have been doing 'make
randpackageconfig' builds continously for the last week on a fast
machine, and have now done around 250 iterations. The config I have used
has the following toolchain config:

arm926t, EABI, 2.6.34 headers, uClibc 0.9.31, binutils 2.20.1, gcc 4.4.4

I've simply used a script like this:

<cut>
#!/bin/sh
# do buildroot test

DIR=/scratch/peko

rm -rf $DIR
mkdir -p $DIR
cp ~/.config $DIR/

# limit the amount of options enabled
export KCONFIG_PROBABILITY=20

STAMP=$(date '+%F_%H-%M-%S')
git pull >~/logs/active/$STAMP.log 2>&1
yes ''|make O=$DIR randpackageconfig >/dev/null
cp $DIR/.config ~/logs/active/$STAMP.config
if yes ''|make O=$DIR >>~/logs/active/$STAMP.log 2>&1;
then
	echo "$STAMP ok"
	OUT=~/logs/ok
else
	echo "$STAMP fail"
	OUT=~/logs/fail
fi

gzip -9 ~/logs/active/$STAMP.log
mv ~/logs/active/$STAMP.* $OUT
</cut>

I've now put these logs online on:

http://buildroot.net/~jacmet/logs

Now, these are pretty big and cumbersome to read, so I've processed them
a bit:

for i in $(find ~/logs/fail -name '*.log.gz'); do ~/bin/sort-logs $i; done

where sort-logs is something like:
<cut>
#!/bin/sh
# find unique logs and keep count of them

md5=$(zcat $1|tail|md5sum|awk '{ print $1 }')
file=$md5.count
log=$md5.txt

if [ -e $file ];
then
	count=$(( $(cat $file) + 1 ))
	echo $count > $file
else
	echo 1 > $file
	zcat $1|tail >$log
fi
</cut>

we get 65 unique errors. These can be seen here:

http://buildroot.net/~jacmet/logs/unique/

We can also look a bit closer at how often each bug has triggered:

for i in *count; do
    log=$(tail -n 1 ${i%.count}.txt|sed 's~.*/build/\([^]]*\)].*~\1~');
    count=$(cat $i); echo -e "$count\t$log";
done|sort -n

1	dialog-1.1-20100428/.stamp_configured
1	fltk-1.1.7/.stamp_built
1	gmpc-0.17.0/.stamp_configured
1	gst-plugins-base-0.10.25/.stamp_built
1	gst-plugins-base-0.10.25/.stamp_built
1	gst-plugins-good-0.10.16/.stamp_built
1	gtk+-1.2.10/gtk/.libs/libgtk.a
1	host-xlib_libXfont-1.4.1/.stamp_built
1	ipsec-tools-0.7.3/.stamp_built
1	libevent-1.4.12/.stamp_built
1	libevent-1.4.12/.stamp_built
1	libglib2-2.24.1/.stamp_configured
1	libgtk2-2.12.12/.stamp_configured
1	libgtk2-2.12.12/.stamp_configured
1	libxcb-1.5/.stamp_built
1	libxcb-1.5/.stamp_built
1	ltrace-0.5/ltrace
1	mysql_client-5.1.47/.stamp_built
1	mysql_client-5.1.47/.stamp_built
1	netperf-2.4.5/.stamp_built
1	netperf-2.4.5/.stamp_built
1	pcmanfm-0.3.5.9/.stamp_configured
1	php-5.2.13/.stamp_built
1	php-5.2.13/.stamp_built
1	php-5.2.13/.stamp_built
1	php-5.2.13/.stamp_built
1	php-5.2.13/.stamp_configured
1	quagga-0.99.16/.stamp_built
1	samba-3.3.12/.stamp_configured
1	sdl_gfx-2.0.19/.stamp_configured
1	SDL_net-1.2.7/.stamp_configured
1	startup-notification-0.9/.stamp_configured
1	startup-notification-0.9/.stamp_configured
1	vsftpd-2.0.7/vsftpd
1	xserver_xorg-server-1.7.5/.stamp_built
2	dash-0.5.5.1/.stamp_built
2	fltk-1.1.7/.stamp_built
2	netperf-2.4.5/.stamp_built
2	php-5.2.13/.stamp_configured
2	quagga-0.99.16/.stamp_built
2	quagga-0.99.16/.stamp_configured
2	torsmo-0.18/.stamp_built
2	xlib_libpciaccess-0.11.0/.stamp_built
3	diffutils-2.8.1/.stamp_built
3	ng-spice-rework-17/.stamp_built
3	proftpd-1.3.1/proftpd
3	swfdec-0.8.4/.stamp_staging_installed
3	which-2.20/.stamp_built
4	host-ruby-1.9.1-p129/.stamp_host_installed
4	host-ruby-1.9.1-p129/.stamp_host_installed
4	libdnet-1.11/.stamp_built
4	pango-1.28.0/.stamp_built
4	tcl-8.4.19/.stamp_built
6	libglib2-2.22.5/.stamp_configured
6	xserver_xorg-server-1.7.5/.stamp_configured
7	libglib2-2.22.5/.stamp_built
7	libglib2-2.22.5/.stamp_configured
9	libdrm-2.4.19/.stamp_built
10	fltk-1.1.7/.stamp_built
10	gob2-2.0.15/.stamp_built
10	ipsec-tools-0.7.3/.stamp_built
10	libglib2-2.22.5/.stamp_configured
10	luafilesystem-1.5.0/.stamp_built
11	avahi-0.6.27/.stamp_configured
28	classpath-0.98/.stamp_configured

Most, but not all of the issues have been resolved so far. Avahi will be
fixed when we bump the gtk version, and classpath has been marked as broken.

I would appreciate if the other developers could take a look at these
build failures and help fix them.

Thanks!

-- 
Bye, Peter Korsgaard
