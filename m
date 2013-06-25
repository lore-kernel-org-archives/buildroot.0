From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jun 2013 21:35:38 +0200
Subject: [Buildroot] [RFCv1 03/18] package: allow to override the make
	install target for host packages
In-Reply-To: <1372188953-29449-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372188953-29449-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372188953-29449-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to convert gcc to the package infrastructure, we need a way
of overriding the name of the make target used for the installation of
host packages, just like we have for target packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-autotools.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index d8d7e6d..09deef2 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -76,6 +76,7 @@ $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPT			?=
 $(2)_AUTORECONF			?= NO
 $(2)_AUTORECONF_OPT		?=
+$(2)_INSTALL_OPT                ?= install
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
 $(2)_CLEAN_OPT			?= clean
@@ -232,7 +233,7 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -C $$($$(PKG)_SRCDIR) install
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_OPT) -C $$($$(PKG)_SRCDIR)
 endef
 endif
 
-- 
1.8.1.2
