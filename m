From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Mar 2017 21:50:43 +0200
Subject: [Buildroot] [git commit] package/gdb: fix gdb-7.12.1 build on xtensa
Message-ID: <20170328195050.2ABFD821E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3419046be9473dfed50e1826f51ea367e49933af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the following gdb-7.12.1 build error on xtensa architecture:

  gdb/xtensa-linux-nat.c: In function 'void fetch_gregs(regcache*, ptid_t, int)':
  gdb/xtensa-linux-nat.c:178:23: error: uninitialized const 'regs' [-fpermissive]
     const gdb_gregset_t regs;

Backported from: d274ecf4ddf76768af57e27f654b9ce6784b391c
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...e-const-in-xtensa-linux-nat.c-fetch_gregs.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/gdb/7.12.1/0001-Remove-const-in-xtensa-linux-nat.c-fetch_gregs.patch b/package/gdb/7.12.1/0001-Remove-const-in-xtensa-linux-nat.c-fetch_gregs.patch
new file mode 100644
index 0000000..bb3d99d
--- /dev/null
+++ b/package/gdb/7.12.1/0001-Remove-const-in-xtensa-linux-nat.c-fetch_gregs.patch
@@ -0,0 +1,39 @@
+From d274ecf4ddf76768af57e27f654b9ce6784b391c Mon Sep 17 00:00:00 2001
+From: Simon Marchi <simon.marchi@ericsson.com>
+Date: Mon, 6 Mar 2017 16:06:42 -0500
+Subject: [PATCH] Remove const in xtensa-linux-nat.c:fetch_gregs
+
+Fixes:
+
+/home/emaisin/src/binutils-gdb/gdb/xtensa-linux-nat.c: In function 'void fetch_gregs(regcache*, ptid_t, int)':
+/home/emaisin/src/binutils-gdb/gdb/xtensa-linux-nat.c:178:23: error: uninitialized const 'regs' [-fpermissive]
+   const gdb_gregset_t regs;
+                       ^
+
+gdb/ChangeLog:
+
+	* xtensa-linux-nat.c (fetch_gregs): Remove const.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: d274ecf4ddf76768af57e27f654b9ce6784b391c
+
+ gdb/xtensa-linux-nat.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdb/xtensa-linux-nat.c b/gdb/xtensa-linux-nat.c
+index afe15f6..c29f0c7 100644
+--- a/gdb/xtensa-linux-nat.c
++++ b/gdb/xtensa-linux-nat.c
+@@ -175,7 +175,7 @@ static void
+ fetch_gregs (struct regcache *regcache, int regnum)
+ {
+   int tid = ptid_get_lwp (inferior_ptid);
+-  const gdb_gregset_t regs;
++  gdb_gregset_t regs;
+   int areg;
+   
+   if (ptrace (PTRACE_GETREGS, tid, 0, (long) &regs) < 0)
+-- 
+2.1.4
+
