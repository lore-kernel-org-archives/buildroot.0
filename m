Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798FCC0015E
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 18:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23FE961423;
	Fri, 21 Jul 2023 18:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23FE961423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y9Yf7bYZrqKr; Fri, 21 Jul 2023 18:48:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60E8061425;
	Fri, 21 Jul 2023 18:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60E8061425
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22CC81BF5B4
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 18:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0A3383B0F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 18:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0A3383B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QQsthZE4HiZG for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 18:48:09 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89F2B83B05
 for <buildroot@busybox.net>; Fri, 21 Jul 2023 18:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89F2B83B05
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51e5e4c6026so2988713a12.0
 for <buildroot@busybox.net>; Fri, 21 Jul 2023 11:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689965288; x=1690570088;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2igWm7Rk0oFPPtFHlYJEd5dPF15VDX6BkYluJ6mxR6A=;
 b=GKOD34dD5Ke4A8DeijsQnWsTpCrLx/j/qSZR/MMItG2JjdQbEdVlOnCDGHIH0DJsAs
 zQs8tQ5hVP9X3sksCUc3LKZ+2uF+cieRQ8BPu0pgyMfGgKsm5uA482Y829dLxbv2AA1O
 KGymX0DdQrwJHizzpZWZPEHkEu5QrWDpHw25xdaokYVYJqKVcfns9FnFXi+jtmBXDKqL
 hQmEAMTWGqqj9qqzRYxCxzd8l9ueKgf6seSu98pp364aWiy9lPy291xYAmlNWVprA9hD
 B8wqu9rrRC4L2LL71opEKUEgvbSdnwoekonWd1YjGWeFKMwBAjYezEQZ+i9+9Ko451Hv
 CfvA==
X-Gm-Message-State: ABy/qLaDETZd9+qlG3hiFLpiVH4fmlZM8JX1tWQNrzrOwdE6Dd6WuygG
 C8LZqwPpvLUROcsHUQPpS9sCkUjdndQ=
X-Google-Smtp-Source: APBJJlE/v8CTlpTBOEGk4v7cL8RP7Gla2TvxOGu83fysgdI5VDdzd5ZiROZs1Ee+Hhe8RH2M1drNkg==
X-Received: by 2002:a05:6402:6c6:b0:51d:d568:fa4e with SMTP id
 n6-20020a05640206c600b0051dd568fa4emr1914727edy.41.1689965287625; 
 Fri, 21 Jul 2023 11:48:07 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 w20-20020a50fa94000000b0051e26c7a154sm2423641edr.18.2023.07.21.11.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 11:48:07 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 21 Jul 2023 20:48:04 +0200
Message-Id: <20230721184804.819073-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689965288; x=1690570088;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2igWm7Rk0oFPPtFHlYJEd5dPF15VDX6BkYluJ6mxR6A=;
 b=CSPj/lFGKEKkX+tkCg7H9vLzcz1IP4ximSSuSHMsrQRfqtwaFJ5++9LR2VQIL8AoP1
 KzHy/3YdQ5zDdoHsc++FYRCCNc2aySx83DdfoTm8YKQmGzjD8tAMA7BFcAPj6f+6rIe9
 tTjvllpgUvWXsZTnM9NpAJ/LFA1CS9cAbVd92wDNsxSmiFpXodK3XYmGiaJPvrww0iUR
 +jGH1fCZmPVb9Evy9q/IoF4ad44awMXuMxaztOYLgPiniK6f3TZ7TKVF9ziw7cpf5Sun
 XZq5fx/IPAQmKZciX28IbWXMzho5ob7bKxXT6gHLSJGU3rmZkl0hRNBC7eIjytWv7VMs
 cTRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=CSPj/lFG
Subject: [Buildroot] [PATCH] package/moarvm: bump to version 2023.06
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index e56ecfe65..7d113694f 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  67e214d44d5f626787ca7f04424043a639308a43a7777b6fa41926b7240e0dc5  MoarVM-2023.02.tar.gz
+sha256  143f92510eaa3452c712e4aae9f44d84cd078f16517b40252bab7dd5e224ecdb  MoarVM-2023.06.tar.gz
 sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 6ac2468f5..8f568f4b4 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2023.02
+MOARVM_VERSION = 2023.06
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
