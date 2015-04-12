From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 18:38:02 +0200
Subject: [Buildroot] [PATCHv2 18/21] pkg-generic: propagate
	<pkg>_EXTRA_DOWNLOADS from target to host package
In-Reply-To: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1428856685-4403-19-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just like <pkg>_PATCH, <pkg>_SOURCE or <pkg>_SITE, the
<pkg>_EXTRA_DOWNLOADS variable of a host package should be
automatically inferred from the <pkg>_EXTRA_DOWNLOADS value of the
corresponding target package, unless an explicit value is being
defined for the host package. This commit implements this for
<pkg>_EXTRA_DOWNLOADS.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 13a3843..d2ed605 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -353,6 +353,12 @@ ifndef $(2)_PATCH
  endif
 endif
 
+ifndef $(2)_EXTRA_DOWNLOADS
+ ifdef $(3)_EXTRA_DOWNLOADS
+  $(2)_PATCH = $$($(3)_EXTRA_DOWNLOADS)
+ endif
+endif
+
 ifndef $(2)_SITE
  ifdef $(3)_SITE
   $(2)_SITE = $$($(3)_SITE)
-- 
2.1.0
