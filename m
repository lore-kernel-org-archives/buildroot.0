Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A36C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 21:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15403415DB;
	Wed, 23 Feb 2022 21:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KUdH9JI7Qha6; Wed, 23 Feb 2022 21:12:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EA6C415CC;
	Wed, 23 Feb 2022 21:12:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6685F1BF36F
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 21:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 466E640273
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 21:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nkBJJw630wx0 for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 21:12:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC557400F5
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 21:12:16 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so92193wmp.5
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 13:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+OozQhy4QPmmmD1wMyrREtCP4VVfR3IW06bglNT2LDE=;
 b=YnBCmkCjbnvvjOSFcRQFsIGbcQ8v9WWKEobpnkh/1fkinNX9aClFFoAkE9EX0b+ACK
 r/somo/Wfus+rOotT0oJ/4ScVPVC6of/P6SUfwRz4mbeOwPfnbr18sE3CFMC/WvjpLGm
 Hl5vNsC4FoSbh/7DyLouGKYC928r7CkHmWsnCxtP90UvDeOBl5jsUZWa58yNihhYMVuU
 fMntrrhw1yEY/kSNY/pSqM+/m2PDv6iJNrBYVjFVb5MiGWAlUNRpfSrxhFY58nY4SMmW
 kwNnYjKkZSsjbVOwq0pYIs+99CG1oT0g1FwfoDT2hnvB6P0Ti4ItXddnonkntw2YaJeN
 HBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+OozQhy4QPmmmD1wMyrREtCP4VVfR3IW06bglNT2LDE=;
 b=J/WqIDRwJHc+jM33CfFeRALgsH4jLlcC6poYxnAgDCLd7e7TXPYHo8Q/9F+xJULwDF
 DzfnQhlOP/u/dXQnrI619PwRdJM60mPwaBjg3J1HFAwDOOk+mBHdrsT7hzwMMIf4nftG
 ElXrvL1OKyCzK6v6ssrPOvJsi6WW9rf/wepiQfcpgdy1ULGrcxB2MhQTRS4xtOUGgnnY
 HRH/faIryty2e8aAYCF9XFmRB4qExOqgiHu8fFOYTba4hyGxzP6aBnytyHCw6KH0aENT
 sLGTI6fiWZRWg+qTr/jyMwuiKgGv+ZB4dkywdeGRLe0e9mVsd4OyRs5byBFZ/wZvZ1uW
 fseA==
X-Gm-Message-State: AOAM530DuLP5kCTW8wDrTULbdY2Vr3RXtTZ2UMblKPdKAwOOC9syUxhO
 hHos6XW3wufvGzZBEpYqJwpXdW5cG5k=
X-Google-Smtp-Source: ABdhPJxP4PpSUsHfL6J7LQuBraB0bsLgE351BuCDwI8Wk1Zrlzd0T6XvJnkUnAWcU6K49jvdC+S3zg==
X-Received: by 2002:a7b:cf2a:0:b0:37b:bf79:669f with SMTP id
 m10-20020a7bcf2a000000b0037bbf79669fmr8920177wmg.84.1645650734908; 
 Wed, 23 Feb 2022 13:12:14 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id d13sm762995wri.38.2022.02.23.13.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 13:12:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 22:12:02 +0100
Message-Id: <20220223211202.3412693-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/kismet: bump to version
 2022-02-R1
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

Linking with -latomic is handled by configure.ac since version
2022-01-R3 and
https://github.com/kismetwireless/kismet/commit/bbdfd21e2b41bf69513ded5ae5ab5a89f22a9912

https://www.kismetwireless.net/release/kismet-2022-02-R1
https://www.kismetwireless.net/release/kismet-2022-01-R3
https://www.kismetwireless.net/release/kismet-2022-01-R2
https://www.kismetwireless.net/release/kismet-2022-01-R1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kismet/kismet.hash | 2 +-
 package/kismet/kismet.mk   | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
index 9a9d2260b9..fc5f854b7e 100644
--- a/package/kismet/kismet.hash
+++ b/package/kismet/kismet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1c8e31b1babdb0fc93ac38fd0772a24d4b40f865fbc292fa8ec7f4a18ced0135  kismet-2021-08-R1.tar.xz
+sha256  aaae4747f14734a73f601af013c0eee26e13680f5e3675dfce09b7de2e68b8a8  kismet-2022-02-R1.tar.xz
 sha256  93c7f0d7e356b0abfb6f494ff3ea37f96abc84e9a5619b25d4e43f7553a55739  LICENSE
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 819ed510d7..3992a392f8 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KISMET_VERSION = 2021-08-R1
+KISMET_VERSION = 2022-02-R1
 KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
 KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = \
@@ -29,10 +29,6 @@ endif
 
 KISMET_CONF_ENV += CXXFLAGS="$(KISMET_CXXFLAGS)"
 
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-KISMET_CONF_ENV += LIBS=-latomic
-endif
-
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 KISMET_DEPENDENCIES += libcap
 KISMET_CONF_OPTS += --enable-libcap
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
