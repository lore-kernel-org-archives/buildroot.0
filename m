Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E29C433EF
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 16:15:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CF68611AD
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 16:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CF68611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DBDB60AD5;
	Wed, 10 Nov 2021 16:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dZL4Q5L2yoag; Wed, 10 Nov 2021 16:15:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFF5A607BE;
	Wed, 10 Nov 2021 16:15:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E7B91BF318
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 16:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8990B40389
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 16:15:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 93IJjR-cy7al for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 16:15:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FDFE402DF
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 16:15:09 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id i11so3017288ilv.13
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 08:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9zNX4R/Mxbi35a6SkhOHOrrogHqivfzZTY31aiHh6gY=;
 b=gIZnLTsJ9xpiIkG6+qHh+6MLPACafEnXpEMbFM8sON2e51MTX/CLDzdpKqJFIYXb7k
 fO6l9+ksgN7i+PE7nu9wN7u1SkLlpCuWqD+07GX8Gronc/ncKHAQp3T4Fwu8YILXEYCP
 JLQ+uPAhdr0wnAqctwjSAxFw5vZc232HjRTDlsC+Cs/53pUdSjguo2RWvucz7VXDfbCJ
 XVj3WcBTfKTsLvl6RObjoxZ7ugWtMotbbx2qA96TVhb8u/8Ec8zAOQ/GLWnQfslyF8fO
 qyGk2XXTQbsH/MbHtnZt3nznHOMVAaZznIfeefjC+O320rkestecFdHcbsHC9Btp2Bu1
 PHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9zNX4R/Mxbi35a6SkhOHOrrogHqivfzZTY31aiHh6gY=;
 b=Kob8XdSS9+Rrtk9CYbp2z0/Naf9OWHWTYtS0CVs+N4uu4PnUHBCj/FV7Om0WuYlDts
 xUscd8FwWP604O/NtO//uUqjSHGDbcaFBf2iRpvUXkN4zEJ6mUyNR3wOVmBIx/or1WxQ
 7z9ZLoMXHBmQpuBmHHPHmIGHosPURGaPyR5XZubCXqtv2SMV5W26fY/gFVAecyaw7XNG
 iohEM9ykLgnOGgl4VhJIYCK2d8ds19G8Efk+yBWeLiSsBg7wG1DjnmLp3TbhmnPTEYTH
 kI3tUQIL8SjHYU/PEJiRwm2a+LhyuX+55i/8+gXnTl6+D0zgKO5gRl5nuUgvYxFkZoWQ
 mg5g==
X-Gm-Message-State: AOAM530oL8N52yS4Kp/OxE9bkMeGuuiexhMGOd1po+dgqT6jfHNznyA0
 3wQkvM//fUTmWeswmbphqdy1N+qAI5I=
X-Google-Smtp-Source: ABdhPJytwd3XKSc2FINkLkNp7w2Nev1XEGc9HVSQuwrLPNVuwfB4hpUbF4rPZ9AdxhUzhZfnNq4pOA==
X-Received: by 2002:a92:c569:: with SMTP id b9mr131603ilj.39.1636560908001;
 Wed, 10 Nov 2021 08:15:08 -0800 (PST)
Received: from james-x399.localdomain (97-118-146-63.hlrn.qwest.net.
 [97.118.146.63])
 by smtp.gmail.com with ESMTPSA id i4sm237672ilm.9.2021.11.10.08.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 08:15:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Nov 2021 09:15:05 -0700
Message-Id: <20211110161505.74745-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/meson: disable meson wrap downloads
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We don't want to allow meson to download wrap dependencies as this
bypasses buildroot's dependency resolution.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/cross-compilation.conf.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
index 37b49eea3b..7a7ece97ae 100644
--- a/package/meson/cross-compilation.conf.in
+++ b/package/meson/cross-compilation.conf.in
@@ -17,6 +17,7 @@ c_args = [@TARGET_CFLAGS@]
 c_link_args = [@TARGET_LDFLAGS@]
 cpp_args = [@TARGET_CXXFLAGS@]
 cpp_link_args = [@TARGET_LDFLAGS@]
+wrap_mode = 'nodownload'
 
 [properties]
 needs_exe_wrapper = true
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
