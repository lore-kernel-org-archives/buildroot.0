From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 14:19:34 +0100
Subject: [Buildroot] [git commit] toolchain-external: don't exclude too much
	lib in sysroot rsync
Message-ID: <20160201224703.3A6297F9EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=beddd71c5729240d0c819066c978793fd7d6d41f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The copy_toolchain_sysroot helper in toolchain/helpers.mk performs an
rsync of various directories from the extracted external toolchain to the
corresponding directory in staging.

The relevant (simplified) snippet is:
    for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
            rsync -au --chmod=u=rwX,go=rX --exclude 'usr/lib/locale' \
                    --exclude lib --exclude lib32 --exclude lib64 \
                    $${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
    done ; \

The exclusion logic of lib/lib32/lib64 has been added by commit
5628776c4a4d29d0715633ea463b64cc19e19c5a with the purpose of only copying
the relevant usr/lib* directory from the toolchain to staging, instead of
all. For example, if ARCH_LIB_DIR is 'lib64', then only usr/lib64 would be
copied and usr/lib and usr/lib32 are ignored. It works by ignoring any
lib/lib32/lib64 subdirectory on the rsync of 'usr' and then separately
copying usr/{lib,lib32,lib64} as appropriate. (The exclusion rules only have
impact on the files beneath the main source directory.)

However, on the rsync of 'usr', ANY of the following directories AND files
would be excluded:
    lib/
    lib
    lib32/
    foobar/something/lib/
    something-else/lib64/

while it is only the intention to skip directories directly under usr.

Therefore, add a leading (to restrict the scope to first-level) and trailing
(to restrict to directories) slash to the exclude pattern. From 'man rsync':

    - if the pattern starts with a / then it is anchored to [..] the root of
      the transfer.
    - if the pattern ends with a / then it will only match a directory, not
      a regular file, symlink, or device.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 70695ee..906993d 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -154,7 +154,8 @@ copy_toolchain_sysroot = \
 	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
 		if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
 			rsync -au --chmod=u=rwX,go=rX --exclude 'usr/lib/locale' \
-				--exclude lib --exclude lib32 --exclude lib64 \
+				--exclude '/lib/' --exclude '/lib32/' \
+				--exclude '/lib64/' \
 				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
 		fi ; \
 	done ; \
