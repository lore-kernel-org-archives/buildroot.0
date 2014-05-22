From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 22 May 2014 14:35:40 +0200
Subject: [Buildroot] [PATCH 1 of 2] infra: permissions/users/device tables:
 avoid adding empty entries
In-Reply-To: <patchbomb.1400762139@argentina>
References: <patchbomb.1400762139@argentina>
Message-ID: <f9a9da19bf34a6862ec5.1400762140@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In pkg-generic.mk, an entry would be added to each of the permissions,
devices and users tables, even if FOO_PERMISSIONS/DEVICES/USERS is empty. In
that last case, the entry would contain only the separator, which is
substituted to '\n' in fs/common.mk.
For configurations with many packages, this would render the build output a
bit odd, containing many \n instances (even though the end result in the
target would of course be the same).

This patch cleans up the build output by only adding to these tables when
the package actually specified contents for them.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-generic.mk |  7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -653,9 +653,16 @@ ifneq ($$($(2)_PROVIDES),)
 endif
 
 TARGETS += $(1)
+
+ifneq ($$($(2)_PERMISSIONS),)
 PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
+endif
+ifneq ($$($(2)_DEVICES),)
 PACKAGES_DEVICES_TABLE += $$($(2)_DEVICES)$$(sep)
+endif
+ifneq ($$($(2)_USERS),)
 PACKAGES_USERS += $$($(2)_USERS)$$(sep)
+endif
 
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
