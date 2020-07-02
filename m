From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu,  2 Jul 2020 18:05:00 +0200
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.54
Message-ID: <20200702160500.3374986-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version to 3.54 and remove 0002[1] and 0003[2] local patches that
has been upstreamed.

Release Notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.54_release_notes

[1]: https://hg.mozilla.org/projects/nss/rev/e955ece90b050e9da67528f09648945156d2bcea
[2]: https://hg.mozilla.org/projects/nss/rev/f46fca8ced7fca6aa6de60e3170b2a3b6b2df565

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...d-infinite-recursion-when-CHECKLOC-i.patch | 30 -----------
 ...-seed.o-back-into-freeblpriv3.-r-bbe.patch | 50 -------------------
 package/libnss/libnss.hash                    |  4 +-
 package/libnss/libnss.mk                      |  2 +-
 4 files changed, 3 insertions(+), 83 deletions(-)
 delete mode 100644 package/libnss/0002-Bug-1642153-Avoid-infinite-recursion-when-CHECKLOC-i.patch
 delete mode 100644 package/libnss/0003-Bug-1642146-Move-seed.o-back-into-freeblpriv3.-r-bbe.patch

diff --git a/package/libnss/0002-Bug-1642153-Avoid-infinite-recursion-when-CHECKLOC-i.patch b/package/libnss/0002-Bug-1642153-Avoid-infinite-recursion-when-CHECKLOC-i.patch
deleted file mode 100644
index c8bdfd7a3f..0000000000
--- a/package/libnss/0002-Bug-1642153-Avoid-infinite-recursion-when-CHECKLOC-i.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b0e9408ea779b37e97e706d037e497d2bf807593 Mon Sep 17 00:00:00 2001
-From: Mike Hommey <mh@glandium.org>
-Date: Wed, 3 Jun 2020 03:04:49 +0000
-Subject: [PATCH] Bug 1642153 - Avoid infinite recursion when CHECKLOC is not
- set. r=jcj
-
-Differential Revision: https://phabricator.services.mozilla.com/D77596
-
---HG--
-extra : moz-landing-system : lando
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- nss/cmd/shlibsign/Makefile | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/nss/cmd/shlibsign/Makefile b/cmd/shlibsign/Makefile
-index 73641d996..a1192055c 100644
---- a/nss/cmd/shlibsign/Makefile
-+++ b/nss/cmd/shlibsign/Makefile
-@@ -96,4 +96,6 @@ else
- endif
- 
- libs: install
-+ifdef CHECKLOC
- 	$(MAKE) $(CHECKLOC)
-+endif
--- 
-2.25.1
-
diff --git a/package/libnss/0003-Bug-1642146-Move-seed.o-back-into-freeblpriv3.-r-bbe.patch b/package/libnss/0003-Bug-1642146-Move-seed.o-back-into-freeblpriv3.-r-bbe.patch
deleted file mode 100644
index c9321658fd..0000000000
--- a/package/libnss/0003-Bug-1642146-Move-seed.o-back-into-freeblpriv3.-r-bbe.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 0841ebe3c85bfb12ecf080efb2e28ac18f55ed41 Mon Sep 17 00:00:00 2001
-From: Mike Hommey <mh@glandium.org>
-Date: Mon, 15 Jun 2020 18:12:09 +0000
-Subject: [PATCH] Bug 1642146 - Move seed.o back into freeblpriv3.
- r=bbeurdouche
-
-Differential Revision: https://phabricator.services.mozilla.com/D77595
-
---HG--
-extra : moz-landing-system : lando
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- nss/lib/freebl/Makefile    | 4 ----
- nss/lib/freebl/manifest.mn | 4 ++++
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
-index 29dc940a3..52d827c6a 100644
---- a/nss/lib/freebl/Makefile
-+++ b/nss/lib/freebl/Makefile
-@@ -545,10 +545,6 @@ ifndef HAVE_INT128_SUPPORT
-     DEFINES += -DKRML_VERIFIED_UINT128
- endif
- 
--ifndef NSS_DISABLE_DEPRECATED_SEED
--	CSRCS += deprecated/seed.c
--endif
--
- ifndef NSS_DISABLE_CHACHAPOLY
-     ifeq ($(CPU_ARCH),x86_64)
-         ifndef NSS_DISABLE_AVX2
-diff --git a/nss/lib/freebl/manifest.mn b/nss/lib/freebl/manifest.mn
-index 5efb48520..8dd8ddb53 100644
---- a/nss/lib/freebl/manifest.mn
-+++ b/nss/lib/freebl/manifest.mn
-@@ -160,6 +160,10 @@ CSRCS = \
- 	$(EXTRA_SRCS) \
- 	$(NULL)
- 
-+ifndef NSS_DISABLE_DEPRECATED_SEED
-+	CSRCS += deprecated/seed.c
-+endif
-+
- ALL_CSRCS := $(CSRCS)
- 
- ALL_HDRS =  \
--- 
-2.25.1
-
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 5f76bffd00..aedc0669de 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_53_1_RTM/src/SHA256SUMS
-sha256	2dccde67079b25c4e95ac3121f11b2819c37cf8c48ca263a45d8f83f7a315316  nss-3.53.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_54_RTM/src/SHA256SUMS
+sha256	dab18bbfcf5e347934cda664df75ce9fd912a5772686c40d3c805e53c08d6e43  nss-3.54.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 8b31892353..adebaa6173 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.53.1
+LIBNSS_VERSION = 3.54
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1
