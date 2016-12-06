From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Dec 2016 20:40:10 +0100
Subject: [Buildroot] [git commit] Makefile: move SED definition into the
	main Makefile
Message-ID: <20161206194102.F15F4817D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90605b8fe72e61ad8224b7f5c2dde7a5dedbf791
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
