From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 21 Oct 2014 14:21:45 +0100
Subject: [Buildroot] [PATCH] bash: fix linking for static builds with uClibc
	toolchains
Message-ID: <1413897705-47811-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

...and also use configure options instead of environment variables.

bash fails to link for static builds with uClibc toolchains due to
getenv redefinitions. This is caused because bash is unable to check if
getenv is already defined when cross-compiling, so it defaults to 'yes':

configure:14438: WARNING: cannot check getenv redefinition if cross
compiling -- defaulting to yes

We can avoid this redefinition by adding bash_cv_getenv_redef=no to the
configure options.

At the same time, we use configure options instead of environment
variables because there is no need to pass those options to the
configure script as environment variables. Doing it in this way we
avoid the risk of environment variables leaking into places we don't
expect.

Related:
	http://lists.gnu.org/archive/html/bug-bash/2012-03/msg00052.html

Fixes:
	http://autobuild.buildroot.net/results/a20/a2007e6dbcfe53e7cd837ae642869ee26376826a/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/bash/bash.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 34a3a73..9a13f69 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -13,7 +13,7 @@ BASH_CONF_OPTS = --with-installed-readline
 BASH_LICENSE = GPLv3+
 BASH_LICENSE_FILES = COPYING
 
-BASH_CONF_ENV += \
+BASH_CONF_OPTS += \
 	ac_cv_rl_prefix="$(STAGING_DIR)" \
 	ac_cv_rl_version="$(READLINE_VERSION)" \
 	bash_cv_job_control_missing=present \
@@ -28,6 +28,9 @@ BASH_MAKE = $(MAKE1)
 # The static build needs some trickery
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 BASH_CONF_OPTS += --enable-static-link --without-bash-malloc
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+BASH_CONF_OPTS += bash_cv_getenv_redef=no
+endif
 endif
 
 # Make /bin/sh -> bash (no other shell, better than busybox shells)
-- 
1.7.1
