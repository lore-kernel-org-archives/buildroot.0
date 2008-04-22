From: Hebbar <gururajakr@sanyo.co.in>
Date: Mon, 21 Apr 2008 17:12:30 -0700 (PDT)
Subject: [Buildroot] Improper device nodes created
	inside	project_build_arm/uclibc/root/dev/
In-Reply-To: <20080421140757.GC21702@cloud.net.au>
References: <16803332.post@talk.nabble.com>
	<20080421140757.GC21702@cloud.net.au>
Message-ID: <16819059.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

    I use the root directory as it is for nfs boot. i put this directory
inside /etc/exports and mount it on my board at boot time. when i do this
linux kernel and busybox complains about missing /dev/console, /dev/ttyAMA0.

So i have delete previous device nodes and create a fresh node. Basically
device_table and fakeroot fails to create proper device nodes.

I have logged in through "su root" in console

Finall steps of "make world" is as below

********************************************************************
<snip>
<snip>
<snip>

test -x
/opt/buildroot_plain/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-ldconfig
&&
/opt/buildroot_plain/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-ldconfig
-r /opt/buildroot_plain/project_build_arm/uclibc/root 2>/dev/null
# Use fakeroot to pretend all target binaries are owned by root
rm -f
/opt/buildroot_plain/project_build_arm/uclibc/_fakeroot.rootfs.arm.ext2
touch /opt/buildroot_plain/project_build_arm/uclibc/.fakeroot.00000
cat /opt/buildroot_plain/project_build_arm/uclibc/.fakeroot* >
/opt/buildroot_plain/project_build_arm/uclibc/_fakeroot.rootfs.arm.ext2
echo "chown -R 0:0 /opt/buildroot_plain/project_build_arm/uclibc/root" >>
/opt/buildroot_plain/project_build_arm/uclibc/_fakeroot.rootfs.arm.ext2
# Use fakeroot to pretend to create all needed device nodes
echo "/opt/buildroot_plain/build_arm/staging_dir/bin/makedevs -d
target/device/Sanyo/kboard/device_table.txt
/opt/buildroot_plain/project_build_arm/uclibc/root" \
                >>
/opt/buildroot_plain/project_build_arm/uclibc/_fakeroot.rootfs.arm.ext2
# Use fakeroot so genext2fs believes the previous fakery
GENEXT2_REALSIZE=`LC_ALL=C du -s -c -k
/opt/buildroot_plain/project_build_arm/uclibc/root | grep total | sed -e
"s/total//"`; \
        GENEXT2_ADDTOROOTSIZE=`if [ $GENEXT2_REALSIZE -ge 20000 ]; then echo
16384; else echo 2400; fi`; \
        GENEXT2_SIZE=`expr $GENEXT2_REALSIZE + $GENEXT2_ADDTOROOTSIZE`; \
        GENEXT2_ADDTOINODESIZE=`find
/opt/buildroot_plain/project_build_arm/uclibc/root | wc -l`; \
        GENEXT2_INODES=`expr $GENEXT2_ADDTOINODESIZE + 400`; \
        set -x; \
        echo "/opt/buildroot_plain/build_arm/genext2fs-1.4/genext2fs -b
$GENEXT2_SIZE " \
                "-N $GENEXT2_INODES -d
/opt/buildroot_plain/project_build_arm/uclibc/root " \
                " -m 0 /opt/buildroot_plain/binaries/uclibc/rootfs.arm.ext2"
>> /opt/buildroot_plain/project_build_arm/uclibc/_fakeroot.rootfs.arm.ext2
+ echo '/opt/buildroot_plain/build_arm/genext2fs-1.4/genext2fs -b 18030 '
'-N 842 -d /opt/buildroot_plain/project_build_arm/uclibc/root ' ' -m 0
/opt/buildroot_plain/binaries/uclibc/rootfs.arm.ext2'
chmod a+x
/opt/buildroot_plain/project_build_arm/uclibc/_fakeroot.rootfs.arm.ext2
/opt/buildroot_plain/build_arm/staging_dir/usr/bin/fakeroot --
/opt/buildroot_plain/project_build_arm/uclibc/_fakeroot.rootfs.arm.ext2
rootdir=/opt/buildroot_plain/project_build_arm/uclibc/root
table='target/device/Sanyo/kboard/device_table.txt'
-rw-r--r-- 1 root root 18462720 Apr 22 11:51
/opt/buildroot_plain/binaries/uclibc/rootfs.arm.ext2
rm -f /opt/buildroot_plain/project_build_arm/uclibc/.fakeroot*

*************************************************************************

root at guru_vlinux:/opt/buildroot_plain# ls -la
project_build_arm/uclibc/root/dev/
total 0
drwxr-xr-x  2 root root 144 Apr 22 11:51 .
drwxr-xr-x 17 root root 432 Apr 22 11:50 ..
-rw-rw-rw-  1 root root   0 Apr 22 11:51 console
-rw-rw-rw-  1 root root   0 Apr 22 11:51 null
-rw-rw-rw-  1 root root   0 Apr 22 11:51 ttyAMA0
-rw-rw-rw-  1 root root   0 Apr 22 11:51 zero

If this is what it is suppose to do, then how to mount the same for NFS
boot. 

I checked the ext2 file created inside binaries/uclibc/rootfs.arm.ext2. I
mounted this ext2 file and found that the device nodes are properly created
inside /dev directory.

Kindly let me know what i should do to copy the root directory from
project_build_arm/uclibc/root for nfs boot.

Thanks in advance.

Regards
Gururaja


>That's normal. They are only real devices within the fakeroot instance
>used during the build. They are only normal files on disk (fakeroot is
>playing tricks). Outside of fakeroot you see the regular files.
>
>> I have to manualy delete them and cp the basic one from my system
>> root/dev.
>
>You should not need to do that.
>
>What output image format are you using? (ext2fs etc)? Please post the
>output of the final stages of make, where the fakeroot script is
>generated and the image creation tool is run.
>
>
>Hamish
>-- 
>Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>

-- 
View this message in context: http://www.nabble.com/Improper-device-nodes-created-inside-project_build_arm-uclibc-root-dev--tp16803332p16819059.html
Sent from the BuildRoot mailing list archive at Nabble.com.
