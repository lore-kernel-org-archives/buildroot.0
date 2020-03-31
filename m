From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Mar 2020 22:24:19 +0200
Subject: [Buildroot] [git commit] package/gssdp: build vala bindings for
 introspection
Message-ID: <20200331210021.C2ABC8A49E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d513e55930eda15a5fb15e00c1da774e6c18f66c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building its introspection metadata description files, gssdp can
also generate the associated vala bindings.

Dependent packages may then use either or both the introspection
metadata description files or the vala bindings to generate their own.
For example; this is the case with gupnp, which requires the vala
bindings from gssdp to be able to generate its introspection metadata
description files and vala bindings.

Since there is no way to know whether the vala bindings are required or
not, we always build them. host-vala has no dependency that is not
already a dependency of gssdp, so the overhead is just the time to build
host-vala itself, roughly 32s here when compared to 10+minutes to build
all the dependencies of gssdp with introspection support.

Fixes:
  - http://autobuild.buildroot.org/results/06f879902a567c26bade630091b21b56f637bd60/
  - http://autobuild.buildroot.org/results/457ecc20e1932e13e82ff6bdcaf4adaf97cb7d1d/

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gssdp/gssdp.mk | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index 4b3ce854fc..14eec0b5fd 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -12,15 +12,13 @@ GSSDP_LICENSE = LGPL-2.0+
 GSSDP_LICENSE_FILES = COPYING
 GSSDP_INSTALL_STAGING = YES
 GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
-GSSDP_CONF_OPTS = \
-	-Dexamples=false \
-	-Dvapi=false
+GSSDP_CONF_OPTS = -Dexamples=false
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-GSSDP_CONF_OPTS += -Dintrospection=true
-GSSDP_DEPENDENCIES += gobject-introspection
+GSSDP_CONF_OPTS += -Dintrospection=true -Dvapi=true
+GSSDP_DEPENDENCIES += host-vala gobject-introspection
 else
-GSSDP_CONF_OPTS += -Dintrospection=false
+GSSDP_CONF_OPTS += -Dintrospection=false -Dvapi=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
