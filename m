Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACEDC6FA8E
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 09:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C0BB60C11;
	Thu,  2 Mar 2023 09:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C0BB60C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ksWhmuWqQ1iu; Thu,  2 Mar 2023 09:23:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B61CC60BC6;
	Thu,  2 Mar 2023 09:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B61CC60BC6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44C711BF322
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 09:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E75240327
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 09:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E75240327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id je5o6g3USKUe for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 09:22:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABF7740025
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABF7740025
 for <buildroot@buildroot.net>; Thu,  2 Mar 2023 09:22:56 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id cw28so15755379edb.5
 for <buildroot@buildroot.net>; Thu, 02 Mar 2023 01:22:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677748975;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=plF2+Sfo9BKa36IHshUAQcJxp33CWkDnsrmo3zpJbtg=;
 b=P8m0nhNdCoaDfTsa13LZAG7BOAsysuv/aVA3ceFqaj9jjGrMK61CCfGknfmORcHCn7
 o1I7fYEUPat7nV9IISFXhctY7AgLX5HHt3O+UCG//4gTA66eAhC4p83rFdcXnrl8fB7K
 EEM4y4JeGX2htrFw9UrpqePANE+lsMiOR4uLuuQIIL9GwplnmI/djIVtOk6aUHHKyyRI
 XCur5aYm2eAGPkaicLR0yElFU52VIddiBf9CYf8vNJeUbVYTueHVlVQLH8SDOlELAmHA
 VsO+owZwA0nOm6BAYgkkADm14g8G2eouDm7vXybQu2gKx5rySw1Ymcd5bLljb3DNg5CM
 6X7w==
X-Gm-Message-State: AO0yUKXTgJrq8e5h2clMM7CBTD2LFenxl7I2f2wQJ/7dPeZ8Ya/gx2+R
 k7WO7M8KfElM48WEf2p5V/cTRtn2t04=
X-Google-Smtp-Source: AK7set+AY7hINsoRJGOIVHccm/8VnOu9elJpK9NeJsfo9RDGyfQpeJKdit7MJaYzGz45kn9z0f5CbA==
X-Received: by 2002:a17:906:9390:b0:871:178d:fc1e with SMTP id
 l16-20020a170906939000b00871178dfc1emr9210204ejx.77.1677748974880; 
 Thu, 02 Mar 2023 01:22:54 -0800 (PST)
Received: from einstein.dilieto.eu (smtp.dilieto.eu. [188.68.43.228])
 by smtp.gmail.com with ESMTPSA id
 a24-20020a17090640d800b008b1797b77b2sm6873216ejk.221.2023.03.02.01.22.54
 for <buildroot@buildroot.net>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:22:54 -0800 (PST)
Date: Thu, 2 Mar 2023 10:22:51 +0100
From: Nicola Di Lieto <nicola.dilieto@gmail.com>
To: buildroot@buildroot.net
Message-ID: <ZABq61t3vEixCwpm@einstein.dilieto.eu>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677748975;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=plF2+Sfo9BKa36IHshUAQcJxp33CWkDnsrmo3zpJbtg=;
 b=ixvCifMSGJ4dmkR53zGhf9T78Ii5ZJ1b3juILZPSVvCagsgymE6cv5iMa2wiUhaDbA
 ovahq9Q0kd47JDl1FYaTlWq8e4BFg6GOUoUsU/sIwv4s7h/pyIUAa/8uXq8FUiO/TXj7
 AVyGI1S2EH+Y0Ck+RXMCK/XXu31bHlPh/R6K/hG0FHql11Y2/W3XNoeLXcabnZBIotw5
 iRp5l3hSW3JmMjZ/BjPMcaVAJ00gk2p0jNDJF3any0PXCWNvaTKUysyfcwMxmiWbO8XJ
 BqCzHOlh6H54RiXC2eYDl18Ul8khhPZa5EBgEEziQsYy1tcQP8IKX77jCEhBXDY2H8je
 okpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ixvCifMS
Subject: [Buildroot] [PATCH v2] package/uacme: bump version to 1.7.4
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

Includes https://github.com/ndilieto/uacme/commit/fe91f46b620f8c58805fcf48cb4f4a793c8a47a4
Fixes https://github.com/ndilieto/uacme/issues/64

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
---
Changes v1 -> v2: fix patch whitespace damage by email client

 package/uacme/uacme.hash | 2 +-
 package/uacme/uacme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
index 6c71f6b94d..063b0b57ac 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0ec8e5bcb8ed2b532572ca4878d30b2a794f607b995348ebc176d566b64d73f9  uacme-1.7.3.tar.gz
+sha256  a638fe0878dba8fdda62f89e7a284243edbcd31b92c11b5cfdc7d3efd9547bca  uacme-1.7.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index a70ec3a635..9b2360937b 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.7.3
+UACME_VERSION = 1.7.4
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
