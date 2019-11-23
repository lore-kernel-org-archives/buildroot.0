From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Nov 2019 13:42:20 +0100
Subject: [Buildroot] [git commit] package/glibc: install utilities into
 their standard locations
Message-ID: <20191202083934.5133B81DFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e487649e2e67537d65b4ac9d19a942b3eb8a16a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed out by Carlos, ldconfig normally goes into /sbin, and getconf +
ldd into /usr/bin, so do that here as well instead of installing everything
to /bin.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 5cb19aabb9..5da0b064a2 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -144,15 +144,20 @@ GLIBC_LIBS_LIB += libthread_db.so.*
 endif
 
 ifeq ($(BR2_PACKAGE_GLIBC_UTILS),y)
-GLIBC_TARGET_UTILS_BIN = posix/getconf elf/ldconfig elf/ldd
+GLIBC_TARGET_UTILS_USR_BIN = posix/getconf elf/ldd
+GLIBC_TARGET_UTILS_SBIN = elf/ldconfig
+
 endif
 
 define GLIBC_INSTALL_TARGET_CMDS
 	for libpattern in $(GLIBC_LIBS_LIB); do \
 		$(call copy_toolchain_lib_root,$$libpattern) ; \
 	done
-	$(foreach util,$(GLIBC_TARGET_UTILS_BIN), \
-		$(INSTALL) -D -m 0755 $(@D)/build/$(util) $(TARGET_DIR)/bin/$(notdir $(util))
+	$(foreach util,$(GLIBC_TARGET_UTILS_USR_BIN), \
+		$(INSTALL) -D -m 0755 $(@D)/build/$(util) $(TARGET_DIR)/usr/bin/$(notdir $(util))
+	)
+	$(foreach util,$(GLIBC_TARGET_UTILS_SBIN), \
+		$(INSTALL) -D -m 0755 $(@D)/build/$(util) $(TARGET_DIR)/sbin/$(notdir $(util))
 	)
 endef
 
