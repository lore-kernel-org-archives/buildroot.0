From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue,  4 Mar 2014 23:10:16 +0400
Subject: [Buildroot] [PATCH] kmod: disable --gc-sections ld option when
	building for xtensa
Message-ID: <1393960216-18633-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a workaround for the following ld issue exhibited by --gc-sections
option, until a proper fix for binutils is ready:

ld: BFD (GNU Binutils) 2.22 internal error, aborting at elf32-xtensa.c line 3374 in elf_xtensa_finish_dynamic_sections

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/kmod/900-disable-gc-sections.patch.xtensa | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 package/kmod/900-disable-gc-sections.patch.xtensa

diff --git a/package/kmod/900-disable-gc-sections.patch.xtensa b/package/kmod/900-disable-gc-sections.patch.xtensa
new file mode 100644
index 0000000..2b7a9cb
--- /dev/null
+++ b/package/kmod/900-disable-gc-sections.patch.xtensa
@@ -0,0 +1,12 @@
+--- kmod-16/configure	2013-12-23 01:31:12.456202872 +0400
++++ kmod-16.mod/configure	2014-03-04 22:53:37.132241845 +0400
+@@ -14511,8 +14511,7 @@
+ 
+ 
+   for flag in  \
+-		       -Wl,--as-needed \
+-		       -Wl,--gc-sections; do
++		       -Wl,--as-needed ; do
+ 
+   { $as_echo "$as_me:${as_lineno-$LINENO}: checking if $CC supports flag $flag in envvar LDFLAGS" >&5
+ $as_echo_n "checking if $CC supports flag $flag in envvar LDFLAGS... " >&6; }
-- 
1.8.1.4
