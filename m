From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Jul 2017 18:53:40 +0200
Subject: [Buildroot] [PATCH 18/20] tinycbor: on't download patch from Github
In-Reply-To: <20170702165342.29522-1-thomas.petazzoni@free-electrons.com>
References: <20170702165342.29522-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170702165342.29522-19-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches downloaded from Github are not stable, so bring them in the
tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Fix-static-compilation-of-json2cbor.patch | 28 ++++++++++++++++++++++
 package/tinycbor/tinycbor.hash                     |  1 -
 package/tinycbor/tinycbor.mk                       |  4 ----
 3 files changed, 28 insertions(+), 5 deletions(-)
 create mode 100644 package/tinycbor/0001-Fix-static-compilation-of-json2cbor.patch

diff --git a/package/tinycbor/0001-Fix-static-compilation-of-json2cbor.patch b/package/tinycbor/0001-Fix-static-compilation-of-json2cbor.patch
new file mode 100644
index 0000000..8d265d8
--- /dev/null
+++ b/package/tinycbor/0001-Fix-static-compilation-of-json2cbor.patch
@@ -0,0 +1,28 @@
+From ae608ea2735bd331ec7dcf9d89928c38f0e0c981 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 6 Mar 2017 18:59:22 +0100
+Subject: [PATCH] Fix static compilation of json2cbor
+
+json2cbor depends on cjson so tools/json2cbor/json2cbor.o must be
+before -lcjson
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream commit: https://github.com/01org/tinycbor/commit/ae608ea2735bd331ec7dcf9d89928c38f0e0c981]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 97b292c..a8cb57c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -115,7 +115,7 @@ bin/cbordump: $(CBORDUMP_SOURCES:.c=.o) lib/libtinycbor.a
+ 
+ bin/json2cbor: $(JSON2CBOR_SOURCES:.c=.o) lib/libtinycbor.a
+ 	@$(MKDIR) -p bin
+-	$(CC) -o $@ $(LDFLAGS) $(LDFLAGS_CJSON) $^ $(LDLIBS) -lm
++	$(CC) -o $@ $(LDFLAGS) $^ $(LDFLAGS_CJSON) $(LDLIBS) -lm
+ 
+ tinycbor.pc: tinycbor.pc.in
+ 	$(SED) > $@ < $< \
diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
index 416dce6..6cb0a6e 100644
--- a/package/tinycbor/tinycbor.hash
+++ b/package/tinycbor/tinycbor.hash
@@ -1,3 +1,2 @@
 # Locally computed:
 sha256	8e42984015d62e8323b7f2a439bde157d707e0d7ae57a6d8d5a2665247af6638	tinycbor-v0.4.1.tar.gz
-sha256	1298b80ab23ae24e85515d9f06398236d087bc76dccd0a48757fcb7e54557175	ae608ea2735bd331ec7dcf9d89928c38f0e0c981.patch
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index 1f13e7d..9c3d2eb 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -12,10 +12,6 @@ TINYCBOR_LICENSE_FILES = LICENSE
 TINYCBOR_DEPENDENCIES = host-pkgconf
 TINYCBOR_INSTALL_STAGING = YES
 
-# This patch fixes static build of json2cbor
-TINYCBOR_PATCH = \
-	https://github.com/01org/tinycbor/commit/ae608ea2735bd331ec7dcf9d89928c38f0e0c981.patch
-
 ifeq ($(BR2_PACKAGE_CJSON),y)
 TINYCBOR_DEPENDENCIES += cjson
 endif
-- 
2.9.4
