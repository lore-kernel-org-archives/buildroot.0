From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Feb 2021 18:40:12 +0100
Subject: [Buildroot] [RFC v1 5/6] package/pkg-cmake: add
 _INSTALL_STAGING_ENV/_INSTALL_TARGET_ENV
In-Reply-To: <20210213174013.32584-1-ps.report@gmx.net>
References: <20210213174013.32584-1-ps.report@gmx.net>
Message-ID: <20210213174013.32584-6-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add _INSTALL_STAGING_ENV/_INSTALL_TARGET_ENV as needed for ninja
make/install as ninja expects the DESDIR as eviornment var instead
of parameter.

This one makes ninja unhappy:

	$ ninja install DESTDIR=...

This one makes ninja happy:

	$ DESTDIR=... ninja install

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
ToDo:
  - add documentation

Notes:
  - alternative to explicit make/ninja calls maybe common
    'cmake --build'/'cmake --install' calls are a feasible
    solution (yet untested) - pro: more common code, con:
    less customizable, needs to take a look at the current
    users of _MAKE/_INSTALL_STAGING_OPTS/_INSTALL_TARGET_OPTS
    options
---
 package/pkg-cmake.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index c001051002..b758e50b76 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -58,7 +58,10 @@ $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPTS			?=
 $(2)_INSTALL_OPTS		?= install
 $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install/fast
+$(2)_INSTALL_STAGING_ENV	?=
 $(2)_INSTALL_TARGET_OPTS	?= DESTDIR=$$(TARGET_DIR) install/fast
+$(2)_INSTALL_TARGET_ENV		?=
+
 
 $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
 
@@ -192,7 +195,7 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_INSTALL_STAGING_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 
@@ -202,7 +205,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV)  $$($$(PKG)_INSTALL_TARGET_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPTS) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 
-- 
2.30.0
