Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8CFC05027
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 23:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3348C4185F;
	Thu,  9 Feb 2023 23:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3348C4185F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LTTFRGQgRsaK; Thu,  9 Feb 2023 23:15:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F08A241819;
	Thu,  9 Feb 2023 23:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F08A241819
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC05E1BF842
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 23:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3074660E19
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 23:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3074660E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 99mjPV5QIxFO for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 23:15:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3753A6059C
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3753A6059C
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 23:15:35 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 v6-20020a17090ad58600b00229eec90a7fso7341743pju.0
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 15:15:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ZmetyC3AP7yXLSGaX82rttoOs79pp79qjcb4MHe864=;
 b=nVY3lDKq23M7yehs3nraLJTmO8KDIHh6LsQlQiHtm8e0J3khQu/egouUoRwv0mGVlr
 GSflTVzBk1IhmJvj1QanAJlFg8eO40Xq97Xow66By5IPYZLrzBxf6OH5KG+vtl6x9rCZ
 JnKzCNYnpbLV7WSWE0KOjHpRUTsZku/jK7pkAb+taQD5V6p37uM8vVlcU2z3sVeZp6kD
 I5F32pEoaldCg68cxc11kkyl/nEF2Jr75FvlDL67P8QQpCdjvgDqBQ7HGfMaWNQmBduF
 wOpD6M6gWRvQIRzOyoUYIQJgS70VzplaF5FqJco/+RePFKtYlz9nyiWP186vB6LWjf6z
 Li9Q==
X-Gm-Message-State: AO0yUKWwYDxIrjDcuffUMyj0X0BP5ldQdh8n+uIsaDHKdAWEs0AY5crn
 qnwEzowkuPv6XWxh3Z89vNLy03mO4dY=
X-Google-Smtp-Source: AK7set+r2/wFbpb63xAhtjjRbRe6PCmLxWFQTS/Lq1A5BWV/qH0jKldMWrYjQQ4by61X5ZC/Qkwsug==
X-Received: by 2002:a05:6a20:7d95:b0:bc:5f20:140d with SMTP id
 v21-20020a056a207d9500b000bc5f20140dmr15196006pzj.30.1675984534241; 
 Thu, 09 Feb 2023 15:15:34 -0800 (PST)
Received: from localhost.localdomain ([12.125.190.90])
 by smtp.gmail.com with ESMTPSA id
 c4-20020aa781c4000000b005905d2fe760sm1970067pfn.155.2023.02.09.15.15.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 09 Feb 2023 15:15:33 -0800 (PST)
From: ckhardin@gmail.com
To: buildroot@buildroot.org
Date: Thu,  9 Feb 2023 15:15:17 -0800
Message-Id: <20230209231518.9458-3-ckhardin@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230209231518.9458-1-ckhardin@gmail.com>
References: <20230209231518.9458-1-ckhardin@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ZmetyC3AP7yXLSGaX82rttoOs79pp79qjcb4MHe864=;
 b=ZCHZvLvRmmEt5iN0bP5R0AIEJGohwdXZYXUWhRcTSUbn5bB+bRvlK5m6iTzhLjfkS9
 kcImuSOpZJOVPJqtlq8+AK9eOW6PKqmu06ECiWyW2jK/eDuvNUNdk+XTxtcdFedgwhan
 Rpb86uSv3u1eRHekAsTP+4H6v9oLdxggQo6ZLg4paRobv17T1NoiWtBW88X+K5Oj9avG
 CMRqzNCdxSVEkUvZ7cpmKyRd0ArwYzOHVjbcAx082yoiSStUlbxX8wM/gldc64BCcAYp
 ViI4iOiZU/icDQG4OY3Hn9Wp6TBj9RSWEaTjY4TV6yzaoNEN6UIubDcIdQPzFyO185KC
 SL9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZCHZvLvR
Subject: [Buildroot] [PATCH 3/4] boot/uboot: add a setlocalversion rsync
 hook when overriding srcdir
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

    #define PLAIN_VERSION "2018.03-01358-gbda75d6a8b"
    #define U_BOOT_VERSION "U-Boot " PLAIN_VERSION

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 boot/uboot/uboot.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d735b47326..3f8479e623 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -40,6 +40,18 @@ UBOOT_SITE = https://ftp.denx.de/pub/u-boot
 UBOOT_SOURCE = u-boot-$(UBOOT_VERSION).tar.bz2
 endif
 
+ifneq ($(UBOOT_OVERRIDE_SRCDIR),)
+define UBOOT_OVERRIDE_SRCDIR_SETLOCALVERSION
+	(cd $(@D); \
+		if [ -x ./scripts/setlocalversion ]; then \
+			./scripts/setlocalversion --save-scmversion \
+				$(abspath $(UBOOT_OVERRIDE_SRCDIR)) ||:; \
+		fi)
+endef
+
+UBOOT_POST_RSYNC_HOOKS += UBOOT_OVERRIDE_SRCDIR_SETLOCALVERSION
+endif
+
 ifeq ($(BR2_TARGET_UBOOT)$(BR2_TARGET_UBOOT_LATEST_VERSION),y)
 BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
 endif
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
