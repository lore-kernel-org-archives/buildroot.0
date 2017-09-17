From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Sep 2017 17:18:36 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/pinentry: added optional support
	for qt5
In-Reply-To: <20170917151836.3661-1-bernd.kuhls@t-online.de>
References: <20170917151836.3661-1-bernd.kuhls@t-online.de>
Message-ID: <20170917151836.3661-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream added support for qt5:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commit;h=abb59f50abf698ff1e56490fb39bcc98c26ab44b

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Moved rename of configure option -pinentry-qt4 to -pinentry-qt to
    the patch bumping the package version.

 package/pinentry/Config.in   | 18 ++++++++++++++++++
 package/pinentry/pinentry.mk |  4 +++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index a92cd82a22..7184a10c7b 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -53,4 +53,22 @@ comment "pinentry-qt4 needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
+config BR2_PACKAGE_PINENTRY_QT5
+	bool "pinentry-qt5"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_PACKAGE_PINENTRY_QT4
+	select BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	help
+	  The pinentry-qt5 tool
+
+comment "pinentry-qt5 needs a toolchain w/ wchar, NPTL, C++, dynamic library"
+	depends on !BR2_PACKAGE_PINENTRY_QT4
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+
 endif
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index 3f3b24c682..97fdea42cb 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -49,12 +49,14 @@ PINENTRY_CONF_OPTS += --disable-pinentry-gtk2
 endif
 
 # pinentry-qt4 backend
+ifeq ($(BR2_PACKAGE_PINENTRY_QT4)$(BR2_PACKAGE_PINENTRY_QT5),y)
 ifeq ($(BR2_PACKAGE_PINENTRY_QT4),y)
 # -pthread needs to be passed for certain toolchains
 # http://autobuild.buildroot.net/results/6be/6be109ccedec603a67cebdb31b55865dcce0e128/
 PINENTRY_CONF_OPTS += LIBS=-pthread MOC=$(HOST_DIR)/bin/moc
+endif
 PINENTRY_CONF_OPTS += --enable-pinentry-qt
-PINENTRY_DEPENDENCIES += qt
+PINENTRY_DEPENDENCIES += $(if $(BR2_PACKAGE_PINENTRY_QT4),qt,qt5base)
 else
 PINENTRY_CONF_OPTS += --disable-pinentry-qt
 endif
-- 
2.11.0
