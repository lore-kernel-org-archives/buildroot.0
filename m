Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362A0C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 10:08:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E01A661440
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 10:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E01A661440
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0D016058B;
	Tue, 27 Jul 2021 10:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R-lqG4aK0Kc7; Tue, 27 Jul 2021 10:08:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E862600B9;
	Tue, 27 Jul 2021 10:08:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6CAE1BF279
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 10:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95FBB83925
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 10:08:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tvY0-tJfiLZ3 for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 10:08:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5A3B8391F
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 10:08:35 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b9so13660395wrx.12
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 03:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z8iZXpaI9Cc99mYLzAwaQIHHk1xw/TK4/57Zckmnqjc=;
 b=B+63823Ph5tY/thbot68iAWZzLjdZj7fhXlFBrHHQLtwfK2RzDupCdN6GZZRkDZE2H
 aXnRqA76d9v3NkFU5OU7IDs//3vgy+dDP9dTujBYKa7JWS1iKKcKNok7to+goGTd1zK2
 LafR056ZVjNKz4/4YA5XSl7Xg+vTVuNUpLTVos2UKw+qejwHqtwYr6D3/ep2+OM+95sQ
 ZiqDua3mq+C7d2yxDkj0JL4EbGW3rOjKKoThQ1otmfgc4Tk4Ye8Ne5GQO+7Q2dJZA84v
 ypJxTb7jF10VJpVeQw9haIDfE+j76YH40Zuino3Rm0ErXlZ3GRCHv8DWUYllm6rU+3KQ
 hGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z8iZXpaI9Cc99mYLzAwaQIHHk1xw/TK4/57Zckmnqjc=;
 b=UYD1y+O/kgw3G8iAAqnW+3Uh/fF0oHZ65i9/KU/zpcqBVpbH+h2mmiJ9NvOEhdM1aa
 pIcypK7Ju+eMlnZQ7aWRH9JNQhtTAnWXH842FoEtI+Xy47jjBy7VnWwQ12YM4IjbN0na
 WOiIkVOmWN93Xu3vcsSUbjqO9t+saj6n/8Lk7cSbh0ZLWQjo5T4PCnrlFsDOHufS35mc
 yC+ZQTj5JShGHvMuS2ZhAwaGEJpyo+h4tP8LNUdMyvpHyoOaDhu5JTtc1Fc/G2zav9cs
 uccg5gSV/Gsc4mALwiQ9vN+i5kG+zSEU/R9QTdkK3Olsb+HgTqf7Jkc4hGvC4VWkIVpf
 7GqQ==
X-Gm-Message-State: AOAM532h0Z1lpzaXYQ/1wqarGdnUK61eYVJu3xiyFQ3MBUMcdGfOSH+o
 omBgozaE7VpgqmyUUEHD7P+I5wPzqlH6ig==
X-Google-Smtp-Source: ABdhPJzDmKVg7oNjsc8+EqlrBmvykFfUg3gIi/f1Zc2uEEjLFc+cNfhROVUGluIe2uyimsBKJmvxJA==
X-Received: by 2002:a05:6000:548:: with SMTP id
 b8mr24199083wrf.159.1627380513490; 
 Tue, 27 Jul 2021 03:08:33 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id l2sm641806wry.32.2021.07.27.03.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:08:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 12:08:04 +0200
Message-Id: <20210727100804.2317597-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/whois: bump to version 5.5.10
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

https://github.com/rfc1036/whois/blob/v5.5.10/debian/changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/whois/whois.hash | 4 ++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 699616ef1d..1478d60697 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20210328T030002Z/pool/main/w/whois/whois_5.5.9.dsc
-sha256  69088241ed33d2204f153c8005b312a69b60a1429075ff49f42f9f1f73a19c19  whois_5.5.9.tar.xz
+# From http://snapshot.debian.org/archive/debian/20210606T204545Z/pool/main/w/whois/whois_5.5.10.dsc
+sha256  2391037b079695d0e9fd3c85ab021809a539cf093d25b6c51ca65019a54158dd  whois_5.5.10.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 53bbe85f08..c5d0a6f2ad 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.5.9
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20210328T030002Z/pool/main/w/whois
+WHOIS_VERSION = 5.5.10
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20210606T204545Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
