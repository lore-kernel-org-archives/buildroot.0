From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:19 -0600
Subject: [Buildroot] [NEXT 04/26] cpe-info: only report target pkgs
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519697441-54194-5-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The reporting of host packages causes some duplication
and complicates what is really in the targets configuration.
For the purpose of the first version of this patchset,
its assumed that host packages aren't relevant for the
configuration and we only report the target's contents.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8b80de7..21d62a5 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -842,6 +842,7 @@ else
 endif
 
 
+ifneq ($$($(2)_TYPE),host)
 $(1)-cpe-info: PKG=$(2)
 $(1)-cpe-info:
 ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
@@ -852,6 +853,7 @@ else
 	$(Q)$$(foreach id,$$($(2)_CPE_ID),$$(call cpe-manifest,$$($(2)_CPE_PREFIX):$$(id):$(CPE_SUFFIX),$$($(2)_CVE_PATCHED),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))$$(sep))
 endif # ifeq ($$(call qstrip,$$($(2)_CPE_ID)),)
 endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
+endif # ifeq ($$($(2)_TYPE),target)
 
 # legal-info: declare dependencies and set values used later for the manifest
 ifneq ($$($(2)_LICENSE_FILES),)
-- 
1.9.1
