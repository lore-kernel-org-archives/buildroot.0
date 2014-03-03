From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  3 Mar 2014 08:44:12 -0300
Subject: [Buildroot] [PATCH] samba4: fix readline support
Message-ID: <1393847052-13062-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add automatic readilne support since it's used when available.
Also add a patch to update to new-style typedefs that were removed from
readline 6.3 that causes build breakage. Fixes:
http://autobuild.buildroot.net/results/b13/b137c237ff6df81dd10f7895278d1f2f5d2326de/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...line-switch-to-new-style-readline-typedef.patch | 32 ++++++++++++++++++++++
 package/samba4/samba4.mk                           |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 package/samba4/samba4-0006-smbreadline-switch-to-new-style-readline-typedef.patch

diff --git a/package/samba4/samba4-0006-smbreadline-switch-to-new-style-readline-typedef.patch b/package/samba4/samba4-0006-smbreadline-switch-to-new-style-readline-typedef.patch
new file mode 100644
index 0000000..65d0950
--- /dev/null
+++ b/package/samba4/samba4-0006-smbreadline-switch-to-new-style-readline-typedef.patch
@@ -0,0 +1,32 @@
+From 0d4f18b88c3e687b83dcbe4c27f74424cf2f2043 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Mon, 3 Mar 2014 07:57:24 -0300
+Subject: [PATCH] smbreadline: switch to new-style readline typedef
+
+Function, CPFunction, CPPFunction and VFunction typedefs are considered
+old-style (deprecated) starting from readline 4.2.
+Compatibility typedefs have been in place up to readline 6.2 but were
+removed with the 6.3 release thus causing builds to break.
+Swtich to the new-style specific prototyped typedef.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ libcli/smbreadline/smbreadline.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcli/smbreadline/smbreadline.c b/libcli/smbreadline/smbreadline.c
+index cff25a7..80e10b0 100644
+--- a/libcli/smbreadline/smbreadline.c
++++ b/libcli/smbreadline/smbreadline.c
+@@ -141,7 +141,7 @@ char *smb_readline(const char *prompt, void (*callback)(void),
+ 
+ #if HAVE_DECL_RL_EVENT_HOOK
+ 	if (callback)
+-		rl_event_hook = (Function *)callback;
++		rl_event_hook = (rl_hook_func_t *)callback;
+ #endif
+ 	ret = readline(prompt);
+ 	if (ret && *ret)
+-- 
+1.8.3.2
+
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 452c694..72710bf 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -10,7 +10,8 @@ SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_LICENSE = GPLv3+
 SAMBA4_LICENSE_FILES = COPYING
 SAMBA4_DEPENDENCIES = host-e2fsprogs host-heimdal e2fsprogs popt python zlib \
-	$(if $(BR2_PACKAGE_LIBCAP),libcap)
+	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
+	$(if $(BR2_PACKAGE_READLINE),readline)
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 	SAMBA4_CONF_OPT += --with-acl-support
-- 
1.8.3.2
