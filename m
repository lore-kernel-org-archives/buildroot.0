From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:27:25 +0200
Subject: [Buildroot] [git commit] exiv2: use the new gettext logic
Message-ID: <20170704233514.B4D0E7FC74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cdc194883f1f3968cfd8d6683ce67f6c5bbbde84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - using BR2_SYSTEM_ENABLE_NLS instead of BR2_ENABLE_LOCALE to decide
   if NLS support should be enabled or not

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exiv2/exiv2.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 6bc8848..32029ba 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -42,11 +42,10 @@ else
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_XMP=OFF -DEXIV2_ENABLE_LIBXMP=OFF
 endif
 
-ifeq ($(BR2_ENABLE_LOCALE),y)
+EXIV2_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
+
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_NLS=ON
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-EXIV2_DEPENDENCIES += gettext
-endif
 else
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_NLS=OFF
 endif
