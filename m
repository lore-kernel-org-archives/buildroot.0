From: John Keeping <john@metanate.com>
Date: Tue,  1 May 2018 12:13:04 +0100
Subject: [Buildroot] [PATCH v2] core/pkg-generic: only save latest package
 list
In-Reply-To: <20180430194136.GC2470@scaer>
References: <20180430194136.GC2470@scaer>
Message-ID: <20180501111304.17597-1-john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When rebuilding a package, simply appending the package's file list to
the global list means that the package list grows for every rebuild, as
does the time taken to check for files installed by multiple packages.
Furthermore, we get false positives where a file is reported as being
installed by multiple copies of the same package.

With this approach we may end up with orphaned files in the target
filesystem if a package that has been updated and rebuilt no longer
installs the same set of files, but we know that only a clean build will
produce reliable results.  In fact it may be helpful to identify these
orphaned files as evidence that the build is not clean.

Signed-off-by: John Keeping <john@metanate.com>
---
Changes in v2:
- Do the sed as a separate step rather than in the same shell invocation
  as the find (we know that $(BUILD_DIR) is an absolute path); since we
  no longer ignore the exit status of sed, we also have to ensure that
  the file exists before executing sed

 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index bd47ca1964..8ebbacc180 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -63,6 +63,8 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 # $(2): base directory to search in
 # $(3): suffix of file  (optional)
 define step_pkg_size_inner
+	@>$(BUILD_DIR)/packages-file-list$(3).txt
+	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
 	cd $(2); \
 	find . \( -type f -o -type l \) \
 		-newer $($(PKG)_DIR)/.stamp_built \
-- 
2.17.0
