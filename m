From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Tue,  6 Oct 2020 15:42:36 +0200
Subject: [Buildroot] [PATCH 03/17] cpe-info: only report target pkgs
In-Reply-To: <20201006134250.22738-1-gregory.clement@bootlin.com>
References: <20201006134250.22738-1-gregory.clement@bootlin.com>
Message-ID: <20201006134250.22738-4-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

The reporting of host packages causes some duplication and complicates
what is really in the targets configuration. For the purpose of the
first version of this patchset, its assumed that host packages aren't
relevant for the configuration and we only report the target's
contents.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 63bd8720eb..1372dc6e4d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -983,10 +983,12 @@ endif
 
 $(1)-cpe-info: PKG=$(2)
 $(1)-cpe-info:
+ifeq ($$($(2)_TYPE),target)
 ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 	@$$(call MESSAGE,"Collecting cpe info")
 	$(Q)$$(call cpe-manifest,$$($(2)_CPE_PREFIX):$$($(2)_CPE_ID):$(CPE_SUFFIX),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))
 endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
+endif # ifeq ($$($(2)_TYPE),target)
 
 # legal-info: declare dependencies and set values used later for the manifest
 ifneq ($$($(2)_LICENSE_FILES),)
-- 
2.28.0
