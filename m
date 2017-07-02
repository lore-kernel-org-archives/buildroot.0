From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 23:42:31 +0200
Subject: [Buildroot] [git commit] pkg-virtual: fix host dependencies handling
Message-ID: <20170702213930.AC5B580641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=346e926c1506ec8bc99ce3dd653d01ebb605fc70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If $(BR2_PACKAGE_HAS_HOST_FOO) is defined, then the pkg-virtual
infrastructure will check if $(BR2_PACKAGE_PROVIDES_HOST_FOO) is not
empty.

But later, $(BR2_PACKAGE_HOST_FOO_DEPENDENCIES) will be set from
$(BR2_PACKAGE_PROVIDES_FOO), ignoring $(BR2_PACKAGE_PROVIDES_HOST_FOO).

So fix this discrepancy by setting $(BR2_PACKAGE_HOST_FOO_DEPENDENCIES)
from $(BR2_PACKAGE_PROVIDES_FOO) only if $(BR2_PACKAGE_PROVIDES_HOST_FOO)
is empty.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: add comments suggested by Arnout.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-virtual.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index 2e83e07..0de79d4 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -49,7 +49,13 @@ $(2)_IS_VIRTUAL = YES
 ifeq ($(4),target)
 $(2)_DEPENDENCIES += $$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2)))
 else
+ifeq ($$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2))),)
+# Inherit from target package BR2_PACKAGE_PROVIDES_FOO
 $(2)_DEPENDENCIES += host-$$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(3)))
+else
+# BR2_PACKAGE_PROVIDES_HOST_<pkg> is explicitly defined
+$(2)_DEPENDENCIES += $$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2)))
+endif
 endif
 
 # Call the generic package infrastructure to generate the necessary
