From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Jul 2014 00:07:57 +0200
Subject: [Buildroot] [git commit] pkg-infra: move the cp (aka localfiles)
	download helper to a script
Message-ID: <20140702220914.20CA49D091@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=283b8b7feaccbe23decc69c2b3300b2a2d74d02d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Maintaining the download helpers in the Makefile has proved to be a bit
complex, so move it to a shell script.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-download.mk |    5 +++--
 support/download/cp     |   16 ++++++++++++++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index eec91b8..d3cd0c1 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -16,7 +16,7 @@ export GIT := $(call qstrip,$(BR2_GIT))
 export HG := $(call qstrip,$(BR2_HG)) $(QUIET)
 export SCP := $(call qstrip,$(BR2_SCP)) $(QUIET)
 SSH := $(call qstrip,$(BR2_SSH)) $(QUIET)
-LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
+export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 # Default spider mode is 'DOWNLOAD'. Other possible values are 'SOURCE_CHECK'
 # used by the _source-check target and 'SHOW_EXTERNAL_DEPS', used by the
@@ -192,7 +192,8 @@ endef
 
 define DOWNLOAD_LOCALFILES
 	test -e $(DL_DIR)/$(2) || \
-		$(LOCALFILES) $(call stripurischeme,$(call qstrip,$(1))) $(DL_DIR)
+	$(EXTRA_ENV) support/download/cp $(call stripurischeme,$(call qstrip,$(1))) \
+					 $(DL_DIR)
 endef
 
 define SOURCE_CHECK_LOCALFILES
diff --git a/support/download/cp b/support/download/cp
new file mode 100755
index 0000000..3e9f548
--- /dev/null
+++ b/support/download/cp
@@ -0,0 +1,16 @@
+#!/bin/bash
+
+# We want to catch any command failure, and exit immediately
+set -e
+
+# Download helper for cp
+# Call it with:
+#   $1: source file
+#   $2: output file
+# And this environment:
+#   LOCALFILES: the cp command to call
+
+source="${1}"
+output="${2}"
+
+${LOCALFILES} "${source}" "${output}"
