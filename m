Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFC8C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 15:32:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B55560ED8
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 15:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B55560ED8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3211880F6A;
	Mon, 30 Aug 2021 15:32:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1NkevhmI9y0o; Mon, 30 Aug 2021 15:31:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E92D180F6D;
	Mon, 30 Aug 2021 15:31:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84E0E1BF3E3
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 15:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 734B780F69
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 15:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xt5MWZjetNOz for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 15:31:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 712F980F6D
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 15:31:17 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id j4so32011596lfg.9
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 08:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:organization:content-transfer-encoding;
 bh=0djCIpCg6vnB1zigxr8jG1Pe3wEI/uaEG70kitTuFI8=;
 b=R1lZ3ChexMo33R2VMBYNla6zagB2fOUC887FHFKNh6y8Tk07yH7amK9EZrYPVxSKdD
 To/crJFMN34hO9KR4Z6vjlEYlPN7x+Trj6xJ/af5IjnEPHpQvB4nBWB9rP+GeDCtIOyI
 onufRZjfEUwFHrLXJyHhSOxI7u/rziUFIMviNAipaIMk4yKjMcrG8jKB3qZGdDP4HPJi
 AJ7e7t0EMHsPVK6eAqkNYhZ1STMCHKCfvd4hu34Q3xTIEUhcfpwtq7te4YCLQUsoHwr7
 fdrdHRaHXZcojQVOOxHkEmzbMynjdEvZfHYWGyOaH32ekB/u8+viypNtKhhAiC6PzOCX
 QyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:organization:content-transfer-encoding;
 bh=0djCIpCg6vnB1zigxr8jG1Pe3wEI/uaEG70kitTuFI8=;
 b=JCZ/t59PvP7puQO8A46Q5XiatJNALRobjBi8myUNptCJ+EYrV1Cdy+MMYO3kxo0PnW
 qxspYePFLkiXRmunit+KvyGxviIoZaJ40JV+fI38MZmho1RBw8hs9+QWbdV9/K+HyYCs
 m2OSpHhaEyltBmwyIPVt6ZXgq20S1V0YvNbPOGzxxSsNh9qnmg8aYarADm7kY7veQUIF
 FtN0Dc0kqP7K3+CMS/VfuN1SNM3QF60gX9KSaSHtFC7kmvaoybP3axPfPfBetkxYPme3
 faL35iVtx94LivCun2eNrSyWFyqj3TF2nyifnvP/UfxrOlg8OxPsJy0SI/JKUFOoo3z5
 mKng==
X-Gm-Message-State: AOAM533+npUQ991VxIOTYRdhL/Oxq3DY4JrW/+jvpKDP9lSc/uy20C5V
 p1sNDBbGr4qQa4O3NnygpR+Uv39tmlu/GQ==
X-Google-Smtp-Source: ABdhPJxAZdjWtuv/Cl8V4knu18VTA+zLgrADjy2oizLnVCBW0mJLImQLMl+U+a2R0i20YIYyV0dfow==
X-Received: by 2002:a05:6512:1326:: with SMTP id
 x38mr17408578lfu.591.1630337475253; 
 Mon, 30 Aug 2021 08:31:15 -0700 (PDT)
Received: from wbg.labs.westermo.se (static-193-12-47-89.cust.tele2.se.
 [193.12.47.89])
 by smtp.gmail.com with ESMTPSA id k20sm1871343ljc.2.2021.08.30.08.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 08:31:14 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Aug 2021 17:30:56 +0200
Message-Id: <20210830153056.3176678-4-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830153056.3176678-1-troglobit@gmail.com>
References: <20210830153056.3176678-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
Subject: [Buildroot] [PATCH v2 3/3] package/smcroute: prune old smcroute
 compat script
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Long ago, before SMCRoute had yet become a proper daemon and standalone
control tool, it was both.  After the metamorphosis commands and options
had changed, a compat script was added to provide a smooth transition.

The compat script is still shipped in the tarball, and installed, but
only Debian still relies on it, so we prune it here to keep confusion
to a minimum, hopefully.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/smcroute/smcroute.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 9cce0acbbc..e8fc54bb42 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -24,4 +24,10 @@ define SMCROUTE_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S41smcroute
 endef
 
+define SMCROUTE_PRUNE_COMPAT_SCRIPT
+	rm -f $(TARGET_DIR)/usr/sbin/smcroute
+endef
+
+SMCROUTE_POST_INSTALL_TARGET_HOOKS += SMCROUTE_PRUNE_COMPAT_SCRIPT
+
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
