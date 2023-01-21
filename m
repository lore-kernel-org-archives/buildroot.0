Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8886FC004D4
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 16:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A54C82410;
	Sat, 21 Jan 2023 16:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A54C82410
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bBwQDcpHMmOM; Sat, 21 Jan 2023 16:36:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FE6681D9F;
	Sat, 21 Jan 2023 16:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FE6681D9F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 434A11BF41C
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 16:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BFF881836
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 16:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BFF881836
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hd04B95jPpvc for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 16:36:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3658782400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3658782400
 for <buildroot@busybox.net>; Sat, 21 Jan 2023 16:36:01 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id k16so6162141wms.2
 for <buildroot@busybox.net>; Sat, 21 Jan 2023 08:36:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8FyYIKNyySP8oqqME5TeTAfOJsKj11bjWxReyEToork=;
 b=YLliFqWIr5M1uF98dXLRNp6ZX74yP8MNDVXz6JVUCiij1PxWYpO/CrflCkEdp8ii1X
 qEtFEUquVIaXS0FJuiRpKqF3odfpxBSnyJOE4n4pGv+MQREaM/7eFlO2DOLFfReVr642
 x8z7Qa2RqUHzaGURgkDvn/7R41JXNMWieRg+Xows//kXHA3Px2JjbZWreZrSA3gskCds
 MUXjZP3qTKhWHMumF7vaFuFWwsN9uqdqU/QshJ4XBqUclFwJmPtzgfUOQU1VQTMGvsT8
 OW311i3R5E0+VDPL0YJOku0Aq07mpHyCo8q90dC8jxayQxLtWv+a25BIJCbcxWUbTN+c
 WiVg==
X-Gm-Message-State: AFqh2kpOra+49e+m73fDmO42ag2GHLvfN4EDqTje3ZZQ+3XVp+LNZMlS
 rqmtKA7SFXza6jfYrNAtNRd6hdOlnrE=
X-Google-Smtp-Source: AMrXdXud+j9Onr5mY9bpyfk3TmOFSnSJzglXYaTBhO/yvYXkEwgEJxZe4BnnV/91N2OAAEBDdQo71A==
X-Received: by 2002:a05:600c:46cb:b0:3db:1afd:ac45 with SMTP id
 q11-20020a05600c46cb00b003db1afdac45mr12676454wmo.7.1674318959391; 
 Sat, 21 Jan 2023 08:35:59 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 bi16-20020a05600c3d9000b003daf89e01d3sm5648794wmb.11.2023.01.21.08.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 08:35:59 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 21 Jan 2023 17:35:34 +0100
Message-Id: <20230121163537.147981-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230121163537.147981-1-francois.perrad@gadz.org>
References: <20230121163537.147981-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8FyYIKNyySP8oqqME5TeTAfOJsKj11bjWxReyEToork=;
 b=f4DuQBxzJSdocPlx5qG0vPdezQ2x2s69zEtNo/lEv1XVvn9QoAFT3QtM3BD3CdhGb1
 hX2Ratb7BlVfTcYB4ydhKyZ7PlHkckktnaoM/sDYjBNN/Y/12wS82QZnrCkmgFe38Eo8
 ftqXIAkZ0R7CDP8UpqNBW4jMB2q2vZh6t82Egfh9LdtbWn3iWpV9fniOP+sgOnzTx+oQ
 uDXnQfUU+jS1bLiDguusDX7eUHTfCUn2AHQy7MUoq+G6IO2ymxeZPUz3nc6MRKFaxuC0
 8/OSCPp22DbINmq7gCiAjJkxYp1v2H8Q+o2YAFIRAHflGnHJWvnFyZqRFIq1I8vx1hRz
 UWCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=f4DuQBxz
Subject: [Buildroot] [PATCH 4/7] package/perl-module-build: bump to version
 0.4232
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
 package/perl-module-build/perl-module-build.hash | 4 ++--
 package/perl-module-build/perl-module-build.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-module-build/perl-module-build.hash b/package/perl-module-build/perl-module-build.hash
index 09bc5f374..a2181290e 100644
--- a/package/perl-module-build/perl-module-build.hash
+++ b/package/perl-module-build/perl-module-build.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  066b193e461d7dfe1eca17a139353001  Module-Build-0.4231.tar.gz
-sha256  7e0f4c692c1740c1ac84ea14d7ea3d8bc798b2fb26c09877229e04f430b2b717  Module-Build-0.4231.tar.gz
+md5  144885f1cbaf9420017bbed696ec6b83  Module-Build-0.4232.tar.gz
+sha256  67c82ee245d94ba06decfa25572ab75fdcd26a9009094289d8f45bc54041771b  Module-Build-0.4232.tar.gz
 
 # computed by scancpan
 sha256  f35ac2cc6b808a38c42c2d230b875217b0a24bb51e5a497ebb630cbb3d806c3e  LICENSE
diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
index f5cab3689..d95a30647 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_VERSION = 0.4231
+PERL_MODULE_BUILD_VERSION = 0.4232
 PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
 PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_MODULE_BUILD_LICENSE = Artistic or GPL-1.0+
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
