Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9582C433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 17:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5072B40A5A;
	Thu,  2 Dec 2021 17:48:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aXODZyYQmGb6; Thu,  2 Dec 2021 17:48:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 736B140A4C;
	Thu,  2 Dec 2021 17:48:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 705C51BF3F9
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A7896F496
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:48:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kpJlKmzX8g_Z for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 17:48:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C16E760641
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 17:48:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso2944948wml.1
 for <buildroot@buildroot.org>; Thu, 02 Dec 2021 09:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1DkE+eF4++iqknqBYwZCpQFsaVcEdWAlHBaOZxF9P14=;
 b=flnOvSBzlg7vrEe7gk4MYNjhvlqVo6GI7RGGrn7EJ8v+Ou4DIijgX28XUcp7pj5IQU
 bcHdj29lGX5nkk41v3Vh+WIJLw3febUT/7urRUg2TUmpiCVku2mbqAXOcnFUTgsHbSCm
 CxkNLebUyzTWoVFMguYCjcC1ygQgeK0aWFb47akV/vs7/VPJt4073VI8rXT8mclAyAvx
 jJdBvS6MJbjbVQpwecJLH1L+VrO2+ITXkZ/14/IcHu2uyzAYxWhFTXrMJYP4pP3j/5g1
 TAwqC4a9KTKwRttNoGYtLFkytSNEhuQKliL+YeokINjnV/dgR+18TgEP4G5r0DJE57xC
 IZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1DkE+eF4++iqknqBYwZCpQFsaVcEdWAlHBaOZxF9P14=;
 b=wagKs/L2VbToeF08c3SFgV0TZmq3BgvUvntLQ2UztH4mc54VOSY2iVgZuX/WDjtFYv
 71tO2HamKlCzgD/J2v8IJftHNOGvuWe3ZLkE8lsBRvJhOxQEKHdPsz6Qh9fjoqhqT7Gt
 BjLm9awUzf+amh8mx7+3lJf5sTTSihSM8oT5HDJzNm7acT+Gp7iJ7oMfHmICb3GO/2fN
 Q8GHOOGoNShZlGBxyh2TeuIlTF2LcubWuCiD6xZ6/cUERcaUtIsO5wXeDPdzvnHodslj
 mPzTq4uoD9PkMvysffUKCSJVoijEOY9hVZv7Yol8VZlI+lS+IRDK2cbF4wEcHjlKsKj8
 2VAg==
X-Gm-Message-State: AOAM53091x6CVoenGzAjKsRAuZIbXx4jw9c8wT8WUbqmuFgSb6+aqz/k
 Spu+qaWDjYKFsRM9zXZPAJSAhbrJbaLaew==
X-Google-Smtp-Source: ABdhPJz+l/S5I9fIruZ0nwkkAnykigcW59XVUO9XYp9t0Cnzw19SmndG9TpdidIkJVLrmqpM872oBw==
X-Received: by 2002:a7b:c407:: with SMTP id k7mr8154329wmi.35.1638467328742;
 Thu, 02 Dec 2021 09:48:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id c6sm3693300wmq.46.2021.12.02.09.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 09:48:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Dec 2021 18:48:50 +0100
Message-Id: <20211202174850.1464076-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libfuse: drop spurious spaces
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

Drop spurious spaces added by commit
ea62ff85b59aa1ff7757787061eb451b4b4780df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libfuse/libfuse.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 6dce641f7f..723060931f 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -38,7 +38,7 @@ define LIBFUSE_INSTALL_TARGET_CMDS
 endef
 
 define LIBFUSE_DEVICES
-	/dev/fuse  c  666  0  0  10  229  0  0  -
+	/dev/fuse c 666 0 0 10 229 0 0 -
 endef
 
 define LIBFUSE_PERMISSIONS
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
