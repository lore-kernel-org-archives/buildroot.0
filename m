From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 14:20:10 +0100
Subject: [Buildroot] [git commit] package/gnupg: fix TAR path in gpg-zip
 script
Message-ID: <20191230131048.E0EA78E7B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68df0f9782396f89ad68627224fb5f63ebc90939
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnupg installs a shell script called gpg-zip, which contains a
reference to the 'tar' program. Unfortunately, the location of the tar
program is determined at build time, and is therefore incorrect on the
target. This causes runtime issues, but also potentially leaks some
host paths into the target, causing BR2_REPRODUCIBLE=y failures.

gnupg has a --with-tar option, but it doesn't work properly as the
implementation of the GNUPG_CHECK_USTAR m4 macro in m4/tar-ustar.m4 is
incomplete:

 - If --with-tar is passed, AC_PATH_PROG is not called, so the TAR
   variable is not defined and AC_SUBST([TAR]) is not called, so the
   @TAR@ replacement in tools/gpg-zip.in is replaced by the empty
   string.

 - If --with-tar is passed, the check that this tar version support
   the ustar format is not executed, so the HAVE_USTAR automake
   conditional is never defined. There is unfortunately no way to
   determine if the target tar supports ustar or not, but since even
   the Busybox variant apparently does, we can probably assume all tar
   versions that Buildroot can build support the ustar format.

Fixing this logic is a bit cumbersome, gnupg 1.4.x is not really
maintained anymore and fixing the logic would require an AUTORECONF =
YES.

So we just opt with a very simple solution: replace TAR=something by
TAR=/bin/tar, through a post-install target hook. We only do this if
gpg-zip is installed, since its installation is optional. Note that
the logic is still not ideal, because the installation (or not) of
gpg-zip depends on whether the system/host tar has ustar format or
not.

Fixes the gpg-zip reproducibility issue reported in:

  http://autobuild.buildroot.net/results/d1c/d1c5ad34ba928edfbb5901eb936c7e4457cc9083//diffoscope-results.txt

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gnupg/gnupg.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index bedcf6c985..617def884e 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -79,5 +79,11 @@ endef
 GNUPG_POST_INSTALL_TARGET_HOOKS += GNUPG_REMOVE_GPGSPLIT
 endif
 
+define GNUPG_FIXUP_GPG_ZIP
+	test -f $(TARGET_DIR)/usr/bin/gpg-zip && \
+		$(SED) 's%^TAR=.*%TAR=/bin/tar%' $(TARGET_DIR)/usr/bin/gpg-zip
+endef
+GNUPG_POST_INSTALL_TARGET_HOOKS += GNUPG_FIXUP_GPG_ZIP
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
