From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 18 Aug 2016 23:54:38 +0530
Subject: [Buildroot] [PATCH 2/2] fwup: fix static linking issues
In-Reply-To: <1471544678-12514-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1471544678-12514-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1471544678-12514-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In case of static linking, we need to link against dependencies of
dependencies. When static libs are enabled, pkg-config seems to be
outputting private libs implicitly without need of --static option.

Instead of manually adding libs for dependencies of libconfuse and
libarchive, use pkg-config.

Fixes:

  http://autobuild.buildroot.net/results/69d/69d410e13a49b0ed34c501ba27d32df3269adb16/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/fwup/fwup.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
index ae85716..db13fcc 100644
--- a/package/fwup/fwup.mk
+++ b/package/fwup/fwup.mk
@@ -13,5 +13,9 @@ HOST_FWUP_DEPENDENCIES = host-libconfuse host-libarchive host-libsodium
 FWUP_AUTORECONF = YES
 FWUP_CONF_ENV = ac_cv_path_HELP2MAN=""
 
+ifeq ($(BR2_STATIC_LIBS),y)
+FWUP_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libconfuse libarchive`"
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.6.2
