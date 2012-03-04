From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun,  4 Mar 2012 22:10:23 +0100
Subject: [Buildroot] [PATCH] pkg-infra: Fix wget -O
Message-ID: <1330895423-14763-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wget -O always creates its output file, so we need a different way to
detect if the download succeeded or not.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Ideally, wget should have an option to name the downloaded file.
-O <filename> is in fact fully equivalent to -O - > <filename>...
Maybe we should move to curl after all? :-)

 package/Makefile.package.in |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index ea44c6c..da6aee0 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -236,9 +236,13 @@ define SHOW_EXTERNAL_DEPS_HG
 endef
 
 
+# wget -O ... creates the output file before downloading it, so
+# it will essentially always succeed.  As a workaround, test that
+# it is non-empty both before and after.
 define DOWNLOAD_WGET
-	test -e $(DL_DIR)/$(2) || \
-	$(WGET) -O $(DL_DIR)/$(2) $(call qstrip,$(1))/$(2)
+	test -s $(DL_DIR)/$(2) || \
+	$(WGET) -O $(DL_DIR)/$(2) $(call qstrip,$(1))/$(2) && \
+	test -s $(DL_DIR)/$(2)
 endef
 
 define SOURCE_CHECK_WGET
-- 
tg: (dca6e03..) t/wget (depends on: master)
