From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 13:19:05 +0200
Subject: [Buildroot] [git commit] core/pkg-virtual: fix fallout of
	host-dependecy no auto-derivation
Message-ID: <20160703112002.601137FDE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e0d06cf2016638873c861394b2a5f21580d972b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 4bdb067 (infra: remove auto derivation of host dependencies), the
dependencies of host packages are no longer inherited from the
dependencies of the corresponding target package.

However, for virtual packages, there is no provider declared for the
host variant, so we end up with no dependency for the host variant
of virtual packages.

This causes host-luainterpreter to have no provider, and thus breaks the
build of host-luarocks.

To fix that, we use the host variant of the provider of the target
variant of the virtual package to define the provider of the host variant
of the virtual package (re-read it, it's correct!).

Fixes:
    http://autobuild.buildroot.org/results/d8b/d8baf44b1e2f8e0e32c86558fc3e0694235b512a
    http://autobuild.buildroot.org/results/59a/59ac0fe84e5c76a590c698a1483b2a3ae26e1dcf
    http://autobuild.buildroot.org/results/203/2039f24731d8e14cde24c613b487b3db530dd238

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-virtual.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index bcb2cad..2e83e07 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -44,7 +44,13 @@ endif
 $(2)_IS_VIRTUAL = YES
 
 # Add dependency against the provider
+# For a host package, there is no corresponding BR2_PACKAGE_PROVIDES_HOST_FOO,
+# so we need to compute it from the target variant.
+ifeq ($(4),target)
 $(2)_DEPENDENCIES += $$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2)))
+else
+$(2)_DEPENDENCIES += host-$$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(3)))
+endif
 
 # Call the generic package infrastructure to generate the necessary
 # make targets
