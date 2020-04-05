From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Apr 2020 16:28:23 +0200
Subject: [Buildroot] [PATCH 2/2] package/python3: add optional support for
 berkeleydb
In-Reply-To: <20200405142823.836514-1-bernd.kuhls@t-online.de>
References: <20200405142823.836514-1-bernd.kuhls@t-online.de>
Message-ID: <20200405142823.836514-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested using this defconfig:

BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_BERKELEYDB=y

Without this patch:

$ ls -la output/target/usr/lib/python3.8/lib-dynload | grep dbm
$

With this patch:

$ ls -la output/target/usr/lib/python3.8/lib-dynload | grep dbm
-rwxr-xr-x  1 bernd bernd   95240 Apr  5 16:19 _dbm.cpython-38-x86_64-linux-gnu.so

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python3/python3.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 2656037efd..98c78bb156 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -150,6 +150,10 @@ ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
 PYTHON3_DEPENDENCIES += gettext
 endif
 
+ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
+PYTHON3_DEPENDENCIES += berkeleydb
+endif
+
 PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
 	--without-cxx-main \
-- 
2.25.0
