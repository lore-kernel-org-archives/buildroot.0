From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  8 Mar 2019 16:04:21 -0600
Subject: [Buildroot] [PATCH v8 3/9] cpe-info: only report target pkgs
In-Reply-To: <1552082667-46877-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1552082667-46877-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1552082667-46877-4-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The reporting of host packages causes some duplication and complicates
what is really in the targets configuration. For the purpose of the
first version of this patchset, its assumed that host packages aren't
relevant for the configuration and we only report the target's
contents.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes

v4 -> v8
 - None

v3
 - Fixed host build error because cpe-info wasn't defined

v1 -> v2
[Thomas P
 - select if target vs selecting not host
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a547c65..8ff389e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -924,10 +924,12 @@ endif
 
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
1.9.1
