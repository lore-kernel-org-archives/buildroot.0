From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Feb 2016 23:21:53 +0100
Subject: [Buildroot] [PATCH 03/16 v4] core/pkg-utils: add macro to
	hardlink-or-copy
In-Reply-To: <cover.1454536753.git.yann.morin.1998@free.fr>
References: <cover.1454536753.git.yann.morin.1998@free.fr>
Message-ID: <821b8ea9cd929a6c05b715d12e99f3da00aa9ed4.1454536753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This macro will try to copy a source file into a destination directory,
by first attempting to hard-link, and falling back to a plain copy.

In some situations, it will be necessary that the destination file is
named differently than the source (e.g. due to a re-numbering), so if a
third argument is specified, it is treated as the basename of the
destination file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
[Ran 'make legal-info' with output dir on {the same,another} fs]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v3 -> v4:
  - forcibly remove destination file first  (Arnout, Luca)
  - typoes  (Luca)
  - drop trailing slash in destination directory name

Changes v2 -> v3;
  - use "ln" instead of "cp -l"
  - accept third argument, as the basename of the destination file
  - drop reviewed-by and tested-by tags given in v2, due to the above
    two changes

Changes RFC -> v1:
  - move to pkg-utils  (Luca)
---
 package/pkg-utils.mk | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 44bd2c9..ed05964 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -113,6 +113,35 @@ $$(error Package error: use $(2) instead of $(1). Please fix your .mk file)
 endif
 endef
 
+################################################################################
+# hardlink-copy -- hardlink source and destination if possible, otherwise
+# do a simple copy
+#
+# argument 1 is the source *file*
+# argument 2 is the destination *directory*
+# argument 3 is the basename of the destination file (optional, defaults to
+#            the basename of the source file.
+#
+# examples:
+#   $(call hardlink-copy,/path/to/source/file,/path/to/destination/dir)
+#   $(call hardlink-copy,/path/to/source/file,/path/to/destination/dir,new-name)
+#
+# Note: we make that a single command, so we can:
+#  - use '$(Q)' in front of it and properly silence the whole macro,
+#  - use '|| exit 1' after it, so we can exit on error in compound commands.
+#
+# Note-2: we do not introduce any intermediate shell variables because we can't
+# guarantee the number of expansions (as $-signs) we'll need.
+################################################################################
+define hardlink-copy
+	{ mkdir -p $(2) && \
+	  rm -f        $(strip $(2))/$(if $(3),$(strip $(3)),$(notdir $(1))) && \
+	  { ln -f $(1) $(strip $(2))/$(if $(3),$(strip $(3)),$(notdir $(1))) 2>/dev/null || \
+	    cp -f $(1) $(strip $(2))/$(if $(3),$(strip $(3)),$(notdir $(1))); \
+	  } \
+	}
+endef
+
 #
 # legal-info helper functions
 #
-- 
1.9.1
