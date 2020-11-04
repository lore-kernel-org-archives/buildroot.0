From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Nov 2020 15:51:37 +0100
Subject: [Buildroot] [PATCH 03/10] package/pkg-generic.mk: add CPE ID
 related package variables
In-Reply-To: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201104145145.1316167-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

Currently, the match between Buildroot packages and CVEs is solely
based on the package names. Unfortunately, as one can imagine, there
isn't necessarily a strict mapping between Buildroot package names,
and how software projects are referenced in the National Vulnerability
Database (NVD) which we use.

The NVD has defined the concept of CPE (Common Platform Enumeration)
identifiers, which uniquely identifies software components based on
string looking like this:

  cpe:2.3:a:netsurf-browser:libnsbmp:0.1.2:*:*:*:*:*:*:*

In particular, this CPE identifier contains a vendor name (here
"netsurf-browser"), a product name (here "libnsbmp") and a version
(here "0.1.2").

This patch series introduces the concept of CPE ID in Buildroot, where
each package can be associated to a CPE ID. A package can define one
or several of:

 - <pkg>_CPE_ID_VENDOR
 - <pkg>_CPE_ID_PRODUCT
 - <pkg>_CPE_ID_VERSION
 - <pkg>_CPE_ID_VERSION_MINOR
 - <pkg>_CPE_ID_PREFIX

If one or several of those variables are defined, then the
<pkg>_CPE_ID will be defined by the generic package infrastructure as
follows:

  $(2)_CPE_ID = $$($(2)_CPE_ID_PREFIX):$$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_NAME):$$($(2)_CPE_ID_VERSION):$$($(2)_CPE_ID_VERSION_MINOR):*:*:*:*:*:*

<pkg>_CPE_ID_* variables that are not explicitly specified by the
package will carry a default value defined by the generic package
infrastructure.

If a package is happy with the default <pkg>_CPE_ID, and therefore
does not need to define any of <pkg>_CPE_ID_{VENDOR,PRODUCT,...}, it
can set <pkg>_CPE_ID_VALID = YES.

If any of the <pkg>_CPE_ID_{VENDOR,PRODUCT,...} variables are defined
by the package, then <pkg>_CPE_ID_VALID = YES will be set by the
generic package infrastructure.

Then, it's only if <pkg>_CPE_ID_VALID = YES that a <pkg>_CPE_ID will
be defined. Indeed, we want to be able to distinguish packages for
which the CPE ID information has been checked and is considered valid,
from packages for which the CPE ID information has never been
verified. For thise reason, we cannot simply define a default value
for <pkg>_CPE_ID.

The <pkg>_CPE_ID_* values for the host package are inherited from the
same variables of the corresponding target package, as we normally do
for most package variables.

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 70 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 54de03da03..621fb91424 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -608,6 +608,76 @@ $(2)_REDISTRIBUTE		?= YES
 
 $(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_BASENAME_RAW)
 
+# If any of the <pkg>_CPE_ID_* variables are set, we assume the CPE ID
+# information is valid for this package.
+ifneq ($$($(2)_CPE_ID_VENDOR)$$($(2)_CPE_ID_NAME)$$($(2)_CPE_ID_VERSION)$$($(2)_CPE_ID_VERSION_MINOR)$$($(2)_CPE_ID_PREFIX),)
+$(2)_CPE_ID_VALID = YES
+endif
+
+# When we're a host package, make sure to use the variables of the
+# corresponding target package, if any.
+ifneq ($$($(3)_CPE_ID_VENDOR)$$($(3)_CPE_ID_NAME)$$($(3)_CPE_ID_VERSION)$$($(3)_CPE_ID_VERSION_MINOR)$$($(3)_CPE_ID_PREFIX),)
+$(2)_CPE_ID_VALID = YES
+endif
+
+# If the CPE ID is valid for the target package so it is for the host
+# package
+ifndef $(2)_CPE_ID_VALID
+ ifdef $(3)_CPE_ID_VALID
+   $(2)_CPE_ID_VALID = $$($(3)_CPE_ID_VALID)
+ endif
+endif
+
+ifeq ($$($(2)_CPE_ID_VALID),YES)
+ # CPE_ID_VENDOR
+ ifndef $(2)_CPE_ID_VENDOR
+  ifdef $(3)_CPE_ID_VENDOR
+   $(2)_CPE_ID_VENDOR = $$($(3)_CPE_ID_VENDOR)
+  else
+   $(2)_CPE_ID_VENDOR = $$($(2)_RAWNAME)_project
+ endif
+ endif
+
+ # CPE_ID_NAME
+ ifndef $(2)_CPE_ID_NAME
+  ifdef $(3)_CPE_ID_NAME
+   $(2)_CPE_ID_NAME = $$($(3)_CPE_ID_NAME)
+  else
+   $(2)_CPE_ID_NAME = $$($(2)_RAWNAME)
+  endif
+ endif
+
+ # CPE_ID_VERSION
+ ifndef $(2)_CPE_ID_VERSION
+  ifdef $(3)_CPE_ID_VERSION
+   $(2)_CPE_ID_VERSION = $$($(3)_CPE_ID_VERSION)
+  else
+   $(2)_CPE_ID_VERSION = $$($(2)_VERSION)
+  endif
+ endif
+
+ # CPE_ID_VERSION_MINOR
+ ifndef $(2)_CPE_ID_VERSION_MINOR
+  ifdef $(3)_CPE_ID_VERSION_MINOR
+   $(2)_CPE_ID_VERSION_MINOR = $$($(3)_CPE_ID_VERSION_MINOR)
+  else
+   $(2)_CPE_ID_VERSION_MINOR = *
+  endif
+ endif
+
+ # CPE_ID_PREFIX
+ ifndef $(2)_CPE_ID_PREFIX
+  ifdef $(3)_CPE_ID_PREFIX
+   $(2)_CPE_ID_PREFIX = $$($(3)_CPE_ID_PREFIX)
+  else
+   $(2)_CPE_ID_PREFIX = cpe:2.3:a
+  endif
+ endif
+
+ # Calculate complete CPE ID
+ $(2)_CPE_ID = $$($(2)_CPE_ID_PREFIX):$$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_NAME):$$($(2)_CPE_ID_VERSION):$$($(2)_CPE_ID_VERSION_MINOR):*:*:*:*:*:*
+endif # ifeq ($$($(2)_CPE_ID_VALID),YES)
+
 # When a target package is a toolchain dependency set this variable to
 # 'NO' so the 'toolchain' dependency is not added to prevent a circular
 # dependency.
-- 
2.26.2
