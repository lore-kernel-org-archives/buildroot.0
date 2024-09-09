Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9319ECE579
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EBEA810BB;
	Mon,  9 Sep 2024 16:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYMUSnIhmwGK; Mon,  9 Sep 2024 16:28:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B7B4810CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B7B4810CB;
	Mon,  9 Sep 2024 16:28:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04CF31BF345
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 341B180CEE
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id girCMTayo-no for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:28:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1060B80EAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1060B80EAC
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1060B80EAC
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:27:59 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42cb2191107so12938895e9.1
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899278; x=1726504078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OJPHAUofiPfC+2TlIBu4ovoMlFFrHOn00GrJYtIk4EE=;
 b=WEk8h1Y105gCwvaTcGXl14CIRiW231gt1ahFWuOIAySDIpIv1Rau7h4gtE4QRqnmOC
 Fju1/BYaQD8CdlD8yJ+xPreMSwXtSLKE4nAkjnPV2k0Sp3PfDS87m6IpngIiUA1Nq+cr
 SRbD66CDNQLQ8OcQXMTWziSweA352ZZ5j1MUR1S3/QhlghvxqvJF3scwqnkXC1oSSb+Q
 sPq6lwggW4m/P9ERFlXcZ14ggYWh0omkS64p0vP3xcN4VsUihhnY1PB5FMJBzBfJPRv9
 0kd1QwjEaYuF2rzdhnMy2ZKQS5gY9FG9omz+AdxEY1z/4pVhTPtaB+IDGKY154Bya/oc
 gxSA==
X-Gm-Message-State: AOJu0YyI0lrgGsUD0gvwPTFcbSimYZUumltuseHUGICWvYxV5dptEH3y
 rfBWYsJfDdrxKfAJc1mfo6Yu4yZgTOayZfsz2Q5RUrKen0u5k6+WVzGN4277Q7m/z7EE7a/feSS
 FOQ==
X-Google-Smtp-Source: AGHT+IFic+2OCqAOA2h0q1d3voqlZnVZ0HVaCNY8G30baV8a0mKT7xwy0apqxmQ0uPaBrx3a5UrZeQ==
X-Received: by 2002:a05:600c:4f16:b0:42c:a72a:e8f4 with SMTP id
 5b1f17b1804b1-42cad760ee2mr67551915e9.14.1725899277991; 
 Mon, 09 Sep 2024 09:27:57 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:27:57 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:26:53 +0200
Message-ID: <20240909162703.3439481-11-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899278; x=1726504078; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OJPHAUofiPfC+2TlIBu4ovoMlFFrHOn00GrJYtIk4EE=;
 b=nlGnZFub7GAJXxeRaLuSONzcw/EIqnOsBhc1qeoDR+jyXm3ShXWpjjX8uvV98p2K1f
 KORJnbAXIOlE8WN24QfgefdenwkxogMUHs9tEYfP8UBkoSSoW0nnhltyv0jrYCwB3qWR
 vYn5cWS/EDiKpgRm69Ssd53/8tffFP3rPzAoKTl0nIL21aZ4Iy58sEP03uZLjMSyGokk
 6NvRe0KR11eBEnyW/nd5bKbrbVUUzAb6M7UNxxD/bALf1cZ5qvh7i1AKPkTVUqMM7rZ4
 Q4oKV+e6lnz6KlauESzDg0aYmmB5YvQFG2yEJJpXvoa3xCdn6cxiBhPD5semoj+DZ6VO
 ZbDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=nlGnZFub
Subject: [Buildroot] [PATCH 11/20] package/perl-net-dns: bump to version 1.46
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
index f025d36ab..1e559a432 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  7c88cae0cac342f3fd43e7d99b29bf2a  Net-DNS-1.42.tar.gz
-sha256  48dea4d57b25deff5590e18f398a34a52256cb9f0cbf4b7a9ad2ec6fb5182cbe  Net-DNS-1.42.tar.gz
+md5  640f572abed308ca5399d3429cbce6bd  Net-DNS-1.46.tar.gz
+sha256  91b65cd0f12461802c61ca5474f87b3e29f5182d2e1b3a2ea70702a3efb4a743  Net-DNS-1.46.tar.gz
 
 # computed by scancpan
 sha256  1e44fcf65509b47a251eda0ce1f8bd6aefa13517e38cb1e95b8d36120fb15452  LICENSE
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index 5b6c1ba1d..c5b01e8a8 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.42
+PERL_NET_DNS_VERSION = 1.46
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
