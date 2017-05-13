From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 May 2017 15:03:49 +0200
Subject: [Buildroot] [git commit branch/next] package/tmux: bump to v2.4
Message-ID: <20170513130403.B3D18827C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1b31f07e6a915336fb8ff6750851b94369bf68b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also removes 0001-compat-don-t-re-define-program_invocation_short_name.patch,
since it's applied to upstream in this version.

Tested with:
qemu_ppc_g3beige_defconfig

Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...t-re-define-program_invocation_short_name.patch | 42 ----------------------
 package/tmux/tmux.hash                             |  2 +-
 package/tmux/tmux.mk                               |  2 +-
 3 files changed, 2 insertions(+), 44 deletions(-)

diff --git a/package/tmux/0001-compat-don-t-re-define-program_invocation_short_name.patch b/package/tmux/0001-compat-don-t-re-define-program_invocation_short_name.patch
deleted file mode 100644
index bddc2c7..0000000
--- a/package/tmux/0001-compat-don-t-re-define-program_invocation_short_name.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 9b18a98614a9f201b0883c2b15e7c7bde0aa0ff2 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 5 Feb 2017 17:12:00 +0100
-Subject: [PATCH] compat: don't re-define program_invocation_short_name
-
-program_invocation_short_name is defined in errno.h, and its definition
-can differ between the various C libraries: glibc defines it as:
-    extern char *program_invocation_short_name;
-
-while uClibc defines it as:
-    extern const char *program_invocation_short_name;
-
-So there is not simple solution to know the prototype.
-
-But since it is defined in errno.h, there is no reason to try and define
-it ourselves; let's just trust what the header provides.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- compat/getprogname.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/compat/getprogname.c b/compat/getprogname.c
-index 80a496d..ad619fc 100644
---- a/compat/getprogname.c
-+++ b/compat/getprogname.c
-@@ -19,11 +19,10 @@
- #include "compat.h"
- 
- #if defined(HAVE_PROGRAM_INVOCATION_SHORT_NAME)
-+#include <errno.h>
- const char *
- getprogname(void)
- {
--	extern char	*program_invocation_short_name;
--
- 	return (program_invocation_short_name);
- }
- #elif defined(HAVE___PROGNAME)
--- 
-2.7.4
-
diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index 9195a16..ac42571 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 55313e132f0f42de7e020bf6323a1939ee02ab79c48634aa07475db41573852b  tmux-2.3.tar.gz
+sha256 757d6b13231d0d9dd48404968fc114ac09e005d475705ad0cd4b7166f799b349 tmux-2.4.tar.gz
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index f6dd1a9..6636b9b 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TMUX_VERSION = 2.3
+TMUX_VERSION = 2.4
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = README
