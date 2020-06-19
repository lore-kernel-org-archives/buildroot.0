From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 19 Jun 2020 02:01:47 +0200
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.53.1
Message-ID: <20200619000147.86253-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version to 3.53.1 and add a patch from upstream[1] to fix build
failure.

Release notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.53.1_release_notes

[1]:
https://hg.mozilla.org/projects/nss/rev/e955ece90b050e9da67528f09648945156d2bcea

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...d-infinite-recursion-when-CHECKLOC-i.patch | 30 +++++++++++++++++++
 package/libnss/libnss.hash                    |  4 +--
 package/libnss/libnss.mk                      |  2 +-
 3 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 package/libnss/0002-Bug-1642153-Avoid-infinite-recursion-when-CHECKLOC-i.patch

diff --git a/package/libnss/0002-Bug-1642153-Avoid-infinite-recursion-when-CHECKLOC-i.patch b/package/libnss/0002-Bug-1642153-Avoid-infinite-recursion-when-CHECKLOC-i.patch
new file mode 100644
index 0000000000..c8bdfd7a3f
--- /dev/null
+++ b/package/libnss/0002-Bug-1642153-Avoid-infinite-recursion-when-CHECKLOC-i.patch
@@ -0,0 +1,30 @@
+From b0e9408ea779b37e97e706d037e497d2bf807593 Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Wed, 3 Jun 2020 03:04:49 +0000
+Subject: [PATCH] Bug 1642153 - Avoid infinite recursion when CHECKLOC is not
+ set. r=jcj
+
+Differential Revision: https://phabricator.services.mozilla.com/D77596
+
+--HG--
+extra : moz-landing-system : lando
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ nss/cmd/shlibsign/Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/nss/cmd/shlibsign/Makefile b/cmd/shlibsign/Makefile
+index 73641d996..a1192055c 100644
+--- a/nss/cmd/shlibsign/Makefile
++++ b/nss/cmd/shlibsign/Makefile
+@@ -96,4 +96,6 @@ else
+ endif
+ 
+ libs: install
++ifdef CHECKLOC
+ 	$(MAKE) $(CHECKLOC)
++endif
+-- 
+2.25.1
+
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 425f5da515..5f76bffd00 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_52_RTM/src/SHA256SUMS
-sha256	0a0aeb0cdda65ddcb64f746223df58b150f6803f4bfa1a4e876bbe6f9c4c1561  nss-3.52.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_53_1_RTM/src/SHA256SUMS
+sha256	2dccde67079b25c4e95ac3121f11b2819c37cf8c48ca263a45d8f83f7a315316  nss-3.53.1.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 020cf212d4..8b31892353 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.52
+LIBNSS_VERSION = 3.53.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1
