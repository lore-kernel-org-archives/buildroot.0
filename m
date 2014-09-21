From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:47:47 +0200
Subject: [Buildroot] [git commit] iprutils: Fix static build by passing the
	libraries in the right order
Message-ID: <20140921174754.5D0A99D6FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d4ce6ccc4754c57643446052a89cbd153564e1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This mistake was causing failures like this one:

m_post.c:(.text+0x60): undefined reference to `wattr_on'

Patch sent upstream:
  https://sourceforge.net/p/iprdd/iprutils/merge-requests/1/

Fixes:
  http://autobuild.buildroot.net/results/500/5004e7b230635e0605acdd17d2b7d2d01fc5075c/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...x-static-build-by-passing-the-libraries-i.patch |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

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
