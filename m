Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307D5ECE581
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D227580FB4;
	Mon,  9 Sep 2024 16:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUm00k8XJvuQ; Mon,  9 Sep 2024 16:28:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C41681027
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C41681027;
	Mon,  9 Sep 2024 16:28:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B1751BF345
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0132F80E7E
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3kJYWzuQcJj for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:28:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCC4980EA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCC4980EA7
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCC4980EA7
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:27:59 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42cb5b3c57eso13370605e9.2
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899277; x=1726504077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XQ31nBzBnBW3RV19+t+303lMnLzJrwPgaJMAZZJjgN8=;
 b=hf+49CP11ltoKLmaDfvlJ+4GOwxOLpR0wpa1FrprKWwBSBdlOWN4exaxPffqMt0+CE
 M1/505XHijoM+H8hCCZZNZPPWWeVGOg7ZTP9EkMLzykR3HkHjit9EPbZ4QcvH0FZqET7
 DwyjAF/qMKOUieBcmg9XdoxnZq2YtTX5QrSsnDrychPwZ/wJ+GEDJMESevPRqczJosKA
 dqITce3a4s38GQkluVQn0iO3JDwHtAmvF+KWFwgS74jX1t00b/eAfiiVm237RHtDF9I1
 7Qmtms4ld1IxKSWvWemUHjIcfAf+lHjYCc177wbnKpK2d762wIt/9Zgoy5goK+bLe/0H
 +bKw==
X-Gm-Message-State: AOJu0YzANy0MDQudJQroKpQsB7RGZ3s+NXA/Mwn8/Cj6dHm/GHMXOyBT
 EABtmiTRbeyphIfo3jMI6s/UKYrTnJuiJSIKHOpVLg+A2KJRJ6j64ndHMoNLknL3hDPVeYPXSVR
 gXQ==
X-Google-Smtp-Source: AGHT+IHqV8d/CN3M5fcN2s6O2OMmMyx0g98POtQQk/jOfP44OJEPhyr8Pqxm0A53SaKA1NBQXm1k9Q==
X-Received: by 2002:a05:600c:3c8d:b0:426:647b:1bfc with SMTP id
 5b1f17b1804b1-42c9f9d385emr81171295e9.30.1725899276704; 
 Mon, 09 Sep 2024 09:27:56 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:27:56 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:26:51 +0200
Message-ID: <20240909162703.3439481-9-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899277; x=1726504077; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XQ31nBzBnBW3RV19+t+303lMnLzJrwPgaJMAZZJjgN8=;
 b=EBxVZpRdWee/QxfpIf2W9ep8yhQbe4+AWE+7Cfa6YdBni8aegOyS9+gIPuXjRNdSrg
 bk0Rqrs2r2JADApm65KJ+MkkoTVGUPxzHZrTH9Brf4F3MSZx2P8bmjfYM3I6EvdtVt+y
 HYIffMEoWJWalDROUkNUIKDHNFGl9ZqMV5qnq69pH2BYS4RMG4UomlYRQrTs9XcFroKq
 76RS1L/V1RzvxAW7IdGx5MQI38taMwzdb9DKi7ccIipvjHtNSuaOgGO2psh8nYzml4zm
 Ltz5GhU8k5SGHQlX/r4hi/uJxNHa4cfmxDP5Dy878Lt04Ycjp5sEJf+SgalsZZewTiUw
 E49w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=EBxVZpRd
Subject: [Buildroot] [PATCH 09/20] package/perl-mojolicious: bump to version
 9.38
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-mojolicious/perl-mojolicious.hash | 4 ++--
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index b1ff561f7..0dd34a483 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  8fba4deae54681d560c275c28803b48c  Mojolicious-9.35.tar.gz
-sha256  6a4a446ee07fca7c6db72f5d817540d6833009cb8de7cce4c6fb24a15ee7d46b  Mojolicious-9.35.tar.gz
+md5  0f1eba69cfdb8be36a8c6f0a30d707d1  Mojolicious-9.38.tar.gz
+sha256  9a9eb78663ffc4641af7c16a763411e05d9875a27d4f111d4944b690f9a1ef43  Mojolicious-9.38.tar.gz
 
 # computed by scancpan
 sha256  19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a  LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 4657d2792..1c0b52fb4 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 9.35
+PERL_MOJOLICIOUS_VERSION = 9.38
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
