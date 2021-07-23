Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E3DC4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:33:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06B4660BD3
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06B4660BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D51994060B;
	Fri, 23 Jul 2021 20:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ma1KaU9nJYKe; Fri, 23 Jul 2021 20:33:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 241E340615;
	Fri, 23 Jul 2021 20:33:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3788D1BF3FF
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3455483B5D
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uNyYQ3PztH4d for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 20:32:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4890883B5B
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 20:32:58 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id z8so3601193wru.7
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 13:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gk/0VsLdOZzKSQrhJ1zawJVrL0LVsSSERsbmulRqor0=;
 b=LO5jY/LbOSirI56AkaHU6vbBss9yr7shWHkRs/xr7EWQSYCxehpPxxJYHH0OheExAK
 MPWyIyCXzoqc24nLlcsnMbJ8sPjimQravYXu0OZto9B8ryCFbvTzn9XtEN5kX80NmNsD
 pv6qbCIQ6KxcpLvm0VbiLbMWzSjo36kfhic2G2Qf0Jv+MsXYz7MwcqIGbfTYtb5LJYv+
 2YczOnrntSSezv/qVpKjmSF+OWjK5cVr5+c7sCDkfrNLXnlH251uL4nFuObLeTXdrJBR
 UUrjCvMRV5BmtDWGhnPyr4fYThZ4YzMA/xt2PaxDLjfBD+uWm3B9AJPHaMVB0i7tw74c
 OTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gk/0VsLdOZzKSQrhJ1zawJVrL0LVsSSERsbmulRqor0=;
 b=o0tOcj0n8gh8wT3E0CoxZEOSca86BCo9orb83jHTCOpKNiFl73epyMVQ4O+IOqRaEO
 ajUgKhc+QiaY5tfXfdVbTFSCA+9kZa2m/337yJHMVTbPm6rVaK92jz/iQFEjTjpJmBW8
 Hnm/PCQ0Vs6ErLzwLasv5tYM9GqMosnQD6eRRn8pmXJnR3NLw6uSlwcaTj7lfOTrHnXl
 fvf+nrMu4Cq2akmSU56Nev+XNyiH2k50AbTnb8v8JlZ2M8YvvIkU0r2Mk27/yhZFUHNd
 xhOSGBiCngAUAtMpPF4NMOXtDqz1WyOtr2U62BN37aXtNrPcUTEJ12Gbf0Xex7v3/saz
 OX0A==
X-Gm-Message-State: AOAM532IMmDTKovMQMwoOizWB2jauDCdPgdMfM9YXpnc6R5f5vVuWcwi
 yoHnoj4N2jnNmx8mQ03NQ+fIs3+BJW0=
X-Google-Smtp-Source: ABdhPJwoBDu9DMWAvIHYe8SLTVxeqPTMpArWuJ7lgAhZQDow+4E03uefu+xPM0rXJGnAx9u+SvsJFg==
X-Received: by 2002:a05:6000:10c3:: with SMTP id
 b3mr7010545wrx.271.1627072376503; 
 Fri, 23 Jul 2021 13:32:56 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id n17sm2128422wmo.18.2021.07.23.13.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 13:32:56 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 23 Jul 2021 22:32:36 +0200
Message-Id: <20210723203242.2531909-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723203242.2531909-1-francois.perrad@gadz.org>
References: <20210723203242.2531909-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/9] package/perl-http-message: bump to version
 6.33
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-message/perl-http-message.hash | 4 ++--
 package/perl-http-message/perl-http-message.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index 2728a2690..62cf0588a 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  703551d67da8ba7ecbe0955d7c7a325d  HTTP-Message-6.32.tar.gz
-sha256  ac32960ce01a3ae4a950666736f2bd633fb694c60ad545adaad9cb5fe5c12278  HTTP-Message-6.32.tar.gz
+md5  e291f19e9532ffb7d1c80eab786bf0f2  HTTP-Message-6.33.tar.gz
+sha256  23b967f71b852cb209ec92a1af6bac89a141dff1650d69824d29a345c1eceef7  HTTP-Message-6.33.tar.gz
 
 # computed by scancpan
 sha256  1379396dcd2291f17a741d2d6bf14d379f5f2ab91b3c7e7b92c5f82856e2d7ac  LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index 1cdac5def..18e673ae1 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 6.32
+PERL_HTTP_MESSAGE_VERSION = 6.33
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_LICENSE = Artistic or GPL-1.0+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
