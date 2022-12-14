Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26064C4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 19:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93DBA408CE;
	Wed, 14 Dec 2022 19:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93DBA408CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wz2UNXKW1IZK; Wed, 14 Dec 2022 19:47:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38C90410BC;
	Wed, 14 Dec 2022 19:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38C90410BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D67E91BF42C
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B22DA81F25
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B22DA81F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AmtuW9x1hZVe for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 19:47:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 648BC81F1C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 648BC81F1C
 for <buildroot@busybox.net>; Wed, 14 Dec 2022 19:47:41 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id v7so12223665wmn.0
 for <buildroot@busybox.net>; Wed, 14 Dec 2022 11:47:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=178M719F81AzBxxwYWCd7R0BG22AqQ2CAk2RncG/ynY=;
 b=UdaBEa8+PXRyGuYrJBTvuEDbfSBcc5DUMRWPffB8OpmMp3lLwvQH9tsHcXNnDeCdoN
 JXtkPy7QR3dVnUK8cc+lGnNF2U7siQ3k2MFjgiFLa1qUymPakue+Ho7xYO5qBzlUQjRE
 IQRAA6Kfc0jB1m3eutNH9JgDgiKfwps1qQpozzSBS0TNSGhGUrrCh3fEvAv2KcEYlSPd
 CQQuPDtzIN8vMNM0i4jviz65Txx3BmLUG2OxxYZDotcMnGwASBcJWePaDOzkOf9KWOsm
 GMFOvkdHWe7u4+VfjSeo/mcFY96WXKQLH/Vc5XnFwOj73KFVM9zw7iSbRHXh40AaF5iu
 +2YQ==
X-Gm-Message-State: ANoB5pnNbyJI4abegUH87H9/ien0Ev3vOPTQEmg7yoPC2SCffysX48a4
 GkAr/c555wKj2L9x9XCm6xwQXEOmdhw=
X-Google-Smtp-Source: AA0mqf59Byr18G0fHiuq8cpc24VAX+lEH8GMsMfh9YS2GmPka/8Cbgm0I85zoPO2NdtJ3wCOyBXKwQ==
X-Received: by 2002:a05:600c:3508:b0:3c6:e63e:23e9 with SMTP id
 h8-20020a05600c350800b003c6e63e23e9mr20016451wmq.24.1671047259591; 
 Wed, 14 Dec 2022 11:47:39 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 az34-20020a05600c602200b003d220ef3232sm4012386wmb.34.2022.12.14.11.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 11:47:39 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 14 Dec 2022 20:47:26 +0100
Message-Id: <20221214194726.3341319-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=178M719F81AzBxxwYWCd7R0BG22AqQ2CAk2RncG/ynY=;
 b=h48X4a9xsKETHedinZA9p1OIfpyAV2+/9n2KEP8ccPChSdZ1sSzaTocepWxEyA/X8K
 ZOVUwdZ66bIAhMLHdF4F95t3+hxY7HsGIvlES6cNnVWQUPjwNwQMG2dVZz2WqQwXTnIO
 FFD0P7bN8z1t3TI/uAoFIDhY0Qha+CTpkaEgTjps2qrkjkJUfOSu5/V6wK8tZLXXBF8i
 EPY2DYOq+jUjTgFHFf4ftn14tEuDPyggUPX3uJtF1ntZA26iIG9fFmDLPcMZ7jz+w07D
 feEbux0O3U9mAUp63/o2o0EJmhaACFmAddakgsVP70KC9GC8rFK5k0qVCCrQnloNpixe
 QKSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=h48X4a9x
Subject: [Buildroot] [PATCH v2] package/sudo: bump to version 1.9.12p1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

remove merged patch

diff LICENSE.md
-    Copyright (C) 1995-2017 Jean-loup Gailly and Mark Adler
+    Copyright (C) 1995-2022 Jean-loup Gailly and Mark Adler
-    Copyright (c) 2008-2018, Dave Benson and the protobuf-c authors.
+    Copyright (c) 2008-2022, Dave Benson and the protobuf-c authors.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/sudo/0001-Fix-CVE-2022-43995.patch | 53 ----------------------
 package/sudo/Config.in                     |  2 +-
 package/sudo/sudo.hash                     |  6 +--
 package/sudo/sudo.mk                       |  7 +--
 4 files changed, 6 insertions(+), 62 deletions(-)
 delete mode 100644 package/sudo/0001-Fix-CVE-2022-43995.patch

