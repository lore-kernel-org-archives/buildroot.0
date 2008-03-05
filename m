From: Tim Barr <tbarr@multitech.com>
Date: Wed, 5 Mar 2008 16:02:18 -0600
Subject: [Buildroot] I really need some help
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E60A91DDB1@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have been trying for the past 2+ months to successfully complete a
buildroot session for a AT91SAM9260EK. I first installed buildroot via
svn. Then I then did a "make at91sam9260pf_defconfig" to get baseline
config files. Then I ran a "make configured" in order to get a baseline
codeset. I ran "make menuconfig" in the kernel directory in order to
update the kernel config from what defconfig installed, otherwise I kept
getting prompted about missing config info during the make. The only
change I made to the kernel config was to add USB ACM support so I could
talk to a USB wireless module. I have tried both 2.6.22.1 and 2.6.22.10
kernels.
 
I have been able to figure out workarounds for some of the errors I have
gotten, either manually downloading source files that buildroot could
not find or creating directories that buildroot could not find or would
not create itself. Now I am getting an error about "No mail command
specified". Log file info follows:
 
# Use fakeroot to pretend all target binaries are owned by root

rm -f
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/_
fakeroot.rootfs.arm-20080305.ext2

touch
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/.
fakeroot.00000

cat
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/.
fakeroot* >
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/_
fakeroot.rootfs.arm-20080305.ext2

echo "chown -R 0:0
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/r
oot" >>
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/_
fakeroot.rootfs.arm-20080305.ext2

# Use fakeroot to pretend to create all needed device nodes

echo
"/home/falingtrea/buildroot/build_arm_wchar/staging_dir/bin/makedevs -d
target/device/Atmel/root/device_table.txt
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/r
oot" \

>>
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/_
fakeroot.rootfs.arm-20080305.ext2

# Use fakeroot so genext2fs believes the previous fakery

GENEXT2_REALSIZE=`LC_ALL=C du -s -c -k
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/r
oot | grep total | sed -e "s/total//"`; \

GENEXT2_ADDTOROOTSIZE=`if [ $GENEXT2_REALSIZE -ge 20000 ]; then echo
16384; else echo 2400; fi`; \

GENEXT2_SIZE=`expr $GENEXT2_REALSIZE + $GENEXT2_ADDTOROOTSIZE`; \

GENEXT2_ADDTOINODESIZE=`find
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/r
oot | wc -l`; \

GENEXT2_INODES=`expr $GENEXT2_ADDTOINODESIZE + 400`; \

set -x; \

echo "/home/falingtrea/buildroot/build_arm_wchar/genext2fs-1.4/genext2fs
-b $GENEXT2_SIZE " \

"-N $GENEXT2_INODES -d
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/r
oot " \

" -U -m 0
/home/falingtrea/buildroot/binaries/SuperModem-2.6.22.1/rootfs.arm-20080
305.ext2" >>
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/_
fakeroot.rootfs.arm-20080305.ext2

+ echo
/home/falingtrea/buildroot/build_arm_wchar/genext2fs-1.4/genext2fs -b
46612 -N 1479 -d
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/r
oot -U -m 0
/home/falingtrea/buildroot/binaries/SuperModem-2.6.22.1/rootfs.arm-20080
305.ext2

chmod a+x
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/_
fakeroot.rootfs.arm-20080305.ext2

/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/bin/fakeroot
--
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/_
fakeroot.rootfs.arm-20080305.ext2

make[1]: Entering directory
`/home/falingtrea/buildroot/build_arm_wchar/at-3.1.10'

/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/bin/arm-linux
-uclibc-gcc -Os -pipe
-I/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/include
-I/home/falingtrea/buildroot/build_arm_wchar/staging_dir/include
--sysroot=/home/falingtrea/buildroot/build_arm_wchar/staging_dir/
-isysroot /home/falingtrea/buildroot/build_arm_wchar/staging_dir -c -O2
-g -Wall -DHAVE_CONFIG_H -DVERSION=\"3.1.9\" -DETCDIR=\"/etc\"
-DLOADAVG_MX=0.8 -DDAEMON_USERNAME=\"root\" -DDAEMON_GROUPNAME=\"root\"
-DLFILE=\"/var/lib/atjobs/.SEQ\" -Wall atd.c

atd.c:498:2: error: #error "No mail command specified."

make[1]: *** [atd.o] Error 1

make[1]: Leaving directory
`/home/falingtrea/buildroot/build_arm_wchar/at-3.1.10'

rootdir=/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.
6.22.1/root

table='target/device/Atmel/root/device_table.txt'

makedevs: line 42: regular file
'/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/
root/etc/shadow' does not exist: No such file or directory

makedevs: line 43: regular file
'/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/
root/etc/passwd' does not exist: No such file or directory

makedevs: line 48: regular file
'/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/
root/usr/share/udhcpc/default.script' does not exist: No such file or
directory

-rw-r--r-- 1 falingtrea falingtrea 47730688 2008-03-05 12:12
/home/falingtrea/buildroot/binaries/SuperModem-2.6.22.1/rootfs.arm-20080
305.ext2

rm -f
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/.
fakeroot*

 


Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
 <mailto:tbarr@multitech.com> tbarr at multitech.com 

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080305/d3a07c65/attachment.htm 
