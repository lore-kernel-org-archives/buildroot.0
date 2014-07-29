From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 20:43:09 +0200
Subject: [Buildroot] [git commit] httping: fix math library linking
Message-ID: <20140729184323.4409E9D339@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8793ddcd6f87b50934a4b4d1a53b7bf54cf650cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the math library directive '-lm' to linker options at the end.
The order of the math library directive '-lm' matters.

Fixes:

  http://autobuild.buildroot.net/results/843/84382290696e72c23995f5ed020ad5c157817012/

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../httping-0001-fix-math-library-linking.patch    |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/httping/httping-0001-fix-math-library-linking.patch b/package/httping/httping-0001-fix-math-library-linking.patch
new file mode 100644
index 0000000..0078f41
--- /dev/null
+++ b/package/httping/httping-0001-fix-math-library-linking.patch
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
