From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed,  5 Mar 2014 00:30:31 +0400
Subject: [Buildroot] [PATCH v2] kmod: disable --gc-sections ld option when
	building for xtensa
Message-ID: <1393965031-25239-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a workaround for the following ld issue exhibited by --gc-sections
option, until a proper fix for binutils is ready:

ld: BFD (GNU Binutils) 2.22 internal error, aborting at elf32-xtensa.c line 3374 in elf_xtensa_finish_dynamic_sections

Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1->v2:
- instead of patching configure specify that -Wl,--gc-sections is not
  supported by ld at configure time

 package/kmod/kmod.mk | 5 +++++
 1 file changed, 5 insertions(+)

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
-- 
1.8.1.4
