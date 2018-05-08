From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  8 May 2018 22:40:19 +0200
Subject: [Buildroot] [PATCH 6/7 v2] core/package: add host-tar dependency
 for downloads from repositories
In-Reply-To: <cover.1525812011.git.yann.morin.1998@free.fr>
References: <cover.1525812011.git.yann.morin.1998@free.fr>
Message-ID: <03be0fca5aee707e535261e66588d3b47bed4e0c.1525812011.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Three of our download backends need a host tar that can generate
reproducible archives: cvs, git, and svn. The other two, hbzr and hg,
use their internal implementation.

So, for those three that need it, and a dependency on host-tar when the
system tar is not appropriate.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 78aa751b0d..f654241bf7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -567,6 +567,10 @@ ifneq ($(1),host-skeleton)
 $(2)_DEPENDENCIES += host-skeleton
 endif
 
+ifneq ($$(filter cvs git svn,$$($(2)_SITE_METHOD)),)
+$(2)_DOWNLOAD_DEPENDENCIES += $(BR2_TAR_HOST_DEPENDENCY)
+endif
+
 ifeq ($$(filter host-tar host-skeleton host-fakedate,$(1)),)
 $(2)_EXTRACT_DEPENDENCIES += $$(BR2_TAR_HOST_DEPENDENCY)
 endif
-- 
2.14.1
