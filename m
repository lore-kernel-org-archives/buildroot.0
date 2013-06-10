From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Jun 2013 00:06:30 +0200
Subject: [Buildroot] [git commit] ext-toolchain-wrapper: force hash-style to
	'both'
Message-ID: <20130611100809.45B8C9AC6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d5e6fa2fd4e48bdc0235f6bb902329b804b312d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If ext-toolchain-wrapper was built with a gcc that uses hash-style 'gnu' by
default, the resulting binary might be unusable on other systems. The error
in this case is "Floating point exception".
Using hash-style 'both' solves this issue.

Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/ext-tool.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 30a4953..430b2bc 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -491,7 +491,9 @@ $(HOST_DIR)/usr/bin/ext-toolchain-wrapper: $(STAMP_DIR)/ext-toolchain-installed
 			;; \
 		esac; \
 	done ;
-	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_EXTERNAL_WRAPPER_ARGS) -s \
+	# We use --hash-style=both to increase the compatibility of
+	# the generated binary with older platforms
+	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_EXTERNAL_WRAPPER_ARGS) -s -Wl,--hash-style=both \
 		toolchain/toolchain-external/ext-toolchain-wrapper.c -o $@
 
 # 'uclibc' is the target to provide toolchain / staging dir
