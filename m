From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 04:55:16 -0700
Subject: [Buildroot] [PATCH 15/18] pkg-utils.mk: patch_sub_makefile
In-Reply-To: <20180820115519.24046-1-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
Message-ID: <20180820115519.24046-16-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

suggested and written by Fran?ois
Fix incorrectly generated Makefiles in subdirectories, usually perl
packages.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/pkg-utils.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index c3acc22b17..7dbdb427a6 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -95,3 +95,19 @@ define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-full
 	} && \
 	cp $(5) $(LICENSE_FILES_DIR_$(6))/$(2)/$(4)
 endef
+
+# Used to fix makefiles in subdirectories, usually perl packages see 
+# perl-template-toolkit and perl-xml-parser
+# use: $(call patch_sub_makefile,$(@D)/xs/Makefile)
+
+define patch_sub_makefile
+	$(SED) "s:^AR = .*:AR = $(TARGET_AR):g" $(1)
+	$(SED) "s:^FULL_AR = .*:FULL_AR = $(TARGET_AR):g" $(1)
+	$(SED) "s:^CC = .*:CC = $(TARGET_CC):g" $(1)
+	$(SED) "s:^CCFLAGS = .*:CCFLAGS = $(TARGET_CFLAGS):g" $(1)
+	$(SED) "s:^LD = .*:LD = $(TARGET_CC):g" $(1)
+	$(SED) "s:^LDDLFLAGS = .*:LDDLFLAGS = -shared $(TARGET_LDFLAGS):g" $(1)
+	$(SED) "s:^LDLFLAGS = .*:LDLFLAGS = $(TARGET_LDFLAGS):g" $(1)
+	$(SED) "s:^DESTDIR = .*:DESTDIR = $(TARGET_DIR):g" $(1)
+endef
+
-- 
2.14.4
