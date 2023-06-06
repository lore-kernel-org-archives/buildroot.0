Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C03C7EE24
	for <buildroot@archiver.kernel.org>; Tue,  6 Jun 2023 07:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D08B7415C0;
	Tue,  6 Jun 2023 07:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D08B7415C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cgaLiaXOfDD5; Tue,  6 Jun 2023 07:01:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AD86415A9;
	Tue,  6 Jun 2023 07:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AD86415A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5590E1BF3AE
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 07:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D430415CB
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 07:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D430415CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B0awrUhOH62q for <buildroot@lists.busybox.net>;
 Tue,  6 Jun 2023 07:01:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24CED41558
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24CED41558
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 07:01:34 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id
 2adb3069b0e04-4f5f728c4aaso6377339e87.0
 for <buildroot@buildroot.org>; Tue, 06 Jun 2023 00:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686034891; x=1688626891;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IPG8rlhVhKpkzbLZ3Guf0Y2awV5+RQF12zmEKQtVruQ=;
 b=Eh/p5gI0hGjfPXsIgJ91Qu79fOKWQpvYD/GnsvkVXOvqunEacrxx64QVm/xHWvvPiv
 0CkN33W/n89h/564j3Xch5mzyABJnwbbKOWKs6wI2L3ZOSDrpptKd2ulggKn/hB/HwZN
 cmpY6NCQX2pjKfhGngD4thI6zdFBNm+3bd3geY6I1Bj8o+9QF13nwbjmb1bAEFzOBzJ4
 ENzV8T7158Age5jDY8zPWqW0bZAV/XS1wzV//nDa4tbSDUZeomG1a3DMWeEzlmCAN9tx
 HvV2FyNuD0UuNE0dcWqANYATEaIEM5vyKZ/ruUV5UZPrCvUND40wd7fFX2DDwca1E6zJ
 +lUA==
X-Gm-Message-State: AC+VfDyP951qTMiqlVZm7ZEo2n8pntj+816Px0VpCR8MF2uTtkdIGJNd
 PurAZIHWY5eW6gEpoX22N4bhMN9FdT2vpQ==
X-Google-Smtp-Source: ACHHUZ7GP3W7mCgyqlzI9QQAkLKomS4GqxYi+L2oEGqJqhiEq2x1NQJIr+MWJIo+G4JZFrtx13uoOQ==
X-Received: by 2002:a05:6512:131e:b0:4eb:46c2:e771 with SMTP id
 x30-20020a056512131e00b004eb46c2e771mr5125108lfu.14.1686034891035; 
 Tue, 06 Jun 2023 00:01:31 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:21e:3500::522])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a197604000000b004f608eb50d1sm1336684lff.299.2023.06.06.00.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 00:01:30 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Jun 2023 09:01:25 +0200
Message-Id: <20230606070126.165827-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606070126.165827-1-troglobit@gmail.com>
References: <20230606070126.165827-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686034891; x=1688626891;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=IPG8rlhVhKpkzbLZ3Guf0Y2awV5+RQF12zmEKQtVruQ=;
 b=PmP5oZ08l4fjU+zubupnFn+M3r6+XzmPEWdLld5CbFfUJVY69SWbA4dU8l60YjLCj/
 WIymI1LeDkNhfundRjDUHco6ND9GnGpLXDHRmK6bK98xBA8H22Z4OG2Y4/PH2R8r5IxC
 lj0eh48NcR5XrwjGGQTLZGnZWbVf3kcbjw+9HaNMnxC92ITlL3n8YAruzFh/CKF5C5xG
 fJn3UHglQVgzQXlIP8PLfjjXLGemFg3cT68sN6BvoIs3Y8wol0Ei4v27ooM+qUbsp/4V
 oE9PKKz63OrXh4XkaQq8m7XR/twA01YtJhud0WOWTwoDTQ4ewJxO/2EDtF4FVQbiNC6e
 bdFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=PmP5oZ08
Subject: [Buildroot] [PATCH 1/2] package/inadyn: bump to v2.11.0
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream ChageLog, summary:

 - Add wildcard support for Cloudflare
 - New DDNS providers from DD-WRT;
     - goip.de
     - myonlineportal.net
     - desec.io (a.k.a. dedyn.io)
     - domaindiscount24.com
     - dy.fi
     - do.de (Domain-Offensive)
     - Domopoli.de
     - inwx
     - It's DNS
     - Joker.com
     - all-inkl.com
     - core-networks.de
     - dnsever.com
     - dnshome.de
     - dnsmadeeasy.com
     - dnsmax.com
     - schokokeks.org
     - variomedia.de
     - udmedia.de
     - moniker.com
     - dyndns.it
     - infomaniak.com
     - oray.com
     - simply.com
     - mydns.jp
     - myonlineportal.net
     - namecheap.com
     - regfish.de
     - twodns.de
 - Support for updating both ipv4 and ipv6 address for same provider
 - Add new command line options -L and -S NAME to list supported
 - providers and their respective details
 - Add 'success' as a valid generic response to DNS update
 - Fix use after free in logger at inadyn exit
 - Use dynv6 'auto' IP only if we have not detected an address
 - Replace unstable api.ipify.org with http://ifconfig.me
 - Fix default checkip server for dnsexit.com
 - Fix easydns response code problem

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/inadyn/inadyn.hash | 2 +-
 package/inadyn/inadyn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index 2c0995babf..94af9f87b7 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  1727b6aae6727f99eba584e46950369d7b259d2ef09e5bc02566e9c3c1d6daf6  inadyn-2.10.0.tar.gz
+sha256  9ddac7b6b0a1ed372c6cb5afaec6bea927ab539db02c8536dd10d73bd1d37c95  inadyn-2.11.0.tar.gz
 
 # Locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 5a24c1eced..3e346fd769 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.10.0
+INADYN_VERSION = 2.11.0
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
 INADYN_LICENSE = GPL-2.0+
 INADYN_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
