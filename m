From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Oct 2012 16:41:44 +0200
Subject: [Buildroot] [PATCH] pkg-infra: rename <pkg>-rsync to <pkg>-extract
In-Reply-To: <50768116.4000506@relinux.de>
Message-ID: <1350225704-5693-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The legal-info target (and possibly others as well) depends on
<pkg>-extract to make sure the license file is available.  However,
when <PKG>_OVERRIDE_SRCDIR is active, the <pkg>-extract target
doesn't exist.

To solve this, we just call the target that rsyncs the source
<pkg>-extract.

While we're at it, also add a <pkg>-patch target (which is equivalent
to <pkg>-extract).  That avoids the same problem in the future if
something starts depending on <pkg>-patch.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/pkg-generic.mk |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ffe7dfb..c2c1b06 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -378,9 +378,11 @@ else
 $(1)-configure:		$(1)-depends \
 			$$($(2)_TARGET_CONFIGURE)
 
-$(1)-depends:		$(1)-rsync $$($(2)_DEPENDENCIES)
+$(1)-depends:		$(1)-extract $$($(2)_DEPENDENCIES)
 
-$(1)-rsync:		$$($(2)_TARGET_RSYNC)
+$(1)-patch:		$(1)-extract
+
+$(1)-extract:		$$($(2)_TARGET_RSYNC)
 
 $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
 endif
-- 
tg: (0132e36..) t/rsync-add-extract-target (depends on: )
