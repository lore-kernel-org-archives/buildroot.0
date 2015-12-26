From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Dec 2015 15:49:41 +0100
Subject: [Buildroot] [git commit] trousers: remove inline for
	read_data/write_data
Message-ID: <20151226145051.CD93C81E7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95789dd06601afb8ad43f7490e6350f9b79b24b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

read_data and write_data functions are declared with inline, but
their definition is not in a .h file. This is causing errors when
linking:

tcsps.c:(.text+0x4ac): undefined reference to `read_data'
tcsps.c:(.text+0x1888): undefined reference to `write_data'
...

The patch is a partial backport of upstream commit
3297fcdf5ac0df868778e976b8b59e35542c1ee2.

Fixes:
http://autobuild.buildroot.net/results/1a53d929bcec840cd18185e54b1a6da8aa849269/
http://autobuild.buildroot.net/results/fad66e88b5a97004b21658d413f4d3a6d0d8838b/
http://autobuild.buildroot.net/results/c7e23b8ec2c69798482868e18311ebf2c01b65e0/
...

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...emove-inline-for-read_data-and-write_data.patch | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/package/trousers/0001-Remove-inline-for-read_data-and-write_data.patch b/package/trousers/0001-Remove-inline-for-read_data-and-write_data.patch
new file mode 100644
index 0000000..b0db70b
--- /dev/null
+++ b/package/trousers/0001-Remove-inline-for-read_data-and-write_data.patch
@@ -0,0 +1,94 @@
+From f03c7987c234a81f7e4274b26bab07318357a2a5 Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Fri, 25 Dec 2015 20:09:21 -0200
+Subject: [PATCH] Remove inline for read_data and write_data
+
+read_data and write_data functions are declared with inline, but
+their definition is not in a .h file. This is causing errors when
+linking:
+
+tcsps.c:(.text+0x4ac): undefined reference to `read_data'
+tcsps.c:(.text+0x1888): undefined reference to `write_data'
+...
+
+Partial backport of upstream commit
+3297fcdf5ac0df868778e976b8b59e35542c1ee2.
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ src/include/tcsps.h    | 5 -----
+ src/tcs/ps/ps_utils.c  | 8 --------
+ src/tspi/ps/ps_utils.c | 4 ++--
+ 3 files changed, 2 insertions(+), 15 deletions(-)
+
+diff --git a/src/include/tcsps.h b/src/include/tcsps.h
+index 87542965877d..dcd5db469822 100644
+--- a/src/include/tcsps.h
++++ b/src/include/tcsps.h
+@@ -23,13 +23,8 @@ int		   get_file();
+ int		   put_file(int);
+ void		   close_file(int);
+ void		   ps_destroy();
+-#ifdef SOLARIS
+ TSS_RESULT  read_data(int, void *, UINT32);
+ TSS_RESULT  write_data(int, void *, UINT32);
+-#else
+-inline TSS_RESULT  read_data(int, void *, UINT32);
+-inline TSS_RESULT  write_data(int, void *, UINT32);
+-#endif
+ int		   write_key_init(int, UINT32, UINT32, UINT32);
+ TSS_RESULT	   cache_key(UINT32, UINT16, TSS_UUID *, TSS_UUID *, UINT16, UINT32, UINT32);
+ TSS_RESULT	   UnloadBlob_KEY_PS(UINT16 *, BYTE *, TSS_KEY *);
+diff --git a/src/tcs/ps/ps_utils.c b/src/tcs/ps/ps_utils.c
+index 2e7f502b9599..35ac89f8fc12 100644
+--- a/src/tcs/ps/ps_utils.c
++++ b/src/tcs/ps/ps_utils.c
+@@ -42,11 +42,7 @@
+ struct key_disk_cache *key_disk_cache_head = NULL;
+
+
+-#ifdef SOLARIS
+ TSS_RESULT
+-#else
+-inline TSS_RESULT
+-#endif
+ read_data(int fd, void *data, UINT32 size)
+ {
+	int rc;
+@@ -64,11 +60,7 @@ read_data(int fd, void *data, UINT32 size)
+ }
+
+
+-#ifdef SOLARIS
+ TSS_RESULT
+-#else
+-inline TSS_RESULT
+-#endif
+ write_data(int fd, void *data, UINT32 size)
+ {
+	int rc;
+diff --git a/src/tspi/ps/ps_utils.c b/src/tspi/ps/ps_utils.c
+index aac40a147314..83259141d375 100644
+--- a/src/tspi/ps/ps_utils.c
++++ b/src/tspi/ps/ps_utils.c
+@@ -22,7 +22,7 @@
+ #include "tspps.h"
+ #include "tsplog.h"
+
+-inline TSS_RESULT
++TSS_RESULT
+ read_data(int fd, void *data, UINT32 size)
+ {
+	int rc;
+@@ -39,7 +39,7 @@ read_data(int fd, void *data, UINT32 size)
+	return TSS_SUCCESS;
+ }
+
+-inline TSS_RESULT
++TSS_RESULT
+ write_data(int fd, void *data, UINT32 size)
+ {
+	int rc;
+--
+1.9.1
+
