From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Sep 2019 12:13:27 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/dropbear: add
 upstream patch to fix norootlogin (-w) with pam
Message-ID: <20190905101107.BE1388B7E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae81527917e74b9751df4e7bfb7a0b2688362eac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes #12181

The security fix for CVE-2018-15599 broke the norootlogin (-w) handling when
pam support is enabled.  Add an upstream patch to fix it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sue-successfull-login-of-disabled-user-78.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/dropbear/0003-Fix-for-issue-successfull-login-of-disabled-user-78.patch b/package/dropbear/0003-Fix-for-issue-successfull-login-of-disabled-user-78.patch
new file mode 100644
index 0000000000..b3cec4c08d
--- /dev/null
+++ b/package/dropbear/0003-Fix-for-issue-successfull-login-of-disabled-user-78.patch
@@ -0,0 +1,35 @@
+From a0aa2749813331134452f80bb8a808bdc871ba41 Mon Sep 17 00:00:00 2001
+From: vincentto13 <33652988+vincentto13@users.noreply.github.com>
+Date: Wed, 20 Mar 2019 15:03:40 +0100
+Subject: [PATCH] Fix for issue successfull login of disabled user (#78)
+
+This commit introduces fix for scenario:
+1. Root login disabled on dropbear
+2. PAM authentication model enabled
+
+While login as root user, after prompt for password
+user is being notified about login failrue, but
+after second attempt of prompt for password within
+same session, login becames succesfull.
+
+Signed-off-by: Pawel Rapkiewicz <pawel.rapkiewicz@gmail.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ svr-authpam.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/svr-authpam.c b/svr-authpam.c
+index d201bc9..e236db4 100644
+--- a/svr-authpam.c
++++ b/svr-authpam.c
+@@ -275,6 +275,7 @@ void svr_auth_pam(int valid_user) {
+ 		/* PAM auth succeeded but the username isn't allowed in for another reason
+ 		(checkusername() failed) */
+ 		send_msg_userauth_failure(0, 1);
++		goto cleanup;
+ 	}
+ 
+ 	/* successful authentication */
+-- 
+2.11.0
+
