From: Herve Codina <herve.codina@bootlin.com>
Date: Tue,  6 Jul 2021 16:24:58 +0200
Subject: [Buildroot] [PATCH v2 15/18] package/pkg-generic.mk: remove
 .files-final-rsync.before temporary file
In-Reply-To: <20210706142501.951345-1-herve.codina@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
Message-ID: <20210706142501.951345-16-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Keeping the .files-final-rsync.before file between make invocations
was needed to ensure that this file will be present in case of
'make <pkg>_{reconfigure,rebuild,reinstall}' invocation.

The .files-final-rsync.before is now recreated on
<pkg>_{reconfigure,rebuild,reinstall} and we don't need to keep it
between make invocation.

This patch simply removes this file as soon as it is no longer needed.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
New patch in this v2 series

 package/pkg-generic.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ee2d68f2f7..14d76e65c0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -183,6 +183,7 @@ define pkg_final_rsync_after
 		$($(PKG)_DIR)/.files-final-rsync$(2).after \
 		| sed -r -e 's/^[^,]+,./- /' \
 		> $($(PKG)_DIR)/.files-final-rsync$(2).exclude_rsync
+	rm -f $($(PKG)_DIR)/.files-final-rsync$(2).before
 	rm -f $($(PKG)_DIR)/.files-final-rsync$(2).after
 endef
 
-- 
2.31.1
