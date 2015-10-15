From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Oct 2015 09:48:50 -0300
Subject: [Buildroot] [PATCH] sconeserver: use direct imagemagick disable
Message-ID: <1444913330-16605-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disabling sconesite image isn't enough to avoid imagemagick
autodetection, and if it's present in the host (distro) but not in the
target it gets automatically picked up. Fixes:
http://autobuild.buildroot.net/results/377/37705926f3023395c54af0532ff95f0125fbaa66/

Also add a comment about autoreconf.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sconeserver/sconeserver.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index beca926..2072142 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -10,7 +10,7 @@ SCONESERVER_VERSION = 3b886c3dda6eda39bcb27472d29ed7fd3185ba1d
 SCONESERVER_SITE = $(call github,sconemad,sconeserver,$(SCONESERVER_VERSION))
 SCONESERVER_LICENSE = GPLv2+
 SCONESERVER_LICENSE_FILES = COPYING
-
+# For 0001-fix-ssl-libs-ordering.patch and configure isn't up to date
 SCONESERVER_AUTORECONF = YES
 SCONESERVER_DEPENDENCIES += pcre
 SCONESERVER_CONF_OPTS += --with-ip --with-local --with-ip6
@@ -50,7 +50,7 @@ SCONESERVER_CONF_OPTS += \
 	--with-sconesite-image \
 	--with-Magick++-config="$(STAGING_DIR)/usr/bin/Magick++-config"
 else
-SCONESERVER_CONF_OPTS += --without-sconesite-image
+SCONESERVER_CONF_OPTS += --without-sconesite-image --with-Magick++-config=no
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
-- 
2.4.9
