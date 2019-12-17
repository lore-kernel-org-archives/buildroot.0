From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Dec 2019 22:09:51 +0100
Subject: [Buildroot] [git commit] package/pkg-generic.mk: use
 extractor-pkg-dependency macro
Message-ID: <20191217210914.3F3F98B8C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f24332cdbce767753024a1c39d45729f79d8e59b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of manually calculating the EXTRACT_DEPENDENCIES value based
on the archive extension, let's use the newly introduced
extractor-pkg-dependency macro.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index fd1817a86c..6c0105a1e1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -644,15 +644,7 @@ $(2)_EXTRACT_DEPENDENCIES += $$(BR2_TAR_HOST_DEPENDENCY)
 endif
 
 ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
-ifneq ($$(filter .xz .lzma,$$(suffix $$($(2)_SOURCE))),)
-$(2)_EXTRACT_DEPENDENCIES += $$(BR2_XZCAT_HOST_DEPENDENCY)
-endif
-endif
-
-ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
-ifneq ($$(filter .lz,$$(suffix $$($(2)_SOURCE))),)
-$(2)_EXTRACT_DEPENDENCIES += $$(BR2_LZIP_HOST_DEPENDENCY)
-endif
+$(2)_EXTRACT_DEPENDENCIES += $$(call extractor-pkg-dependency,$$($(2)_SOURCE))
 endif
 
 ifeq ($$(BR2_CCACHE),y)
