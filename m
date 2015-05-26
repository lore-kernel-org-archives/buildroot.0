From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 May 2015 01:41:57 +0200
Subject: [Buildroot] [PATCH 02/21 RFC] pkg-infra/pkg-generic: define PKGDIR
	for all rules
In-Reply-To: <cover.1432681414.git.yann.morin.1998@free.fr>
References: <cover.1432681414.git.yann.morin.1998@free.fr>
Message-ID: <9393286b01b2641eaad7f55d41a6e12a9b90c10a.1432681414.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When we eventually support more than one br2-external tree, packages
won't be able to use $(BR2_EXTERNAL)/PACKAGE_PATH to reference files in
the package's directory (the directory with the package's .mk file).

Define PKGDIR for all our rules, so packages can simply reference it to
find their files.

This can also be used for our own packages, to avoid hard-coding the
path to our own files as well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 package/pkg-generic.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d5b29f0..2a5ad21 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -614,17 +614,25 @@ $(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
 $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
+$$($(2)_TARGET_INSTALL_TARGET):		PKGDIR=$(pkgdir)
 $$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
+$$($(2)_TARGET_INSTALL_STAGING):	PKGDIR=$(pkgdir)
 $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
+$$($(2)_TARGET_INSTALL_IMAGES):		PKGDIR=$(pkgdir)
 $$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
+$$($(2)_TARGET_INSTALL_HOST):           PKGDIR=$(pkgdir)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
+$$($(2)_TARGET_BUILD):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
+$$($(2)_TARGET_CONFIGURE):		PKGDIR=$(pkgdir)
 $$($(2)_TARGET_RSYNC):                  SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC):                  PKG=$(2)
+$$($(2)_TARGET_RSYNC):                  PKGDIR=$(pkgdir)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			RAWNAME=$$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
+$$($(2)_TARGET_EXTRACT):		PKGDIR=$(pkgdir)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
-- 
1.9.1
