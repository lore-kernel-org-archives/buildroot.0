Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B8FC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 15:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D124280AB0;
	Thu, 18 Jul 2024 15:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypploxymkGZ8; Thu, 18 Jul 2024 15:15:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E602D80AEE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E602D80AEE;
	Thu, 18 Jul 2024 15:15:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 267FE1BF35E
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 15:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2057A400A4
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 15:15:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gjums1ZSGlbx for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 15:15:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.50;
 helo=mail-ej1-f50.google.com; envelope-from=bryce.d.johnson@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A03E4000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A03E4000B
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A03E4000B
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 15:15:31 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a728f74c23dso105587966b.1
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 08:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721315729; x=1721920529;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vd/oe6gYPRQxRv4Ky/D0qNB+wJlfidlk88xmIt/OHNY=;
 b=qc7OGR7uZxxaQ2J+5Fuw9/4eI7IdJJ4gEiKtd93o4O7WC8LMmyMTQMRSuoVKAKXj/m
 +JqXEmqbRUKMUXYIpcI+1Uw+6i/lqhWcUZWbjrb3VZ8SxpXOHHgbq7/URzT8+8r1PO8l
 csmgGLq3Yhsvar6nTKARZsf7WMikedcl+f1UzqhEAt7txXZsxxyxUh7D27BRM17fleQs
 dMRoAZtP6D7BxTst+7+lbuECat4uhuYcuvN6uHNjY7TXMwfqvA9wrTgEO+PqTdFSqqW5
 7DkymjP2QdPiayEI8DSEMZjJpDT4D99N1m63jdu0UJ331HbV2lWXmQHQcsJ95SeIuHUu
 oH3A==
X-Gm-Message-State: AOJu0Yzhrbnx13gvYjp+DJ5ZJjA1sSCqaSE1RVimSnqt/AO5KgElAT2N
 wBdZQ4mWrGvg9YibVIANpQ4IoXrvzCr0uba4x5y8yQ+vi8k1rdPza6q1JxIF
X-Google-Smtp-Source: AGHT+IGsRmxrZSQ9mzu/UmWTSGucCqSbmNWuqBB69/QVah3emSeEb7cVGaJ4kTRx3Rrn6WWiPjyBuA==
X-Received: by 2002:a17:906:d7a8:b0:a77:d63e:d8fd with SMTP id
 a640c23a62f3a-a7a011308f2mr357415466b.12.1721315728741; 
 Thu, 18 Jul 2024 08:15:28 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc5b48e6sm573049166b.49.2024.07.18.08.15.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 08:15:28 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5a1fcb611d9so816669a12.1
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 08:15:28 -0700 (PDT)
X-Received: by 2002:a50:9b5c:0:b0:58d:9b90:e0a8 with SMTP id
 4fb4d7f45d1cf-5a05beb57afmr3348623a12.22.1721315728108; Thu, 18 Jul 2024
 08:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <CADXxVSKBFjoub2ctkeSAzuuw2hbaMKwPw+xC=BG9z5+JJk7vSg@mail.gmail.com>
 <23725f14-d243-45da-b096-948c5e063aa7@mind.be>
 <CADXxVS+tRXXBbtVf=DXOtsH6BqbJgbKDZgQn206aS0sOMYek=w@mail.gmail.com>
In-Reply-To: <CADXxVS+tRXXBbtVf=DXOtsH6BqbJgbKDZgQn206aS0sOMYek=w@mail.gmail.com>
From: Bryce Johnson <bryce@redpinelabs.com>
Date: Thu, 18 Jul 2024 09:15:16 -0600
X-Gmail-Original-Message-ID: <CADXxVSLCUVvO1MwirtFrxfX8QFP4=N7S49xswD=j1oSrV=6PSg@mail.gmail.com>
Message-ID: <CADXxVSLCUVvO1MwirtFrxfX8QFP4=N7S49xswD=j1oSrV=6PSg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=redpinelabs.com
Subject: [Buildroot] [PATCH v2 1/1] package/connman: Remove wpa_supplicant
 selection for wifi
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
Cc: martin@barkynet.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Connman wifi works both with IWD and wpa_supplicant

Signed-off-by: Bryce Johnson <bryce@redpinelabs.com>
---
 package/connman/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index af3e1f69f6..62516d435f 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -45,8 +45,7 @@ config BR2_PACKAGE_CONNMAN_ETHERNET

 config BR2_PACKAGE_CONNMAN_WIFI
     bool "enable WiFi support"
-    select BR2_PACKAGE_WPA_SUPPLICANT # runtime
-    select BR2_PACKAGE_WPA_SUPPLICANT_DBUS # runtime
+    select BR2_PACKAGE_WPA_SUPPLICANT if !BR2_PACKAGE_IWD #runtime
     help
       Enable WiFi support (scan and static/dhcp interface
       setup). ConnMan detects the start of wpa_supplicant
-- 
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
