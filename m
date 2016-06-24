From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 16:56:50 +0200
Subject: [Buildroot] [git commit] core/legal-info: generate a hash of all
	saved files
Message-ID: <20160624150626.9709C8057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bfce06a4c6b4c2badeb52065c2184096031df9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Having a hash of the saved files can be interesting for the recipient to
verify the integrity of the files.

We remove the warning file earlier, to exclude it from the hash
list.

We generate the hash list in a temporary file that will not be matched
by the "find" expression, and once the file is generated, we remain it
to its final name.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Thomas: adjust indentation, improve commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 78b44c5..41f0274 100644
--- a/Makefile
+++ b/Makefile
@@ -701,8 +701,12 @@ legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p
 		cat support/legal-info/README.warnings-header \
 			$(LEGAL_WARNINGS) >>$(LEGAL_REPORT); \
 		cat $(LEGAL_WARNINGS); fi
-	@echo "Legal info produced in $(LEGAL_INFO_DIR)"
 	@rm -f $(LEGAL_WARNINGS)
+	@(cd $(LEGAL_INFO_DIR); \
+		find * -type f -exec sha256sum {} + | LC_ALL=C sort -k2 \
+			>.legal-info.sha256; \
+		mv .legal-info.sha256 legal-info.sha256)
+	@echo "Legal info produced in $(LEGAL_INFO_DIR)"
 
 show-targets:
 	@echo $(PACKAGES) $(TARGETS_ROOTFS)
