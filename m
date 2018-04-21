From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Apr 2018 11:10:55 +0200
Subject: [Buildroot] [PATCH 6/7] core/package: add host-tar dependency for
 downloads from repositories
In-Reply-To: <cover.1524301847.git.yann.morin.1998@free.fr>
References: <cover.1524301847.git.yann.morin.1998@free.fr>
Message-ID: <033e8b463463d1ed5931599abba35ce6214fb123.1524301847.git.yann.morin.1998@free.fr>
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
index 6222d238c6..aece46ff0c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -560,6 +560,10 @@ ifneq ($(1),host-skeleton)
 $(2)_DEPENDENCIES += host-skeleton
 endif
 
+ifneq ($$(filter cvs git svn,$$($(2)_SITE_METHOD)),)
+$(2)_DOWNLOAD_DEPENDENCIES += $(BR2_TAR_HOST_DEPENDENCY)
+endif
+
 ifeq ($$(filter host-tar host-skeleton host-fakedate,$(1)),)
 $(2)_EXTRACT_DEPENDENCIES += $(BR2_TAR_HOST_DEPENDENCY)
 endif
-- 
2.14.1
