From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2014 08:14:57 +0100
Subject: [Buildroot] [git commit] Makefile.legacy: fix recursive invocation
	with BUILDROOT_DL_DIR and _CONFIG
Message-ID: <20140211082559.2BD9A9C969@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af97c94b70eee6388f1902864ec248e2817323be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The legacy support for the old BUILDROOT_DL_DIR and BUILDROOT_CONFIG
breaks down when make is invoked recursively - which is done in a few
cases, e.g. silentoldconfig, external-defs, ... These targets always
give a legacy error.

For BUILDROOT_DL_DIR, this is fixed by making sure that the original
value of BR2_DL_DIR taken from the environment is also exported again.

For BUILDROOT_CONFIG, this is fixed with an additional comparison of
the environment variable's value with the fake value that we introduce
ourselves.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile.legacy         |   10 +++++++---
 package/pkg-download.mk |    5 +++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/Makefile.legacy b/Makefile.legacy
index ea18bc6..764cfcd 100644
--- a/Makefile.legacy
+++ b/Makefile.legacy
@@ -28,16 +28,20 @@ $(error "The BUILDROOT_DL_DIR environment variable was renamed to BR2_DL_DIR.")
 endif
 endif
 
+# If a script is using the deprecated BUILDROOT_CONFIG, make sure it fails.
+# Add some directories in front just in case someone used dirname on it.
+BUILDROOT_CONFIG_FAKE = /tmp/deprecated/The-BUILDROOT_CONFIG-environment-variable-was-renamed-to-BR2_CONFIG
+
 # Similar to above for BUILDROOT_CONFIG, but here we have no .config equivalent.
 ifneq ($(BUILDROOT_CONFIG),)
 ifneq ($(BUILDROOT_CONFIG),$(BR2_CONFIG))
+ifneq ($(BUILDROOT_CONFIG),$(BUILDROOT_CONFIG_FAKE))
 $(error "The BUILDROOT_CONFIG environment variable was renamed to BR2_CONFIG.")
 endif
 endif
+endif
 
-# If a script is using the deprecated BUILDROOT_CONFIG, make sure it fails.
-# Add some directories in front just in case someone used dirname on it.
-BUILDROOT_CONFIG = /tmp/deprecated/The-BUILDROOT_CONFIG-environment-variable-was-renamed-to-BR2_CONFIG
+BUILDROOT_CONFIG = $(BUILDROOT_CONFIG_FAKE)
 export BUILDROOT_CONFIG
 
 #
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 84598d5..6d4cbcd 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -24,10 +24,15 @@ LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 DL_MODE=DOWNLOAD
 
 # DL_DIR may have been set already from the environment
+ifeq ($(origin DL_DIR),undefined)
 DL_DIR ?= $(call qstrip,$(BR2_DL_DIR))
 ifeq ($(DL_DIR),)
 DL_DIR := $(TOPDIR)/dl
 endif
+else
+# Restore the BR2_DL_DIR that was overridden by the .config file
+BR2_DL_DIR = $(DL_DIR)
+endif
 
 # ensure it exists and a absolute path
 DL_DIR := $(shell mkdir -p $(DL_DIR) && cd $(DL_DIR) >/dev/null && pwd)
