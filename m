Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B64CC05027
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 23:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE325417C9;
	Thu,  9 Feb 2023 23:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE325417C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nmb962ls9Bvu; Thu,  9 Feb 2023 23:16:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9853A418DB;
	Thu,  9 Feb 2023 23:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9853A418DB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F23A1BF842
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 23:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7923382249
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 23:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7923382249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CKL3IQ75o3qZ for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 23:15:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F0F382248
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F0F382248
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 23:15:37 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id j1so3590864pjd.0
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 15:15:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bep+Ub6vovuiNuTjYO7d1zFgcxJ7RRUYVRDzziXkZso=;
 b=qr02CZ0P6s2yN0/tQ2kdkxferUIVwnAlBJb8h2qTwXrdKqGAzRp4eUKEgNeOImdaVo
 MoGCvz/tRbs/7zy68FvuOwn1bqR1/vZCJYjA+WbstRorRsovm7WPpKYUBQchaidKyu4x
 msLOkCVcmw3pfct4jqXIA2gArD5FDkcR3cg2+8votVWuzKYtunzvaEkqzidFMCNfaH5l
 wmWJTxCYuI93zeCYGyVBXRcMcuO6c4umaThLx0NluMH7Gp5VGOWTK1okykF5ex6MDM8D
 ekeikk5pObkjhHKoAmW6SPfn9fOIm87ZcV45jEiaV5s35qcj0yZ/NIuKywdmX8UxNQ0D
 wJzA==
X-Gm-Message-State: AO0yUKX1KxKULlVRO99tNIasq+rZWKhrZtkdp6T7XKupm+logsm8iA+/
 cM1lMCdFWRr/1KacBTpv7Ro+kBNfow4=
X-Google-Smtp-Source: AK7set+OlPuk6iYBAn/aUUIQf0jpIa+k8FkOz8VOza/lhPS4pRJCKXQJwxqhhm8Sr3x+bF0SWGGlkA==
X-Received: by 2002:a05:6a20:5484:b0:b6:157d:bf48 with SMTP id
 i4-20020a056a20548400b000b6157dbf48mr16089762pzk.43.1675984536359; 
 Thu, 09 Feb 2023 15:15:36 -0800 (PST)
Received: from localhost.localdomain ([12.125.190.90])
 by smtp.gmail.com with ESMTPSA id
 c4-20020aa781c4000000b005905d2fe760sm1970067pfn.155.2023.02.09.15.15.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 09 Feb 2023 15:15:35 -0800 (PST)
From: ckhardin@gmail.com
To: buildroot@buildroot.org
Date: Thu,  9 Feb 2023 15:15:18 -0800
Message-Id: <20230209231518.9458-4-ckhardin@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230209231518.9458-1-ckhardin@gmail.com>
References: <20230209231518.9458-1-ckhardin@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bep+Ub6vovuiNuTjYO7d1zFgcxJ7RRUYVRDzziXkZso=;
 b=E9A793M6kxH4G3Pm1tXTByQQjHFZu293wB9aSpJYF+wG8LkENtPf1fMxqUnNSIexWj
 mfu+hv8fnc6t8z5qtkmbnhSswRdK75atzkimoUDkBHBuXr7Weh6vHqtkT9M9KtTZxhOf
 eZ55ALdZMbEHMtg8K4Oo1gZB2+P9ufjVQV1zqiiIqEEN2+EnG/CBZPP9gwg+jyu6BB6S
 o8gGOekCE6r4L7lJyUAx5yvpZJLs/QfgMlanufcUas+8FBpJJRpGNAsQ9WlNEUNVNjK2
 G02Lt/3fLvuTT5MTtdku5PxtHN/yg/DgqUQPsRZRrEalweg4yOLQ2cObExTAcNnkPZJT
 1QLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=E9A793M6
Subject: [Buildroot] [PATCH 4/4] linux: add a setlocalversion rsync hook
 when overriding srcdir
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Charles Hardin <ckhardin@gmail.com>

During development the override srcdir is often used with a local
git repo and branch. To help track the builds used in those flows
it is useful to have the scm version available as part of the info.
With this hook, the auto generated version include will include the
example.

    #define UTS_RELEASE "5.4.70-00031-g92c23d10d003"

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 linux/linux.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 0b27c8dee2..3ef8e555c5 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -46,6 +46,18 @@ LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v$(firstword $(subst ., ,$(LINUX_
 endif
 endif
 
+ifneq ($(LINUX_OVERRIDE_SRCDIR),)
+define LINUX_OVERRIDE_SRCDIR_SETLOCALVERSION
+	(cd $(@D); \
+		if [ -x ./scripts/setlocalversion ]; then \
+			./scripts/setlocalversion --save-scmversion \
+				$(abspath $(LINUX_OVERRIDE_SRCDIR)) ||:; \
+		fi)
+endef
+
+LINUX_POST_RSYNC_HOOKS += LINUX_OVERRIDE_SRCDIR_SETLOCALVERSION
+endif
+
 ifeq ($(BR2_LINUX_KERNEL)$(BR2_LINUX_KERNEL_LATEST_VERSION),y)
 BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
 endif
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
