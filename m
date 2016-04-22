From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 22 Apr 2016 22:50:13 +0200
Subject: [Buildroot] [PATCH v9 01/11] core: split variables definition
	related to in/out-of-tree build from O itself
In-Reply-To: <1461358223-18312-1-git-send-email-s.martin49@gmail.com>
References: <1461358223-18312-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1461358223-18312-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change uncorrolates the CONFIG_DIR and NEED_WRAPPER definition from
the presence of the O variable in the command line.

Now, the condition used to set these variables is the value of O itself.

This change is a preparatory work since the O definition will need to
be moved around when we will make Buildroot run with absolute canonical
paths for both its root directory and the output location.
This will be addressed in a follow-up patch.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v8->v9:
- none

changes v7->v8:
- new patch
---
 Makefile | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 0e4beb2..3d86c9b 100644
--- a/Makefile
+++ b/Makefile
@@ -110,10 +110,11 @@ comma := ,
 empty :=
 space := $(empty) $(empty)
 
+# Set O variable if not already done on the command line;
+# or avoid confusing packages that can use the O=<dir> syntax for out-of-tree
+# build by preventing it from being forwarded to sub-make calls.
 ifneq ("$(origin O)", "command line")
 O := output
-CONFIG_DIR := $(TOPDIR)
-NEED_WRAPPER =
 else
 # other packages might also support Linux-style out of tree builds
 # with the O=<dir> syntax (E.G. BusyBox does). As make automatically
@@ -126,9 +127,16 @@ MAKEOVERRIDES =
 # Unfortunately some packages don't look at origin (E.G. uClibc 0.9.31+)
 # To really make O go away, we have to override it.
 override O := $(O)
-CONFIG_DIR := $(O)
 # we need to pass O= everywhere we call back into the toplevel makefile
 EXTRAMAKEARGS = O=$(O)
+endif
+
+# Set variables related to in-tree or out-of-tree build.
+ifeq ($(O),output)
+CONFIG_DIR := $(TOPDIR)
+NEED_WRAPPER =
+else
+CONFIG_DIR := $(O)
 NEED_WRAPPER = y
 endif
 
-- 
2.8.0
