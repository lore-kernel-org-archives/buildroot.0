From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Nov 2020 11:26:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/uclibc-ng-test: disable TLS for
 nios2
Message-ID: <20201128102639.1158730-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable TLS for nios2 to avoid the following build failure:

In file included from tst-tls1.c:6:
tls-macros.h:101:3: error: #error "No support for this architecture so far."
 # error "No support for this architecture so far."
   ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/303e50d996b7261896f163418831fabb40779ff5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uclibc-ng-test/uclibc-ng-test.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
index 9f866f5d71..7ebc5bbcf9 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.mk
+++ b/package/uclibc-ng-test/uclibc-ng-test.mk
@@ -39,7 +39,7 @@ ifeq ($(BR2_STATIC_LIBS),y)
 UCLIBC_NG_TEST_MAKE_ENV += NO_TLS=1 NO_NPTL=1 NO_DL=1
 endif
 # no TLS macros available
-ifeq ($(BR2_nds32)$(BR2_s390x),y)
+ifeq ($(BR2_nds32)$(BR2_nios2)$(BR2_s390x),y)
 UCLIBC_NG_TEST_MAKE_ENV += NO_TLS=1
 endif
 
-- 
2.29.2
