From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 13:12:29 +0200
Subject: [Buildroot] [git commit] gzip: force shell shebang to /bin/sh
Message-ID: <20161016111259.6E69081EC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ae8d415e60fec75997b9d9a533ab5103d4d93d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gzip's configure uses $SHELL to find a POSIX-compliant shell to put in
the shebang of its shell scripts (zcat, gzexe, ...). However, we set
$SHELL to /bin/bash in the Makefile, which may not be present on the
target. We do make sure that /bin/sh always points to a valid shell on
the target so we can use that.

The configure discovery is completely broken for cross-compilation. The
same $SHELL is used during the build (it is used by make to run the
commands in rules) and on the target. Also, the checks for a valid
shell use the host shell, not the target shell.

We could try to patch gzip to fix that, but the checks can anyway not
be run for the target shell, so we'll have to override it with a cache
value anyway. So we can just as well do exactly that, without patching.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reported-by: Pascal Speck <kernel@iktek.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gzip/gzip.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 6dc910e..c4e91b0 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -14,5 +14,12 @@ GZIP_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 GZIP_LICENSE = GPLv3+
 GZIP_LICENSE_FILES = COPYING
 GZIP_CONF_ENV += gl_cv_func_fflush_stdin=yes
+# configure substitutes $(SHELL) for the shell shebang in scripts like
+# gzexe. Unfortunately, the same $(SHELL) variable will also be used by
+# make to run its commands. Fortunately, /bin/sh is always a POSIX shell
+# on both the target and host systems that we support. Even with this,
+# the configure check is slightly broken and prints a bogus warning:
+#  "using /bin/sh, even though it may have file descriptor bugs"
+GZIP_CONF_ENV += ac_cv_path_shell=/bin/sh
 
 $(eval $(autotools-package))
