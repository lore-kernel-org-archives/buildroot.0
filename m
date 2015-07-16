From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 23:12:06 +0200
Subject: [Buildroot] [git commit] toolchain-external: fix uClibc-ng 64bit
	dynamic loader link
Message-ID: <20150716211218.7131B81E0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ec15820289808ed9a53086d1e384c8b4c5802fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 34f95bf9dbb0 (toolchain-external: fix support of uClibc-ng toolchains,
2015-07-13) added the missing ld-uClibc.so.1 dynamic linker symlink that
binaries expect when linked with uClibc-ng. However on 64bit targets the
linker is called ld64-uClibc.so.1. Handle that case as well.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index fcb033c..ce9d79f 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -730,6 +730,9 @@ define TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO
 	if test -e $(TARGET_DIR)/lib/ld-uClibc.so.1; then \
 		ln -sf ld-uClibc.so.1 $(TARGET_DIR)/lib/ld-uClibc.so.0 ; \
 	fi
+	if test -e $(TARGET_DIR)/lib/ld64-uClibc.so.1; then \
+		ln -sf ld64-uClibc.so.1 $(TARGET_DIR)/lib/ld64-uClibc.so.0 ; \
+	fi
 endef
 
 define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
