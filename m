From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:42 -0000
Subject: [Buildroot] [git commit branch/next] toolchain-external: fix
	support of uClibc-ng toolchains
Message-ID: <20150808105631.F311F7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34f95bf9dbb0a2698d425975d83a92fa5e7ca0aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The uClibc-ng dynamic loader is called ld-uClibc.so.1, but gcc is not
patched specifically for uClibc-ng, so it continues to generate
binaries that expect the dynamic loader to be named ld-uClibc.so.0,
like with the original uClibc.

Therefore, when a uClibc-ng toolchain is used as an external
toolchain, we need to create an additional symbolic link to make
uClibc-ng systems work properly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index c8dd98f..fcb033c 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -721,6 +721,17 @@ define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
 	fi
 endef
 
+# uClibc-ng dynamic loader is called ld-uClibc.so.1, but gcc is not
+# patched specifically for uClibc-ng, so it continues to generate
+# binaries that expect the dynamic loader to be named ld-uClibc.so.0,
+# like with the original uClibc. Therefore, we create an additional
+# symbolic link to make uClibc-ng systems work properly.
+define TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO
+	if test -e $(TARGET_DIR)/lib/ld-uClibc.so.1; then \
+		ln -sf ld-uClibc.so.1 $(TARGET_DIR)/lib/ld-uClibc.so.0 ; \
+	fi
+endef
+
 define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
 	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
@@ -734,6 +745,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
 	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)
+	$(TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
 endef
 
 $(eval $(generic-package))
