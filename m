From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 22:01:12 +0100
Subject: [Buildroot] [git commit] package/pkg-generic: add host-tar
 dependency for downloads from repositories
Message-ID: <20181101210018.C0652867CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b5feea8753520320d11896a24b970c60331bcdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Three of our download backends need a host tar that can generate
reproducible archives: cvs, git, and svn. The other two, bzr and hg,
use their internal implementation.

So, for those three that need it, and a dependency on host-tar when the
system tar is not appropriate.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 747e286baf..f34f46afc8 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -582,6 +582,10 @@ ifneq ($(1),host-skeleton)
 $(2)_DEPENDENCIES += host-skeleton
 endif
 
+ifneq ($$(filter cvs git svn,$$($(2)_SITE_METHOD)),)
+$(2)_DOWNLOAD_DEPENDENCIES += $(BR2_TAR_HOST_DEPENDENCY)
+endif
+
 ifeq ($$(filter host-tar host-skeleton host-fakedate,$(1)),)
 $(2)_EXTRACT_DEPENDENCIES += $$(BR2_TAR_HOST_DEPENDENCY)
 endif
