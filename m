From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 21 Dec 2010 13:57:11 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain: fix multilib symlink
	for external toolchains
Message-ID: <20101221125742.DAE2E8E148@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cd11bf49704ef6413ae303c6c774b5c6a4a62f9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ARCH_SUBDIR is a shell variable, so it should be referenced with
$${ARCH_SUBDIR}. Without this, no symbolic link is created, and the
external toolchain fails to work if the non-default multilib variant
is used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/helpers.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 9b37f3f..eb9d742 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -96,7 +96,7 @@ copy_toolchain_sysroot = \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
 			cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \
 		fi ; \
-		ln -s . $(STAGING_DIR)/$(ARCH_SUBDIR) ; \
+		ln -s . $(STAGING_DIR)/$${ARCH_SUBDIR} ; \
 	fi ; \
 	find $(STAGING_DIR) -type d | xargs chmod 755
 
-- 
1.7.2.2
