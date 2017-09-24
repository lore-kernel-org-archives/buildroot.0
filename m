From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 15:26:19 +0200
Subject: [Buildroot] [git commit] package/pinentry: added optional support
	for qt5
Message-ID: <20170924132001.89D3B80F8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6759caf679c5a479639ece9e2486eb9333e02708
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream added support for qt5:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commit;h=abb59f50abf698ff1e56490fb39bcc98c26ab44b

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Arnout: completely separate qt4 and qt5 in the .mk file instead of
 making a complicated mix.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pinentry/Config.in   | 23 ++++++++++++++++++++++-
 package/pinentry/pinentry.mk |  6 ++++--
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index a92cd82..781901b 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -5,7 +5,10 @@ menuconfig BR2_PACKAGE_PINENTRY
 	select BR2_PACKAGE_LIBASSUAN
 	select BR2_PACKAGE_LIBGPG_ERROR
 	# At least one backend is needed to avoid build breakage
-	select BR2_PACKAGE_PINENTRY_NCURSES if !BR2_PACKAGE_PINENTRY_GTK2 && !BR2_PACKAGE_PINENTRY_QT4
+	select BR2_PACKAGE_PINENTRY_NCURSES if \
+		!BR2_PACKAGE_PINENTRY_GTK2 && \
+		!BR2_PACKAGE_PINENTRY_QT4 && \
+		!BR2_PACKAGE_PINENTRY_QT5
 	help
 	  A collection of simple PIN or pass-phrase entry dialogs
 
@@ -53,4 +56,22 @@ comment "pinentry-qt4 needs a toolchain w/ C++, threads"
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
index 3f3b24c..4081a8a 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -48,13 +48,15 @@ else
 PINENTRY_CONF_OPTS += --disable-pinentry-gtk2
 endif
 
-# pinentry-qt4 backend
+# pinentry-qt4/5 backend
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
