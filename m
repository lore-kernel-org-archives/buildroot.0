Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E61FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17F1F41D1C;
	Thu, 19 May 2022 14:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pidgAqSTrMvQ; Thu, 19 May 2022 14:12:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF2EB41CF5;
	Thu, 19 May 2022 14:12:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABD0A1BF3CE
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B76984338
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hfeOSqQsNXKM for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E41AD8426E
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:50 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id r23so7379719wrr.2
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gnS6Fcfze5REKQrzI9KbwLztDO/eeOR1KtP88yr6dEQ=;
 b=KLXbsqEtUYb3tfiIsj3zGAhgJA5nVJBhYNadyK7YDtMIT67x+gAyngDqhXMn6mQUdY
 pqutS7CGMWgESDSYLjyvS0VbdguCJOZ/9mEKtKysUJ73bKQHnD7nNHTLIrWfjX1y3dJk
 op14u2Z8RvTKOY9TV6V71DJ/ZWI3I2BQ/q90n0Wlt0bAZmMXdz5KPtbkt/Chomzns8r2
 2Aye5jXiYgPQMAcQLc9dn2DJjZex8E649ePZiVPlDfdVamzHuFcZ/F+bmWEwrUZrSR4v
 Tya1fMTjM6mPTsI84d6fWgskfyggR7chBTcj7j0DPzJ9c7Ec8yIByA39aqgvJoLLM5bl
 xjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gnS6Fcfze5REKQrzI9KbwLztDO/eeOR1KtP88yr6dEQ=;
 b=ViUI8dZGTWjtYjDbrAzFLfNZ/00F74UiQQMyDQQKQDAQoMaFfdUyyRGTZ/ZRiUfuRX
 xrWSA4uXql6IpKyleFvU/M9v8tiFyNXOPOXwAp4tidzW24a6Rf4OBEkshzL0slRBgHA3
 VjRvIyMGqH2XNjr7Yfbkunj1+o+KdI+EPvSW1+330Goxd5ucbEHuqk11WG1knafx0AIa
 QXFhM0Fm/TMgYs8Wdz6UJtZpwmMVwf5tJ04Vl4JR8hCShMn3yaYr0xpbUNWcBu8d2xug
 64ZRN0231tNY+cWzvTEEH6oB9vu0clTyfcF6ZtJG822C2Ix5x/8ksx4GjST9Kxwl2qz5
 +uyA==
X-Gm-Message-State: AOAM532NGvBN3GLUQD7uqp4uhVrbp17qiOKQilOLHUJ60O/jQVbhAPLG
 VDfXpX57MZYB0M/YzXxzdYNb4PrJJZE=
X-Google-Smtp-Source: ABdhPJz0vOxuU/JxUuOAsz/4wE3v1CDcs9CJFz24AHBSSweyu7wivZBNTfSWJcPc9yHQyMt9dkMUxw==
X-Received: by 2002:a05:6000:45:b0:20d:840:dab9 with SMTP id
 k5-20020a056000004500b0020d0840dab9mr4212365wrx.612.1652969328962; 
 Thu, 19 May 2022 07:08:48 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:48 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:08:09 +0200
Message-Id: <20220519140810.1953601-20-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 19/20] package/erlang-p1-zlib: bump version
 to 1.0.10
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The copyright year in the license file has been updated to 2022, hence
the new license hash.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-zlib/erlang-p1-zlib.hash | 4 ++--
 package/erlang-p1-zlib/erlang-p1-zlib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.hash b/package/erlang-p1-zlib/erlang-p1-zlib.hash
index 7ce58762f8..f48aba90ea 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.hash
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f0ac60336b2ddf55ac4f58934580cb8f02dba440d68feb607be312dd35d91269  erlang-p1-zlib-1.0.9.tar.gz
-sha256  6cd4871db940d055cf272c12c10e0c08febdc94362e404390758fde34b4ce01a  LICENSE.txt
+sha256  cef52f8f28229bf7229b53d225a6a9865acf5bdeaf16a40f81bbeb226615be99  erlang-p1-zlib-1.0.10.tar.gz
+sha256  a401e98a7eef1c741b3e8b1a46a21730b4a1bc7020e4ec1a8c2a44dbd7f0ba5d  LICENSE.txt
diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.mk b/package/erlang-p1-zlib/erlang-p1-zlib.mk
index 0e6ee298ef..fdffb6ed3e 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.mk
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ZLIB_VERSION = 1.0.9
+ERLANG_P1_ZLIB_VERSION = 1.0.10
 ERLANG_P1_ZLIB_SITE = $(call github,processone,ezlib,$(ERLANG_P1_ZLIB_VERSION))
 ERLANG_P1_ZLIB_LICENSE = Apache-2.0
 ERLANG_P1_ZLIB_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
