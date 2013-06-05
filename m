From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Jun 2013 10:58:40 +0200
Subject: [Buildroot] [git commit] pkg-utils.mk: legal-license-file: handle
	multiple license files with same name
Message-ID: <20130605090358.1DC519A95D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31aa4264d8839d05684e67a238837e8633d1e1bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages (kmod, e2fsprogs, ..) contain multiple (different) license
files with the same file name, but in different directories.

These are currently all copied to the same filename in
output/legal-info/licenses/<pkg>, overwriting everything but the last file.

Fix it by recreating the same directory structure under legal-info.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-utils.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 835c588..86d687f 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -106,6 +106,6 @@ define legal-license-file # pkg, filename, file-fullpath
 	$(call legal-license-header,$(1),$(2) file) && \
 	cat $(3) >>$(LEGAL_LICENSES_TXT) && \
 	echo >>$(LEGAL_LICENSES_TXT) && \
-	mkdir -p $(LICENSE_FILES_DIR)/$(1)/ && \
-	cp $(3) $(LICENSE_FILES_DIR)/$(1)/
+	mkdir -p $(LICENSE_FILES_DIR)/$(1)/$(dir $(2)) && \
+	cp $(3) $(LICENSE_FILES_DIR)/$(1)/$(2)
 endef
