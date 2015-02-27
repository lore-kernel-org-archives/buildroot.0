From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 09:21:32 +0100
Subject: [Buildroot] [git commit] ding-libs: fix build with !locale
Message-ID: <20150227082309.2AE247FBD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a56d7d9d211e40d48b2296ceb9db57c4d321de9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It needs libiconv if the toolchain doesn't have iconv support.

Fixes:
http://autobuild.buildroot.net/results/60f/60f85a2144b167f33ed674ff5979c1ef20bc0555/
http://autobuild.buildroot.net/results/76d/76d249f5a85da72cc53a3e66202c372dc33c9c38/
http://autobuild.buildroot.net/results/9f7/9f78043f549e09d020d69f45cd26c3e43a91d9dc/
http://autobuild.buildroot.net/results/8a5/8a586b781b6923444857ef58de659e5f0e8652ee/

And many more.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ding-libs/Config.in    |    1 +
 package/ding-libs/ding-libs.mk |    4 +++-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/ding-libs/Config.in b/package/ding-libs/Config.in
index 6069ed9..7af75b7 100644
--- a/package/ding-libs/Config.in
+++ b/package/ding-libs/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DING_LIBS
 	bool "ding-libs"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_USE_WCHAR || !BR2_NEEDS_GETTEXT
 	help
 	  The ding-libs packages contain a set of libraries used by
diff --git a/package/ding-libs/ding-libs.mk b/package/ding-libs/ding-libs.mk
index d7977ee..5b842ff 100644
--- a/package/ding-libs/ding-libs.mk
+++ b/package/ding-libs/ding-libs.mk
@@ -7,7 +7,9 @@
 DING_LIBS_VERSION = 0_4_0
 DING_LIBS_SOURCE = ding_libs-$(DING_LIBS_VERSION).tar.xz
 DING_LIBS_SITE = https://git.fedorahosted.org/cgit/ding-libs.git/snapshot
-DING_LIBS_DEPENDENCIES = $(if $(BR2_PACKAGE_GETTEXT),gettext) host-pkgconf
+DING_LIBS_DEPENDENCIES = host-pkgconf \
+	$(if $(BR2_PACKAGE_GETTEXT),gettext) \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 DING_LIBS_INSTALL_STAGING = YES
 DING_LIBS_LICENSE = LGPLv3+ (library),GPLv3+ (test programs)
 DING_LIBS_LICENSE_FILES = COPYING COPYING.LESSER
