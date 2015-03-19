From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 20:48:05 -0700
Subject: [Buildroot] [PATCH] package: add shadow 4.2.1
In-Reply-To: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
References: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
Message-ID: <1426736888-29437-3-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/Config.in                                 |   1 +
 package/shadow/Config.in                          |  10 +
 package/shadow/chgpasswd.pam                      |   4 +
 package/shadow/chpasswd.pam                       |   6 +
 package/shadow/newusers.pam                       |   6 +
 package/shadow/passwd.pam                         |   4 +
 package/shadow/remove-util-linux-conflicts.patch  | 642 ++++++++++++++++++++++
 package/shadow/shadow-4.2.1-subordinate-ids.patch |  34 ++
 package/shadow/shadow-strncpy-usage.patch         |  25 +
 package/shadow/shadow.hash                        |   1 +
 package/shadow/shadow.mk                          |  43 ++
 package/shadow/xstrdup.patch                      |   9 +
 12 files changed, 785 insertions(+)
 create mode 100644 package/shadow/Config.in
 create mode 100644 package/shadow/chgpasswd.pam
 create mode 100644 package/shadow/chpasswd.pam
 create mode 100644 package/shadow/newusers.pam
 create mode 100644 package/shadow/passwd.pam
 create mode 100644 package/shadow/remove-util-linux-conflicts.patch
 create mode 100644 package/shadow/shadow-4.2.1-subordinate-ids.patch
 create mode 100644 package/shadow/shadow-strncpy-usage.patch
 create mode 100644 package/shadow/shadow.hash
 create mode 100644 package/shadow/shadow.mk
 create mode 100644 package/shadow/xstrdup.patch

diff --git a/package/Config.in b/package/Config.in
index c938326..c557010 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1341,6 +1341,7 @@ endif
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/rsyslog/Config.in"
 endif
+	source "package/shadow/Config.in"
 	source "package/smack/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/start-stop-daemon/Config.in"
