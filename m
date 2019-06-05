From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Jun 2019 22:57:18 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/netsurf: do not
 allow on static linking configurations
Message-ID: <20190605210240.2572B813FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab976c72a7e57790554f762f6f070ffd560de7d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Static linking does not work properly in netsurf, nobody fixed it, and
the netsurf build system is completely broken. Let's disable the
package for static linking configurations.

Fixes:

  http://autobuild.buildroot.net/results/28b43c29e241080e23c87145797ea00dc4b3970d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bbfdfa77c476fcde8dc74aaac0c1617a46bd9a24)
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
