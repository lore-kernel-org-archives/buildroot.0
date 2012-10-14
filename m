From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Oct 2012 17:17:34 +0200
Subject: [Buildroot] [PATCH] pkg-infra: correct the source name for
	host-only packages
In-Reply-To: <20120611105621.0aacd20c@skate>
Message-ID: <1350227854-6823-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Host-only package that don't define their <PKG>_SOURCE variable would
default to host-<pkg>-<version>.tar.gz.  It's more logical to remove
the host- prefix in this case.

This problem is most apparent with host-only packages downloaded from
version control, because they never define <PKG>_SOURCE.

Reported by Thomas Petazzoni and initial analysis by Luca Ceresoli.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/pkg-generic.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ffe7dfb..270da60 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -231,7 +231,7 @@ ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $($(3)_SOURCE)
  else
-  $(2)_SOURCE			?= $$($(2)_BASE_NAME).tar.gz
+  $(2)_SOURCE			?= $$($(2)_RAWNAME)-$$($(2)_VERSION).tar.gz
  endif
 endif
 
-- 
tg: (0132e36..) t/correct-host-only-source-name (depends on: master)
