From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 14 Oct 2018 18:35:03 +0200
Subject: [Buildroot] [PATCH 2/3] pkg-perl: patch files in
 <pkg>_PATCH_XS_MAKEFILES
In-Reply-To: <20181014163504.28519-1-francois.perrad@gadz.org>
References: <20181014163504.28519-1-francois.perrad@gadz.org>
Message-ID: <20181014163504.28519-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

based on an initial work of Christopher McCrory <chrismcc@gmail.com>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pkg-perl.mk | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index 07348bd5d..673c07a63 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -132,6 +132,29 @@ define $(2)_CONFIGURE_CMDS
 	fi
 endef
 endif
+
+ifneq ($$($(3)_PATCH_XS_MAKEFILES),)
+# Some arguments to Makefile.PL do not get propagated to subdirectories
+# similar to:
+# https://rt.cpan.org/Public/Bug/Display.html?id=28632
+define $(2)_PATCH_XS_MAKEFILE_HOOK
+	for f in $$($(3)_PATCH_XS_MAKEFILES); do \
+		echo "patching: $$($$(PKG)_SRCDIR)$$$${f}"; \
+		$(SED) "s:^AR = .*:AR = $(TARGET_AR):g" $$($$(PKG)_SRCDIR)$$$${f}; \
+		$(SED) "s:^FULL_AR = .*:FULL_AR = $(TARGET_AR):g" $$($$(PKG)_SRCDIR)$$$${f}; \
+		$(SED) "s:^CC = .*:CC = $(TARGET_CC):g" $$($$(PKG)_SRCDIR)$$$${f}; \
+		$(SED) "s:^CCFLAGS = .*:CCFLAGS = $(TARGET_CFLAGS):g" $$($$(PKG)_SRCDIR)$$$${f}; \
+		$(SED) "s:^LD = .*:LD = $(TARGET_CC):g" $$($$(PKG)_SRCDIR)$$$${f}; \
+		$(SED) "s:^LDDLFLAGS = .*:LDDLFLAGS = -shared $(TARGET_LDFLAGS):g" $$($$(PKG)_SRCDIR)$$$${f}; \
+		$(SED) "s:^LDLFLAGS = .*:LDLFLAGS = $(TARGET_LDFLAGS):g" $$($$(PKG)_SRCDIR)$$$${f}; \
+		$(SED) "s:^DESTDIR = .*:DESTDIR = $(TARGET_DIR):g" $$($$(PKG)_SRCDIR)$$$${f}; \
+		$(SED) "s:^PERL_INC = .*:PERL_INC = $(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE:g" $$($$(PKG)_SRCDIR)$$$${f}; \
+	done
+endef
+
+$(2)_POST_CONFIGURE_HOOKS += $(2)_PATCH_XS_MAKEFILE_HOOK
+endif
+
 endif
 
 #
-- 
2.17.1
