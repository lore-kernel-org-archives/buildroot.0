From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Mon, 18 May 2015 11:24:44 -0300
Subject: [Buildroot] [PATCH v2 2/6] pkg-utils: implement INFLATE for .deb
	files
In-Reply-To: <1431959088-15257-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1431959088-15257-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1431959088-15257-3-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows to use packages that are shipped in the .deb format.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 Makefile                       | 2 ++
 package/pkg-utils.mk           | 1 +
 support/extract/inflate-deb.sh | 5 +++++
 3 files changed, 8 insertions(+)
 create mode 100755 support/extract/inflate-deb.sh

diff --git a/Makefile b/Makefile
index 5c4293b..c20da1f 100644
--- a/Makefile
+++ b/Makefile
@@ -339,6 +339,8 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 ZCAT := $(call qstrip,$(BR2_ZCAT))
 BZCAT := $(call qstrip,$(BR2_BZCAT))
 XZCAT := $(call qstrip,$(BR2_XZCAT))
+export ZCAT BZCAT XZCAT
+
 TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
 # packages compiled for the host go here
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 99a3c1e..196dd36 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -77,6 +77,7 @@ INFLATE.tbz  = $(BZCAT)
 INFLATE.tbz2 = $(BZCAT)
 INFLATE.tgz  = $(ZCAT)
 INFLATE.xz   = $(XZCAT)
+INFLATE.deb  = ./support/extract/inflate-deb.sh
 INFLATE.tar  = cat
 # suitable-extractor(filename): returns extractor based on suffix
 suitable-extractor = $(INFLATE$(suffix $(1)))
diff --git a/support/extract/inflate-deb.sh b/support/extract/inflate-deb.sh
new file mode 100755
index 0000000..39e7b52
--- /dev/null
+++ b/support/extract/inflate-deb.sh
@@ -0,0 +1,5 @@
+#!/usr/bin/env bash
+
+DEBFILE=$1
+
+ar fp ${DEBFILE} data.tar.xz | ${XZCAT} -d
-- 
2.1.4
