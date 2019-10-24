From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 24 Oct 2019 11:03:20 +0200
Subject: [Buildroot] [git commit] package/ofono: use external ell library
Message-ID: <20191024085838.C710A8433B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91221084f2440542348535a111b61ad166a66dd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add comments to the dependencies that also come from ell. Note that the
BR2_TOOLCHAIN_HAS_SYNC_4 is coming both from ell and from internal sync
calls, so no comment is added.

While we're at it, also order the selects and DEPENDENCIES
alphabetically.

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
[Arnout: extend "reason" comments to Config.in; alphabetical ordering]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ofono/Config.in | 7 ++++---
 package/ofono/ofono.mk  | 4 +++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index 70daef7a1b..57ee4bc536 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -1,12 +1,13 @@
 config BR2_PACKAGE_OFONO
 	bool "ofono"
-	depends on BR2_USE_WCHAR # gettext, libglib2
+	depends on BR2_USE_WCHAR # gettext, libglib2, ell
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
-	depends on !BR2_STATIC_LIBS # dlopen()
+	depends on !BR2_STATIC_LIBS # dlopen(), ell
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_ELL
+	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO
 	help
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 95a6c8c599..18248b50d1 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -12,11 +12,13 @@ OFONO_LICENSE_FILES = COPYING
 OFONO_DEPENDENCIES = \
 	host-pkgconf \
 	dbus \
-	libglib2 \
+	ell \
 	libcap-ng \
+	libglib2 \
 	mobile-broadband-provider-info
 
 OFONO_CONF_OPTS = \
+	--enable-external-ell \
 	--disable-test \
 	--with-dbusconfdir=/etc \
 	$(if $(BR2_INIT_SYSTEMD),--with-systemdunitdir=/usr/lib/systemd/system)
