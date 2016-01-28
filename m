From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jan 2016 19:15:12 +0100
Subject: [Buildroot] [PATCH 14/16 v3] core/legal-info: generate a hash of
	all saved files
In-Reply-To: <cover.1454004518.git.yann.morin.1998@free.fr>
References: <cover.1454004518.git.yann.morin.1998@free.fr>
Message-ID: <61fe7a163615adb37ddc79e46e00430a7ff67f16.1454004518.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Having a hash of the saved files can be interesting for the recipient to
verify the integrity of the files.

We remove the warning file earlier, to exclude it from the hash list.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v1 -> v2:
  - simplify getting rid of the ..../legal-info/ prefix  (Luca)
  - always sort with the C locale
---
 Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 17c181b..c3427ed 100644
--- a/Makefile
+++ b/Makefile
@@ -696,8 +696,14 @@ legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p
 		cat support/legal-info/README.warnings-header \
 			$(LEGAL_WARNINGS) >>$(LEGAL_REPORT); \
 		cat $(LEGAL_WARNINGS); fi
-	@echo "Legal info produced in $(LEGAL_INFO_DIR)"
 	@rm -f $(LEGAL_WARNINGS)
+	@(cd $(LEGAL_INFO_DIR); \
+	  find * -type f -exec sha256sum {} + \
+	  |LC_ALL=C sort -k2 \
+	  >.legal-info.sha256; \
+	  mv .legal-info.sha256 legal-info.sha256 \
+	)
+	@echo "Legal info produced in $(LEGAL_INFO_DIR)"
 
 show-targets:
 	@echo $(PACKAGES) $(TARGETS_ROOTFS)
-- 
1.9.1
