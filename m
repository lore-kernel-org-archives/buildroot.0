From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 22:51:47 +0200
Subject: [Buildroot] [git commit branch/next] package/sofia-sip: bump
 version to 1.13.1
Message-ID: <20200829204526.972477FF10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56952e95d6c9590b75bff054cc7a06090c09ba0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Rebased patch 0001.

Added patch 0002 previously used for the sofia-sip library which was
bundled with the freeswitch source:
https://git.buildroot.net/buildroot/commit/package/freeswitch?id=3c2e8b2b29a88c35c8a9867537d3ce3d0af85bc2
The bundled library was removed in freeswitch-1.10.4.

Switched upstream to freeswitch repo according to
http://sofia-sip.sourceforge.net/

"This repository is not currently maintained.

 The FreeSWITCH project hosts a currently maintained version of this
 library at https://github.com/freeswitch/sofia-sip"

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ag.h-reintroduce-soatag_local_sdp_str_ref.patch |  6 +++-
 .../sofia-sip/0002-sofia-sip-fix-s2tcase.c.patch   | 38 ++++++++++++++++++++++
 package/sofia-sip/Config.in                        |  2 +-
 package/sofia-sip/sofia-sip.hash                   |  2 +-
 package/sofia-sip/sofia-sip.mk                     |  4 +--
 5 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/package/sofia-sip/0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch b/package/sofia-sip/0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch
index 2d52348617..57c0bfe250 100644
--- a/package/sofia-sip/0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch
+++ b/package/sofia-sip/0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch
@@ -4,6 +4,10 @@ Date: Thu, 24 Mar 2011 14:45:21 +0200
 Subject: [PATCH] soa_tag.h: reintroduce soatag_local_sdp_str_ref
 
 Thanks to Erik Habicht <e.habicht@thiesen.com> for spotting it
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[rebased for sofia-sip 1.13.1-d10a3d268c, patch sent upstream
+ https://github.com/freeswitch/sofia-sip/pull/23]
 ---
  libsofia-sip-ua/soa/sofia-sip/soa_tag.h |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)
@@ -12,7 +16,7 @@ diff --git a/libsofia-sip-ua/soa/sofia-sip/soa_tag.h b/libsofia-sip-ua/soa/sofia
 index 723ca02..d9448d6 100644
 --- a/libsofia-sip-ua/soa/sofia-sip/soa_tag.h
 +++ b/libsofia-sip-ua/soa/sofia-sip/soa_tag.h
-@@ -118,7 +118,7 @@ SOFIAPUBVAR tag_typedef_t soatag_local_sdp_ref;
+@@ -130,7 +130,7 @@ SOFIAPUBVAR tag_typedef_t soatag_local_sdp_ref;
  SOFIAPUBVAR tag_typedef_t soatag_local_sdp_str;
  #define SOATAG_LOCAL_SDP_STR_REF(x) \
    soatag_local_sdp_str_ref, tag_str_vr(&(x))
diff --git a/package/sofia-sip/0002-sofia-sip-fix-s2tcase.c.patch b/package/sofia-sip/0002-sofia-sip-fix-s2tcase.c.patch
new file mode 100644
index 0000000000..a2cc412843
--- /dev/null
+++ b/package/sofia-sip/0002-sofia-sip-fix-s2tcase.c.patch
@@ -0,0 +1,38 @@
+From d66a2e55daf223737c07c59b1be45a2d91212ef6 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 26 Jul 2020 13:47:16 +0200
+Subject: [PATCH] [sofia-sip] fix s2tcase.c
+
+Fixes build error with recent libcheck:
+https://github.com/freeswitch/sofia-sip/issues/22
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ s2check/s2tcase.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libs/sofia-sip/s2check/s2tcase.c b/libs/sofia-sip/s2check/s2tcase.c
+index 382aaa3ad7..d67694c2ce 100644
+--- a/s2check/s2tcase.c
++++ b/s2check/s2tcase.c
+@@ -57,7 +57,7 @@ void s2_tcase_add_test(TCase *tc, TFun tf, char const *name,
+       if (strcmp(*patterns, "*")) {
+ 	printf("%s: selected\n", name);
+       }
+-      _tcase_add_test(tc, tf, name, signo, 0, start, end);
++      _tcase_add_test(tc, tf, name, signo, start, end);
+       return;
+     }
+   }
+@@ -67,7 +67,7 @@ void s2_tcase_add_test(TCase *tc, TFun tf, char const *name,
+       if (strcmp(*patterns, "*")) {
+ 	printf("%s: selected\n", name);
+       }
+-      _tcase_add_test(tc, tf, name, signo, 0, start, end);
++      _tcase_add_test(tc, tf, name, signo, start, end);
+       return;
+     }
+   }
+-- 
+2.27.0
+
diff --git a/package/sofia-sip/Config.in b/package/sofia-sip/Config.in
index 24e2148ab9..2ad1940833 100644
--- a/package/sofia-sip/Config.in
+++ b/package/sofia-sip/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_SOFIA_SIP
 	  client software for uses such as VoIP, IM, and many other
 	  real-time and person-to-person communication services.
 
-	  http://sofia-sip.sourceforge.net/
+	  https://github.com/freeswitch/sofia-sip
 
 comment "sofia-sip needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/sofia-sip/sofia-sip.hash b/package/sofia-sip/sofia-sip.hash
index 6e81ec878f..99b315e276 100644
--- a/package/sofia-sip/sofia-sip.hash
+++ b/package/sofia-sip/sofia-sip.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  2b01bc2e1826e00d1f7f57d29a2854b15fd5fe24695e47a14a735d195dd37c81  sofia-sip-1.12.11.tar.gz
+sha256  4cf0de1aaa1e1737db5a8fe4104021a8e60a148a4534f92b5affdd9782e404aa  sofia-sip-1.13.1-d10a3d268c.tar.gz
 sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  COPYING
 sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  COPYRIGHTS
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 831b9ea54d..54b48a7048 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SOFIA_SIP_VERSION = 1.12.11
-SOFIA_SIP_SITE = http://downloads.sourceforge.net/project/sofia-sip/sofia-sip/$(SOFIA_SIP_VERSION)
+SOFIA_SIP_VERSION = 1.13.1-d10a3d268c
+SOFIA_SIP_SITE = https://files.freeswitch.org/downloads/libs
 SOFIA_SIP_INSTALL_STAGING = YES
 SOFIA_SIP_DEPENDENCIES = host-pkgconf
 SOFIA_SIP_LICENSE = LGPL-2.1+
