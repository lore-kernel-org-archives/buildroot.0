From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri,  7 Dec 2012 00:16:00 +0100
Subject: [Buildroot] [PATCH] pkg-infra: add <pkg>-extract and <pkg>-patch
	targets to OVERRIDE support
Message-ID: <1354835760-9357-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The legal-info target (and possibly others as well) depends on
<pkg>-extract to make sure the license file is available.  However,
when <PKG>_OVERRIDE_SRCDIR is active, the <pkg>-extract target
doesn't exist.

To solve this, we add <pkg>-extract which depends on <pkg>-rsync.
While we're at it, we do the same for <pkg>-patch.  That avoids the
same problem in the future if something starts depending on
<pkg>-patch.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
---
v2: As ThomasP suggested, don't remove <pkg>-rsync.
---
 package/pkg-generic.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6fcd359..13c1d83 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -390,6 +390,9 @@ $(1)-configure:		$(1)-depends \
 
 $(1)-depends:		$(1)-rsync $$($(2)_DEPENDENCIES)
 
+$(1)-patch:		$(1)-rsync
+$(1)-extract:		$(1)-rsync
+
 $(1)-rsync:		$$($(2)_TARGET_RSYNC)
 
 $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
-- 
1.7.10.4
