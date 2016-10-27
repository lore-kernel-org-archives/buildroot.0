From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 27 Oct 2016 21:24:38 +0000
Subject: [Buildroot] [Bug 9386] ubinize fails with or without custom config
In-Reply-To: <bug-9386-163@https.bugs.busybox.net/>
References: <bug-9386-163@https.bugs.busybox.net/>
Message-ID: <bug-9386-163-BOHrC0yVkk@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9386

--- Comment #4 from Andrey Yurovsky <yurovsky@gmail.com> ---
Ok, I've reproduced it with your defconfig and I've left all paths in here.  To
build I just ran:

make atmel_sama5d4_xplained_defconfig
make

And in the end the output is:

>>>   Generating root filesystem image rootfs.ubi
rm -f /home/ayurovsky/dev/build-system/buildroot/output/build/_fakeroot.fs
rm -f
/home/ayurovsky/dev/build-system/buildroot/output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
rm -f /home/ayurovsky/dev/build-system/buildroot/output/build/_users_table.txt
echo '#!/bin/sh' >
/home/ayurovsky/dev/build-system/buildroot/output/build/_fakeroot.fs
echo "set -e" >>
/home/ayurovsky/dev/build-system/buildroot/output/build/_fakeroot.fs
echo "chown -h -R 0:0 /home/ayurovsky/dev/build-system/buildroot/output/target"
>> /home/ayurovsky/dev/build-system/buildroot/output/build/_fakeroot.fs
printf '   \n' >>
/home/ayurovsky/dev/build-system/buildroot/output/build/_users_table.txt
PATH="/home/ayurovsky/dev/build-system/buildroot/output/host/bin:/home/ayurovsky/dev/build-system/buildroot/output/host/sbin:/home/ayurovsky/dev/build-system/buildroot/output/host/usr/bin:/home/ayurovsky/dev/build-system/buildroot/output/host/usr/sbin:/usr/lib64/qt-3.3/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/ayurovsky/.local/bin:/home/ayurovsky/bin"
/home/ayurovsky/dev/build-system/buildroot/support/scripts/mkusers
/home/ayurovsky/dev/build-system/buildroot/output/build/_users_table.txt
/home/ayurovsky/dev/build-system/buildroot/output/target >>
/home/ayurovsky/dev/build-system/buildroot/output/build/_fakeroot.fs
cat system/device_table.txt >
/home/ayurovsky/dev/build-system/buildroot/output/build/_device_table.txt
printf '        /bin/busybox                     f 4755 0  0 - - - - -\n
/dev/console c 622 0 0 5 1 - - -\n\n' >>
/home/ayurovsky/dev/build-system/buildroot/output/build/_device_table.txt
echo "/home/ayurovsky/dev/build-system/buildroot/output/host/usr/bin/makedevs
-d /home/ayurovsky/dev/build-system/buildroot/output/build/_device_table.txt
/home/ayurovsky/dev/build-system/buildroot/output/target" >>
/home/ayurovsky/dev/build-system/buildroot/output/build/_fakeroot.fs
printf '        /usr/bin/install -m 0644 fs/ubifs/ubinize.cfg
/home/ayurovsky/dev/build-system/buildroot/output/build/ubinize.cfg\n    
/usr/bin/sed -i -e
'\''s;BR2_ROOTFS_UBIFS_PATH;/home/ayurovsky/dev/build-system/buildroot/output/images/rootfs.ubifs;'\''
/home/ayurovsky/dev/build-system/buildroot/output/build/ubinize.cfg\n
/home/ayurovsky/dev/build-system/buildroot/output/host/usr/sbin/ubinize -o
/home/ayurovsky/dev/build-system/buildroot/output/images/rootfs.ubi -m 0x1000
-p 0x40000 
/home/ayurovsky/dev/build-system/buildroot/output/build/ubinize.cfg\n      rm
/home/ayurovsky/dev/build-system/buildroot/output/build/ubinize.cfg\n' >>
/home/ayurovsky/dev/build-system/buildroot/output/build/_fakeroot.fs
chmod a+x /home/ayurovsky/dev/build-system/buildroot/output/build/_fakeroot.fs
PATH="/home/ayurovsky/dev/build-system/buildroot/output/host/bin:/home/ayurovsky/dev/build-system/buildroot/output/host/sbin:/home/ayurovsky/dev/build-system/buildroot/output/host/usr/bin:/home/ayurovsky/dev/build-system/buildroot/output/host/usr/sbin:/usr/lib64/qt-3.3/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/ayurovsky/.local/bin:/home/ayurovsky/bin"
/home/ayurovsky/dev/build-system/buildroot/output/host/usr/bin/fakeroot --
/home/ayurovsky/dev/build-system/buildroot/output/build/_fakeroot.fs
rootdir=/home/ayurovsky/dev/build-system/buildroot/output/target
table='/home/ayurovsky/dev/build-system/buildroot/output/build/_device_table.txt'
iniparser: cannot open
/home/ayurovsky/dev/build-system/buildroot/output/build/ubinize.cfg
ubinize: error!: cannot load the input ini file
"/home/ayurovsky/dev/build-system/buildroot/output/build/ubinize.cfg"
/usr/bin/install -m 0644 support/misc/target-dir-warning.txt
/home/ayurovsky/dev/build-system/buildroot/output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM

-- 
You are receiving this mail because:
You are on the CC list for the bug.