diff --git a/package/sudo/0001-Fix-CVE-2022-43995.patch b/package/sudo/0001-Fix-CVE-2022-43995.patch
deleted file mode 100644
index 3f544dcf8..000000000
--- a/package/sudo/0001-Fix-CVE-2022-43995.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From bd209b9f16fcd1270c13db27ae3329c677d48050 Mon Sep 17 00:00:00 2001
-From: "Todd C. Miller" <Todd.Miller@sudo.ws>
-Date: Fri, 28 Oct 2022 07:29:55 -0600
-Subject: [PATCH] Fix CVE-2022-43995, potential heap overflow for passwords < 8
- characters. Starting with sudo 1.8.0 the plaintext password buffer is
- dynamically sized so it is not safe to assume that it is at least 9 bytes in
- size. Found by Hugo Lefeuvre (University of Manchester) with ConfFuzz.
-
-[Retrieved from:
-https://github.com/sudo-project/sudo/commit/bd209b9f16fcd1270c13db27ae3329c677d48050]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- plugins/sudoers/auth/passwd.c | 11 +++++------
- 1 file changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/plugins/sudoers/auth/passwd.c b/plugins/sudoers/auth/passwd.c
-index b2046eca2..0416861e9 100644
---- a/plugins/sudoers/auth/passwd.c
-+++ b/plugins/sudoers/auth/passwd.c
-@@ -63,7 +63,7 @@ sudo_passwd_init(struct passwd *pw, sudo_auth *auth)
- int
- sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_conv_callback *callback)
- {
--    char sav, *epass;
-+    char des_pass[9], *epass;
-     char *pw_epasswd = auth->data;
-     size_t pw_len;
-     int matched = 0;
-@@ -75,12 +75,12 @@ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_c
- 
-     /*
-      * Truncate to 8 chars if standard DES since not all crypt()'s do this.
--     * If this turns out not to be safe we will have to use OS #ifdef's (sigh).
-      */
--    sav = pass[8];
-     pw_len = strlen(pw_epasswd);
--    if (pw_len == DESLEN || HAS_AGEINFO(pw_epasswd, pw_len))
--	pass[8] = '\0';
-+    if (pw_len == DESLEN || HAS_AGEINFO(pw_epasswd, pw_len)) {
-+	strlcpy(des_pass, pass, sizeof(des_pass));
-+	pass = des_pass;
-+    }
- 
-     /*
-      * Normal UN*X password check.
-@@ -88,7 +88,6 @@ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_c
-      * only compare the first DESLEN characters in that case.
-      */
-     epass = (char *) crypt(pass, pw_epasswd);
--    pass[8] = sav;
-     if (epass != NULL) {
- 	if (HAS_AGEINFO(pw_epasswd, pw_len) && strlen(epass) == DESLEN)
- 	    matched = !strncmp(pw_epasswd, epass, DESLEN);
diff --git a/package/sudo/Config.in b/package/sudo/Config.in
index cbef15d67..ee5ea542a 100644
--- a/package/sudo/Config.in
+++ b/package/sudo/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_SUDO
 	  basic philosophy is to give as few privileges as possible
 	  but still allow people to get their work done.
 
-	  http://www.sudo.ws/sudo/
+	  https://www.sudo.ws/sudo/
diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 63c98e2c4..a3476df96 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
-# From: http://www.sudo.ws/download.html
-sha256  a21918eb9fc0063794f6887464fa2d924ab6d192e19063191a429605c22791d2  sudo-1.9.11p2.tar.gz
+# From: https://www.sudo.ws/getting/download/
+sha256  475a18a8eb3da8b2917ceab063a6baf51ea09128c3c47e3e0e33ab7497bab7d8  sudo-1.9.12p1.tar.gz
 # Locally calculated
-sha256  cf3a83366f9aabfd76d693ce03843106fcaaf6c76dfa97610f7c0b719a06e6bb  LICENSE.md
+sha256  d2f93a3b17ed5586fddd07be33ad767146c1a81a22682baa68bb4360a31d020a  LICENSE.md
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 8e237bd36..a16b6863a 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUDO_VERSION_MAJOR = 1.9.11
-SUDO_VERSION_MINOR = p2
+SUDO_VERSION_MAJOR = 1.9.12
+SUDO_VERSION_MINOR = p1
 SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
@@ -25,9 +25,6 @@ SUDO_CONF_OPTS = \
 	--without-interfaces \
 	--with-env-editor
 
-# 0001-Fix-CVE-2022-43995.patch
-SUDO_IGNORE_CVES += CVE-2022-43995
-
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 define SUDO_INSTALL_PAM_CONF
 	$(INSTALL) -D -m 0644 package/sudo/sudo.pam $(TARGET_DIR)/etc/pam.d/sudo
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
