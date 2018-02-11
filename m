From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sun, 11 Feb 2018 11:13:20 -0500
Subject: [Buildroot] [RFC 2/2] qt5webengine: select libnss
In-Reply-To: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
References: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180211161320.8864-3-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since Qt WebEngine 5.10, libnss is a requirement[1] because OpenSSL
certificate validation[3] and NSS bundle[3] was dropped.

Let satisfy this requirement by selecting libnss.

Fixes:

	A suitable version of nss could not be found.
	QtWebEngine will not be built.

[1]: https://github.com/qt/qtwebengine/commit/9b449045fbd5fd3b58bcaff6cf0c5878cd6e64eb
[2]: https://codereview.chromium.org/2862543003
[3]: https://codereview.chromium.org/1882433002

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5webengine/Config.in       | 1 +
 package/qt5/qt5webengine/qt5webengine.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 387ce0a76e..c231ad2993 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -38,6 +38,7 @@ config BR2_PACKAGE_QT5WEBENGINE
 	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if !BR2_ARCH_IS_64 # v8/chromium
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBNSS if !BR2_PACKAGE_QT5_VERSION_5_6
 	select BR2_PACKAGE_LIBVPX
 	select BR2_PACKAGE_OPUS
 	select BR2_PACKAGE_WEBP
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 31d625d06c..69b7356a51 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -7,7 +7,7 @@
 QT5WEBENGINE_VERSION = $(QT5_VERSION)
 QT5WEBENGINE_SITE = $(QT5_SITE)
 QT5WEBENGINE_SOURCE = $(call qt5source,qtwebengine,$(QT5WEBENGINE_VERSION))
-QT5WEBENGINE_DEPENDENCIES = ffmpeg libglib2 libvpx opus webp qt5base \
+QT5WEBENGINE_DEPENDENCIES = ffmpeg libglib2 libnss libvpx opus webp qt5base \
 	qt5declarative qt5webchannel host-bison host-flex host-gperf \
 	host-pkgconf host-python
 QT5WEBENGINE_INSTALL_STAGING = YES
-- 
2.15.1
