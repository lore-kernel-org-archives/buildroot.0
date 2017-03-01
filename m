From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 23:23:35 +0100
Subject: [Buildroot] [git commit] toolchain-external: fix broken handling of
	'usr/lib/locale'
Message-ID: <20170301223437.BD34E81735@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb924a0489487fccb1d665adcd81c2c66c5b3abe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Function copy_toolchain_sysroot, which is in charge of copying the relevant
bits from the external toolchain to the staging directory, performs an rsync
loop of various directories and excludes the pattern 'usr/lib/locale' with
the intention of skipping the directory <toolchain>/usr/lib/locale.

However, while this worked in the original commit, commit
5628776c4a4d29d0715633ea463b64cc19e19c5a broke it inadvertently. The
relevant part of the diff:

-    rsync -au --chmod=Du+w --exclude 'usr/lib/locale' \
-          $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
+    rsync -au --chmod=Du+w --exclude 'usr/lib/locale' \
+          --exclude lib --exclude lib32 --exclude lib64 \
+          $${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \

Notice how the source directory now contains a trailing slash, which impacts
the way the exclude rules are interpreted. Previously, when 'i' was 'usr',
the exclude of 'usr/lib/locale' would find a match. With the trailing slash,
there will never be a match, unless for a directory 'usr/usr/lib/locale'.
The right rule would have been '--exclude lib/locale'.

However, just that fix does not solve the problem in all cases, in
particular in the (common) case where ARCH_LIB_DIR is 'lib'. This is due
another change in that commit, changing the iterated values of the above
rsync:

- for i in etc $${ARCH_LIB_DIR} sbin usr ; do \
+ for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \

Due to the fact that we rsync both 'usr' as 'usr/lib' (assuming ARCH_LIB_DIR
is 'lib') we need to add the correct exclude in both cases. But the exclude
is different for both. When i == 'usr', the correct exclude rule would be
'--exclude lib/locale' while when i == 'usr/lib' the correct rule would be
'--exclude locale'.

Since we would like to avoid separate cases for this, use the following
exclude: '--exclude locale/'. The trailing slash will make sure only
directories called 'locale' will match. The targeted directories are then
usr/lib/locale and usr/share/locale. The latter directory was not matched
originally, but it should not hurt changing that.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 8cae996..6f87230 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -92,7 +92,7 @@ copy_toolchain_sysroot = \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
 			continue ; \
 		fi ; \
-		rsync -au --chmod=u=rwX,go=rX --exclude 'usr/lib/locale' \
+		rsync -au --chmod=u=rwX,go=rX --exclude 'locale/' \
 			--include '/libexec*/' --exclude '/lib*/' \
 			$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
 	done ; \
