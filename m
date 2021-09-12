Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC00DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:07:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A6C3610CE
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A6C3610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 009C86081B;
	Sun, 12 Sep 2021 14:07:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QpxlS1JUxUQv; Sun, 12 Sep 2021 14:07:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68DCB6075B;
	Sun, 12 Sep 2021 14:07:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 620081BF471
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F750825BF
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:07:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LyrL81_0YtHn for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 14:07:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25D04826AA
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 14:07:14 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 b21-20020a1c8015000000b003049690d882so2162232wmd.5
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e/Ky3U/jzSrhezGe4Pkj2ESxZUqRpBMCtJ5IzZzQ9lQ=;
 b=ovsG45V+2FWryC7LyF2CnxYjQdyla8YP/n6gIIIVW3fWkxip88g2vNMAN1eGJjHTEG
 eOh0nx+yKB9B5QDl7lxbeDxmM3+vZY1Sruzua1ZbQo8Z5fMCsiCU7d22vR/e3AMqCwH3
 3vsFhz6aAVrZ6UFHAyJ1IBkcn7q9k0mn0i79sbHuN+qPx8DTOfW8h4vBZou7XjEkZCgJ
 2SelgTHAe4LgvcIQriXor7kLIn+x1gbxNgCYpe052Dmbj7yynb3KirNFQzTILynZnJEv
 IvtOwcpZOFgOMKOXb56s/iIaUueNuISYZQbP3mzi+q4+QXG3FgReiYFPp5AClEwRVT2s
 S3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e/Ky3U/jzSrhezGe4Pkj2ESxZUqRpBMCtJ5IzZzQ9lQ=;
 b=SabutADi1feOu3Ef1FeSybdvwjhT1XrE+1SU3m2YiMAkXCaweql9aSkoerdss7HuSB
 Dj2CeYkCufmi6l4giAUeQh7+c1GhCN36rr7mAPFvuG326q+2OvisO5TkrNFaEeXBxnNm
 R+xvzEA4r3NUCK8c6WFnUlIGEpBS8qn2dgYe7lrOkRAUJacmDkWctuS+MzNUHscmzdMW
 joQOR6LuFW7/Xih3FWHgJMPEdpB5oCJZFPFEcAPXF9er9rSbaAc4Eq5sHoAHWTaFntPt
 2qA62hw8f8yM00HQcALIlrkgDK9fB3hza+5Eu7Wbd6IzzNMOfDwbMZUZVv+9lBZEFKfT
 OfRg==
X-Gm-Message-State: AOAM5321giDjAGPs/5YXF/Zsp96lUUUOdV8VlQg7dEmZvrs3WrKHShSl
 qAa4mZfhChC4eI+fVCcRHD0tHk2hd7M=
X-Google-Smtp-Source: ABdhPJyAkFUY8eoO9VVD3AFzXCZaQijJRjXUBUkXYmxAXfmZ0vaLysbPMhQAeGnsEnnM+NXfRMVSaA==
X-Received: by 2002:a1c:398a:: with SMTP id g132mr6898066wma.125.1631455632456; 
 Sun, 12 Sep 2021 07:07:12 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id u23sm4183826wmc.24.2021.09.12.07.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 07:07:12 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 16:06:44 +0200
Message-Id: <20210912140658.253602-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912140658.253602-1-romain.naour@gmail.com>
References: <20210912140658.253602-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 02/16] support/testing: test_systemd: bump to
 kernel 4.19.204
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

The kernel 4.11.3 curently used by the test doesn't build with host
gcc >= 10 due the gcc default -fno-common. See GCC 10 porting guide [1].

/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x20): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

Bump to the next LTS release.

[1] https://gcc.gnu.org/gcc-10/porting_to.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/init/test_systemd.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index b553f69a48..f0cc52bac8 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -13,7 +13,7 @@ class InitSystemSystemdBase(InitSystemBase):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
         BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
