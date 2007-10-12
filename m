From: Saurav Kumar Barik <sauravb@aztecsoft.com>
Date: Fri, 12 Oct 2007 18:52:59 +0530
Subject: [Buildroot] "genext2fs: couldn't allocate a block (no free space)"
	error
Message-ID: <A1286843C9B74E46B0063D92B7844C283751FF@azindbaex01.aztec.soft>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hi All,

I am getting "genext2fs: couldn't allocate a block (no free space)"
error when building ramdisk.

My setup is :
		GWIXP425
		Redboot-2.04
		GW SDK 0.7

Earlier when my target file system size was less(could fit into 8Mb
ramdisk), I could build and successfully load onto target.
Now I added some more packages to the build and I believe the intended
target file system size has exceeded the 8 Mb(ramdisk) limits of
genext2fs utility.

AFAIK genext2fs is capable of generating file system of size 8Mb.
There is a patch available for extending it to 16Mb, but the patch is
for genext2fs-1.3.
I am using genext2fs-1.4.

Moreover I tried creating the ramdisk manually with the following steps,
but I got Kernel Panic while booting.

dd if=/dev/zero of=ramdisk bs=1024 count=16384

mke2fs -b 1024 -m 0 -F ramdisk

mount -o loop ramdisk /mnt/

cp -a root/* /mnt/.

umount /mnt/

gzip -9 -f ramdisk

Could anybody suggest me how to successfully create a ramdisk of size
16Mb, so that my target file system (which is greater than 8Mb) can fit
into that.

Thanks for your time.

Thanks & Regards,
Saurav

________________________________________________________________________
________________
Build failure logs ---
________________________________________________________________________
________________


/home/sauravb/2.2trunk/trunk/buildroot# make ramdisk
if [ ! -e
"/home/sauravb/2.2trunk/trunk/buildroot/toolchain_build_armeb/bin/sed" ]
; then \
                mkdir -p
"/home/sauravb/2.2trunk/trunk/buildroot/toolchain_build_armeb/bin"; \
                rm -f
"/home/sauravb/2.2trunk/trunk/buildroot/toolchain_build_armeb/bin/sed";
\
                ln -sf "/bin/sed"
"/home/sauravb/2.2trunk/trunk/buildroot/toolchain_build_armeb/bin/sed";
\
        fi

Checking build system dependencies:
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.1.2':                     Ok
C++ compiler '/usr/bin/c++'
C++ compiler version '4.1.2':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

/sbin/ldconfig -r
/home/sauravb/2.2trunk/trunk/buildroot/build_armeb/root 2>/dev/null
# Use fakeroot to pretend all target binaries are owned by root
rm -f /opt/arm-toolchain/_fakeroot.ramdisk
touch /opt/arm-toolchain/.fakeroot.00000
cat /opt/arm-toolchain/.fakeroot* > /opt/arm-toolchain/_fakeroot.ramdisk
echo "chown -R 0:0
/home/sauravb/2.2trunk/trunk/buildroot/build_armeb/root" >>
/opt/arm-toolchain/_fakeroot.ramdisk
# Use fakeroot to pretend to create all needed device nodes
echo "/opt/arm-toolchain/bin/makedevs -d target/generic/device_table.txt
/home/sauravb/2.2trunk/trunk/buildroot/build_armeb/root" \
                >> /opt/arm-toolchain/_fakeroot.ramdisk
# Use fakeroot so genext2fs believes the previous fakery
echo
"/home/sauravb/2.2trunk/trunk/buildroot/build_armeb/genext2fs-1.4/genext
2fs -d /home/sauravb/2.2trunk/trunk/buildroot/build_armeb/root " \
                " -U -b 8192 -N 800 -m 0 ramdisk" >>
/opt/arm-toolchain/_fakeroot.ramdisk
chmod a+x /opt/arm-toolchain/_fakeroot.ramdisk
/opt/arm-toolchain/usr/bin/fakeroot --
/opt/arm-toolchain/_fakeroot.ramdisk
rootdir=/home/sauravb/2.2trunk/trunk/buildroot/build_armeb/root
table='target/generic/device_table.txt'
number of inodes too low, increasing to 820
/home/sauravb/2.2trunk/trunk/buildroot/build_armeb/genext2fs-1.4/genext2
fs: couldn't allocate a block (no free space)
make: *** [ramdisk] Error 1


The information contained in, or attached to, this e-mail, contains confidential information and is intended solely for the use of the individual or entity to whom they are addressed and is subject to legal privilege. If you have received this e-mail in error you should notify the sender immediately by reply e-mail, delete the message from your system and notify your system manager. Please do not copy it for any purpose, or disclose its contents to any other person. The views or opinions presented in this e-mail are solely those of the author and do not necessarily represent those of the company. The recipient should check this e-mail and any attachments for the presence of viruses. The company accepts no liability for any damage caused, directly or indirectly, by any virus transmitted in this email.

www.aztecsoft.com
