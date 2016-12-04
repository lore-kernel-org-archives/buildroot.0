From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  4 Dec 2016 22:37:24 +0100
Subject: [Buildroot] [PATCH] Makefile: move SED definition into the main
	Makefile
Message-ID: <1480887444-19245-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit f71a621d91ec27f175fc84012962f88b1107305f, we are using the
SED variable in the main Makefile. However, this variable is only
defined in package/Makefile.in, which gets included only when a
configuration is defined.

This means that, if you do:

 $ make menuconfig savedefconfig

without a configuration defined, it fails with:

/bin/bash: /BR2_DEFCONFIG=/d: No such file or directory
Makefile:898: recipe for target 'savedefconfig' failed
make[1]: *** [savedefconfig] Error 127

This issue affects users of the "buildroot-submodule" project, which
does menuconfig+savedefconfig automatically. They worked around this
issue in commit
https://github.com/Openwide-Ingenierie/buildroot-submodule/commit/d12676b608a58529c6b551aa176464166a200428,
but really "make menuconfig savedefconfig" should work out of the box.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile            | 1 +
 package/Makefile.in | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 00bcd0f..b80b9e1 100644
--- a/Makefile
+++ b/Makefile
@@ -322,6 +322,7 @@ HOSTLN := $(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
 HOSTNM := $(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
 HOSTOBJCOPY := $(shell which $(HOSTOBJCOPY) || type -p $(HOSTOBJCOPY) || echo objcopy)
 HOSTRANLIB := $(shell which $(HOSTRANLIB) || type -p $(HOSTRANLIB) || echo ranlib)
+SED := $(shell which sed || type -p sed) -i -e
 
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTLD
 export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
diff --git a/package/Makefile.in b/package/Makefile.in
index 4b3368f..688d5b1 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -213,7 +213,6 @@ endif
 INSTALL := $(shell which install || type -p install)
 FLEX := $(shell which flex || type -p flex)
 BISON := $(shell which bison || type -p bison)
-SED := $(shell which sed || type -p sed) -i -e
 UNZIP := $(shell which unzip || type -p unzip) -q
 
 APPLY_PATCHES = support/scripts/apply-patches.sh $(if $(QUIET),-s)
-- 
2.7.4
