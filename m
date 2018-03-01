From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 28 Feb 2018 23:23:34 -0600
Subject: [Buildroot] [next,v2 3/8] cpe-info: only report target pkgs
In-Reply-To: <1519881819-51445-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519881819-51445-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519881819-51445-4-git-send-email-matthew.weber@rockwellcollins.com>
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
Changes
v1 -> v2
[Thomas P
 - select if target vs selecting not host
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 21a353e..f84a270 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -841,6 +841,7 @@ $(2)_CPE_PREFIX = $(CPE_PREFIX_APP)
 endif
 
 
+ifeq ($$($(2)_TYPE),target)
 $(1)-cpe-info: PKG=$(2)
 $(1)-cpe-info:
 ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
@@ -851,6 +852,7 @@ else
 	$(Q)$$(foreach id,$$($(2)_CPE_ID),$$(call cpe-manifest,$$($(2)_CPE_PREFIX):$$(id):$(CPE_SUFFIX),$$($(2)_CVE_PATCHED),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))$$(sep))
 endif # ifeq ($$(call qstrip,$$($(2)_CPE_ID)),)
 endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
+endif # ifeq ($$($(2)_TYPE),target)
 
 # legal-info: declare dependencies and set values used later for the manifest
 ifneq ($$($(2)_LICENSE_FILES),)
-- 
1.9.1
