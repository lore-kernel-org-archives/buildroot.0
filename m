From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jan 2016 17:55:03 +0100
Subject: [Buildroot] [git commit] alsa-utils: needs dynamic library support
Message-ID: <20160116165614.9557C80141@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4707383c5d501a9ad7698579e5d0a4e2ab758c7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since recent bumps of alsa-lib and alsa-utils, alsa-lib installs
<alsa/topology.h>, which alsa-utils uses to build an alsatplg program
which requires <dlfcn.h>. Therefore, alsa-utils now needs dynamic
library support.

Fixes:

  http://autobuild.buildroot.net/results/7ba954e03822d758e25356935b0dfc2c91d3712a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/alsa-utils/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index a08743e..af3d466 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -1,11 +1,12 @@
-comment "alsa-utils needs a toolchain w/ threads"
+comment "alsa-utils needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU # fork
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_ALSA_UTILS
 	bool "alsa-utils"
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	depends on !BR2_STATIC_LIBS # uses dlfcn.h
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
