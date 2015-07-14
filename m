From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 10:24:10 +0200
Subject: [Buildroot] [git commit] core/pkg-kconfig: don't enforce check for
	config file when not building
Message-ID: <20150714083402.CCA03819C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61ca162f5bf052f70c6ac356358120329e4b1c6d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, this is triggering the error message:
    make randconfig
    make source

Only limit the check to enforce a config file being set to when we are
actually building, like is done in the various kconfig-using packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index c86c340..f708875 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -90,9 +90,11 @@ $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
 # FOO_KCONFIG_FILE is required
+ifeq ($$(BR_BUILDING),y)
 ifeq ($$($(2)_KCONFIG_FILE),)
 $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
 endif
+endif
 
 # Configuration editors (menuconfig, ...)
 #
