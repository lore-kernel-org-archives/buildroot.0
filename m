From: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Date: Wed, 23 Jul 2014 17:17:22 +0530
Subject: [Buildroot] [PATCH] httping: fix math library linking
Message-ID: <1406116042-3054-1-git-send-email-yuvaraj.patil@wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the math library directive '-lm' to linker options at the end.
The order of the math library directive '-lm' matters.

fixes:
http://autobuild.buildroot.net/results/843/84382290696e72c23995f5ed020ad5c157817012//

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
---
 .../httping-2.3.4-fix-math-library-linking.patch   |   25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/httping/httping-2.3.4-fix-math-library-linking.patch

diff --git a/package/httping/httping-2.3.4-fix-math-library-linking.patch b/package/httping/httping-2.3.4-fix-math-library-linking.patch
new file mode 100644
index 0000000..0078f41
--- /dev/null
+++ b/package/httping/httping-2.3.4-fix-math-library-linking.patch
@@ -0,0 +1,25 @@
+Move LDFLAGS+=-lm option to the end.
+The order of the math library directive '-lm' matters.
+
+Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
+---
+diff -Nurp httping-2.3.4_orig/Makefile httping-2.3.4/Makefile
+--- httping-2.3.4_orig/Makefile	2014-07-23 16:16:36.495546288 +0530
++++ httping-2.3.4/Makefile	2014-07-23 16:18:42.547541002 +0530
+@@ -37,7 +37,6 @@ DEBUG=yes
+ WFLAGS=-Wall -W
+ OFLAGS=
+ CFLAGS+=$(WFLAGS) $(OFLAGS) -DVERSION=\"$(VERSION)\" -DLOCALEDIR=\"$(LOCALEDIR)\"
+-LDFLAGS+=-lm
+ 
+ PACKAGE=$(TARGET)-$(VERSION)
+ PREFIX?=/usr
+@@ -97,6 +96,8 @@ ifeq ($(ARM),yes)
+ CC=arm-linux-gcc
+ endif
+ 
++LDFLAGS+=-lm
++
+ all: $(TARGET) $(TRANSLATIONS)
+ 
+ $(TARGET): $(OBJS)
-- 
1.7.9.5
