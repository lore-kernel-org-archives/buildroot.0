From: vomlehn at canopus-us.com <vomlehn@canopus-us.com>
Date: Wed, 28 May 2014 22:24:13 -0700
Subject: [Buildroot] [PATCH 2/3] Allow specification of values for --prefix
	and --exec-prefix in autotools.
In-Reply-To: <1401341054-16705-1-git-send-email-vomlehn@canopus-us.com>
References: <1401341054-16705-1-git-send-email-vomlehn@canopus-us.com>
Message-ID: <1401341054-16705-3-git-send-email-vomlehn@canopus-us.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: David VomLehn <vomlehn@canopus-us.com>

The --prefix and --exec-prefix arguments to autotools configuration files
allow the installation location to be specified. This is particularly
useful when a package must be located in another directory so that it
can be split into a separate filesystem image.

Signed-off-by: David VomLehn <vomlehn@canopus-us.com>
---
 docs/manual/adding-packages-autotools.txt |    8 ++++++++
 package/pkg-autotools.mk                  |    7 ++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index c7e797f..7cac94e 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -99,6 +99,14 @@ cases, typical packages will therefore only use a few of them.
 * +LIBFOO_CONF_OPT+, to specify additional configure
   options to pass to the configure script. By default, empty.
 
+* +LIBFOO_CONF_PREFIX+, to specify the installation directory for
+  architecture-independent files, i.e. the argument to --prefix.
+  By default, /usr.
+
+* +LIBFOO_CONF_EXEC_PREFIX+, to specify the installation directory for
+  architecture-dependent files, i.e. the argument to --exec-prefix.
+  By default, the value given for +LIBFOO_CONF_PREFIX+.
+
 * +LIBFOO_MAKE+, to specify an alternate +make+
   command. This is typically useful when parallel make is enabled in
   the configuration (using +BR2_JLEVEL+) but that this
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index a646612..5cb0f20 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -95,7 +95,8 @@ $(2)_AUTORECONF_OPT		?= $($(3)_AUTORECONF_OPT)
 $(2)_INSTALL_OPT                ?= install
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
-
+$(2)_CONF_PREFIX		?= /usr
+$(2)_CONF_EXEC_PREFIX		?= $$($(2)_CONF_PREFIX)
 
 #
 # Configure step. Only define it if not already defined by the package
@@ -115,8 +116,8 @@ define $(2)_CONFIGURE_CMDS
 		--target=$$(GNU_TARGET_NAME) \
 		--host=$$(GNU_TARGET_NAME) \
 		--build=$$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
+		--prefix=$$($$(PKG)_CONF_PREFIX) \
+		--exec-prefix=$$($$(PKG)_CONF_EXEC_PREFIX) \
 		--sysconfdir=/etc \
 		--program-prefix="" \
 		--disable-gtk-doc \
-- 
1.7.9.5
