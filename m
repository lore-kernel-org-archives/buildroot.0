From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 11 Sep 2015 22:57:58 +0200
Subject: [Buildroot] [PATCH] toolchain-external: trivial clean up of messages
Message-ID: <1442005078-17556-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Before this commit, the output of the toolchain-external build steps
looked like this (abbreviated for clarity):

>>> toolchain-external undefined Building
>>> toolchain-external undefined Installing to staging directory
>>> toolchain-external undefined Copying external toolchain sysroot to staging...
>>> toolchain-external undefined Building ext-toolchain wrapper
mkdir -p output/host/usr/bin; cd output/host/usr/bin; for i in ...
/usr/bin/gcc -O2 -Ioutput/host/usr/include -DBR_SYSROOT='...
if test -f output/host/usr/bin/i686-pc-linux-gnu-gdb ; then mkdir -p ...
>>> toolchain-external undefined Fixing libtool files
>>> toolchain-external undefined Installing to target
>>> toolchain-external undefined Copying external toolchain libraries to target...
if test -e output/target/lib/ld-uClibc.so.1; then ln -sf ld-uClibc.so.1 output/target/lib/ld-uClibc.so.0 ; fi
if test -e output/target/lib/ld64-uClibc.so.1; then ln -sf ld64-uClibc.so.1 output/target/lib/ld64-uClibc.so.0 ; fi

All the long lines with conditions and loops in them are not usefull,
so put $(Q) in front of them. The line with mkdir can better be split
on a separate line so the cd stands out more. There are two redundant
semicolons that can be removed. The installation of gdbinit could
use an extra message so the user can see what is going on.

After this commit, the toolchain-external build steps look like this:
>>> toolchain-external undefined Building
>>> toolchain-external undefined Installing to staging directory
>>> toolchain-external undefined Copying external toolchain sysroot to staging...
>>> toolchain-external undefined Building ext-toolchain wrapper
/usr/bin/gcc -O2 -Ioutput/host/usr/include -DBR_SYSROOT='...
>>> toolchain-external undefined Installing gdbinit
>>> toolchain-external undefined Fixing libtool files
>>> toolchain-external undefined Installing to target
>>> toolchain-external undefined Copying external toolchain libraries to target...

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-external/toolchain-external.mk | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index da9ad3d..4b4b463 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -673,7 +673,8 @@ endif
 # pass the lto arguments.
 define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 	$(Q)$(call MESSAGE,"Building ext-toolchain wrapper")
-	mkdir -p $(HOST_DIR)/usr/bin; cd $(HOST_DIR)/usr/bin; \
+	$(Q)mkdir -p $(HOST_DIR)/usr/bin
+	$(Q)cd $(HOST_DIR)/usr/bin; \
 	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
 		base=$${i##*/}; \
 		case "$$base" in \
@@ -692,7 +693,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
 			;; \
 		esac; \
-	done ;
+	done
 	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_EXTERNAL_WRAPPER_ARGS) \
 		-s -Wl,--hash-style=$(TOOLCHAIN_EXTERNAL_WRAPPER_HASH_STYLE) \
 		toolchain/toolchain-external/ext-toolchain-wrapper.c \
@@ -701,7 +702,7 @@ endef
 
 # This sed magic is taken from Linux headers_install.sh script.
 define TOOLCHAIN_EXTERNAL_SANITIZE_KERNEL_HEADERS
-	$(Q)$(call MESSAGE,"Sanitizing kernel headers");
+	$(Q)$(call MESSAGE,"Sanitizing kernel headers")
 	find $(STAGING_DIR)/usr/include/linux/ -name "*.h" | xargs sed -r -i \
 		-e 's/([ \t(])(__user|__force|__iomem)[ \t]/\1/g' \
 		-e 's/__attribute_const__([ \t]|$$)/\1/g' \
@@ -711,9 +712,13 @@ define TOOLCHAIN_EXTERNAL_SANITIZE_KERNEL_HEADERS
 		-e 's@#(ifndef|define|endif[ \t]*/[*])[ \t]*_UAPI@#\1 @'
 endef
 
+#
+# Generate gdbinit file for use with Buildroot
+#
 define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
-	if test -f $(TARGET_CROSS)gdb ; then \
-		$(call gen_gdbinit_file) ; \
+	$(Q)if test -f $(TARGET_CROSS)gdb ; then \
+		$(call MESSAGE,"Installing gdbinit"); \
+		$(gen_gdbinit_file); \
 	fi
 endef
 
@@ -723,10 +728,10 @@ endef
 # like with the original uClibc. Therefore, we create an additional
 # symbolic link to make uClibc-ng systems work properly.
 define TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO
-	if test -e $(TARGET_DIR)/lib/ld-uClibc.so.1; then \
+	$(Q)if test -e $(TARGET_DIR)/lib/ld-uClibc.so.1; then \
 		ln -sf ld-uClibc.so.1 $(TARGET_DIR)/lib/ld-uClibc.so.0 ; \
 	fi
-	if test -e $(TARGET_DIR)/lib/ld64-uClibc.so.1; then \
+	$(Q)if test -e $(TARGET_DIR)/lib/ld64-uClibc.so.1; then \
 		ln -sf ld64-uClibc.so.1 $(TARGET_DIR)/lib/ld64-uClibc.so.0 ; \
 	fi
 endef
-- 
2.5.1
