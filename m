From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 11 Aug 2015 20:16:50 +0200
Subject: [Buildroot] [PATCH/next 05/10] package/libcodec2: new package
In-Reply-To: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
References: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1439317015-8031-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                             |  1 +
 package/libcodec2/0001-cross.patch            | 44 +++++++++++++++++++++++++++
 package/libcodec2/0002-disable-unittest.patch | 13 ++++++++
 package/libcodec2/Config.in                   |  7 +++++
 package/libcodec2/libcodec2.mk                | 23 ++++++++++++++
 5 files changed, 88 insertions(+)
 create mode 100644 package/libcodec2/0001-cross.patch
 create mode 100644 package/libcodec2/0002-disable-unittest.patch
 create mode 100644 package/libcodec2/Config.in
 create mode 100644 package/libcodec2/libcodec2.mk

diff --git a/package/Config.in b/package/Config.in
index 261cbf2..69c148f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -696,6 +696,7 @@ menu "Audio/Sound"
 	source "package/libbroadvoice/Config.in"
 	source "package/libcdaudio/Config.in"
 	source "package/libcdio/Config.in"
+	source "package/libcodec2/Config.in"
 	source "package/libcue/Config.in"
 	source "package/libcuefile/Config.in"
 	source "package/libid3tag/Config.in"
diff --git a/package/libcodec2/0001-cross.patch b/package/libcodec2/0001-cross.patch
new file mode 100644
index 0000000..78c72f5
--- /dev/null
+++ b/package/libcodec2/0001-cross.patch
@@ -0,0 +1,44 @@
+Use generate_codebook.host host binary
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr libcodec2-ea79085a983487f9ef4dd317639d5b8a1ada90b2.org/src/Makefile.am libcodec2-ea79085a983487f9ef4dd317639d5b8a1ada90b2/src/Makefile.am
+--- libcodec2-ea79085a983487f9ef4dd317639d5b8a1ada90b2.org/src/Makefile.am	2015-05-22 01:18:22.000000000 +0200
++++ libcodec2-ea79085a983487f9ef4dd317639d5b8a1ada90b2/src/Makefile.am	2015-05-25 15:51:44.480029187 +0200
+@@ -89,28 +89,28 @@
+ codebook.lo: codebook.c
+ 
+ codebook.c: generate_codebook $(CODEBOOKS)
+-	./generate_codebook lsp_cb $(CODEBOOKS) > codebook.c
++	./generate_codebook.host lsp_cb $(CODEBOOKS) > codebook.c
+ 
+ codebookd.c: generate_codebook $(CODEBOOKSD)
+-	./generate_codebook lsp_cbd $(CODEBOOKSD) > codebookd.c
++	./generate_codebook.host lsp_cbd $(CODEBOOKSD) > codebookd.c
+ 
+ codebookdt.c: generate_codebook $(CODEBOOKSDT)
+-	./generate_codebook lsp_cbdt $(CODEBOOKSDT) > codebookdt.c
++	./generate_codebook.host lsp_cbdt $(CODEBOOKSDT) > codebookdt.c
+ 
+ codebookvq.c: generate_codebook $(CODEBOOKSVQ)
+-	./generate_codebook lsp_cbvq $(CODEBOOKSVQ) > codebookvq.c
++	./generate_codebook.host lsp_cbvq $(CODEBOOKSVQ) > codebookvq.c
+ 
+ codebookjnd.c: generate_codebook $(CODEBOOKSJND)
+-	./generate_codebook lsp_cbjnd $(CODEBOOKSJND) > codebookjnd.c
++	./generate_codebook.host lsp_cbjnd $(CODEBOOKSJND) > codebookjnd.c
+ 
+ codebookjvm.c: generate_codebook $(CODEBOOKSJVM)
+-	./generate_codebook lsp_cbjvm $(CODEBOOKSJVM) > codebookjvm.c
++	./generate_codebook.host lsp_cbjvm $(CODEBOOKSJVM) > codebookjvm.c
+ 
+ codebookvqanssi.c: generate_codebook $(CODEBOOKSVQANSSI)
+-	./generate_codebook lsp_cbvqanssi $(CODEBOOKSVQANSSI) > codebookvqanssi.c
++	./generate_codebook.host lsp_cbvqanssi $(CODEBOOKSVQANSSI) > codebookvqanssi.c
+ 
+ codebookge.c: generate_codebook $(CODEBOOKSGE)
+-	./generate_codebook ge_cb $(CODEBOOKSGE) > codebookge.c
++	./generate_codebook.host ge_cb $(CODEBOOKSGE) > codebookge.c
+ 
+ clean-local:
+ 	-rm -f codebook.c codebookd.c codebookdvq.c codebookjnd.c codebookdt.c codebookjvm.c codebookge.c codebookvqanssi.c
diff --git a/package/libcodec2/0002-disable-unittest.patch b/package/libcodec2/0002-disable-unittest.patch
new file mode 100644
index 0000000..f31f6df
--- /dev/null
+++ b/package/libcodec2/0002-disable-unittest.patch
@@ -0,0 +1,13 @@
+Disable unittest to avoid depending on C++
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr libcodec2-ea79085a983487f9ef4dd317639d5b8a1ada90b2.org/Makefile.am libcodec2-ea79085a983487f9ef4dd317639d5b8a1ada90b2/Makefile.am
+--- libcodec2-ea79085a983487f9ef4dd317639d5b8a1ada90b2.org/Makefile.am	2015-05-22 01:18:22.000000000 +0200
++++ libcodec2-ea79085a983487f9ef4dd317639d5b8a1ada90b2/Makefile.am	2015-05-25 20:59:29.951589843 +0200
+@@ -94,4 +94,4 @@
+ src/codebook/lsp9.txt \
+ src/codebook/lsp10.txt
+ 
+-SUBDIRS = src unittest
++SUBDIRS = src
diff --git a/package/libcodec2/Config.in b/package/libcodec2/Config.in
new file mode 100644
index 0000000..b27aab1
--- /dev/null
+++ b/package/libcodec2/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBCODEC2
+	bool "libcodec2"
+	help
+	  Codec2 is an open source low bit rate speech codec designed
+	  for communications quality speech between 1200 and 3200 bit/s.
+
+	  http://rowetel.com/codec2.html
diff --git a/package/libcodec2/libcodec2.mk b/package/libcodec2/libcodec2.mk
new file mode 100644
index 0000000..b20d8a2
--- /dev/null
+++ b/package/libcodec2/libcodec2.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# libcodec2
+#
+################################################################################
+
+LIBCODEC2_VERSION = 392a55b4f3f8ad30d845ac6ae35e8b27343bb944
+LIBCODEC2_SITE = https://freeswitch.org/stash/scm/sd/libcodec2.git
+LIBCODEC2_SITE_METHOD = git
+LIBCODEC2_LICENSE = LGPLv2.1
+LIBCODEC2_LICENSE_FILES = COPYING
+LIBCODEC2_AUTORECONF = YES
+LIBCODEC2_INSTALL_STAGING = YES
+
+define LIBCODEC2_GENERATE_HOST_TOOLS
+	cd $(@D)/src; \
+	$(HOSTCC) $(HOST_CFLAGS) -o generate_codebook.host \
+		generate_codebook.c -lm
+endef
+
+LIBCODEC2_POST_CONFIGURE_HOOKS = LIBCODEC2_GENERATE_HOST_TOOLS
+
+$(eval $(autotools-package))
-- 
2.1.4
