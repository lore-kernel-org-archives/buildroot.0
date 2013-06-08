From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  8 Jun 2013 11:14:21 +0200
Subject: [Buildroot] [PATCH 8/9] ext-toolchain-wrapper: force hash-style to
	'both'
In-Reply-To: <1370682862-7285-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1370682862-7285-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1370682862-7285-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Patrick Ziegler <patrick.ziegler@fh-kl.de>

If ext-toolchain-wrapper was build with gcc that uses hash-style 'gnu' by
default, the resulting binary might be unusable on other systems. The error
in this case is "Floating point exception".
Using hash-style 'both' solves this issue.

Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/ext-tool.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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
-- 
1.8.1.2
