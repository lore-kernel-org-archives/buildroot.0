From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 21:05:52 +0200
Subject: [Buildroot] [git commit] package/go: Set file timestamp
Message-ID: <20160526191312.55D5981926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cb235a4deb07406d516454708b8d9667f6832ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set all file timestamps to prevent the go compiler from rebuilding any
built in packages when programs are built.

Signed-off-by: Geoff Levand <geoff@infradead.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/go/go.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index 7a8ebf4..98615aa 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -107,6 +107,10 @@ define HOST_GO_INSTALL_CMDS
 	# There is a known issue which requires the go sources to be installed
 	# https://golang.org/issue/2775
 	cp -a $(@D)/src $(HOST_GO_ROOT)/
+
+	# Set all file timestamps to prevent the go compiler from rebuilding any
+	# built in packages when programs are built.
+	find $(HOST_GO_ROOT) -type f -exec touch -r $(HOST_GO_TMP)/bin/go {} \;
 endef
 
 $(eval $(host-generic-package))
