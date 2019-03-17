From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 17 Mar 2019 22:20:13 +0100
Subject: [Buildroot] [PATCH v2 1/2] pkg-generic: Depend on host-{xz,
 lzip} only for fitting archives
Message-ID: <20190317212014.3831-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

results in cleaner dependency graphs, and usually omits host-lzip
from being built.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/pkg-generic.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4353bd3868..89da43d5e5 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -607,12 +607,16 @@ $(2)_EXTRACT_DEPENDENCIES += $$(BR2_TAR_HOST_DEPENDENCY)
 endif
 
 ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
+ifneq ($$(filter .xz .lzma,$$(suffix $$($(2)_SOURCE))),)
 $(2)_EXTRACT_DEPENDENCIES += $$(BR2_XZCAT_HOST_DEPENDENCY)
 endif
+endif
 
 ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
+ifeq ($$(suffix $$($(2)_SOURCE)),.lz)
 $(2)_EXTRACT_DEPENDENCIES += $$(BR2_LZIP_HOST_DEPENDENCY)
 endif
+endif
 
 ifeq ($$(BR2_CCACHE),y)
 ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache,$(1)),)
-- 
2.20.1