diff --git a/package/shadow/Config.in b/package/shadow/Config.in
new file mode 100644
index 0000000..0c3d6e1
--- /dev/null
+++ b/package/shadow/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SHADOW
+	bool "shadow"
+	select BR2_PACKAGE_ACL
+	select BR2_PACKAGE_LINUX_PAM
+	select BR2_PACKAGE_UTIL_LINUX
+	help
+	  Password and account management tool suite with support for shadow files
+	  and PAM
+
+	  http://pkg-shadow.alioth.debian.org/
diff --git a/package/shadow/chgpasswd.pam b/package/shadow/chgpasswd.pam
new file mode 100644
index 0000000..8f49f5c
--- /dev/null
+++ b/package/shadow/chgpasswd.pam
@@ -0,0 +1,4 @@
+#%PAM-1.0
+auth		sufficient	pam_rootok.so
+account		required	pam_permit.so
+password	include		system-auth
diff --git a/package/shadow/chpasswd.pam b/package/shadow/chpasswd.pam
new file mode 100644
index 0000000..5d44798
--- /dev/null
+++ b/package/shadow/chpasswd.pam
@@ -0,0 +1,6 @@
+#%PAM-1.0
+auth		sufficient	pam_rootok.so
+auth		required	pam_unix.so
+account		required	pam_unix.so
+session		required	pam_unix.so
+password 	required 	pam_unix.so sha512 shadow
diff --git a/package/shadow/newusers.pam b/package/shadow/newusers.pam
new file mode 100644
index 0000000..5d44798
--- /dev/null
+++ b/package/shadow/newusers.pam
@@ -0,0 +1,6 @@
+#%PAM-1.0
+auth		sufficient	pam_rootok.so
+auth		required	pam_unix.so
+account		required	pam_unix.so
+session		required	pam_unix.so
+password 	required 	pam_unix.so sha512 shadow
diff --git a/package/shadow/passwd.pam b/package/shadow/passwd.pam
new file mode 100644
index 0000000..ab56da4
--- /dev/null
+++ b/package/shadow/passwd.pam
@@ -0,0 +1,4 @@
+#%PAM-1.0
+#password	required	pam_cracklib.so difok=2 minlen=8 dcredit=2 ocredit=2 retry=3
+#password	required	pam_unix.so sha512 shadow use_authtok
+password	required	pam_unix.so sha512 shadow nullok
diff --git a/package/shadow/remove-util-linux-conflicts.patch b/package/shadow/remove-util-linux-conflicts.patch
new file mode 100644
index 0000000..fce9639
--- /dev/null
+++ b/package/shadow/remove-util-linux-conflicts.patch
@@ -0,0 +1,642 @@
+diff --git a/etc/pam.d/Makefile.am b/etc/pam.d/Makefile.am
+index d967eb9..ab01cbd 100644
+--- a/etc/pam.d/Makefile.am
++++ b/etc/pam.d/Makefile.am
+@@ -2,12 +2,8 @@
+ # and also cooperate to make a distribution for `make dist'
+
+ pamd_files = \
+-	chfn \
+-	chsh \
+	groupmems \
+-	login \
+-	passwd \
+-	su
++	passwd
+
+ pamd_acct_tools_files = \
+	chage \
+diff --git a/man/Makefile.am b/man/Makefile.am
+index 307eab5..503e45f 100644
+--- a/man/Makefile.am
++++ b/man/Makefile.am
+@@ -8,10 +8,8 @@ endif
+
+ man_MANS = \
+	man1/chage.1 \
+-	man1/chfn.1 \
+	man8/chgpasswd.8 \
+	man8/chpasswd.8 \
+-	man1/chsh.1 \
+	man1/expiry.1 \
+	man5/faillog.5 \
+	man8/faillog.8 \
+@@ -27,12 +25,8 @@ man_MANS = \
+	man8/grpunconv.8 \
+	man5/gshadow.5 \
+	man8/lastlog.8 \
+-	man1/login.1 \
+	man5/login.defs.5 \
+-	man8/logoutd.8 \
+-	man1/newgrp.1 \
+	man8/newusers.8 \
+-	man8/nologin.8 \
+	man1/passwd.1 \
+	man5/passwd.5 \
+	man8/pwck.8 \
+@@ -41,13 +35,10 @@ man_MANS = \
+	man1/sg.1 \
+	man3/shadow.3 \
+	man5/shadow.5 \
+-	man1/su.1 \
+	man5/suauth.5 \
+	man8/useradd.8 \
+	man8/userdel.8 \
+-	man8/usermod.8 \
+-	man8/vigr.8 \
+-	man8/vipw.8
++	man8/usermod.8
+
+ man_nopam = \
+	man5/limits.5 \
+@@ -70,10 +61,8 @@ endif
+
+ man_XMANS = \
+	chage.1.xml \
+-	chfn.1.xml \
+	chgpasswd.8.xml \
+	chpasswd.8.xml \
+-	chsh.1.xml \
+	expiry.1.xml \
+	faillog.5.xml \
+	faillog.8.xml \
+@@ -87,15 +76,11 @@ man_XMANS = \
+	gshadow.5.xml \
+	lastlog.8.xml \
+	limits.5.xml \
+-	login.1.xml \
+	login.access.5.xml \
+	login.defs.5.xml \
+-	logoutd.8.xml \
+	newgidmap.1.xml \
+-	newgrp.1.xml \
+	newuidmap.1.xml \
+	newusers.8.xml \
+-	nologin.8.xml \
+	passwd.1.xml \
+	passwd.5.xml \
+	porttime.5.xml \
+@@ -104,14 +89,12 @@ man_XMANS = \
+	shadow.3.xml \
+	shadow.5.xml \
+	sg.1.xml \
+-	su.1.xml \
+	suauth.5.xml \
+	subgid.5.xml \
+	subuid.5.xml \
+	useradd.8.xml \
+	userdel.8.xml \
+-	usermod.8.xml \
+-	vipw.8.xml
++	usermod.8.xml
+
+ login_defs_v = \
+	CHFN_AUTH.xml \
+diff --git a/man/cs/Makefile.am b/man/cs/Makefile.am
+index 3b2be0c..50290f4 100644
+--- a/man/cs/Makefile.am
++++ b/man/cs/Makefile.am
+@@ -13,14 +13,10 @@ man_MANS = \
+	man8/grpck.8 \
+	man5/gshadow.5 \
+	man8/lastlog.8 \
+-	man8/nologin.8 \
+	man5/passwd.5 \
+-	man5/shadow.5 \
+-	man1/su.1 \
+-	man8/vipw.8
++	man5/shadow.5
+
+ EXTRA_DIST = $(man_MANS) \
+	man1/id.1 \
+-	man8/groupmems.8 \
+-	man8/logoutd.8
++	man8/groupmems.8
+
+diff --git a/man/da/Makefile.am b/man/da/Makefile.am
+index a3b0922..e45bef6 100644
+--- a/man/da/Makefile.am
++++ b/man/da/Makefile.am
+@@ -3,16 +3,10 @@ mandir = @mandir@/da
+
+ # 2012.01.28 - activate manpages with more than 50% translated messages
+ man_MANS = \
+-	man1/chfn.1 \
+	man8/groupdel.8 \
+	man1/groups.1 \
+	man5/gshadow.5 \
+-	man8/logoutd.8 \
+-	man1/newgrp.1 \
+-	man8/nologin.8 \
+-	man1/sg.1 \
+-	man8/vigr.8 \
+-	man8/vipw.8
++	man1/sg.1
+
+ man_nopam =
+
+diff --git a/man/de/Makefile.am b/man/de/Makefile.am
+index 3cd302e..dee3e2a 100644
+--- a/man/de/Makefile.am
++++ b/man/de/Makefile.am
+@@ -3,10 +3,8 @@ mandir = @mandir@/de
+
+ man_MANS = \
+	man1/chage.1 \
+-	man1/chfn.1 \
+	man8/chgpasswd.8 \
+	man8/chpasswd.8 \
+-	man1/chsh.1 \
+	man1/expiry.1 \
+	man5/faillog.5 \
+	man8/faillog.8 \
+@@ -22,12 +20,8 @@ man_MANS = \
+	man8/grpunconv.8 \
+	man5/gshadow.5 \
+	man8/lastlog.8 \
+-	man1/login.1 \
+	man5/login.defs.5 \
+-	man8/logoutd.8 \
+-	man1/newgrp.1 \
+	man8/newusers.8 \
+-	man8/nologin.8 \
+	man1/passwd.1 \
+	man5/passwd.5 \
+	man8/pwck.8 \
+@@ -36,13 +30,10 @@ man_MANS = \
+	man1/sg.1 \
+	man3/shadow.3 \
+	man5/shadow.5 \
+-	man1/su.1 \
+	man5/suauth.5 \
+	man8/useradd.8 \
+	man8/userdel.8 \
+-	man8/usermod.8 \
+-	man8/vigr.8 \
+-	man8/vipw.8
++	man8/usermod.8
+
+ man_nopam = \
+	man5/limits.5 \
+diff --git a/man/es/Makefile.am b/man/es/Makefile.am
+index 721dc0d..981b5b1 100644
+--- a/man/es/Makefile.am
++++ b/man/es/Makefile.am
+@@ -6,12 +6,7 @@ man_MANS =
+ # These Spanish manpages are outdated.
+ # Please contact pkg-shadow-devel at lists.alioth.debian.org if you wish to
+ # provide updates.
+-#	man1/login.1 \
+-#	man1/newgrp.1 \
+ #	man1/passwd.1 \
+-#	man5/passwd.5 \
+-#	man1/su.1 \
+-#	man8/vigr.8 \
+-#	man8/vipw.8
++#	man5/passwd.5
+
+ EXTRA_DIST = $(man_MANS)
+diff --git a/man/fi/Makefile.am b/man/fi/Makefile.am
+index 26a1a84..f02b92f 100644
+--- a/man/fi/Makefile.am
++++ b/man/fi/Makefile.am
+@@ -1,10 +1,7 @@
+
+ mandir = @mandir@/fi
+
+-man_MANS = \
+-	man1/chfn.1 \
+-	man1/chsh.1 \
+-	man1/su.1
++man_MANS =
+
+ # Outdated manpages
+ #	passwd.1 (https://bugs.launchpad.net/ubuntu/+bug/384024)
+diff --git a/man/fr/Makefile.am b/man/fr/Makefile.am
+index 230d212..1955e94 100644
+--- a/man/fr/Makefile.am
++++ b/man/fr/Makefile.am
+@@ -3,10 +3,8 @@ mandir = @mandir@/fr
+
+ man_MANS = \
+	man1/chage.1 \
+-	man1/chfn.1 \
+	man8/chgpasswd.8 \
+	man8/chpasswd.8 \
+-	man1/chsh.1 \
+	man1/expiry.1 \
+	man5/faillog.5 \
+	man8/faillog.8 \
+@@ -22,12 +20,8 @@ man_MANS = \
+	man8/grpunconv.8 \
+	man5/gshadow.5 \
+	man8/lastlog.8 \
+-	man1/login.1 \
+	man5/login.defs.5 \
+-	man8/logoutd.8 \
+-	man1/newgrp.1 \
+	man8/newusers.8 \
+-	man8/nologin.8 \
+	man1/passwd.1 \
+	man5/passwd.5 \
+	man8/pwck.8 \
+@@ -36,13 +30,10 @@ man_MANS = \
+	man1/sg.1 \
+	man3/shadow.3 \
+	man5/shadow.5 \
+-	man1/su.1 \
+	man5/suauth.5 \
+	man8/useradd.8 \
+	man8/userdel.8 \
+-	man8/usermod.8 \
+-	man8/vigr.8 \
+-	man8/vipw.8
++	man8/usermod.8
+
+ man_nopam = \
+	man5/limits.5 \
+diff --git a/man/hu/Makefile.am b/man/hu/Makefile.am
+index e659aef..ae80da4 100644
+--- a/man/hu/Makefile.am
++++ b/man/hu/Makefile.am
+@@ -2,16 +2,12 @@
+ mandir = @mandir@/hu
+
+ man_MANS = \
+-	man1/chsh.1 \
+	man1/gpasswd.1 \
+	man1/groups.1 \
+	man8/lastlog.8 \
+-	man1/login.1 \
+-	man1/newgrp.1 \
+	man1/passwd.1 \
+	man5/passwd.5 \
+-	man1/sg.1 \
+-	man1/su.1
++	man1/sg.1
+
+ EXTRA_DIST = $(man_MANS)
+
+diff --git a/man/id/Makefile.am b/man/id/Makefile.am
+index 21f3dbe..6d10b93 100644
+--- a/man/id/Makefile.am
++++ b/man/id/Makefile.am
+@@ -2,8 +2,6 @@
+ mandir = @mandir@/id
+
+ man_MANS = \
+-	man1/chsh.1 \
+-	man1/login.1 \
+	man8/useradd.8
+
+ EXTRA_DIST = $(man_MANS)
+diff --git a/man/it/Makefile.am b/man/it/Makefile.am
+index 94460aa..ecf5bd1 100644
+--- a/man/it/Makefile.am
++++ b/man/it/Makefile.am
+@@ -3,10 +3,8 @@ mandir = @mandir@/it
+
+ man_MANS = \
+	man1/chage.1 \
+-	man1/chfn.1 \
+	man8/chgpasswd.8 \
+	man8/chpasswd.8 \
+-	man1/chsh.1 \
+	man1/expiry.1 \
+	man5/faillog.5 \
+	man8/faillog.8 \
+@@ -22,12 +20,8 @@ man_MANS = \
+	man8/grpunconv.8 \
+	man5/gshadow.5 \
+	man8/lastlog.8 \
+-	man1/login.1 \
+	man5/login.defs.5 \
+-	man8/logoutd.8 \
+-	man1/newgrp.1 \
+	man8/newusers.8 \
+-	man8/nologin.8 \
+	man1/passwd.1 \
+	man5/passwd.5 \
+	man8/pwck.8 \
+@@ -36,13 +30,10 @@ man_MANS = \
+	man1/sg.1 \
+	man3/shadow.3 \
+	man5/shadow.5 \
+-	man1/su.1 \
+	man5/suauth.5 \
+	man8/useradd.8 \
+	man8/userdel.8 \
+-	man8/usermod.8 \
+-	man8/vigr.8 \
+-	man8/vipw.8
++	man8/usermod.8
+
+ man_nopam = \
+	man5/limits.5 \
+diff --git a/man/ja/Makefile.am b/man/ja/Makefile.am
+index ffb75a9..b88c490 100644
+--- a/man/ja/Makefile.am
++++ b/man/ja/Makefile.am
+@@ -3,9 +3,7 @@ mandir = @mandir@/ja
+
+ man_MANS = \
+	man1/chage.1 \
+-	man1/chfn.1 \
+	man8/chpasswd.8 \
+-	man1/chsh.1 \
+	man1/expiry.1 \
+	man5/faillog.5 \
+	man8/faillog.8 \
+@@ -18,10 +16,7 @@ man_MANS = \
+	man8/grpconv.8 \
+	man8/grpunconv.8 \
+	man8/lastlog.8 \
+-	man1/login.1 \
+	man5/login.defs.5 \
+-	man8/logoutd.8 \
+-	man1/newgrp.1 \
+	man8/newusers.8 \
+	man1/passwd.1 \
+	man5/passwd.5 \
+@@ -30,13 +25,10 @@ man_MANS = \
+	man8/pwunconv.8 \
+	man1/sg.1 \
+	man5/shadow.5 \
+-	man1/su.1 \
+	man5/suauth.5 \
+	man8/useradd.8 \
+	man8/userdel.8 \
+-	man8/usermod.8 \
+-	man8/vigr.8 \
+-	man8/vipw.8
++	man8/usermod.8
+
+ man_nopam = \
+	man5/limits.5 \
+diff --git a/man/ko/Makefile.am b/man/ko/Makefile.am
+index c269f0b..fb4086c 100644
+--- a/man/ko/Makefile.am
++++ b/man/ko/Makefile.am
+@@ -2,15 +2,7 @@
+ mandir = @mandir@/ko
+
+ man_MANS = \
+-	man1/chfn.1 \
+-	man1/chsh.1 \
+	man1/groups.1 \
+-	man1/login.1 \
+-	man5/passwd.5 \
+-	man1/su.1 \
+-	man8/vigr.8 \
+-	man8/vipw.8
+-# newgrp.1 must be updated
+-#	newgrp.1
++	man5/passwd.5
+
+ EXTRA_DIST = $(man_MANS)
+diff --git a/man/pl/Makefile.am b/man/pl/Makefile.am
+index 724d25f..fa6675b 100644
+--- a/man/pl/Makefile.am
++++ b/man/pl/Makefile.am
+@@ -4,7 +4,6 @@ mandir = @mandir@/pl
+ # 2012.01.28 - activate manpages with more than 50% translated messages
+ man_MANS = \
+	man1/chage.1 \
+-	man1/chsh.1 \
+	man1/expiry.1 \
+	man5/faillog.5 \
+	man8/faillog.8 \
+@@ -16,14 +15,10 @@ man_MANS = \
+	man1/groups.1 \
+	man8/grpck.8 \
+	man8/lastlog.8 \
+-	man8/logoutd.8 \
+-	man1/newgrp.1 \
+	man1/sg.1 \
+	man3/shadow.3 \
+	man8/userdel.8 \
+-	man8/usermod.8 \
+-	man8/vigr.8 \
+-	man8/vipw.8
++	man8/usermod.8
+
+ man_nopam = \
+	man5/porttime.5
+diff --git a/man/ru/Makefile.am b/man/ru/Makefile.am
+index 8a776a8..29e1b84 100644
+--- a/man/ru/Makefile.am
++++ b/man/ru/Makefile.am
+@@ -3,10 +3,8 @@ mandir = @mandir@/ru
+
+ man_MANS = \
+	man1/chage.1 \
+-	man1/chfn.1 \
+	man8/chgpasswd.8 \
+	man8/chpasswd.8 \
+-	man1/chsh.1 \
+	man1/expiry.1 \
+	man5/faillog.5 \
+	man8/faillog.8 \
+@@ -22,12 +20,8 @@ man_MANS = \
+	man8/grpunconv.8 \
+	man5/gshadow.5 \
+	man8/lastlog.8 \
+-	man1/login.1 \
+	man5/login.defs.5 \
+-	man8/logoutd.8 \
+-	man1/newgrp.1 \
+	man8/newusers.8 \
+-	man8/nologin.8 \
+	man1/passwd.1 \
+	man5/passwd.5 \
+	man8/pwck.8 \
+@@ -36,13 +30,10 @@ man_MANS = \
+	man1/sg.1 \
+	man3/shadow.3 \
+	man5/shadow.5 \
+-	man1/su.1 \
+	man5/suauth.5 \
+	man8/useradd.8 \
+	man8/userdel.8 \
+-	man8/usermod.8 \
+-	man8/vigr.8 \
+-	man8/vipw.8
++	man8/usermod.8
+
+ man_nopam = \
+	man5/limits.5 \
+diff --git a/man/sv/Makefile.am b/man/sv/Makefile.am
+index e64b7bc..fbb2a71 100644
+--- a/man/sv/Makefile.am
++++ b/man/sv/Makefile.am
+@@ -3,7 +3,6 @@ mandir = @mandir@/sv
+ # 2012.01.28 - activate manpages with more than 50% translated messages
+ man_MANS = \
+	man1/chage.1 \
+-	man1/chsh.1 \
+	man1/expiry.1 \
+	man5/faillog.5 \
+	man8/faillog.8 \
+@@ -16,18 +15,13 @@ man_MANS = \
+	man8/grpck.8 \
+	man5/gshadow.5 \
+	man8/lastlog.8 \
+-	man8/logoutd.8 \
+-	man1/newgrp.1 \
+-	man8/nologin.8 \
+	man1/passwd.1 \
+	man5/passwd.5 \
+	man8/pwck.8 \
+	man1/sg.1 \
+	man3/shadow.3 \
+	man5/suauth.5 \
+-	man8/userdel.8 \
+-	man8/vigr.8 \
+-	man8/vipw.8
++	man8/userdel.8
+
+ man_nopam = \
+	man5/limits.5 \
+diff --git a/man/tr/Makefile.am b/man/tr/Makefile.am
+index 8d8b916..4fe3632 100644
+--- a/man/tr/Makefile.am
++++ b/man/tr/Makefile.am
+@@ -2,15 +2,12 @@ mandir = @mandir@/tr
+
+ man_MANS = \
+	man1/chage.1 \
+-	man1/chfn.1 \
+	man8/groupadd.8 \
+	man8/groupdel.8 \
+	man8/groupmod.8 \
+-	man1/login.1 \
+	man1/passwd.1 \
+	man5/passwd.5 \
+	man5/shadow.5 \
+-	man1/su.1 \
+	man8/useradd.8 \
+	man8/userdel.8 \
+	man8/usermod.8
+diff --git a/man/zh_CN/Makefile.am b/man/zh_CN/Makefile.am
+index e9d8f2c..c2e6cdf 100644
+--- a/man/zh_CN/Makefile.am
++++ b/man/zh_CN/Makefile.am
+@@ -3,10 +3,8 @@ mandir = @mandir@/zh_CN
+
+ man_MANS = \
+	man1/chage.1 \
+-	man1/chfn.1 \
+	man8/chgpasswd.8 \
+	man8/chpasswd.8 \
+-	man1/chsh.1 \
+	man1/expiry.1 \
+	man5/faillog.5 \
+	man8/faillog.8 \
+@@ -22,12 +20,8 @@ man_MANS = \
+	man8/grpunconv.8 \
+	man5/gshadow.5 \
+	man8/lastlog.8 \
+-	man1/login.1 \
+	man5/login.defs.5 \
+-	man8/logoutd.8 \
+-	man1/newgrp.1 \
+	man8/newusers.8 \
+-	man8/nologin.8 \
+	man1/passwd.1 \
+	man5/passwd.5 \
+	man8/pwck.8 \
+@@ -36,13 +30,10 @@ man_MANS = \
+	man1/sg.1 \
+	man3/shadow.3 \
+	man5/shadow.5 \
+-	man1/su.1 \
+	man5/suauth.5 \
+	man8/useradd.8 \
+	man8/userdel.8 \
+-	man8/usermod.8 \
+-	man8/vigr.8 \
+-	man8/vipw.8
++	man8/usermod.8
+
+ man_nopam = \
+	man5/limits.5 \
+diff --git a/man/zh_TW/Makefile.am b/man/zh_TW/Makefile.am
+index c36ed2c..26696b6 100644
+--- a/man/zh_TW/Makefile.am
++++ b/man/zh_TW/Makefile.am
+@@ -2,15 +2,11 @@
+ mandir = @mandir@/zh_TW
+
+ man_MANS = \
+-	man1/chfn.1 \
+-	man1/chsh.1 \
+	man8/chpasswd.8 \
+-	man1/newgrp.1 \
+	man8/groupadd.8 \
+	man8/groupdel.8 \
+	man8/groupmod.8 \
+	man5/passwd.5 \
+-	man1/su.1 \
+	man8/useradd.8 \
+	man8/userdel.8 \
+	man8/usermod.8
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 25e288d..bbbc92d 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -22,9 +22,9 @@ INCLUDES = \
+ # and installation would be much simpler (just two directories,
+ # $prefix/bin and $prefix/sbin, no install-data hacks...)
+
+-bin_PROGRAMS   = groups login su
+-sbin_PROGRAMS  = nologin
+-ubin_PROGRAMS  = faillog lastlog chage chfn chsh expiry gpasswd newgrp passwd
++bin_PROGRAMS   = groups
++sbin_PROGRAMS  =
++ubin_PROGRAMS  = faillog lastlog chage expiry gpasswd newgrp passwd
+ if ENABLE_SUBIDS
+ ubin_PROGRAMS += newgidmap newuidmap
+ endif
+@@ -38,21 +38,19 @@ usbin_PROGRAMS = \
+	grpck \
+	grpconv \
+	grpunconv \
+-	logoutd \
+	newusers \
+	pwck \
+	pwconv \
+	pwunconv \
+	useradd \
+	userdel \
+-	usermod \
+-	vipw
++	usermod
+
+ # id and groups are from gnu, sulogin from sysvinit
+ noinst_PROGRAMS = id sulogin
+
+-suidbins       = su
+-suidubins      = chage chfn chsh expiry gpasswd newgrp passwd newuidmap newgidmap
++suidbins       =
++suidubins      = chage expiry gpasswd newgrp passwd newuidmap newgidmap
+ if ACCT_TOOLS_SETUID
+	suidubins += chage chgpasswd chpasswd groupadd groupdel groupmod newusers useradd userdel usermod
+ endif
+@@ -119,7 +117,6 @@ vipw_LDADD     = $(LDADD) $(LIBSELINUX)
+ install-am: all-am
+	$(MAKE) $(AM_MAKEFLAGS) install-exec-am install-data-am
+	ln -sf newgrp	$(DESTDIR)$(ubindir)/sg
+-	ln -sf vipw	$(DESTDIR)$(usbindir)/vigr
+	for i in $(suidbins); do \
+		chmod -f $(suidperms) $(DESTDIR)$(bindir)/$$i; \
+	done
diff --git a/package/shadow/shadow-4.2.1-subordinate-ids.patch b/package/shadow/shadow-4.2.1-subordinate-ids.patch
new file mode 100644
index 0000000..4ed6bb5
--- /dev/null
+++ b/package/shadow/shadow-4.2.1-subordinate-ids.patch
@@ -0,0 +1,34 @@
+diff --git a/configure.in b/configure.in
+index a55f125..26bee47 100644
+--- a/configure.in
++++ b/configure.in
+@@ -331,28 +331,8 @@ if test "$enable_man" = "yes"; then
+ fi
+ AM_CONDITIONAL(ENABLE_REGENERATE_MAN, test "x$enable_man" != "xno")
+
+-if test "$enable_subids" != "no"; then
+-	dnl
+-	dnl FIXME: check if 32 bit UIDs/GIDs are supported by libc
+-	dnl
+-	AC_RUN_IFELSE([AC_LANG_SOURCE([
+-#include <sys/types.h>
+-int main(void) {
+-	uid_t u;
+-	gid_t g;
+-	return (sizeof u < 4) || (sizeof g < 4);
+-}
+-	])], [id32bit="yes"], [id32bit="no"])
+-
+-	if test "x$id32bit" = "xyes"; then
+-		AC_DEFINE(ENABLE_SUBIDS, 1, [Define to support the subordinate IDs.])
+-		enable_subids="yes"
+-	else
+-		if test "x$enable_subids" = "xyes"; then
+-			AC_MSG_ERROR([Cannot enable support the subordinate IDs on systems where gid_t or uid_t has less than 32 bits])
+-		fi
+-		enable_subids="no"
+-	fi
++if test "x$enable_subids" != "xno"; then
++	AC_DEFINE(ENABLE_SUBIDS, 1, [Define to support the subordinate IDs.])
+ fi
+ AM_CONDITIONAL(ENABLE_SUBIDS, test "x$enable_subids" != "xno")
diff --git a/package/shadow/shadow-strncpy-usage.patch b/package/shadow/shadow-strncpy-usage.patch
new file mode 100644
index 0000000..dedb078
--- /dev/null
+++ b/package/shadow/shadow-strncpy-usage.patch
@@ -0,0 +1,25 @@
+diff -u shadow-4.1.5/src/usermod.c.orig shadow-4.1.5/src/usermod.c
+--- shadow-4.1.5/src/usermod.c.orig	2012-02-13 08:19:43.792146449 -0500
++++ shadow-4.1.5/src/usermod.c	2012-02-13 08:21:19.375114500 -0500
+@@ -182,7 +182,7 @@
+	struct tm *tp;
+
+	if (date < 0) {
+-		strncpy (buf, "never", maxsize);
++		strncpy (buf, "never", maxsize - 1);
+	} else {
+		time_t t = (time_t) date;
+		tp = gmtime (&t);
+diff -u shadow-4.1.5/src/login.c.orig shadow-4.1.5/src/login.c
+--- shadow-4.1.5/src/login.c.orig	2012-02-13 08:19:50.951994454 -0500
++++ shadow-4.1.5/src/login.c	2012-02-13 08:21:04.490430937 -0500
+@@ -752,7 +752,8 @@
+			          _("%s login: "), hostn);
+		} else {
+			strncpy (loginprompt, _("login: "),
+-			         sizeof (loginprompt));
++			         sizeof (loginprompt) - 1);
++			loginprompt[sizeof (loginprompt) - 1] = '\0';
+		}
+
+		retcode = pam_set_item (pamh, PAM_USER_PROMPT, loginprompt);
diff --git a/package/shadow/shadow.hash b/package/shadow/shadow.hash
new file mode 100644
index 0000000..bab8583
--- /dev/null
+++ b/package/shadow/shadow.hash
@@ -0,0 +1 @@
+sha1	0917cbadd4ce0c7c36670e5ecd37bbed92e6d82d	shadow-4.2.1.tar.xz
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
new file mode 100644
index 0000000..e2fd209
--- /dev/null
+++ b/package/shadow/shadow.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# shadow
+#
+################################################################################
+
+SHADOW_VERSION = 4.2.1
+SHADOW_SITE = http://pkg-shadow.alioth.debian.org/releases/
+SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
+SHADOW_LICENSE = BSD-3c
+SHADOW_LICENSE_FILES = LICENCE
+SHADOW_AUTORECONF = YES
+SHADOW_CONF_OPTS = \
+	--sysconfdir=/etc \
+	--enable-subordinate-ids=yes \
+	--with-libpam \
+	--with-group-name-max-length=32 \
+	--without-selinux
+SHADOW_DEPENDENCIES = acl linux-pam util-linux
+
+define SHADOW_INSTALL_PAMFILES
+	$(INSTALL) -m 0644 package/shadow/chgpasswd.pam \
+		$(TARGET_DIR)/etc/pam.d/chgpasswd
+	$(INSTALL) -m 0644 package/shadow/chpasswd.pam \
+		$(TARGET_DIR)/etc/pam.d/chpasswd
+	$(INSTALL) -m 0644 package/shadow/newusers.pam \
+		$(TARGET_DIR)/etc/pam.d/newusers
+	$(INSTALL) -m 0644 package/shadow/passwd.pam \
+		$(TARGET_DIR)/etc/pam.d/passwd
+endef
+SHADOW_POST_INSTALL_TARGET_HOOKS += SHADOW_INSTALL_PAMFILES
+
+define SHADOW_PERMISSIONS
+	/usr/bin/chage f 4755 0 0 - - - - -
+	/usr/bin/expiry f 4755 0 0 - - - - -
+	/usr/bin/gpasswd f 4755 0 0 - - - - -
+	/usr/bin/newgidmap f 4755 0 0 - - - - -
+	/usr/bin/newuidmap f 4755 0 0 - - - - -
+	/usr/bin/passwd f 4755 0 0 - - - - -
+	/usr/bin/newgrp f 4755 0 0 - - - - -
+endef
+
+$(eval $(autotools-package))
diff --git a/package/shadow/xstrdup.patch b/package/shadow/xstrdup.patch
new file mode 100644
index 0000000..855e81c
--- /dev/null
+++ b/package/shadow/xstrdup.patch
@@ -0,0 +1,9 @@
+--- shadow-4.1.2.1/libmisc/xmalloc.c	2008-08-30 21:55:44.000000000 -0500
++++ shadow-4.1.2.1/libmisc/xmalloc.c.new	2008-08-30 21:55:36.000000000 -0500
+@@ -61,5 +61,6 @@
+
+ char *xstrdup (const char *str)
+ {
++	if(str == NULL) return NULL;
+	return strcpy (xmalloc (strlen (str) + 1), str);
+ }
-- 
2.3.3
