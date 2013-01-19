From: Stephan Hoffmann <sho@relinux.de>
Date: Sat, 19 Jan 2013 18:10:12 +0100
Subject: [Buildroot] post-build script is called before rootfs tweaking
Message-ID: <50FAD374.9010306@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

buildroot's documentation says:
> In the Buildroot configuration, you can specify the path to a
> *post-build script*, that gets called /after/ Buildroot builds all the
> selected software, but /before/ the rootfs packages are assembled.
I understand this the way that the post-build script is called as the
last action before package assembly.

In fact the post-build script is called before some modifications take
place:
> >>>   Executing post-build script
> >>>   Completed post-build script
> mkdir -p /home/stephan/buildroot/output/target/etc
> echo "armstonea8" > /home/stephan/buildroot/output/target/etc/hostname
> /bin/sed -i -e '$a \127.0.1.1\tarmstonea8' \
>                 -e '/^127.0.1.1/d'
> /home/stephan/buildroot/output/target/etc/hosts
> mkdir -p /home/stephan/buildroot/output/target/etc
> echo "Welcome to armStoneA8" >
> /home/stephan/buildroot/output/target/etc/issue
> /bin/sed -i -e '/# GENERIC_SERIAL$/s~^.*#~ttySAC0::respawn:/sbin/getty
> -L ttySAC0 38400 vt100 #~' \
>                 /home/stephan/buildroot/output/target/etc/inittab
> /bin/sed -i -e '/^[^#].*# REMOUNT_ROOTFS_RW$/s~^~#~'
> /home/stephan/buildroot/output/target/etc/inittab
> rm -f /home/stephan/buildroot/output/build/locales.nopurge
> for i in C en_US de fr; do echo $i >>
> /home/stephan/buildroot/output/build/locales.nopurge; done
> for dir in ; \
>         do \
>                 for lang in $(cd $dir; ls .|grep -v man); \
>                 do \
>                         grep -qx $lang
> /home/stephan/buildroot/output/build/locales.nopurge || rm -rf
> $dir/$lang; \
>                 done; \
>         done
Is this a bug or a feature? I'd prefer having the script called after
the target directory is completely set up.

Kind regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
