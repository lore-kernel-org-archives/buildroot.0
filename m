From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jun 2010 09:00:32 +0200
Subject: [Buildroot] [git commit master] libidn: fix build with config.cache,
	autoconf and emacs
Message-ID: <20100605070248.A277B5631@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=168f3b6e1412d47738c0a24660b34c58fdc680c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libidn contains a few elisp files, and it's configure script checks for
emacs to know if it should install them. This is not important for BR as
we don't have emacs, but configure fails if it's available on the host,
config.cache is used and autoconf has already been used as that loads
EMACS="no" into the cache.

Fix it by also setting EMACS="no" here.

At the same time, fix up trailing spaces in Config.in.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    2 +-
 package/libidn/Config.in |    4 ++--
 package/libidn/libidn.mk |    1 +
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index dffc848..1f19a24 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: netperf
+	Updated/fixed packages: libidn, netperf
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/libidn/Config.in b/package/libidn/Config.in
index 04f8900..dcf9724 100644
--- a/package/libidn/Config.in
+++ b/package/libidn/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_LIBIDN
 	bool "libidn"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
-	  Libidn's purpose is to encode and decode internationalized 
-	  domain names. 
+	  Libidn's purpose is to encode and decode internationalized
+	  domain names.
 
 	  http://www.gnu.org/software/libidn/
 
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 4b3bea3..79e0321 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -8,6 +8,7 @@ LIBIDN_VERSION = 1.15
 LIBIDN_SITE = http://ftp.gnu.org/gnu/libidn/
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_INSTALL_TARGET = YES
+LIBIDN_CONF_ENV = EMACS="no"
 LIBIDN_CONF_OPT = --enable-shared --disable-java --enable-csharp=no
 LIBIDN_LIBTOOL_PATCH = NO
 LIBIDN_DEPENDENCIES = host-pkg-config $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-- 
1.6.3.3
