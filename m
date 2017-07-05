From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:34:35 +0200
Subject: [Buildroot] [git commit] libpwquality: Link with zlib when required
	in static builds
Message-ID: <20170705143119.EC5B9816D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0ad066e4a4524375c13564be99aa779d24d1b73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/cfb3a591391d90762a326d91af3ec502a6161ac5

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpwquality/libpwquality.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libpwquality/libpwquality.mk b/package/libpwquality/libpwquality.mk
index 66b15d8..697af0b 100644
--- a/package/libpwquality/libpwquality.mk
+++ b/package/libpwquality/libpwquality.mk
@@ -27,6 +27,11 @@ else
 LIBPWQUALITY_CONF_OPTS += --disable-pam
 endif
 
+# Static link with cracklib requires -lz if zlib is enabled
+ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_ZLIB),yy)
+LIBPWQUALITY_CONF_ENV += LIBS="-lz"
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPWQUALITY_TOOLS),)
 define LIBPWQUALITY_REMOVE_TOOLS
 	rm -f $(TARGET_DIR)/usr/bin/pwmake
