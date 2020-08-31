From: Christian Stewart <christian@paral.in>
Date: Sun, 30 Aug 2020 23:23:35 -0700
Subject: [Buildroot] [RFC PATCH v1 1/1] package/pkg-golang: download deps to
 vendor tree if not present
Message-ID: <20200831062335.1105977-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NOTE: This patch is a RFC and is not intended for merging in its current state.
It is a naiive implementation of the "go mod vendor" download step as a
post-extract hook, for early testing and demonstration of the desired effect. I
don't yet know what a final implementation might look like.

Add a new hook to POST_EXTRACT_HOOKS for Go packages which will create the
"vendor" directory structure under $(@D)/vendor with Go package deps by running
the "go mod vendor" command.

This will download dependency sources and use $GOPATH/pkg as a caching
directory for lookups and downloads.

Go specifies commit hashes OR version tags in go.mod, and lists source code
checksums in go.sum. The Go module system has a robust security model for
preventing MITM attacks or changed Git tags on dependencies through this
checksumming and explicitly-specified versioning approach.

Reference: https://blog.golang.org/using-go-modules

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/pkg-golang.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 2d80e99619..88eb89a68e 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -98,6 +98,16 @@ endef
 
 $(2)_POST_EXTRACT_HOOKS += $(2)_APPLY_EXTRACT_GOMOD
 
+# WIP - download dependencies with the Go tool if vendor does not exist.
+define $(2)_DOWNLOAD_GOMOD
+	if [ ! -d $$(@D)/vendor ]; then \
+		cd $$(@D); \
+		go mod vendor; \
+	fi
+endef
+
+$(2)_POST_EXTRACT_HOOKS += $(2)_DOWNLOAD_GOMOD
+
 # Build step. Only define it if not already defined by the package .mk
 # file.
 ifndef $(2)_BUILD_CMDS
-- 
2.28.0
