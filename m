From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 May 2009 10:26:47 +0200
Subject: [Buildroot] GCC-4.3.3 in toolchain fails to compile
In-Reply-To: <56ea0bb80905272314k37d90aaep7af8de9aa846b1f9@mail.gmail.com>
	(Paul Archer's message of "Thu\, 28 May 2009 16\:14\:48 +1000")
References: <56ea0bb80905212032x1e01cdfbt4c427fc85c9b72e3@mail.gmail.com>
	<87iqjqfg2c.fsf@macbook.be.48ers.dk>
	<56ea0bb80905272314k37d90aaep7af8de9aa846b1f9@mail.gmail.com>
Message-ID: <8763fl8wfs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Archer <ptarcher@gmail.com> writes:

Hi,

 Paul> Hey Peter,
 Paul> Thanks for the reply

 Paul> Making this change let me build the toolchain, and by using the
 Paul> snapshot-20090522 I was able to build and boot. Thank you for the
 Paul> change.

 Paul> With regards to u-boot, I have u-boot working brilliantly with
 Paul> u-boot-2009.06-rc1, however I was having trouble with the u-boot tools
 Paul> for reading the enviroment from linux. I had trouble building this run
 Paul> on the target, I constantly got can't find file
 Paul> '/usr/bin/fw_printenv', but thats another story.

I've fixed the issue with building the target-tools with 2009.06-rc1+
in my tree at work, but I haven't pushed it upstream yet as we haven't
any 2009.06-rcX support in BR (and I won't add it so close to the
release). I'll check it in next week after the release.

If you need it earlier, you could try to apply the following yourself:

commit aa8564860f13b4f295861e256a3955f57c6b23df
Author: peko <peko@a61a55d3-c7e0-402d-9e56-82086cc33c8d>
Date:   Tue May 5 16:01:30 2009 +0000

    u-boot: target tools: use library files from their original location
    
    u-boot 2009.06-rc1 has changed the tools/ logic, and no longer adds
    symbolic links to the needed library files in the tools directory.
    Fix build by referencing the library files in their original
    location.

diff --git a/target/u-boot/Makefile.in b/target/u-boot/Makefile.in
index 6f1a83e..85fac6c 100644
--- a/target/u-boot/Makefile.in
+++ b/target/u-boot/Makefile.in
@@ -196,16 +196,19 @@ $(U_BOOT_TOOLS): $(U_BOOT_DIR)/$(U_BOOT_BIN)
 
 $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/$(U_BOOT_BIN)
        mkdir -p $(@D)
-       $(TARGET_CC) -I$(U_BOOT_DIR)/include -DUSE_HOSTCC -o $@ \
-               $(U_BOOT_DIR)/tools/mkimage.c \
-               $(addprefix $(U_BOOT_DIR)/tools/,crc32.c image.c md5.c sha1.c fdt*
+       $(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(U_BOOT_DIR)/tools \
+               -DUSE_HOSTCC -o $@ \
+               $(U_BOOT_DIR)/tools/mkimage.c $(U_BOOT_DIR)/common/image.c \
+               $(addprefix $(U_BOOT_DIR)/lib_generic/,crc32.c md5.c sha1.c) \
+               $(U_BOOT_DIR)/libfdt/fdt*.c
+
        $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
 $(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/$(U_BOOT_BIN)
        mkdir -p $(@D)
        $(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(LINUX_HEADERS_DIR)/include \
                -DUSE_HOSTCC -o $@ \
-               $(U_BOOT_DIR)/tools/env/*.c $(U_BOOT_DIR)/tools/crc32.c
+               $(U_BOOT_DIR)/tools/env/*.c $(U_BOOT_DIR)/lib_generic/crc32.c
        $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
        ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
 

 Paul> Thanks for your help peter.

You're welcome.

-- 
Bye, Peter Korsgaard
