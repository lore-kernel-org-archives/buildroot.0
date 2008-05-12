From: hartleys <hartleys@visionengravers.com>
Date: Mon, 12 May 2008 13:26:32 -0400
Subject: [Buildroot] httpd question
In-Reply-To: <6311fe0b0805120954pc3ce04ep84c3ac483b58b550@mail.gmail.com>
References: <1CF6EDDF0820924DA43C9A52FE7325950B569C1A@MI8NYCMAIL17.Mi8.com>
	<20080509204814.1151246e.tonyb@sysdev.org>
	<1CF6EDDF0820924DA43C9A52FE7325950B5F057D@MI8NYCMAIL17.Mi8.com>
	<6311fe0b0805120954pc3ce04ep84c3ac483b58b550@mail.gmail.com>
Message-ID: <1CF6EDDF0820924DA43C9A52FE7325950B5F09F5@MI8NYCMAIL17.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I don't actually have a /etc/init.d/ directory.  There is only one
script (/etc/rc.sysinit) that gets called at boot time.
 
My /etc/inittab starts up the system with a couple mounts and setting up
lo then calling the  rc.sysinit script.
 
# /etc/inittab
# Startup the system
::sysinit:/bin/mount -t proc none /proc
::sysinit:/bin/mount -t usbfs usbfs /proc/bus/usb
::sysinit:/bin/mount -t sysfs none /sys
::sysinit:/bin/mount -t devpts devpts /dev/pts
::sysinit:/sbin/ifconfig lo 127.0.0.1 up
::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
::sysinit:/etc/rc.sysinit
 
*snip*
 
My rc.sysinit sets the PATH, does a couple other mounts, then starts the
following:
 
syslogd -C m 0
klogd
udhcpc -i eth0 -b -p /var/run/edhcpc.eth0.pid >/dev/null 2>&1
inetd
crond
 
A 'ps' shows that initd is running. Also telnet is working fine.
 
This was working fine with busybox-1.1.3. It stopped working when I went
to the latest busybox 1.10.2.
 
Hartley
 
 
________________________________

From: rexonator@gmail.com [mailto:rexonator at gmail.com] On Behalf Of Rex
Ashbaugh
Sent: Monday, May 12, 2008 9:54 AM
To: hartleys
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] httpd question


what scripts are in your /etc/init.d/ directory?
do you have the inetd daemon installed?
-Rex


On Mon, May 12, 2008 at 9:15 AM, hartleys <hartleys@visionengravers.com>
wrote:


	On Friday, May 09, 2008 9:48 PM, Tony Borras wrote:
	> > when I try to access the web interface I get the following
message
	in
	> > my browser:
	> >
	> > httpd: bind: Address already in use
	> >
	
	> > For the life of me I can't figure out what might already be
bound to
	
	> > port 80. Any ideas?
	>
	> try:   nmap -p80 localhost
	>
	> or instead of localhost the name or ip of your host.
	
	I don't think nmap is available as a package in buildroot. At
least I
	can't locate it.
	
	_______________________________________________
	buildroot mailing list
	buildroot at uclibc.org
	http://busybox.net/mailman/listinfo/buildroot
	


-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080512/aa4b8ffe/attachment.htm 
