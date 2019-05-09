From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  9 May 2019 22:28:08 +0200
Subject: [Buildroot] [PATCH 2/2] package/netsurf: do not allow on static
 linking configurations
In-Reply-To: <20190509202808.6741-1-thomas.petazzoni@bootlin.com>
References: <20190509202808.6741-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190509202808.6741-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Static linking does not work properly in netsurf, nobody fixed it, and
the netsurf build system is completely broken. Let's disable the
package for static linking configurations.

Fixes:

  http://autobuild.buildroot.net/results/28b43c29e241080e23c87145797ea00dc4b3970d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netsurf/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/netsurf/Config.in b/package/netsurf/Config.in
index 8a301e6218..30b2695309 100644
--- a/package/netsurf/Config.in
+++ b/package/netsurf/Config.in
@@ -1,5 +1,10 @@
+comment "netsurf needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_NETSURF
 	bool "netsurf"
+	# static linking support is broken beyond repair
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-- 
2.21.0
