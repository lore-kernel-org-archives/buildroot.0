From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 21:34:00 +0200
Subject: [Buildroot] [git commit] Makefile: remove extra ifdef/endif of top
	Makefile
Message-ID: <20150407193439.D185F81941@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6bf9e23332bffc6362cb63f37957ac69e5a6ac96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The GNU make's origin function know undefined variable well,
so the outer ifdef/endif conditional checking is unneeded.

From `info make` documentation, origin will return

  `undefined'
     if VARIABLE was never defined.
  `command line'
     if VARIABLE was defined on the command line.
   ...

Therefore, $(origin V) will get a value anyway, killing ifdef/endif
is viable and safe.

Furthermore, I've checked the minimal requirements from the top
Makefile is GNU make 3.81, and that version of GNU make has support
of origin function well already, so now it's safe to kill the outer
conditional checking, without upgrading the minimal requirements.

Signed-off-by: Cheng Renquan <crq@kernel.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
[ Commit description is borrowed from Linux Kernel
  (commit b8b0618cf6fa) and adjusted for Buildroot ]
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index c691b57..2ad8832 100644
--- a/Makefile
+++ b/Makefile
@@ -184,10 +184,8 @@ endif
 
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
-ifdef V
-  ifeq ("$(origin V)", "command line")
-    KBUILD_VERBOSE = $(V)
-  endif
+ifeq ("$(origin V)", "command line")
+  KBUILD_VERBOSE = $(V)
 endif
 ifndef KBUILD_VERBOSE
   KBUILD_VERBOSE = 0
