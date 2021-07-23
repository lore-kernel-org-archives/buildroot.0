Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B6D9C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 08:08:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 343A460E73
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 08:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 343A460E73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 086CF83B45;
	Sat, 24 Jul 2021 08:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fldX98ZgCMDM; Sat, 24 Jul 2021 08:08:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D17583B32;
	Sat, 24 Jul 2021 08:08:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C6F5B1BF37B
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 08:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B648383B32
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 08:08:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UguqNAgxaJwV for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 08:08:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F9DF83AEA
 for <buildroot@busybox.net>; Sat, 24 Jul 2021 08:08:48 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id w12so4678101wro.13
 for <buildroot@busybox.net>; Sat, 24 Jul 2021 01:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FqOhKfLdlG5xhMPwHuFMbgW4rVAILqFUfU8GPo6CiAk=;
 b=EmGhLO47/FxTtHhDuCTcVlmy5Hj2s8U3CeOyOKHJWmUfOR/0xsbjgxnTMWYonfvJSt
 xQfmqvXpBVKfJ3LFhso+N15Rd7VJ6xzL11b67Lc2NPV0cu8uUtQDgR2R2TuhphF/HBMj
 1gZy7fFSSsqUVfz0B677WX7SCRApboZqf1xn9Een9xIsi15CCz3JezvCDqMAzQXHOBic
 eivYqqMd4hHEe6Et3hcJE6xM5ivtuYds0g/W2OhT81mhPLFJUSwHPtsOiwD8CgRipUTM
 aXtoIA0ee7R5b3h4cqtDvgRh4GA9LxGj8SV4xnebFI9F3vbN5B3cy9RexF9Y43UJQTIk
 D4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FqOhKfLdlG5xhMPwHuFMbgW4rVAILqFUfU8GPo6CiAk=;
 b=lufIKV0N4dMjYUAJ1fiKpGgKEQzh58lPLAOBlgQ+Zfbz8nSJ7bN4VIAHEn0Yp4Sg8D
 G2FOZiYurgCd7uls3nmpcWuudSdYyvczPLfxzXr58jLBCgK9l+LiGR/UremkIcTXMJBR
 cWmzu/nQWWblP07F1DBuSAR7afRKnW1Kj/sHi4d5SO9jA3dpaO9+D9geq45Ib0AjCDnd
 12hj1z747oMQR9NcUBeu1X599yQFOMfEjdmqz0uP9gZEiXmdrfxsr40+OM3hAC+b63ao
 iZkLdsfEr9rAd2WcvnBvwtRu9YcGZufkKumXPrw5GTxtn7ZjZbBaMv7kUA8vWTTaXUFY
 G++g==
X-Gm-Message-State: AOAM530HD7su5GAALDQvoOY4yW7Ws+k/rPp+XIrWm4mMDBvcuQt2uNHz
 CEqJQyyVXV3OEAi4lBEJP6iuafgOAZo=
X-Google-Smtp-Source: ABdhPJwU3sdfXJp5MY/deHBaoEHPE27HRlwarqee+szOac81vlhKOueEpnaxCkj25Szymxf1bUs0TQ==
X-Received: by 2002:a5d:4051:: with SMTP id w17mr331903wrp.210.1627114126486; 
 Sat, 24 Jul 2021 01:08:46 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id e8sm14378594wrc.6.2021.07.24.01.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 01:08:46 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 23 Jul 2021 22:43:33 +0200
Message-Id: <20210723204333.2533266-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lua-silva: bump to version 0.1.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-silva/lua-silva.hash | 4 ++--
 package/lua-silva/lua-silva.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-silva/lua-silva.hash b/package/lua-silva/lua-silva.hash
index 3181ca12c..bcd0d3071 100644
--- a/package/lua-silva/lua-silva.hash
+++ b/package/lua-silva/lua-silva.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 8211adfc46629524fc2ba629b616ba84790ca7676ef1ebed20e8de9016c24c10  lua-silva-0.1.7-1.src.rock
-sha256 5b59ffbfc12d9d1cb907dd65b0f16d3453e1a43cc018c6128a00b00e08f6c485  lua-Silva-0.1.7/COPYRIGHT
+sha256 0e656c42c71b64285d4a375fa7b8b1a910b05c4ab6d30f5b427b078fff204e1f  lua-silva-0.1.8-1.src.rock
+sha256 5b59ffbfc12d9d1cb907dd65b0f16d3453e1a43cc018c6128a00b00e08f6c485  lua-Silva-0.1.8/COPYRIGHT
diff --git a/package/lua-silva/lua-silva.mk b/package/lua-silva/lua-silva.mk
index 8b92586ba..91b1b7747 100644
--- a/package/lua-silva/lua-silva.mk
+++ b/package/lua-silva/lua-silva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_SILVA_VERSION = 0.1.7-1
+LUA_SILVA_VERSION = 0.1.8-1
 LUA_SILVA_NAME_UPSTREAM = lua-Silva
 LUA_SILVA_LICENSE = MIT
 LUA_SILVA_LICENSE_FILES = $(LUA_SILVA_SUBDIR)/COPYRIGHT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
