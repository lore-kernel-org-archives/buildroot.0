From: Mauro Condarelli <mc5686@mclink.it>
Date: Thu, 11 Feb 2016 21:08:21 +0100
Subject: [Buildroot] How do folks add packages to an existing rootfs
 during development?
In-Reply-To: <CAF_dkJDw95gyf3WFhfy7_zPgD05W4N0kTmGFLJbWcTCRwj1uKw@mail.gmail.com>
References: <CAF_dkJDw95gyf3WFhfy7_zPgD05W4N0kTmGFLJbWcTCRwj1uKw@mail.gmail.com>
Message-ID: <56BCEA35.9060408@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Patrick,
comments below.

Il 11/02/2016 16:23, Patrick Doyle ha scritto:
> I have read section 10.7 "Why doesn't Buildroot generate binary
> packages (.deb, .ipkg...)?" in the Buildroot users manual, and I
> understand and appreciate the answer to that question.
>
> My question is slightly different, and it is based on the following scenario:
>
> I am creating a buildroot environment for my custom product.  I have
> generated the rootfs and deployed it to my development board.  Once I
> have done that, I have customized a few things to my liking (e.g.
> hostname, installed my custom application, generated OpenSSH keys,
> etc...).  Now I discover that I also want to add another package to my
> environment.
First of all I do structure my development dir with three subdirs:
buildroot, input and output.
This main subdir is also (usually) under git control, so I have a basic .gitignore containing:

buildroot
output

./buildroot is populated by normal "git clone ..."
./input contains:

./input/board/
./input/configs/
./input/overlay/
./input/package/
./input/patch/
./input/Config.in
./input/external.mk
./input/permissions.makedev
./input/users.table

Initial config is done with "cd buildroot && make O=../output BR2_EXTERNAL=../input yourboard_defconfig"

After that all configurations/compilations are done via: "(cd output && make whatever)"

> Option 1:
> Rerun "make menuconfig; make"; generate a new rootfs; flash it on my
> board; and redo the customizations.  (Most of the customizations will
> get easier with time, as I roll them into my configuration, but some
> of them, such as OpenSSH host keys, will just have to change each time
> I do this).
In general I try to do my configurations editing input/overlay.
This way they will be part of next iteration
When forced to work directly on target I try to backport to the ./input/overlay/ tree
For this I found using mc (Midnight Commander) with one panel connected to target via "Shell link" very effective.
> Option 2:
> Rerun "make menuconfig; make" and deploy just the new package.
> Lather, rinse, repeat, until I've figured out what package sets make
> the most sense.  Then do Option 1.
Here a I use rsync to add whatever needed without clobbering what shouldn't be clobbered.
Using it with Buildroot output is not trivial.
I use the following script:

===================
#!/bin/bash

target=
port=
here=$(pwd)
clean=none

while getopts ":t:p:" opt; do
   case $opt in
     t)
       target=$OPTARG
       ;;
     p)
       port="-p $OPTARG"
       ;;
     \?)
       echo "Invalid option: -$OPTARG" >&2
       exit 1
       ;;
     :)
       echo "Option -$OPTARG requires an argument." >&2
       exit 1
       ;;
   esac
done

if [ -z "$target" ]
then
   echo "usage: $0 -t <target IP> [ -p <target ssh port> ]"
   exit 1
fi

cd /tmp
mkdir TMPfs
cd TMPfs

fakeroot bash <<- EOF
         tar xf $here/output/images/rootfs.tar
         rsync -av -e "ssh $port -i $here/operator -oUserKnownHostsFile=$HOME/.ssh/known_hosts" . root@$target:/
EOF

rm -rf *
cd ..
rmdir TMPfs
===================

I generated a key pair operator/operator.pub and I added operator.pub to ./input/overlay/root/.ssh/authorized_keys

>
> Which option do folks in this community choose in general?
>
> --wpd
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
Hope it Helps

Regards
Mauro
