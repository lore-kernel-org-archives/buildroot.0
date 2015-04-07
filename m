From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue,  7 Apr 2015 14:09:09 +0900
Subject: [Buildroot] [PATCH v2] Makefile: remove extra ifdef/endif of top
	Makefile
Message-ID: <1428383349-20804-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---

Changes in v2:
  - Add more detailed explanation

 Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index d6426b3..9db52a8 100644
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
-- 
1.9.1
