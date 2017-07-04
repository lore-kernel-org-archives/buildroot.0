From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:47:57 +0200
Subject: [Buildroot] [PATCH 017/100] coreutils: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-18-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit uses TARGET_NLS_DEPENDENCIES instead of existing logic to
add the dependency on gettext. To keep the existing behavior, we keep
the --with-libintl-prefix option, but only when a libintl library is
effectively provided by gettext.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/coreutils/coreutils.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 14b952f..6a8a31b 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -77,10 +77,11 @@ else
 COREUTILS_CONF_OPTS += --disable-xattr
 endif
 
+COREUTILS_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
+
 # It otherwise fails to link properly, not mandatory though
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
+ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
 COREUTILS_CONF_OPTS += --with-libintl-prefix=$(STAGING_DIR)/usr
-COREUTILS_DEPENDENCIES += gettext
 endif
 
 ifeq ($(BR2_PACKAGE_GMP),y)
-- 
2.9.4
