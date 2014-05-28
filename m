From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 May 2014 21:19:45 +0200
Subject: [Buildroot] [git commit] infra: permissions/users/device tables:
	avoid adding empty entries
Message-ID: <20140528200724.327319CE10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d5bf929a62b41519f5470d7ea20567e0061277f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Tested-by: Romain Naour <romain.naour@openwide.fr>
Acked-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 260f374..5116ed9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -653,9 +653,16 @@ $$(foreach pkg,$$($(2)_PROVIDES),\
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
