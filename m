Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87AEC4332F
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 16:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59D6082158;
	Fri,  4 Nov 2022 16:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59D6082158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 53xmAQxZW5v3; Fri,  4 Nov 2022 16:25:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 831248210F;
	Fri,  4 Nov 2022 16:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 831248210F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16A711BF34D
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 16:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFD644173C
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 16:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFD644173C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sODTeyd9VJvK for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 16:25:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7402416C7
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7402416C7
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 16:25:51 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id y16so7740609wrt.12
 for <buildroot@buildroot.org>; Fri, 04 Nov 2022 09:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hjjkxuuN/lyN17N5XUyqacjELyjQS3aSHrC1TcOiUC8=;
 b=Wy0+zaTDTN1/wmQ7aM4CMlA+D+AqU1WNS4kgt3cQ0g1ZvIFUxHEY3tdRX2srJFQGmr
 cDpJourLKopB5KpIG8bU/UcPeWOX1yLdYTQ3S1WMVS3+NcZcJi11fiG44npnqNcUWl+u
 oVVEURR70YbT2OFokspBCTuRWNLbD81qAowhp+g8WbfS7574zzTIKlPVwhIFZBYhwXWd
 xjBU+Sv3DAPrxySZxIK0Q7DtUdpsXWUjZFyJbR57PxSmvW/Y3ymZsMjKrTVgXgYtrPZu
 VLg/jVigke9rK/3qf0ZD4U69hgNDSdFtr4oCBHeSJsD/qt73Mt6rPwRnke8pd9bl+JWS
 J+UQ==
X-Gm-Message-State: ACrzQf1/iFt6h/imKaFMgVOLxJ/zAw+3oz1ETM9jbGQl7txQ/jWG8/d1
 A6Ec87MpxzOkDopan5Nng5BAvT67ZDw=
X-Google-Smtp-Source: AMsMyM7dRC4CnORr8NbrQz490sus3qq99kDcTf0MWxj7Q9oxMvbUwGKvGcM16G3x66EMNda2s3dfOw==
X-Received: by 2002:adf:e549:0:b0:236:a16c:100 with SMTP id
 z9-20020adfe549000000b00236a16c0100mr23882176wrm.72.1667579149670; 
 Fri, 04 Nov 2022 09:25:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 a12-20020a056000100c00b0022da3977ec5sm3770891wrx.113.2022.11.04.09.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 09:25:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  4 Nov 2022 17:25:45 +0100
Message-Id: <20221104162545.648723-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hjjkxuuN/lyN17N5XUyqacjELyjQS3aSHrC1TcOiUC8=;
 b=P2/LrEdCwQ9mEZ3E+JNZfotI9wxtQ37JpveVHkTQa+Hn5TdB84gfpWVCCsjktIfWyE
 E8puh3q1BFW4M2I/0UVzTbhQE3Oyblh2gnOwWt3G61I205yqmuhLXEAzqg7uRPKcX9Eo
 Mra5oQZq0TWOnMyUNRHI0vgItgR4CRqDDdypGSpO3qW6JR4HuGvak9X5UNZXIAyPvmxA
 SYVR2Fs1sjNZb7bdWxwKbERViITokJFif+27tjD6iwihR7UGv6HBS9gbI1SayFVbEgnQ
 qXBcD7t+GCmTA+g7Tq3RiE744mww3R8Hme397z4Xq5tejfC7/Fwx3k3J+nLVfFqBZx3+
 /Y3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=P2/LrEdC
Subject: [Buildroot] [PATCH 1/1] package/sudo: fix CVE-2022-43995
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
 package/sudo/sudo.mk | 3 +++
 1 file changed, 3 insertions(+)

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
