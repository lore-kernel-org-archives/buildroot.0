From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Nov 2020 10:39:38 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/fastd: libcap is
 optional not mandatory
Message-ID: <20201103093825.73A0386FC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66197f976037bfb601186d1d10a1b6bf0068a287
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

libcap is an optional dependency which is available since version 7:
https://github.com/NeoRaider/fastd/commit/eaac49427339a365aac2d3505f567572cfbdbb96

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 25ab2d8b11d9599696133b1bc30494b50625e768)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fastd/Config.in | 1 -
 package/fastd/fastd.mk  | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/fastd/Config.in b/package/fastd/Config.in
index c4f296dd63..5319d68503 100644
--- a/package/fastd/Config.in
+++ b/package/fastd/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_FASTD
 	select BR2_PACKAGE_LIBUECC
 	select BR2_PACKAGE_LIBSODIUM
 	select BR2_PACKAGE_LIBSODIUM_FULL
-	select BR2_PACKAGE_LIBCAP
 	help
 	  Fast and Secure Tunneling Daemon
 
diff --git a/package/fastd/fastd.mk b/package/fastd/fastd.mk
index 157ba585f4..577ca6f04c 100644
--- a/package/fastd/fastd.mk
+++ b/package/fastd/fastd.mk
@@ -10,11 +10,18 @@ FASTD_SOURCE = fastd-$(FASTD_VERSION).tar.xz
 FASTD_LICENSE = BSD-2-Clause
 FASTD_LICENSE_FILES = COPYRIGHT
 FASTD_CONF_OPTS = -DENABLE_LIBSODIUM=ON
-FASTD_DEPENDENCIES = host-bison host-pkgconf libuecc libsodium libcap
+FASTD_DEPENDENCIES = host-bison host-pkgconf libuecc libsodium
 
 # 0002-receive-fix-buffer-leak-when-receiving-invalid-packets.patch
 FASTD_IGNORE_CVES += CVE-2020-27638
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+FASTD_CONF_OPTS += -DWITH_CAPABILITIES=ON
+FASTD_DEPENDENCIES += libcap
+else
+FASTD_CONF_OPTS += -DWITH_CAPABILITIES=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 FASTD_CONF_OPTS += -DENABLE_OPENSSL=ON
 FASTD_DEPENDENCIES += openssl
