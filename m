From: Matthias 'muh' Pauligk <paulms@idmt.fraunhofer.de>
Date: Thu, 15 Jan 2015 06:23:54 -0800 (PST)
Subject: [Buildroot] ldconfig - unknown machine 40
In-Reply-To: <loom.20130628T172450-675@post.gmane.org>
References: <loom.20130628T172450-675@post.gmane.org>
Message-ID: <1421331834928-90477.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I faced the same problem using buildroot's toolchain.
The ld-config is present in the host directory, but the Makefile is looking
at the wrong path.
So I made a small patch to fix this issue, which is working fine for me:

--- a/Makefile
+++ b/Makefile
@@ -161,6 +161,7 @@
 # initial definition so that 'make clean' works for most users, even
without
 # .config. HOST_DIR will be overwritten later when .config is included.
 HOST_DIR := $(BASE_DIR)/host
+LDCONF_DIR := $(HOST_DIR)/usr/arm-buildroot-linux-gnueabi/sysroot/sbin

 LEGAL_INFO_DIR = $(BASE_DIR)/legal-info
 REDIST_SOURCES_DIR_TARGET = $(LEGAL_INFO_DIR)/sources
@@ -597,9 +598,9 @@
        # for recent versions of ldconfig
        touch $(TARGET_DIR)/etc/ld.so.conf
        mkdir -p $(TARGET_DIR)/var/cache/ldconfig
-       if [ -x "$(TARGET_CROSS)ldconfig" ]; \
+       if [ -x "$(LDCONF_DIR)/ldconfig" ]; \
        then \
-               $(TARGET_CROSS)ldconfig -r $(TARGET_DIR); \
+               $(LDCONF_DIR)/ldconfig -r $(TARGET_DIR); \
        else \
                /sbin/ldconfig -r $(TARGET_DIR); \
        fi


Just apply it in buildroot's root directory. 
Maybe this is also working for external toolchains, depending on where
ld-config is located there.

Best regards.




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/ldconfig-unknown-machine-40-tp47588p90477.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
