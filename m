From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 10 Oct 2018 21:09:08 -0500
Subject: [Buildroot] [RFC] pkg-download: support providing dest filename
Message-ID: <20181011020908.15717-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to the old DOWNLOAD_INNER hook, provide a way for a package
to specify a URI, src file and dest filename to retrieve additional
files. While maintaining the existing practice of hash checking each
archive and storing with the primary source archive in the package's
dl sub-folder.

The use case for this new DOWNLOAD_DIRECT hook is for a package to call
the hook as part of the _POST_DOWNLOAD_HOOKS provided in that specific
package.

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---

Unsure of the desired approach for this, so I went basic for an example
implementation.  I reviewed the DOWNLOAD_EXTRAS but the place where it
fell short is being able to set the destination filename....

The initial use case for this hook is the OpenJDK package.  In the
original patchset the DOWNLOAD_INNER was used to retrieve a series
of subpackages, each with the same src file but different directory
structure.  The solution was to download each and adjust the destination
filename.
http://buildroot-busybox.2317881.n4.nabble.com/PATCH-0-4-openjdk-td186297.html
---
 package/pkg-download.mk | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index bf93b9a08e..ac46866ef2 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -107,3 +107,30 @@ define DOWNLOAD
 		-- \
 		$($(PKG)_DL_OPTS)
 endef
+
+################################################################################
+# DOWNLOAD_DIRECT -- Download helper. Will call DL_WRAPPER which will try to
+# download source from the provided URI and store the file to a specific name.
+#
+# Argument 1 is the source site
+# Argument 2 is the archive name
+# Argument 3 is the destination file name
+#
+################################################################################
+
+define DOWNLOAD_DIRECT
+	$(Q)mkdir -p $($(PKG)_DL_DIR)
+	$(Q)$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
+		-c '$($(PKG)_DL_VERSION)' \
+		-d '$($(PKG)_DL_DIR)' \
+		-D '$(DL_DIR)' \
+		-f '$(2)' \
+		-H '$(PKGDIR)/$($(PKG)_RAWNAME).hash' \
+		-n '$($(PKG)_BASENAME_RAW)' \
+		-N '$($(PKG)_RAWNAME)' \
+		-o '$($(PKG)_DL_DIR)/$(3)' \
+		-u $(call getschemeplusuri,$(call qstrip,$(1)),urlencode) \
+		$(QUIET) \
+		-- \
+		$($(PKG)_DL_OPTS)
+endef
-- 
2.18.0
