From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Nov 2018 18:15:50 +0100
Subject: [Buildroot] [PATCH 3/4 v2] package/gzip: add host variant
In-Reply-To: <cover.1542474939.git.yann.morin.1998@free.fr>
References: <cover.1542474939.git.yann.morin.1998@free.fr>
Message-ID: <b361da9fb70b68c8d768b9e6fbadc8f3f0539ec5.1542474939.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In case someone is building on a musl-based distro (Alpine), we do as
for the target variant, and force the fflush_stdin detection.

We however do not do the /bin/sh trick, because we are building
natively, so the shell check is working.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/gzip/gzip.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index d48cb1aa15..8ac6ddd6ed 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -12,6 +12,7 @@ GZIP_CONF_OPTS = --exec-prefix=/
 GZIP_LICENSE = GPL-3.0+
 GZIP_LICENSE_FILES = COPYING
 GZIP_CONF_ENV += gl_cv_func_fflush_stdin=yes
+HOST_GZIP_CONF_ENV += gl_cv_func_fflush_stdin=yes
 # configure substitutes $(SHELL) for the shell shebang in scripts like
 # gzexe. Unfortunately, the same $(SHELL) variable will also be used by
 # make to run its commands. Fortunately, /bin/sh is always a POSIX shell
@@ -21,3 +22,4 @@ GZIP_CONF_ENV += gl_cv_func_fflush_stdin=yes
 GZIP_CONF_ENV += ac_cv_path_shell=/bin/sh
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.14.1
