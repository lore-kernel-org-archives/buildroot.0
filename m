From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 16 May 2014 22:22:59 +0200
Subject: [Buildroot] [PATCH v2] package/avahi: does not build with
	static-only
Message-ID: <1400271779-15102-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

... and propagate to reverse dependencies.

Fixes (which I reproduced here):
    http://autobuild.buildroot.net/results/ea2/ea2c8f20c4032bf82876805ea787a55834091cec

Should fix (which I did not even try to reproduce):
    http://autobuild.buildroot.net/results/4ef/4ef5bfc17f50bddb00f7ef3d62fc1fe963b7da82
    http://autobuild.buildroot.net/results/76e/76e4854812b0ef3862c080eead4012b35ef27f0f
    http://autobuild.buildroot.net/results/5bf/5bfb3fd9fe61bef5f998dc5999ce2060c334662c
    http://autobuild.buildroot.net/results/dc6/dc607c35471ef6dda04e06ad05ae7794615af578

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>

---
Changes v1 -> v2:
  - add autobuilder references  (Thomas)
  - propagate to reverse dependencies  (Peter)
---
 package/avahi/Config.in | 1 +
 package/xbmc/Config.in  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index fd4d229..483d976 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_AVAHI
 	# libdaemon uses fork()
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Avahi is a system which facilitates service
diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index 1e2f932..75666a4 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -70,6 +70,7 @@ if BR2_PACKAGE_XBMC
 
 config BR2_PACKAGE_XBMC_AVAHI
 	bool "avahi"
+	depends on !BR2_PREFER_STATIC_LIB # avahi
 	select BR2_PACKAGE_AVAHI
 	select BR2_PACKAGE_AVAHI_DAEMON
 	help
-- 
1.8.3.2
