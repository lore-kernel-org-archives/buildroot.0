From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 16 Jun 2020 12:03:33 -0500
Subject: [Buildroot] [RFC v9 02/10] cpe-info: id prefix/suffix
In-Reply-To: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
References: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200616170341.45098-2-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are two types of software CPE prefixes applicable for software,
one for applications and one for operating systems.
Note: The third type is for hardware.

This patchset determines which should be used and stores that
information with the package for later use when assembling the CPE
report.

Refs:
   https://nvlpubs.nist.gov/nistpubs/Legacy/IR/nistir7695.pdf
   https://cpe.mitre.org/specification/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes

v8
 - Rebase

v4 -> v7
 - None

v3
[Arnout
 - Moved CPE prefix and suffix defines to package/Makefile.in

v1 -> v2
[Thomas P
 - Change to using a filter on pkg name value vs ifelse
---
 package/Makefile.in    | 4 ++++
 package/pkg-generic.mk | 8 +++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 51f5cbce4f..c6a21276a2 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -373,6 +373,10 @@ TARGET_CONFIGURE_ARGS = \
 
 ################################################################################
 
+CPE_PREFIX_OS = cpe:2.3:o
+CPE_PREFIX_APP = cpe:2.3:a
+CPE_SUFFIX = *:*:*:*:*:*:*
+
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 NLS_OPTS = --enable-nls
 TARGET_NLS_DEPENDENCIES = host-gettext
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1408845613..7d892ca1d6 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -976,11 +976,17 @@ $(2)_CPE_ID_NAME ?= $$($(2)_NAME)
 $(2)_CPE_ID_VERSION ?= $$($(2)_VERSION)
 $(2)_CPE_ID ?= $$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_NAME):$$($(2)_CPE_ID_VERSION)
 
+ifneq ($(filter linux linux-headers,$(1)),)
+$(2)_CPE_PREFIX = $(CPE_PREFIX_OS)
+else
+$(2)_CPE_PREFIX = $(CPE_PREFIX_APP)
+endif
+
 $(1)-cpe-info: PKG=$(2)
 $(1)-cpe-info:
 ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 	@$$(call MESSAGE,"Collecting cpe info")
-	$(Q)$$(call cpe-manifest,$$($(2)_CPE_ID),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))
+	$(Q)$$(call cpe-manifest,$$($(2)_CPE_PREFIX):$$($(2)_CPE_ID):$(CPE_SUFFIX),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))
 endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 
 # legal-info: declare dependencies and set values used later for the manifest
-- 
2.17.1
