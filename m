From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 28 Feb 2018 23:23:33 -0600
Subject: [Buildroot] [next,v2 2/8] cpe-info: id prefix/suffix
In-Reply-To: <1519881819-51445-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519881819-51445-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519881819-51445-3-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are two types of software cpe prefixes, one for
applications and one for operating systems. Note: There
is a third type for hardware.

This patchset determines which should be used and stores
that information with the package for later use when
assembling the CPE report.

There is also a suffix which we just default to wildcards
at this point.

Refs:
   https://nvlpubs.nist.gov/nistpubs/Legacy/IR/nistir7695.pdf
   https://cpe.mitre.org/specification/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes
v1 -> v2
[Thomas P
 - Change to using a filter on pkg name value vs ifelse
---
 package/pkg-generic.mk | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4481ae2..21a353e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -550,6 +550,10 @@ ifndef $(2)_LICENSE_FILES
  endif
 endif
 
+CPE_PREFIX_OS = cpe:2.3:o
+CPE_PREFIX_APP = cpe:2.3:a
+CPE_SUFFIX = *:*:*:*:*:*:*
+
 ifndef $(2)_REDISTRIBUTE
  ifdef $(3)_REDISTRIBUTE
   $(2)_REDISTRIBUTE = $$($(3)_REDISTRIBUTE)
@@ -830,6 +834,13 @@ else
 $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
 endif
 
+ifneq ($(filter linux linux-headers,$(1)),)
+$(2)_CPE_PREFIX = $(CPE_PREFIX_OS)
+else
+$(2)_CPE_PREFIX = $(CPE_PREFIX_APP)
+endif
+
+
 $(1)-cpe-info: PKG=$(2)
 $(1)-cpe-info:
 ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
@@ -837,11 +848,10 @@ ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 ifeq ($$(call qstrip,$$($(2)_CPE_ID)),)
 	$(Q)$$(call cpe-manifest,"unknown",$$($(2)_CVE_PATCHED),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))
 else
-	$(Q)$$(foreach id,$$($(2)_CPE_ID),$$(call cpe-manifest,$$(id),$$($(2)_CVE_PATCHED),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))$$(sep))
+	$(Q)$$(foreach id,$$($(2)_CPE_ID),$$(call cpe-manifest,$$($(2)_CPE_PREFIX):$$(id):$(CPE_SUFFIX),$$($(2)_CVE_PATCHED),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))$$(sep))
 endif # ifeq ($$(call qstrip,$$($(2)_CPE_ID)),)
 endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 
-
 # legal-info: declare dependencies and set values used later for the manifest
 ifneq ($$($(2)_LICENSE_FILES),)
 $(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
-- 
1.9.1
