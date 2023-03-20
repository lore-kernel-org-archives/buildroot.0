Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D55C7618A
	for <buildroot@archiver.kernel.org>; Mon, 20 Mar 2023 11:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 028EB4150E;
	Mon, 20 Mar 2023 11:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 028EB4150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XuDt2Bih68Vf; Mon, 20 Mar 2023 11:10:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F01D64154A;
	Mon, 20 Mar 2023 11:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F01D64154A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35A871BF3FC
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 11:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F95B813AE
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 11:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F95B813AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dOcP_JofhgFC for <buildroot@lists.busybox.net>;
 Mon, 20 Mar 2023 11:10:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 937678139D
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 937678139D
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 11:10:04 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id y15so14367121lfa.7
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 04:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679310602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rhc8VauKrC330/NOSZMPXk2OZn4LRor1YlfbRqdK64I=;
 b=2atD3OqpuZBuA0+giQKqqM1eleg7spUbGKJg/lcTN7kN7+REcoLLg7Tesh9At0hZP3
 g5dO166bAMhgab3cwlAc4cvlv3t5f2OF2SfOr7AD4wKip5BagFE7bnxca/F8oT7/SPfE
 Ksv8hYQKf7Id1GnZ9Niuca5LqXHRn5A3SkoFdQBZojSRqM5oc5M7is8bU0YoCgdJD0zd
 dXoxKzcEdK3D57jfRYvRSuIfPXVpabcPipR//1hnLFPXB3xGv2O6Zb5a37WyzaPYVLCD
 QlXHFosyUrbpQVRCJfhn6qKCj9C2YvKK9sBeT3mGTXouseU8hvZQqJgCm3RB5HBUyOdU
 lyNA==
X-Gm-Message-State: AO0yUKWQqT9GZqXzkvSHC0EamHLu35+hryB8XAtNTYhCOpAmY4jfhQ20
 u9KYqSdOH5roD2g7CEa/OZmhmEC1Tzk=
X-Google-Smtp-Source: AK7set8Lv1MHJUhTN/6pW7SLKNr/QrWf4cLBWAE2JYbRhj/EMsHVq5uoo42XVRh7AwKGXJJ1ReeFYA==
X-Received: by 2002:ac2:4c1b:0:b0:4dd:98c6:ee1 with SMTP id
 t27-20020ac24c1b000000b004dd98c60ee1mr6139664lfq.61.1679310601277; 
 Mon, 20 Mar 2023 04:10:01 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 o18-20020ac24352000000b004caf992bba9sm1632814lfl.268.2023.03.20.04.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 04:09:59 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Mar 2023 12:09:43 +0100
Message-Id: <20230320110943.1606631-2-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320110943.1606631-1-marcus.folkesson@gmail.com>
References: <20230320110943.1606631-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679310602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rhc8VauKrC330/NOSZMPXk2OZn4LRor1YlfbRqdK64I=;
 b=QuT8w9aeOlvT1JSbrOYaHa3DptI6sOXUrTy1aWbH0hbsrNTcT4Ik7wd960C90xddLM
 lj86jTzhh5/SI15EILcjkgsHLWxj69bMc31JW+hiH4dCHj+Lqp2fuCgEvtsdX7h0AgGu
 iDhz4EFYulNrjLajvUYK4UYhzS4rwVZmUzENK+oGTcuxk00pctUlovRZQl/U1nQBbuPJ
 FUvo0n8vp7Zed6n57DsKcFn/9AQY3yhZF5Cu6VSNsGj9uopYsqq150HYHESyL4/gdb6P
 NFBnHweFnM1t10bQvkKSKPWnSg5MfOH05Ff5jBUBivCQocAvn0aIEqUbEk3Q8b+M1Yv4
 zkoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QuT8w9ae
Subject: [Buildroot] [RESEND PATCH v2 2/2] docs/manual: update pkg-kconfig
 doc about <pkg>-show-fragment
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
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
