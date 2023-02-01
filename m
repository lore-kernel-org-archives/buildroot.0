Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7095C636CC
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 02:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D7B860E46;
	Wed,  1 Feb 2023 02:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D7B860E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uvQhaqpFuCkT; Wed,  1 Feb 2023 02:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF54560E42;
	Wed,  1 Feb 2023 02:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF54560E42
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 399071BF2A5
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 02:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AE1E417E3
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 02:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AE1E417E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YGegbYxG7bix for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 02:38:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85F8441812
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85F8441812
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 02:38:00 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id i17so7212595ils.11
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 18:38:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F3bC1/v/b/bIuv4F4x/3b1lWNiwT36ApycK8VQw7nIM=;
 b=ZWqU0uZYtKIS3isJEt/DvMdUkPbTBfWXwhL+W4OIEV8qovXgQiFHY/8KPRZW2IHlKw
 Ll0dPSP3JphdEPVxVdGOqIi7xcHSyM7sSU0L9M5gMVPsSfsS6VF7xyNR8gNRMgvoJOk5
 z1mfbQsTRV8uNzuRZNHZcIOPnO7JUC/FtmgUB/lFTCqVsMmn0e8OCXNfbcrdm+m9CRyp
 zGBEJOrvw1sZiaFY2TZ1GcjikJPk+2ymrO6V/w7YRAFX9TA+SQng6ASD03cTaJIKi8TT
 q+kXaLXkYFcgeMdZHj19+qvzKuwPhR4kqlUHE4ViY7f/E38F66YoaNJOb2LNw8WC0PLh
 GlYw==
X-Gm-Message-State: AO0yUKWQQaLm3874juWyUHzjOIixdRjEI2Mu7NWVIzVBmqGP7GqTAXZP
 zQPkSlK1SA3iWPyYlxUhJJ/S+yvobX8AOw==
X-Google-Smtp-Source: AK7set8829Y0lPOPVSG00cJjHJPtLi9lfYYeCvNMQNgtAAGys7scP8LTM+qBXZoQVQvTrvRHGpYxsg==
X-Received: by 2002:a05:6e02:18cf:b0:30f:8a2d:87c7 with SMTP id
 s15-20020a056e0218cf00b0030f8a2d87c7mr664109ilu.2.1675219079413; 
 Tue, 31 Jan 2023 18:37:59 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 p18-20020a92c112000000b0030392271239sm5376028ile.8.2023.01.31.18.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 18:37:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 19:37:56 -0700
Message-Id: <20230201023756.1418443-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201023756.1418443-1-james.hilliard1@gmail.com>
References: <20230201023756.1418443-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F3bC1/v/b/bIuv4F4x/3b1lWNiwT36ApycK8VQw7nIM=;
 b=bA+g+N9VepmI2GbVkSkaKZm/A9eQB4MvtF+epaZe/1EtoYygSZC6/bmlOoXoi5FukG
 xwZ+0zz/Js2ZdESg2U3pYekKbKaDFe+HaqRJCuviuFFT3A9UadLjE0z/bHP4SR8Xjnzj
 aoRwt1gJdGHgS05jxIJFSzEB/ERoVUZ+Oan9xvbfm41v7nM/pqPwQKTgSyQi5TNGGu4h
 S1uht0BVUuFWTe+txNV/ojbtiUWzDTvOpeW23o+tqV7s5xdG0o/GEA7jCcxsjYxyCicJ
 SYgR99Vyh2BJ9jV/vhDXEYysKQvwJW7VusaAb8vvgvOvQCq5sM4jDPMaaIRzv8YttYUy
 kX+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bA+g+N9V
Subject: [Buildroot] [PATCH 2/2] package/iwd: bump to version 2.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index e7971cd637..be048b3da6 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  9fd13512dc27d83efb8d341f7df98f5488f70131686021fcd0d93fc97af013b8  iwd-1.30.tar.xz
+sha256  dfeada6d1680221fb128dc6be50fc2d6b40e314b98458acbd696418f8da5c570  iwd-2.2.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 5ffbde334e..b0a2f6e9ed 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.30
+IWD_VERSION = 2.2
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
