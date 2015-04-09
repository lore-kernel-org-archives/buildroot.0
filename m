From: Nicolas S. Dade <nic.dade@mistsys.com>
Date: Wed,  8 Apr 2015 17:28:04 -0700
Subject: [Buildroot] [PATCH 1/1] pkg-generic: support patching local source
	code
Message-ID: <1428539284-5957-1-git-send-email-nic.dade@mistsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas S. Dade <nic.dade@mistsys.com>
---
 package/pkg-generic.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f77aab2..09f2405 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -555,15 +555,18 @@ else
 # In the package override case, the sequence of steps
 #  source, by rsyncing
 #  depends
+#  patch
 #  configure
 
 # Use an order-only dependency so the "<pkg>-clean-for-rebuild" rule
 # can remove the stamp file without triggering the configure step.
-$$($(2)_TARGET_CONFIGURE): | $$($(2)_TARGET_RSYNC)
+$$($(2)_TARGET_CONFIGURE): | $$($(2)_TARGET_PATCH)
 
 $(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
 
-$(1)-patch:		$(1)-rsync
+$(1)-patch:		$$($(2)_TARGET_PATCH)
+$$($(2)_TARGET_PATCH):	$$($(2)_TARGET_RSYNC)
+
 $(1)-extract:		$(1)-rsync
 
 $(1)-rsync:		$$($(2)_TARGET_RSYNC)
-- 
1.9.1
