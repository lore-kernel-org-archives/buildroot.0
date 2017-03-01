From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 23:21:54 +0100
Subject: [Buildroot] [git commit] toolchain-external: reduce nesting in
	copy_toolchain_sysroot
Message-ID: <20170301222213.8A34881975@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a07e47a47f57646d9b18aebd47dbfee667e19986
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed with Thomas Petazzoni, we can reduce the nesting level by early
returning on an invalid iteration.

I did not move the 'else' case (the common case) outside the if-else because
it would make the code less symmetrical and IMO makes it _less_ clear.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 72e7292..8cae996 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -89,11 +89,12 @@ copy_toolchain_sysroot = \
 	ARCH_LIB_DIR="$(strip $4)" ; \
 	SUPPORT_LIB_DIR="$(strip $5)" ; \
 	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
-		if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
-			rsync -au --chmod=u=rwX,go=rX --exclude 'usr/lib/locale' \
-				--include '/libexec*/' --exclude '/lib*/' \
-				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
+		if [ ! -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
+			continue ; \
 		fi ; \
+		rsync -au --chmod=u=rwX,go=rX --exclude 'usr/lib/locale' \
+			--include '/libexec*/' --exclude '/lib*/' \
+			$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
 	done ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
