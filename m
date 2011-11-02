From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Nov 2011 12:28:41 +0100
Subject: [Buildroot] [git commit] ext-toolchain: fix ct-ng as external rsync
	issues
Message-ID: <20111102114941.7645B8F415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d453d0bc9c15fb0f15f116cbe0c14ce7cd9501ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using a CT-NG toolchain as external toolchain (not with the
integration) and said toolchain has u-w directories rsync fails.
So instruct rsync to chmod u+w directories in the target copy to avoid
the issue.

[Peter: notice that this is a workaround for a rsync 3.0.8 bug]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/helpers.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 5585f45..96919d4 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -91,7 +91,7 @@ copy_toolchain_sysroot = \
 	ARCH_SUBDIR="$(strip $3)"; \
 	for i in etc lib sbin usr ; do \
 		if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
-			rsync -au --exclude 'usr/lib/locale' $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
+			rsync -au --chmod=Du+w --exclude 'usr/lib/locale' $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
 		fi ; \
 	done ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
