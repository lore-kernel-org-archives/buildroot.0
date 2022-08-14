Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFC9C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B0C283EDD;
	Sun, 14 Aug 2022 23:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B0C283EDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ZOSZJPX0yzA; Sun, 14 Aug 2022 23:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6680183ED7;
	Sun, 14 Aug 2022 23:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6680183ED7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 974301BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7264C402F5
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7264C402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D5KQ6K9dVJtU for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:40:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C44C4400E4
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C44C4400E4
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:40:06 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id o123so5862586vsc.3
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=g6xIjAKHwiNNZLHO2GYOMNWyRT70z6d78fmYQBS7pFU=;
 b=WtJmqNdO1AYJd5tRiQtkn6HOVSgO66db1icQECj4MOF5jT3VflmJivyH+NYE6y343c
 E6JEqSwzogu4c8tf6HDLZnQ1tMMoWy9jTdvlblSY9WGYwfwVRkbF8FCqmHIVDU9tmGr7
 /sfSp7iTJEQzjU/Nz6qSh7BGacLgha7kJ7k3jy4GOgs0KcBTZV8enFLM7JNs2gaWDAkn
 imqL4d4zQan+mfI03dRbvFJ+e4PMs1a2TDOUiSPsenKRxlAO3H1LSTJK0nsYvqnhwIXQ
 7/HbB0+SVRl2KM7UB7Mf9RdsqfuvJrjrA8cEU1QY6sArZDfgiKm/x7KuxbsEz8/rYJEA
 yTgw==
X-Gm-Message-State: ACgBeo3hN9ObdVqMdO//GTZ7lNJNtvcmUcPEXyxWPnDmnSYifQbYOkjU
 yIcxtlQX5D8vFy9YIFugJumx4Yj/X18=
X-Google-Smtp-Source: AA6agR65ZK9fKz6X+wYORSX9EIzLP61DtcmFj1FeGheh83hMQQOo8Ly4FRSdUYxNlIrNOHxZUXsxww==
X-Received: by 2002:a67:f751:0:b0:388:82bf:aaea with SMTP id
 w17-20020a67f751000000b0038882bfaaeamr4994555vso.55.1660520405612; 
 Sun, 14 Aug 2022 16:40:05 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:40:04 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:31 -0300
Message-Id: <20220814233845.2247022-20-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=g6xIjAKHwiNNZLHO2GYOMNWyRT70z6d78fmYQBS7pFU=;
 b=lGOa7gEWhxY9yjW1zv05XT49TrMFAWgBZmBCbVdlWR/3PKTmte0fXu/NnR8AzYFsdo
 R6WnNp/TrwxbEKKvDb242HIZsXIHRsKhj7TaQaj8/GmjGe7Qa5TmYGKFb7iPUhXhsSpm
 00JPzPRw3BMktkVABtBiQFid71DyHKc1dJJEpPU+ogWxa75bpeIxd6cGMDZ9VpZBfuee
 p9OfEAmKAFT6mabIEETZTi4ipSaRnUSQfC8ECxbKMnZG1kQi6bJKSrfq9QWmB4rzx44L
 rqUYh8OGbmIUC1xcmtIfCfDr6un9EU72QzbcBI9rAwRrD1vP5TuD5BbsnyeZjYds3KTu
 0TgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lGOa7gEW
Subject: [Buildroot] [PATCH 19/33] boot/optee-os: fix typo on
 BR2_TARGET_OPTEE_OS_LATEST
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The typo was added by commit
'9c79b369d6 boot/optee-os: add support for custom tarball URL'

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 boot/optee-os/optee-os.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index fa6ee93137..136c4b2401 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -24,7 +24,7 @@ else
 OPTEE_OS_SITE = $(call github,OP-TEE,optee_os,$(OPTEE_OS_VERSION))
 endif
 
-ifeq ($(BR2_TARGET_OPTEE_OS):$(BR2_TARGET_OPTEE_OS_LATEST_VERSION),y:)
+ifeq ($(BR2_TARGET_OPTEE_OS):$(BR2_TARGET_OPTEE_OS_LATEST),y:)
 BR_NO_CHECK_HASH_FOR += $(OPTEE_OS_SOURCE)
 endif
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
