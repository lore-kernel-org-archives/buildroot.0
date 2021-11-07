Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F63C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 17:39:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD483613A2
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 17:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD483613A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EFFC40242;
	Sun,  7 Nov 2021 17:39:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kC53mcyg9AKG; Sun,  7 Nov 2021 17:39:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 068C840237;
	Sun,  7 Nov 2021 17:39:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EB781BF576
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 17:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2240606F1
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 17:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 47p2zXtbTkvP for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 17:39:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C102606EE
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 17:39:48 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so10098842wmz.2
 for <buildroot@buildroot.org>; Sun, 07 Nov 2021 09:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SoWUeXMGc579zblO8ZTVgPm2UFZi8cOZXxV8/mJoK/g=;
 b=iJvfXTa5LFX41eBYnt+abLyMl0W8GJQNpdSZMbCJxqe5ePCYXrs3qzKTF5Rw+g2s3i
 px0VC81UVNxnUYLgY9r/hcX20saE0xV+BBtYfWxcf1YY+SgRoAOkbwwtEB3nL4ukMIuL
 saIa/rYTb16ekUrebzMkzBH50nsHslk/DSY27aJZcA7AmZAOrBPq1nDlnyBe0hRT4cBO
 6OXnX/TlcPfFow/FypqmIzTBRrOBabqLHAhiW9/gEGRGqsMQ6/aBRErSrecetd99yr43
 asCToL7Y9hPnII6MN9lJnm0KPkKoF/5T2h/kYCOS1kgtq82NoDeSxkKujvvevGOyp2/Y
 warA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SoWUeXMGc579zblO8ZTVgPm2UFZi8cOZXxV8/mJoK/g=;
 b=IW4VWDdUhGGTW1FizGsnAWN46Jiml6qmCwsNa5uIvT4GVJxoq/b7Qbqw5fDfvnjtxZ
 XezlcNESkg5YgNCyqO5qWuiamvgvZIpC6vK+QHgOaZLsNkXUxtYy66fch6pmlaLzEXcu
 +5bZanPlyrFWLiB7LVbr8Qqd/qXbuCdgeGifS2eFjBb/w8xM6QuoipRPflHPKs6f9jEj
 Ra1tQurqj/bZQ7osn7I+nIjylBm3jglhoB+zrWW1ga6awiHNmZycE4je1ECKGOxlnHP0
 RsQjQ/IzqL30HVrQr/2MW9KVHZa2aeA4EbPlYdDoPlIzOx9TvoIfciEWxA7628Tr5jku
 Em7A==
X-Gm-Message-State: AOAM530Orz2ZV5tWEXtOWjzGO4qIF8S8+aBhrwKE6x3+r+cl5cpnetFH
 lbZF9DKkd3hWnktwOxu3NUsPOrRnnN4=
X-Google-Smtp-Source: ABdhPJyDNWrBvaNpWny3Jz2po9zq4uh3Py612wDtXgq0r7Hhvk9ODyF2UnHhSF1FZGHZtCeWJSEzCg==
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr45674013wmi.182.1636306785993; 
 Sun, 07 Nov 2021 09:39:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id t9sm15218352wrx.72.2021.11.07.09.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 09:39:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 18:37:49 +0100
Message-Id: <20211107173749.3528363-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tpm2-tss: fix build on host without
 groupadd
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

Override check for groupadd as already done for setfacl since commit
d9123dd79956124ab1b39427764882b61fe44261 to avoid the following build
failure:

checking for groupadd... no
configure: error: Missing required program 'groupadd': ensure it is installed and on PATH.

Fixes:
 - http://autobuild.buildroot.org/results/5accac06abbd3980484d8e2667a5446ec5d85bc1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tpm2-tss/tpm2-tss.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 4927154d16..f2b5f32171 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -17,6 +17,7 @@ TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf
 TPM2_TSS_AUTORECONF = YES
 
 TPM2_TSS_CONF_OPTS = \
+	ac_cv_prog_result_groupadd=yes \
 	ac_cv_prog_result_setfacl=yes \
 	--with-crypto=ossl \
 	--disable-doxygen-doc \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
