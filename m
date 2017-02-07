From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  7 Feb 2017 09:04:11 -0500
Subject: [Buildroot] [PATCH 2/2] logrotate: enable selinux support.
In-Reply-To: <20170207140411.2656-1-Adamduskett@outlook.com>
References: <20170207140411.2656-1-Adamduskett@outlook.com>
Message-ID: <20170207140411.2656-2-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Selinux is currently disabled staticly in logrotate. This patch
fixes this by checking for libselinux and adding it as a dependecy
if it has been selected.  The configure script is set to check for
libselinux by default, so I only set --without-selinux implicitly
if libselinux hasn't been selected, otherwise it's left alone.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/logrotate/logrotate.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 7828870..673e452 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -12,7 +12,12 @@ LOGROTATE_DEPENDENCIES = popt host-pkgconf
 # tarball does not have a generated configure script
 LOGROTATE_AUTORECONF = YES
 LOGROTATE_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs popt`"
-LOGROTATE_CONF_OPTS = --without-selinux
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+LOGROTATE_DEPENDENCIES += libselinux
+else
+LOGROTATE_CONF_OPTS += --without-selinux
+endif
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 LOGROTATE_DEPENDENCIES += acl
-- 
2.9.3
