From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Dec 2012 17:13:57 -0800
Subject: [Buildroot] [git commit] pkg-infra: add <pkg>-extract and
	<pkg>-patch targets to OVERRIDE support
Message-ID: <20121207011508.50C509A0BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=054f97e1f2de337ea0c788d766212a36d6d4e41c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-generic.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index fc05dc6..a570ad7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -390,6 +390,9 @@ $(1)-configure:		$(1)-depends \
 
 $(1)-depends:		$(1)-rsync $$($(2)_DEPENDENCIES)
 
+$(1)-patch:		$(1)-rsync
+$(1)-extract:		$(1)-rsync
+
 $(1)-rsync:		$$($(2)_TARGET_RSYNC)
 
 $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
