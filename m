Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58315C4332F
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 16:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1ECE82198;
	Fri,  4 Nov 2022 16:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1ECE82198
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xe22sVJLZMGk; Fri,  4 Nov 2022 16:26:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FB4B8217D;
	Fri,  4 Nov 2022 16:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FB4B8217D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B1921BF34D
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 16:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E63604193E
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 16:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E63604193E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5JBQ0-TB802d for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 16:26:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C5F6418CC
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C5F6418CC
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 16:26:45 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h9so7837206wrt.0
 for <buildroot@buildroot.org>; Fri, 04 Nov 2022 09:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GaPm+w7QgGHmMjgVgbE2ajHXo67D9DEYiEftCY3f5H4=;
 b=Zj88kPzUN7vSRsi8nG0VP1r9wD6UYj5Is23iTFVAOmtRWkmp/9D1IDKcQjABTDFqzr
 8sDwIwDah2irugyRU2nTW32vy97wvxR8bZbhd+gdHg3TXZFP2TT6JXgKMM41s4r9GosW
 5fnGfJM8V69QP/nmEMqlPP4NL8n1wsHXYwSbbxNLqoHvBUkLMMnKkUTnncuxzucDz7KM
 e2VcrE1B5BhZnSCBTbcZAp89ur7DT4ComQ8zHVOAzniVyvPSSQH/wm4CV7zoDaMZERcA
 yyHqxERyHZIoWpHP4Yl7/coCIsMW+hNsZIkJOzIcVH2j0x7Rg0+vSoN0flITPp6+FScW
 yJNA==
X-Gm-Message-State: ACrzQf3DSV7KIuLwU78coTgssc6hUu1cnuU8i3yfLAJdksTkIod171yh
 pC4OTL/8C5KsGxaPBAqEnsTp4S4j0pI=
X-Google-Smtp-Source: AMsMyM6z9R5T4zjXEtAuUFo4/J8wYRg0D/zr8+BWm1jQ8+aQFwsKeuRcZ7ddJlkPeJYPrDYSO1LD9Q==
X-Received: by 2002:adf:ee45:0:b0:236:720a:e38b with SMTP id
 w5-20020adfee45000000b00236720ae38bmr23331612wro.273.1667579203119; 
 Fri, 04 Nov 2022 09:26:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bw8-20020a0560001f8800b0022e3538d305sm4803147wrb.117.2022.11.04.09.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 09:26:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  4 Nov 2022 17:26:38 +0100
Message-Id: <20221104162638.649147-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GaPm+w7QgGHmMjgVgbE2ajHXo67D9DEYiEftCY3f5H4=;
 b=GjioHW2ORPhuC2ID6sLTE+dmUAmeWGMhqVpLvWdSykNBMIIcjzMes85tgmYfdXi3dD
 c4IpU+bM09EqTLwZ8pdtzj9wPhHy0S1RVyKlBZakSfDhZb69Y2BHanYUjwKv2UFynS6r
 G+HGBO7Pj1pDM/5y7KeWmRNvpxn82sNsryFsKDTQBSQlRdlKraiL5aYoLO4xl7mzHC1i
 rTE01ea4te52/3Y/lE1OqezyoSObydXLDedzWFTrsJYCd5aeU69VtqZmK7B9xxhQby87
 ttfPt9DMyIIllPHJR6ct7KpXQHedA8VeqzLMpiYIQvqLF5hcIyz8FsxPFlMlsDlPQadd
 Cv2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GjioHW2O
Subject: [Buildroot] [PATCH v2,1/1] package/sudo: fix CVE-2022-43995
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sudo 1.8.0 through 1.9.12, with the crypt() password backend, contains a
plugins/sudoers/auth/passwd.c array-out-of-bounds error that can result
in a heap-based buffer over-read. This can be triggered by arbitrary
local users with access to Sudo by entering a password of seven
characters or fewer. The impact could vary depending on the compiler and
processor architecture.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Add upstream patch

 package/sudo/0001-Fix-CVE-2022-43995.patch | 53 ++++++++++++++++++++++
 package/sudo/sudo.mk                       |  3 ++
 2 files changed, 56 insertions(+)
 create mode 100644 package/sudo/0001-Fix-CVE-2022-43995.patch

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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
