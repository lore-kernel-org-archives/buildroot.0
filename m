From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 27 Nov 2018 12:16:56 +0200
Subject: [Buildroot] [PATCH] strace: don't remove strace-graph
 unconditionally
Message-ID: <e86fb4b00011e29c62871b0386b09af09939badd.1543313816.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

strace-graph is a perl script. This script is removed unconditionally
since commit 720c0ca5ba7 ("strace: convert to makefile.autotools.in
format") from 2008. Since then Buildroot added support for perl on
target. Don't remove strace-graph when perl is built for target.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/strace/strace.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 471dbc2e1dd3..10869453d146 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -38,6 +38,8 @@ define STRACE_REMOVE_STRACE_GRAPH
 	rm -f $(TARGET_DIR)/usr/bin/strace-graph
 endef
 
+ifeq ($(BR2_PACKAGE_PERL),)
 STRACE_POST_INSTALL_TARGET_HOOKS += STRACE_REMOVE_STRACE_GRAPH
+endif
 
 $(eval $(autotools-package))
-- 
2.19.2
