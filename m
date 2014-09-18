From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 18 Sep 2014 10:23:28 +0100
Subject: [Buildroot] [PATCH v2 2/2] iprutils: Fix static build by passing
	the libraries in the right order
In-Reply-To: <1411032208-62586-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1411032208-62586-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1411032208-62586-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This mistake was causing failures like this one:

m_post.c:(.text+0x60): undefined reference to `wattr_on'

Patch sent upstream:
  https://sourceforge.net/p/iprdd/iprutils/merge-requests/1/

Fixes:
  http://autobuild.buildroot.net/results/500/5004e7b230635e0605acdd17d2b7d2d01fc5075c/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...x-static-build-by-passing-the-libraries-i.patch |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/iprutils/iprutils-0003-Fix-static-build-by-passing-the-libraries-i.patch

diff --git a/package/iprutils/iprutils-0003-Fix-static-build-by-passing-the-libraries-i.patch b/package/iprutils/iprutils-0003-Fix-static-build-by-passing-the-libraries-i.patch
new file mode 100644
index 0000000..e176ab6
--- /dev/null
+++ b/package/iprutils/iprutils-0003-Fix-static-build-by-passing-the-libraries-i.patch
@@ -0,0 +1,20 @@
+iprutils: Fix static build by passing the libraries in the right order
+
+This mistake was causing failures like this one:
+
+m_post.c:(.text+0x60): undefined reference to `wattr_on'
+
+http://autobuild.buildroot.net/results/500/5004e7b230635e0605acdd17d2b7d2d01fc5075c/build-end.log
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+--- iprutils-2.4.2/Makefile.orig	2014-09-17 18:14:52.435367860 +0100
++++ iprutils-2.4.2/Makefile	2014-09-17 18:15:09.367652526 +0100
+@@ -16,7 +16,7 @@ TAR = cd .. && tar -zcpf iprutils-$(UTIL
+ all: iprconfig iprupdate iprdump iprinit iprdbg docs 
+ 
+ iprconfig: iprconfig.c iprlib.o iprconfig.h
+-	$(CC) $(CFLAGS) $(INCLUDEDIR) -o iprconfig iprconfig.c iprlib.o $(LDFLAGS) -lform -lpanel -lncurses -lmenu
++	$(CC) $(CFLAGS) $(INCLUDEDIR) -o iprconfig iprconfig.c iprlib.o $(LDFLAGS) -lform -lpanel -lmenu -lncurses
+ 
+ iprupdate: iprupdate.c iprlib.o
+ 	$(CC) $(CFLAGS) $(INCLUDEDIR) -o iprupdate iprlib.o iprupdate.c $(LDFLAGS)
-- 
1.7.1
