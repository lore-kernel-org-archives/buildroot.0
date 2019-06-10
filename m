From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jun 2019 16:39:46 +0200
Subject: [Buildroot] [git commit] package/ncmpc: fix build without NLS
Message-ID: <20190610144446.E125E8F693@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56fb7401b9a69cb9ffac09a7a02d65706765e7ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build fails if libintl.h is found but xgettext is not available:

Has header "libintl.h" : YES
Library intl found: NO

po/meson.build:28:5: ERROR: Can not do gettext because xgettext is not installed.

This is because enable_nls defaults to true if libintl.h is found. Use
the nls option to enable/disable NLS explicitly, depending on
BR2_SYSTEM_ENABLE_NLS,

Also, fix the second patch to always look for libintl, even if NLS is
not enabled. The enable_nls option disables processing the po files, but
the gettext calls in the source are still there, so we need to link with
libintl anyway.

Fixes:
 - http://autobuild.buildroot.org/results/0ab0a42fd4c5c9fd5891f3b84287bd788f763ba4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ncmpc/0002-meson.build-link-with-lintl-if-needed.patch | 4 ++--
 package/ncmpc/ncmpc.mk                                         | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/ncmpc/0002-meson.build-link-with-lintl-if-needed.patch b/package/ncmpc/0002-meson.build-link-with-lintl-if-needed.patch
index 248086fb65..9f599c89e9 100644
--- a/package/ncmpc/0002-meson.build-link-with-lintl-if-needed.patch
+++ b/package/ncmpc/0002-meson.build-link-with-lintl-if-needed.patch
@@ -18,13 +18,13 @@ index 2e6defc..28e9d29 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -42,6 +42,7 @@ else
+   error('libintl.h not found')
  endif
  conf.set('ENABLE_NLS', enable_nls)
++intl_dep = cc.find_library('intl', required: false)
  if enable_nls
-+  intl_dep = cc.find_library('intl', required: false)
    conf.set_quoted('GETTEXT_PACKAGE', meson.project_name())
    subdir('po')
- endif
 @@ -356,6 +357,7 @@ ncmpc = executable('ncmpc',
      boost_dep,
      pcre_dep,
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index f0fe3fe374..d2204c71c6 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -19,7 +19,8 @@ NCMPC_LICENSE_FILES = COPYING
 
 NCMPC_CONF_OPTS = \
 	-Dcurses=ncurses \
-	-Ddocumentation=disabled
+	-Ddocumentation=disabled \
+	$(if $(BR2_SYSTEM_ENABLE_NLS),-Dnls=enabled,-Dnls=disabled)
 
 ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
 NCMPC_DEPENDENCIES += lirc-tools
