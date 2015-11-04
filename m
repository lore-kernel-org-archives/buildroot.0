From: Steven Noonan <steven@uplinklabs.net>
Date: Tue, 3 Nov 2015 21:45:22 -0800
Subject: [Buildroot] cc --version fails with toolchain-wrapper
Message-ID: <CAKbGBLgwPfrHDLe8-qXBYv=Kpf=QEpT9ww8E4a_MQQ2M6VC4jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What's up with this? Invoking "*-gcc" works, but "*-cc" does not:

$ /home/steven/Development/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnux32-cc
--version
ccache: error: execv of
/home/steven/Development/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnux32-cc.br_real.br_real
failed: No such file or directory

$ /home/steven/Development/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnux32-gcc
--version
x86_64-buildroot-linux-gnux32-gcc.br_real (Buildroot
2015.11-git-00965-g8d89653-dirty) 5.2.0
Copyright (C) 2015 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


My guess is that doing something like this would solve it. About to
test the theory with a rebuild over the next couple hours...

diff --git a/package/gcc/gcc-final/gcc-final.mk
b/package/gcc/gcc-final/gcc-final.mk
index 8ac2968..7ccc533 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -91,7 +91,7 @@ HOST_GCC_FINAL_MAKE_OPTS += $(HOST_GCC_COMMON_MAKE_OPTS)
 # Make sure we have 'cc'
 define HOST_GCC_FINAL_CREATE_CC_SYMLINKS
        if [ ! -e $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc ]; then \
-               ln -snf $(GNU_TARGET_NAME)-gcc \
+               cp -l $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc \
                        $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc; \
        fi
 endef
