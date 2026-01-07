Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69571D0D16F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 20:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D309282312;
	Wed,  7 Jan 2026 20:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHPB0o82RuNn; Wed,  7 Jan 2026 20:00:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C63482329
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767816030;
	bh=OLo3IbsaFx9sSv8plc2N0rPZ9h0GVfO1jh6dC1hzBZM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Kn7CmgsLhcDvCHAu70KWZwkGnwtQ5O08qppCZUNGzIMtpOwM33SPcR7rtIivQq86a
	 a30V01MNViL1QBrqTMwmXj5C+JGC+KV+U/AMDuXQhlBJpcqnSifxkM/nA6Y4oUt1Aw
	 jQdNDe+zjr5FqNV/bjJQQ4S3TFR7XxavabQ2gk9ThhHcPT5kRE5kgohdrJp6TNfm1U
	 kFAgLfv0TCgfeGqFscSKkIXhOHFCE6CbMeVWsPzG6URCm/wp7EmraNpMrGwsxBvyNa
	 uslp3lJ9Pw2Hdiv+zwN2WHOSD4KB1lWX1Ym2oJU9pxMWF2c9fcIqY6G3vlYBqNkbli
	 MU6yfWktELh7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C63482329;
	Wed,  7 Jan 2026 20:00:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3401E25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB5AB822E9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9nbKpFxL7I0 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 20:00:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C88AC8226E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C88AC8226E
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C88AC8226E
 for <buildroot@busybox.net>; Wed,  7 Jan 2026 20:00:24 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47755de027eso14893415e9.0
 for <buildroot@busybox.net>; Wed, 07 Jan 2026 12:00:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767816023; x=1768420823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lbdKmEeOxhTIU6mg7zUo+cWwpFYwswy6WeNJEKvK0FY=;
 b=m6hnf4fq83o9XI8Ekq3UWi0QbNcPGIlKOssGjjtM+wYw+bngb0v6Is0bUXGgR5/uO5
 7JLZlM+Bxe6/POF7z8hrIgHI7P/IWjWBx9CkyB/LX+LADx+OvBy9cT6QFonfaY9RmrrZ
 QOBXRwHqri5ZYqwsVMRFtsL5WBRFaJy9SbaX95YHTm6y0TN5OASBzN47cDD6chl/AKP2
 NIoQwEH8BHcjRlCtlH5HwgE5KZ+ezgWjViNacUfdjWgG6TyZls1+zQ1ei6YIm1/ossX4
 q/jjsly/cn3wYLVcU7IEfoahG78xBxgQSGUPOykJKandF+/sxlLaLiTn2uYSozxGgwM+
 mwAA==
X-Gm-Message-State: AOJu0YyJxURGTVRZZQU7RN5eekWQWw67+8NLgfvZCPaaMNnJPFKRo7Gk
 Ir+qlMb6CTT+b82TSoJEdLJd1aMzhl/xEMFpLUL45QxkivpJMevy7TCkrRRx3X0jILW63d69X6A
 8/jR6ag==
X-Gm-Gg: AY/fxX5GwUPe6lEj0dR+5vwMtEK0zwWohG0HmTS7g7eV0QOs0cgPdM1C380CPDdja+q
 UFXYgE7JIbyvQ6CVqSh/Z7si6GqBqJksbsG+EWXkC+9f5rGOy1gfzgrrYSI4ztqnNa9LYz7IO46
 eAiZcLZa3PO7fSn54+ChZD0mCdHNrlrlEiRxhqgMltbVt0izzMN8u/pw39Yp1OFflT/1ApB+P9r
 qMbVZ7cF72vTsW/oqw9eCuYkDGpJTtdeMbp1woSIXPvcYtCobOreC4ianoqwv8qykcV0/0jhHbS
 IrOScxGCqxUDEDzsMbxZAvuXB7+XuDkvesUHU4IQcXJnQ56/+8ZUvxGpbu7cPmKV2WkaqyH4qwP
 eEau5bWU/qQSvG5T/oecYxNpd6yhK6fZD6iAcL6dPBe+p62Q35Ux8G9qEkgtMUVmv1kKNbTrcyL
 4lEUNtpBMwjwadbWvJc6yiCcV4tVZ09kHXOwE=
X-Google-Smtp-Source: AGHT+IHYTWFIGuFTBm1Wwm5m0oM/Sw8QecjAXbZYr2SrVGn1JyHKTndVinywFnhE5FQEkev3u3hdGQ==
X-Received: by 2002:a05:600c:8119:b0:477:9814:6882 with SMTP id
 5b1f17b1804b1-47d84b086c1mr40655725e9.5.1767816022591; 
 Wed, 07 Jan 2026 12:00:22 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719e695sm18987435e9.17.2026.01.07.12.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 12:00:22 -0800 (PST)
To: buildroot@busybox.net
Date: Wed,  7 Jan 2026 20:59:53 +0100
Message-ID: <20260107200004.665611-6-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107200004.665611-1-francois.perrad@gadz.org>
References: <20260107200004.665611-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767816023; x=1768420823; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lbdKmEeOxhTIU6mg7zUo+cWwpFYwswy6WeNJEKvK0FY=;
 b=OdYH1ekSs41pbYzCxVvJbPoEI+M1HIKBuQ7ewZbO8mF5F6zYs39XDMIbMxhbh0L0pb
 uueipcJZX0rOcJALkxzG6wv2KAcBEO4Q1YqE3SGApXiPYC1myZ1EKwMshaBWirK7mspw
 Tyh9KrZYQDnuCBxrkiZGiWEkY5S5TMi+BUPvfSFaYVhAUvwXW11bfaetpRVyBWS7dh/A
 kcdxkpQpzO+TF4F9e0Ftmqgh1n7V7QmxC8WXEKBUj50b1kUfAbCmGcVlw/qzlon8sR6V
 0eBem/ow/AHX1DaO59t1jkCZzGO8bfpJBYEPk2q+9b7w7mmAMAP9CtlBfHIXVzkmLb5Y
 /ZaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=OdYH1ekS
Subject: [Buildroot] [PATCH 06/16] package/perl-net-dns: bump to version 1.53
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
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
index 3a3693bea..6d78a3413 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  1ca152f2eec8f66ef4ae7243697197cc  Net-DNS-1.50.tar.gz
-sha256  c660500b9d96e5aa2b16d9f4260b6f9f05b5602d3c4bea0ca39b45bcd02ba993  Net-DNS-1.50.tar.gz
+md5  af907c09ce60173408d13b93a0a0ab1e  Net-DNS-1.53.tar.gz
+sha256  04acb4f177d57c147dcedc4bd70e23806af3db75a532f46f95461b2bc9a94959  Net-DNS-1.53.tar.gz
 
 # computed by scancpan
 sha256  1e44fcf65509b47a251eda0ce1f8bd6aefa13517e38cb1e95b8d36120fb15452  LICENSE
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index 05924c105..dc5ba8fd5 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.50
+PERL_NET_DNS_VERSION = 1.53
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
