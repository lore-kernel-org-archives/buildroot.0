From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Apr 2021 22:18:38 +0200
Subject: [Buildroot] [git commit] package/uboot-tools: security bump to
 version 2021.04
Message-ID: <20210420195202.64F9F83649@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4c38ae470e6c472f0e0cdfbfb8e2e76f1e8047c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2021-27097: The boot loader in Das U-Boot before 2021.04-rc2
  mishandles a modified FIT.
- Fix CVE-2021-27138: The boot loader in Das U-Boot before 2021.04-rc2
  mishandles use of unit addresses in a FIT.

- Update second patch
- Drop fourth patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-tools-only-in-no-dot-config-targets.patch |  6 ++-
 .../0004-tools-env-fw_env.h-remove-env.h.patch     | 52 ----------------------
 package/uboot-tools/uboot-tools.hash               |  2 +-
 package/uboot-tools/uboot-tools.mk                 |  2 +-
 4 files changed, 6 insertions(+), 56 deletions(-)

diff --git a/package/uboot-tools/0002-tools-only-in-no-dot-config-targets.patch b/package/uboot-tools/0002-tools-only-in-no-dot-config-targets.patch
index a376afbc75..8557af499a 100644
--- a/package/uboot-tools/0002-tools-only-in-no-dot-config-targets.patch
+++ b/package/uboot-tools/0002-tools-only-in-no-dot-config-targets.patch
@@ -20,6 +20,8 @@ http://ftp.de.debian.org/debian/pool/main/u/u-boot/u-boot_2014.10+dfsg1-2.1.debi
 Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
 [fabio: adapt it to 2016.09]
 Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
+[Fabrice: adapt it to 2021.04]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -32,8 +34,8 @@ index 6aa08964ff..fcec83d183 100644
  
  no-dot-config-targets := clean clobber mrproper distclean \
  			 help %docs check% coccicheck \
--			 ubootversion backup tests check qcheck
-+			 ubootversion backup tests tools-only check qcheck
+-			 ubootversion backup tests check qcheck tcheck
++			 ubootversion backup tests tools-only check qcheck tcheck
  
  config-targets := 0
  mixed-targets  := 0
diff --git a/package/uboot-tools/0004-tools-env-fw_env.h-remove-env.h.patch b/package/uboot-tools/0004-tools-env-fw_env.h-remove-env.h.patch
deleted file mode 100644
index f5d9c2b2ca..0000000000
--- a/package/uboot-tools/0004-tools-env-fw_env.h-remove-env.h.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 664ef61e19d6261d8984493b5f22127ec2ad44fc Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sun, 10 May 2020 23:15:32 +0200
-Subject: [PATCH] tools/env/fw_env.h: remove env.h
-
-As reported by Nicolas Carrier on the Buildroot mailing list [1],
-there is a new build issue while building a program which interacts with
-the u-boot environment. This program uses the headers of the ubootenv
-library provided by uboot-tools.
-
-This is an upstream change from uboot [2] adding "#include <env.h>" to
-fw_env.h. Adding env.h require a board configuration to build.
-
-But only fw_env.h header is installed in the staging directory by
-uboot-tools package, but since it now include env.h the build is broken
-because env.h is missing from the staging directory.
-
-It's seems an upstream bug since env_set() is not used in fw_env tool.
-
-Adding env.h is an error since it also include compiler.h (and others
-uboot internal includes).
-
-Nicolas removed env.h from fw_env tool and fixed it's build issue.
-
-This problem is present since uboot v2019.10, so the uboot version
-present in Buildroot 2020.02 is affected.
-
-[1] http://lists.busybox.net/pipermail/buildroot/2020-April/280307.html
-[2] https://gitlab.denx.de/u-boot/u-boot/-/commit/9fb625ce05539fe6876a59ce1dcadb76b33c6f6e
-
-Reported-by: Nicolas Carrier <nicolas.carrier@orolia.com>
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-Upstream: https://gitlab.denx.de/u-boot/u-boot/-/commit/2aca8804d8d5f84d2d661e76e8d232c5c12445b5
----
- tools/env/fw_env.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/tools/env/fw_env.h b/tools/env/fw_env.h
-index b60fbfc8f8..78c803c944 100644
---- a/tools/env/fw_env.h
-+++ b/tools/env/fw_env.h
-@@ -4,7 +4,6 @@
-  * Wolfgang Denk, DENX Software Engineering, wd at denx.de.
-  */
- 
--#include <env.h>
- #include <stdint.h>
- 
- /*
--- 
-2.25.4
-
diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index 8274246cf6..9a0b0cb6b0 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  fe732aaf037d9cc3c0909bad8362af366ae964bbdac6913a34081ff4ad565372  u-boot-2020.04.tar.bz2
+sha256  0d438b1bb5cceb57a18ea2de4a0d51f7be5b05b98717df05938636e0aadfe11a  u-boot-2021.04.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index c4006fe3de..179e39f9c0 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2020.04
+UBOOT_TOOLS_VERSION = 2021.04
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPL-2.0+
