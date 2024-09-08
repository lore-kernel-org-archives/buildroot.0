Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465C1CD4F4C
	for <buildroot@archiver.kernel.org>; Sun,  8 Sep 2024 18:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D441F8109C;
	Sun,  8 Sep 2024 18:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKClReaQkIyS; Sun,  8 Sep 2024 18:15:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21E3380E66
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21E3380E66;
	Sun,  8 Sep 2024 18:15:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E8EE41BF3D7
 for <buildroot@lists.busybox.net>; Sun,  8 Sep 2024 18:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2318605DC
 for <buildroot@lists.busybox.net>; Sun,  8 Sep 2024 18:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6x6yoJ0aq9Y for <buildroot@lists.busybox.net>;
 Sun,  8 Sep 2024 18:15:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A3D95605E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3D95605E6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3D95605E6
 for <buildroot@buildroot.org>; Sun,  8 Sep 2024 18:15:13 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8d0d0aea3cso242453066b.3
 for <buildroot@buildroot.org>; Sun, 08 Sep 2024 11:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725819311; x=1726424111;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=swQ8T/57ZqwaFWwGV6mf0Jc6dm65gbS/fASo1yOudrw=;
 b=s8bH/tmy0ussX9uhh+l4dnAdB6FmNRd6iWCMnnU6DlfQQgqzRpLt5euIWnAwFiIvKG
 jwtHK/6nVfuNmjUZcjGdctBwHh/Sq5EuxC9sgNJFsVnPIJleGM80/Zw+EjEOzuVnp2qU
 hR0eO1a4SWWFQKO4gvFsqYPaeo60QKI+IbwrdWhoV4EzxeuzJ3fJo0r0ZfMRfLtkI5Tl
 pjOUDWK3BiE+LP5OLLvR0N1IXbaoq6VQ2bXPjpymEfgQdvTJBAvl/ehXuhVxTcQ5A7Zo
 Osj/4HVnQYA5VKLqAGVoNsh4eNP1tXRYktkGkTihcADVgmySrkq5Yt+HxXEE4Od/H4F5
 ZWJw==
X-Gm-Message-State: AOJu0YxQJAON8DW/6Ors9nI4hI3x+ROefs8K9w7kgnKP52pK+WpjeeVw
 MaxZhfXkaUerYGomDflO88IFNDnX23JlcYWim6Qu54gpUBY/6Sd0t0d0ejH/e+oo4xqWV/B8WPb
 0zWU=
X-Google-Smtp-Source: AGHT+IEyxOxPQBecqQMz5DgFQX7gmatmmTxwSQjGFq4t7neT+WpAQJLitdx2N9UPDfJTuUm6TY4MNA==
X-Received: by 2002:a17:907:801:b0:a86:9c41:cfc1 with SMTP id
 a640c23a62f3a-a8a885c47bemr640612666b.8.1725819311111; 
 Sun, 08 Sep 2024 11:15:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-4-102-18.retail.telecomitalia.it. [87.4.102.18])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d2593dbb7sm234484866b.56.2024.09.08.11.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2024 11:15:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  8 Sep 2024 20:15:05 +0200
Message-ID: <20240908181505.403963-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725819311; x=1726424111;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=swQ8T/57ZqwaFWwGV6mf0Jc6dm65gbS/fASo1yOudrw=;
 b=BJIPZuAncMT2CnLNZeBkuI8B1tpH3qcf2LQ/8oanoU571dqZSeg7mGRd7GlpZT7F6m
 /KeDbYuqwIRZ8vpctEG7gQtjrlhjNBX0LhcJylO++i4Agz5kuYuJbljBDnR53DcfDW/p
 7aaOCdOTBAwsymA5AjyF/kho6p4tbEVuO4e5c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=BJIPZuAn
Subject: [Buildroot] [PATCH 1/1] package/rp-pppoe: fixup download URL
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported in [1], the download of rp-pppoe-3.15.tar.gz is no longer
guaranteed from the download section of the project.
As suggested by Dianne, the maintainer, for now we "can grab the tarball
from archive.org and then figure out a way to make it available to
buildroot users".

The idea is to later submit a patch to bump the version to 4.0 using the
official repository, which is https://salsa.debian.org/dskoll/rp-pppoe.

Fixes:
- http://autobuild.buildroot.org/results/8676456feec9dd401152887101ad1a9ce96cb769

[1] https://dianne.skoll.ca/pipermail/rp-pppoe/2024q3/000652.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/rp-pppoe/rp-pppoe.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index f50f1e5a1fd1..fae66894c103 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RP_PPPOE_VERSION = 3.15
-RP_PPPOE_SITE = https://dianne.skoll.ca/projects/rp-pppoe/download
+RP_PPPOE_SITE = http://web.archive.org/web/20220523050110/https://dianne.skoll.ca/projects/rp-pppoe/download
 RP_PPPOE_LICENSE = GPL-2.0
 RP_PPPOE_LICENSE_FILES = doc/LICENSE
 RP_PPPOE_CPE_ID_VALID = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
