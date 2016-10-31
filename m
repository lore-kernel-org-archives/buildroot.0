From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 31 Oct 2016 15:56:52 +0100
Subject: [Buildroot] [PATCH v3 03/24] toolchain-external:
	TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER: use arguments instead of
	global variables
In-Reply-To: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
References: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477925833-27204-4-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A new external toolchain package infrastructure will be introduced in a
followup patch, so TOOLCHAIN_EXTERNAL_{CC,CFLAGS...} global variables
will no longer exist. Instead, each external toolchain packages will
provide it's own <toolchain-external-name>_{CC,CFLAGS...} variables.

For the case of the toolchain wrapper install, CROSS is needed when
calling TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v3: use local variables for functions/macros (Yann)
v2: rework commit log/title (Arnout)
---
 toolchain/toolchain-external/toolchain-external.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index e51b9ed..dd8bc21 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -758,9 +758,11 @@ endif
 # used. However, we should not add the toolchain wrapper for them, and they
 # match the *cc-* pattern. Therefore, an additional case is added for *-ar,
 # *-ranlib and *-nm.
+# $1 toolchain CROSS
 define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 	$(Q)cd $(HOST_DIR)/usr/bin; \
-	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
+	TOOLCHAIN_CROSS="$(strip $1)" ; \
+	for i in $${TOOLCHAIN_CROSS}*; do \
 		base=$${i##*/}; \
 		case "$$base" in \
 		*-ar|*-ranlib|*-nm) \
@@ -812,7 +814,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
 	$(call TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
 	$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
 	$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
-	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
+	$(call TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER,$(TOOLCHAIN_EXTERNAL_CROSS))
 	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
 endef
 
-- 
2.5.5
