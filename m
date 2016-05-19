From: Geoff Levand <geoff@infradead.org>
Date: Thu, 19 May 2016 22:25:02 +0000
Subject: [Buildroot] [PATCH v2 6/6] package/go: Set file timestamp
In-Reply-To: <cover.1463696454.git.geoff@infradead.org>
References: <cover.1463696454.git.geoff@infradead.org>
Message-ID: <ec83a5927025fc759d5bfc26ee01aabde3658a7c.1463696454.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set all file timestamps to prevent the go compiler from rebuilding any
built in packages when programs are built.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/go/go.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index 8565a86..a2babab 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -119,6 +119,10 @@ define HOST_GO_INSTALL_CMDS
 	# There is a known issue which requires the go sources to be installed
 	# https://golang.org/issue/2775
 	cp -a $(@D)/src $(HOST_GO_ROOT)/
+
+	# Set all file timestamps to prevent the go compiler from rebuilding any
+	# built in packages when programs are built.
+	find $(HOST_GO_ROOT) -type f -exec touch -r $(HOST_GO_TMP)/bin/go {} \;
 endef
 
 $(eval $(host-generic-package))
-- 
2.5.0
