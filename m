Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0096C54EED
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 10:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C36B60EE4;
	Mon, 30 Jan 2023 10:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C36B60EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jIZxMX_pxwQg; Mon, 30 Jan 2023 10:43:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2D2860E40;
	Mon, 30 Jan 2023 10:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2D2860E40
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E9841BF30D
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 10:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9EF560E09
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 10:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9EF560E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lHTHRJ_UboN3 for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 10:43:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D7E160E90
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D7E160E90
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 10:43:25 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso2828851wms.5
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 02:43:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8VAiJvUYKVEi0Mydfe6kd3e06McV4XtKG6e+UE9nw/0=;
 b=oaCUmnzcrNEZ8ICOgsdr8hoGIMN1+ggLfk3Ngop4/9lQ74hdNCYdLytEAGutAg113+
 oe7rwrJT8Q/P/liHupk6cCumbAp+jOm9/noX3C6mOfXLGF+FWuB2hSD69kxl/aRKOxUA
 w+H3todtLDSLBtI61tDN6jdwoziUItW9W+pBF2MoCF3CEVm9H+jPhkAYrAjOP3868JWa
 6iahm6yJbyG/j4NbRiWtbnmjHmlMSILZCAs9Wo83z+TsHz8c52rk1YEd/aQFXk7gz5rl
 f0LTdhh0g+WwPTHpCJeuXjuoJIJLBUaI5m9Hn4Rgxu0RWfIInXXG6pqHFo49wOOo3lDj
 dZ0Q==
X-Gm-Message-State: AO0yUKVIFASR1GqqKqouDUZIKRYXe4nQ8VKOL6O9aHzy3ZglMY/oZKv1
 RbXUxlCrRnyYnWRUz2siYr6/REp4Me87Ww==
X-Google-Smtp-Source: AK7set+Ceko/Ra5l+FAruvL7D/0SB1Nh0MqdbzrG+qzV87KYWWeRheC4ewCe492Vtbwzu8PJ84Qxbw==
X-Received: by 2002:a1c:7205:0:b0:3dc:523c:229a with SMTP id
 n5-20020a1c7205000000b003dc523c229amr5138454wmc.7.1675075403859; 
 Mon, 30 Jan 2023 02:43:23 -0800 (PST)
Received: from goliat.wr25.org (82-209-154-112.cust.bredband2.com.
 [82.209.154.112]) by smtp.gmail.com with ESMTPSA id
 q17-20020a05600c46d100b003dc530186e1sm5573064wmo.45.2023.01.30.02.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 02:43:23 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 11:43:08 +0100
Message-Id: <20230130104308.483243-2-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230130104308.483243-1-marcus.folkesson@gmail.com>
References: <20230130104308.483243-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8VAiJvUYKVEi0Mydfe6kd3e06McV4XtKG6e+UE9nw/0=;
 b=Vo1uYeXWfe6P3oA0bV0kmwosVzMNafKdS7Yb0i6vP4XzwT5RB6swDbSbMFWtaCHbHr
 ithQ+s4jd1rErxX77qzmYZMU5Fg8KzedB+NivwbsRwgQFNohSfGigRlIY1eVka6JdaSC
 uzyczwrrUJtcWNsyJpKdb+46rN0RJVG/YflTAVfREogoP2+iufzUC/WkMgd3Tmm6crYg
 +hmQy1ZT3o0SvK0t/5+p6f3LuGqYJNtX8MO/3jRiJL/9Nv44e1jUH9lRLMcjBuhOkAeP
 ysb6F9R7+JSQh9VMK/kb0xFyk0y97URz4Lu8+Kmayv5dNy1SQdebp2DCsNBrWxSfpXkz
 0erw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Vo1uYeXW
Subject: [Buildroot] [PATCH v2 2/2] docs/manual: update pkg-kconfig doc
 about <pkg>-show-fragment
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Describe this new target.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 docs/manual/adding-packages-kconfig.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.txt
index a35681775f..b67430c85f 100644
--- a/docs/manual/adding-packages-kconfig.txt
+++ b/docs/manual/adding-packages-kconfig.txt
@@ -45,9 +45,11 @@ This snippet creates the following make targets:
 
 * +foo-diff-config+, which outputs the differences between the current
   configuration and the one defined in the Buildroot configuration for
-  this kconfig package. The output is useful to identify the
-  configuration changes that may have to be propagated to
-  configuration fragments for example.
+  this kconfig package. The output is useful to identify
+  configuration changes.
+
+* +foo-show-fragment+, Similiar to +foo-diff-config+, but with an output
+  format more suitable to be used in fragment files.
 
 and ensures that the source configuration file is copied to the build
 directory at the right moment.
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
