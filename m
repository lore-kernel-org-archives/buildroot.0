From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 May 2014 09:27:57 -0300
Subject: [Buildroot] [PATCH] samba4: disable libbsd support
Message-ID: <1400502477-945-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's a symbol conflict between regular (POSIX) link(2) and the BSD
variant for builtin heimdal when libbsd is around and used. Fixes:
http://autobuild.buildroot.net/results/657/65726ceccbc2d8fa24e178ea66cd44703768bc95/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/samba4-0009-disable-libbsd.patch | 26 +++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/samba4/samba4-0009-disable-libbsd.patch

diff --git a/package/samba4/samba4-0009-disable-libbsd.patch b/package/samba4/samba4-0009-disable-libbsd.patch
new file mode 100644
index 0000000..b29a812
--- /dev/null
+++ b/package/samba4/samba4-0009-disable-libbsd.patch
@@ -0,0 +1,26 @@
+Disable libbsd support, samba4 uses a global config.h for its own
+codebase and that of heimdal (when building with builtin).
+This causes redefinition conflicts for link(2) when both standard unistd.h
+and bsd/unistd.h get included.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura samba-4.1.7.orig/lib/replace/wscript samba-4.1.7/lib/replace/wscript
+--- samba-4.1.7.orig/lib/replace/wscript	2014-04-17 04:59:14.000000000 -0300
++++ samba-4.1.7/lib/replace/wscript	2014-05-19 09:17:25.561947774 -0300
+@@ -253,15 +253,6 @@
+     conf.CHECK_FUNCS('strtouq strtoll __strtoll strtoq memalign posix_memalign')
+     conf.CHECK_FUNCS('prctl')
+ 
+-    # libbsd on some platforms provides strlcpy and strlcat
+-    if not conf.CHECK_FUNCS('strlcpy strlcat'):
+-        conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
+-                checklibc=True)
+-    if not conf.CHECK_FUNCS('getpeereid'):
+-        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
+-    if not conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h'):
+-        conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h')
+-
+     conf.CHECK_CODE('''
+                 struct ucred cred;
+                 socklen_t cred_len;
-- 
1.8.5.5
