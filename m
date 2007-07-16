From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 16 Jul 2007 22:32:43 +0200
Subject: [Buildroot] [PATCH] make strace buildable
Message-ID: <200707162232.43774.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all!

The second hunk in package/strace/strace-undef-syscall.patch is incorrect:

--- strace-4.5.15.orig/linux/syscallent.h       2007-02-04 19:03:48.000000000 +0100
+++ strace-4.5.15/linux/syscallent.h    2007-02-04 19:11:04.000000000 +0100
@@ -130,7 +130,10 @@
        { 2,    TF,     sys_statfs,             "statfs"        }, /* 99 */
        { 2,    TD,     sys_fstatfs,            "fstatfs"       }, /* 100 */
        { 3,    0,      sys_ioperm,             "ioperm"        }, /* 101 */
-       { 2,    TD,     sys_socketcall,         "socketcall", SYS_socketcall }, /* 102 */
+       { 2,    TD,     sys_socketcall,         "socketcall",
+#ifdef __NR_socketcall
+       SYS_socketcall }, /* 102 */
+#endif
        { 3,    0,      sys_syslog,             "syslog"        }, /* 103 */
        { 3,    0,      sys_setitimer,          "setitimer"     }, /* 104 */
        { 2,    0,      sys_getitimer,          "getitimer"     }, /* 105 */
@@ -145,7 +148,10 @@
        { 4,    TP,     sys_wait4,              "wait4", SYS_wait4 }, /* 114 */
        { 1,    0,      sys_swapoff,            "swapoff"       }, /* 115 */
        { 1,    0,      sys_sysinfo,            "sysinfo"       }, /* 116 */
-       { 6,    0,      sys_ipc,                "ipc", SYS_ipc }, /* 117 */
+       { 6,    0,      sys_ipc,                "ipc",
+#ifdef __NR_ipc
+       SYS_ipc }, /* 117 */
+#endif
        { 1,    TD,     sys_fsync,              "fsync"         }, /* 118 */
        { 1,    TS,     sys_sigreturn,          "sigreturn"     }, /* 119 */
        { 5,    TP,     sys_clone,              "clone", SYS_clone }, /* 120 */

If either or both of __NR_socketcall and __NR_ipc are not defined, then the
closing curly braces are omitted, thus resulting in incorrect C statements.

The attached patch to r19112 solves the issue.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< ?_? >==-- ?------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
?------------------------------?-------?------------------?--------------------?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: strace-syscallent.h-r19112.patch
Type: text/x-diff
Size: 1645 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070716/61ad059d/attachment.bin 
