From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 22 Oct 2014 10:40:40 +0100
Subject: [Buildroot] [PATCH v4] bash: fix linking for static builds with
	uClibc toolchains
Message-ID: <1413970840-17304-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bash fails to link for static builds with uClibc toolchains due to
getenv redefinitions. This is caused because bash is unable to check if
getenv is already defined when cross-compiling, so it defaults to 'yes':

configure:14438: WARNING: cannot check getenv redefinition if cross
compiling -- defaulting to yes

We can avoid this redefinition by passing bash_cv_getenv_redef=no to the
configure script.

Related:
	http://lists.gnu.org/archive/html/bug-bash/2012-03/msg00052.html

Fixes:
	http://autobuild.buildroot.net/results/a20/a2007e6dbcfe53e7cd837ae642869ee26376826a/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/bash/bash.mk |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 34a3a73..5eec3cc 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -28,6 +28,17 @@ BASH_MAKE = $(MAKE1)
 # The static build needs some trickery
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 BASH_CONF_OPTS += --enable-static-link --without-bash-malloc
+# bash wants to redefine the getenv() function. To check whether this is
+# possible, AC_TRY_RUN is used which is not possible in
+# cross-compilation.
+# On uClibc, redefining getenv is not possible; on glibc and musl it is.
+# Related:
+# http://lists.gnu.org/archive/html/bug-bash/2012-03/msg00052.html
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+BASH_CONF_ENV += bash_cv_getenv_redef=no
+else
+BASH_CONF_ENV += bash_cv_getenv_redef=yes
+endif
 endif
 
 # Make /bin/sh -> bash (no other shell, better than busybox shells)
-- 
1.7.1
