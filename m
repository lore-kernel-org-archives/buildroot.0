Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D75C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 14:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A56A160A97;
	Sat,  5 Nov 2022 14:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A56A160A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K0pjPZXSNet6; Sat,  5 Nov 2022 14:03:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCA2060A8C;
	Sat,  5 Nov 2022 14:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCA2060A8C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 827F01BF2C7
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 14:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DB898201A
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 14:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DB898201A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ISSyATmip9a4 for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 14:03:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 796A682012
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 14:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 796A682012
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 662E987841; Sat,  5 Nov 2022 14:03:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 15:03:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4721367debff67d2a4fddb3a5d72796ebbb401f8
X-Git-Newrev: 26634490364decc24fa32f175c12c8a2d984f1d3
X-Patchwork-Hint: ignore
Message-Id: <20221105140349.662E987841@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sudo: fix CVE-2022-43995
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=26634490364decc24fa32f175c12c8a2d984f1d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sudo 1.8.0 through 1.9.12, with the crypt() password backend, contains a
plugins/sudoers/auth/passwd.c array-out-of-bounds error that can result
in a heap-based buffer over-read. This can be triggered by arbitrary
local users with access to Sudo by entering a password of seven
characters or fewer. The impact could vary depending on the compiler and
processor architecture.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sudo/0001-Fix-CVE-2022-43995.patch | 53 ++++++++++++++++++++++++++++++
 package/sudo/sudo.mk                       |  3 ++
 2 files changed, 56 insertions(+)

diff --git a/package/sudo/0001-Fix-CVE-2022-43995.patch b/package/sudo/0001-Fix-CVE-2022-43995.patch
new file mode 100644
index 0000000000..3f544dcf81
--- /dev/null
+++ b/package/sudo/0001-Fix-CVE-2022-43995.patch
@@ -0,0 +1,53 @@
+From bd209b9f16fcd1270c13db27ae3329c677d48050 Mon Sep 17 00:00:00 2001
+From: "Todd C. Miller" <Todd.Miller@sudo.ws>
+Date: Fri, 28 Oct 2022 07:29:55 -0600
+Subject: [PATCH] Fix CVE-2022-43995, potential heap overflow for passwords < 8
+ characters. Starting with sudo 1.8.0 the plaintext password buffer is
+ dynamically sized so it is not safe to assume that it is at least 9 bytes in
+ size. Found by Hugo Lefeuvre (University of Manchester) with ConfFuzz.
+
+[Retrieved from:
+https://github.com/sudo-project/sudo/commit/bd209b9f16fcd1270c13db27ae3329c677d48050]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ plugins/sudoers/auth/passwd.c | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/plugins/sudoers/auth/passwd.c b/plugins/sudoers/auth/passwd.c
+index b2046eca2..0416861e9 100644
+--- a/plugins/sudoers/auth/passwd.c
++++ b/plugins/sudoers/auth/passwd.c
+@@ -63,7 +63,7 @@ sudo_passwd_init(struct passwd *pw, sudo_auth *auth)
+ int
+ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_conv_callback *callback)
+ {
+-    char sav, *epass;
++    char des_pass[9], *epass;
+     char *pw_epasswd = auth->data;
+     size_t pw_len;
+     int matched = 0;
+@@ -75,12 +75,12 @@ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_c
+ 
+     /*
+      * Truncate to 8 chars if standard DES since not all crypt()'s do this.
+-     * If this turns out not to be safe we will have to use OS #ifdef's (sigh).
+      */
+-    sav = pass[8];
+     pw_len = strlen(pw_epasswd);
+-    if (pw_len == DESLEN || HAS_AGEINFO(pw_epasswd, pw_len))
+-	pass[8] = '\0';
++    if (pw_len == DESLEN || HAS_AGEINFO(pw_epasswd, pw_len)) {
++	strlcpy(des_pass, pass, sizeof(des_pass));
++	pass = des_pass;
++    }
+ 
+     /*
+      * Normal UN*X password check.
+@@ -88,7 +88,6 @@ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_c
+      * only compare the first DESLEN characters in that case.
+      */
+     epass = (char *) crypt(pass, pw_epasswd);
+-    pass[8] = sav;
+     if (epass != NULL) {
+ 	if (HAS_AGEINFO(pw_epasswd, pw_len) && strlen(epass) == DESLEN)
+ 	    matched = !strncmp(pw_epasswd, epass, DESLEN);
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 4f9fdb4b2c..1826f72017 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -23,6 +23,9 @@ SUDO_CONF_OPTS = \
 	--without-interfaces \
 	--with-env-editor
 
+# 0001-Fix-CVE-2022-43995.patch
+SUDO_IGNORE_CVES += CVE-2022-43995
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 define SUDO_INSTALL_PAM_CONF
 	$(INSTALL) -D -m 0644 package/sudo/sudo.pam $(TARGET_DIR)/etc/pam.d/sudo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
