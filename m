From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Sep 2014 09:37:00 +0200
Subject: [Buildroot] [git commit] package/smstools3: fix for recent make
Message-ID: <20140902073856.4FF859D52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1cb1f1e3e911a1e86edf0d3298c724288c4ef8d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

smstools3 defines variables in the middle of a recipe, which
make-3.81 accepts, but make-3.82 and later whine about.

Fixes:
    http://autobuild.buildroot.net/results/7fa/7fa839c7268256cb4f3b8728b3f50818cf3d3670/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../smstools3/smstools3-0000-fix-Makefile.patch    |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/smstools3/smstools3-0000-fix-Makefile.patch b/package/smstools3/smstools3-0000-fix-Makefile.patch
new file mode 100644
index 0000000..5842357
--- /dev/null
+++ b/package/smstools3/smstools3-0000-fix-Makefile.patch
@@ -0,0 +1,29 @@
+Makefile: fix rules
+
+In a Makefile, recipes should follow rules, there can not be variable
+definitions in-between.
+
+Although make-3.81 is happy about it, make-4.0 (and probably 3.82 too)
+do whine loudly.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN smstools3-3.1.15.orig/src/Makefile smstools3-3.1.15/src/Makefile
+--- smstools3-3.1.15.orig/src/Makefile	2010-09-21 13:29:14.000000000 +0200
++++ smstools3-3.1.15/src/Makefile	2014-09-01 22:27:02.719939329 +0200
+@@ -39,14 +39,13 @@
+ 
+ all: smsd 
+ 
+-smsd: smsd.c extras.o locking.o cfgfile.o logging.o alarm.o smsd_cfg.o charset.o stats.o blacklist.o whitelist.o modeminit.o pdu.o
+-
+ ifneq (,$(findstring SOLARIS,$(CFLAGS)))
+ ifeq (,$(findstring DISABLE_INET_SOCKET,$(CFLAGS)))
+ override LFLAGS += -lsocket -lnsl
+ endif
+ endif
+ 
++smsd: smsd.c extras.o locking.o cfgfile.o logging.o alarm.o smsd_cfg.o charset.o stats.o blacklist.o whitelist.o modeminit.o pdu.o
+ ifneq (,$(findstring NOSTATS,$(CFLAGS)))
+ 	$(CC) $(CFLAGS) -o $@ $^ $(LFLAGS)
+ else 
