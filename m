From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 23:18:21 +0100
Subject: [Buildroot] [git commit] kmod: disable --gc-sections ld option when
	building for xtensa
Message-ID: <20140304221850.1B5069BD03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=55c83179c4b30c9ec715a75297849abd74a63e05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a workaround for the following ld issue exhibited by --gc-sections
option, until a proper fix for binutils is ready:

ld: BFD (GNU Binutils) 2.22 internal error, aborting at elf32-xtensa.c line 3374 in elf_xtensa_finish_dynamic_sections

Fixes:

  http://autobuild.buildroot.org/results/97d/97d4c96d6f6cdc1ed4007456f4ab70be9dfa41b5/

Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kmod/kmod.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index f79a492..46c8ea9 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -32,6 +32,11 @@ KMOD_DEPENDENCIES += xz
 KMOD_CONF_OPT += --with-xz
 endif
 
+# --gc-sections triggers a bug in the current Xtensa binutils
+ifeq ($(BR2_xtensa),y)
+KMOD_CONF_ENV += cc_cv_LDFLAGS__Wl___gc_sections=no
+endif
+
 ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
 
 # add license info for kmod tools
