Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00B9ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 03:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE6184256C;
	Mon, 12 Sep 2022 03:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE6184256C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hZDOEG5syzin; Mon, 12 Sep 2022 03:34:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4C5341DD6;
	Mon, 12 Sep 2022 03:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4C5341DD6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FC9F1BF9AD
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 03:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF78D84012
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 03:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF78D84012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0GedPczz0RWK for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 03:34:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5EDB84214
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5EDB84214
 for <buildroot@busybox.net>; Mon, 12 Sep 2022 03:34:33 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d2so13311166wrn.1
 for <buildroot@busybox.net>; Sun, 11 Sep 2022 20:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VA7R4myhbWIdPB2rhVYZq/ip9tzpsyLDTWFvsgBwEvA=;
 b=6dPf2Cla+z2qLdvmQotrJ/MunJbQGb0++maxWZicGS1Txk0OVW2sVzjeSEhHdjletQ
 rLWKBrbyeOgVJywE1F3fGR9gT8dHNhtDo2ZtzLe0bl7vBCClgz31iNLe8wg/E15A+Msb
 CUYrnUiGSFe/exgXjFWr7vttRtiEI4ycl4q3bcnSf3LaQ3R4CN5uneip5EDXqFbh8zm8
 evEtqjKAzLF0WoHXAY3JT1umWT+7GZpAIKU+arWe6QLe02RODRGYGEljJCr60wt2PbiO
 6iLd1dw1AfZob5AVSbkbO7Vj7En9c5HWN4HOoJ7gCPxJYyGd+gk7UX90sL3q07/G20xw
 ndaQ==
X-Gm-Message-State: ACgBeo3A0QI06NAvVpmxBOlWGucbb1nOqKVERyjbTqyzPfL6B8CkuvRe
 SmE8TEwSiWG3EPANwBFyiCnPuDInzBU=
X-Google-Smtp-Source: AA6agR7fNUn4VehCJpUMRsmJoqWmwdDFGJImzJ3MdWwrnIF4FeTZJkV7IcUXk5K2NYqT7nsIkbM5CQ==
X-Received: by 2002:adf:d1ec:0:b0:228:d9ea:cbd2 with SMTP id
 g12-20020adfd1ec000000b00228d9eacbd2mr13800101wrd.609.1662953673200; 
 Sun, 11 Sep 2022 20:34:33 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a5d60ce000000b0022862fd933asm6009588wrt.96.2022.09.11.20.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 20:34:32 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 12 Sep 2022 05:34:15 +0200
Message-Id: <20220912033418.2587016-6-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912033418.2587016-1-francois.perrad@gadz.org>
References: <20220912033418.2587016-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=VA7R4myhbWIdPB2rhVYZq/ip9tzpsyLDTWFvsgBwEvA=;
 b=qA2/EwCb/SGblpiM3b1eN+vp2G++rIsrxWRxMtVDDF4fUFCyCsbNim6oLUkBAuTQpc
 1S0Q9rEDPB9Fl7dPjFWx0hjh7Hr1vrpRktC1dGM9fWZjPeOlF2ifrJINyZWltzbYGmmw
 FaqlnA4H7l+3/l+UA4dQ7arLRcABniJsEciGNERiuswQXDzZdXLdVXk3Rxk6Y8D6EwWj
 R5ZGbaR+1k57J+gDfJ9yEhzqe8WKEnqWuH5Br/PygGO+rALDANPPd4qrsSC+Pk0tm5Vh
 q+Upg3oFAAX1aQfRZIoTC+4s51lw0KWHjTFzPxJEcMIxUTsG6ZK3tI/cbso0SQbYzOhu
 9V4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qA2/EwCb
Subject: [Buildroot] [PATCH 6/9] package/perl-net-dns: bump to version 1.34
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
 package/perl-net-dns/perl-net-dns.hash | 4 ++--
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index 1af14e2a4..52f2f2bff 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  f3ba5295ee588d25dabc74a2ecda296a  Net-DNS-1.33.tar.gz
-sha256  5a40e7cf524e4bd2c33cf03b82b47d5308b712083aa5ee180b0b5af54c71fbd2  Net-DNS-1.33.tar.gz
+md5  f10276a44ce157cd5f709be4c70c34a8  Net-DNS-1.34.tar.gz
+sha256  de756e3fb6addbd32beafc869c4dd1c6a0b3783c5ef56dbefc6809443a4b1d15  Net-DNS-1.34.tar.gz
 
 # computed by scancpan
 sha256  1e44fcf65509b47a251eda0ce1f8bd6aefa13517e38cb1e95b8d36120fb15452  LICENSE
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index fa7b50c02..cfb16d8de 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.33
+PERL_NET_DNS_VERSION = 1.34
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
