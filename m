From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 28 Feb 2018 23:23:35 -0600
Subject: [Buildroot] [next, v2 4/8] cpe-info: infra defines CPE_ID_* defaults
In-Reply-To: <1519881819-51445-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519881819-51445-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519881819-51445-5-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Default to using the package name for the vendor
and name as most CPE IDs seem to align with that
assumption. Also use the pkg version as the CPE IDs
initial version field.

---
Changes
v1 - no patch

v2
[Thomas P
 - Created patch per suggestion to use infra
   to cleanup common case in individual pkg
   CPE_ID definition.
---
 package/pkg-generic.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f84a270..6ccf511 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -840,17 +840,20 @@ else
 $(2)_CPE_PREFIX = $(CPE_PREFIX_APP)
 endif
 
+$(2)_CPE_ID_NAME ?= $$($(2)_NAME)
+$(2)_CPE_ID_VERSION ?= $$($(2)_VERSION)
+$(2)_CPE_ID ?= $$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_NAME):$$($(2)_CPE_ID_VERSION)
 
 ifeq ($$($(2)_TYPE),target)
 $(1)-cpe-info: PKG=$(2)
 $(1)-cpe-info:
 ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 	@$$(call MESSAGE,"Collecting cpe info")
-ifeq ($$(call qstrip,$$($(2)_CPE_ID)),)
+ifeq ($$(call qstrip,$$($(2)_CPE_ID_VENDOR)),)
 	$(Q)$$(call cpe-manifest,"unknown",$$($(2)_CVE_PATCHED),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))
 else
 	$(Q)$$(foreach id,$$($(2)_CPE_ID),$$(call cpe-manifest,$$($(2)_CPE_PREFIX):$$(id):$(CPE_SUFFIX),$$($(2)_CVE_PATCHED),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))$$(sep))
-endif # ifeq ($$(call qstrip,$$($(2)_CPE_ID)),)
+endif # ifeq ($$(call qstrip,$$($(2)_CPE_ID_VENDOR)),)
 endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 endif # ifeq ($$($(2)_TYPE),target)
 
-- 
1.9.1
