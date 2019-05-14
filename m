From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 May 2019 23:13:26 +0200
Subject: [Buildroot] [git commit] package/netsurf: do not allow on static
 linking configurations
Message-ID: <20190514210804.6FB79811CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbfdfa77c476fcde8dc74aaac0c1617a46bd9a24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Static linking does not work properly in netsurf, nobody fixed it, and
the netsurf build system is completely broken. Let's disable the
package for static linking configurations.

Fixes:

  http://autobuild.buildroot.net/results/28b43c29e241080e23c87145797ea00dc4b3970d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
