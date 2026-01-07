Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89A2D0D16F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 20:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B187D82312;
	Wed,  7 Jan 2026 20:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6W2HPjQi4UD6; Wed,  7 Jan 2026 20:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B580182372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767816040;
	bh=YSTTtWPd+E+a4cQw9h25El3rOFLfL30hWXMYfht878c=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=HsBBQdCOBh5XGF5aZuS/hmqkie1PU7aDjjjJCT2RuZDqnh1F2L6Gzh5uLsohgP7ik
	 0SPz21q2njiXjKQ9FuTl2MCxmUa9KgPb6/TelgfqYk0/BWbCrJArRRMSL1r/AYPgZf
	 d9FKZ0izRE0hKF8Mz7fj0HRqaYNxcNgFxVnYkR7jIyC1spKtc9/AB7Q7c65XanLoCQ
	 jNeEisEW4xxf2LP71nURus+I6F/zO3JQ9gbCcKttc3xEqdSnVSk9CSGiCdGMj5B/xx
	 BSa6GXrgKZRnNm+JtgEKprr22pNqS1SjMM55j6yN9xfoTAYMV1+VNq0O29H79y6yx/
	 abn0udLqo9xKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B580182372;
	Wed,  7 Jan 2026 20:00:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D6C69ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D49782336
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCXMn1Gd-Za0 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 20:00:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 454A082328
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 454A082328
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 454A082328
 for <buildroot@busybox.net>; Wed,  7 Jan 2026 20:00:31 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso23553875e9.3
 for <buildroot@busybox.net>; Wed, 07 Jan 2026 12:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767816029; x=1768420829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZjrC+bjs1Vm7ZLyIMKnSVZb8+ZX8MdrbHp8YuqQ+GJI=;
 b=GqEXtYs9MhO2iaUKYHMSNEtF1jeMesszg3GLEWhlZw7fRBewxoYdmEU02iX9DcHnrx
 faK9T3LRgggMO6EEKXKYLH+XobXhe/n1VgFXOywgHQ/TStXDHvSYgtx/RS2mQSZlXalw
 0VqTIQM3kHMkHgZW0f2q3ivgHehMmXiz7HVsnbv1i7TZEjwtuAZEKNNgroux4vUlIJgk
 E7DCwhjKutoDMfWVZ+q+HKGgex1AFB5cXFDHuUkUSttgck9jJ9yBm5bsB15WTyAkV7hB
 n2QRVO0T/GoAeQ9EMU56Kz63UEf6mnh2KggHkG4lXjgJt/FpScIWLzLImYZ1uqzC2+AJ
 U1Mg==
X-Gm-Message-State: AOJu0YyFjCrYsOIhJqWWNPHiFkVf18elJJX5PC30i4H05h/PYLxyiurN
 4/4SVqDccrBfRdvmDBvAkefwwyopMtaIM0/Zui8Qk137XrHQU5cXOuHxVHPJMGFoajClgtguwRU
 VUKmUHw==
X-Gm-Gg: AY/fxX5qgpfdky1NCao71PyLbADzZlf3BtDHwboN+tz0bznxQM69oKGFWYbJ06QPcTR
 RviM3Lnq6X8nAzuNoZbW+IzxRtnQviQlQ2+EtzHjv7Y3wbnFDtGdYJdLbSXr1kIRjrhZn68KYxE
 oLB9DQMHKEJB54m8dE7VqL96wj6vGiAoP7gG8iWkakaIEQdKbZC5gjV5q5grJHQkvE3zHjjdnGm
 wkPMoIW91AXluP7hA446W03Ps0gl4PGThOesd3SbKAK4ADqJZ1rhO8QYdGUWUERfjIDVUPV0/mX
 owMbWkHveuPd1vIF3vVME9ILIj0oHQwAFMbO0/ZIxCWG+aPT8o+5aP3DaWh3Np+s0B/z08uXCZQ
 t6Ld/yW0bh+n3AQOpHZP8k30IUxwypt5+usyw+3hbjvpK2ghPdE6d4zw4xMgHBWp/5NjX/91UPM
 a9HsYd7tpgeBiOYvmTAmB4rsHE98mXlDkL3tM=
X-Google-Smtp-Source: AGHT+IEtV4FECd8G213RFFlmzcBNjAWBfBN7QLttnhsBd6NdZppHgiTcfg/ufZk7O9fetXy5le/+4A==
X-Received: by 2002:a05:600c:8506:b0:477:a219:cdb7 with SMTP id
 5b1f17b1804b1-47d849bd9fdmr40819695e9.0.1767816028946; 
 Wed, 07 Jan 2026 12:00:28 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719e695sm18987435e9.17.2026.01.07.12.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 12:00:28 -0800 (PST)
To: buildroot@busybox.net
Date: Wed,  7 Jan 2026 21:00:02 +0100
Message-ID: <20260107200004.665611-15-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107200004.665611-1-francois.perrad@gadz.org>
References: <20260107200004.665611-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767816029; x=1768420829; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZjrC+bjs1Vm7ZLyIMKnSVZb8+ZX8MdrbHp8YuqQ+GJI=;
 b=PA2EMKNSr11xT335KW+8SO0L3pCxRQBkx2VpJ8xL+7YJdV8yhI3L6SxJHTKDK9I0Bu
 VkduSt5AM+MTb46IX87K43GpfcbtglfBYz1FU9t5LZB4pPaqYPWywijOn98bZfEbb7L3
 7r06qAabh4mkp3euNHBq+5cpFmsLamVJV1heVWEdtf+K3msrf5WPYWBbNcjUQp2hPK46
 K5wM2MKpSBT6i9H4So+Q5FmNOvClq35f4CiwpU/94Wk6kBxg14WTAV/xFc9CPGCSlwph
 EyiPRaFvYWMdN7hVHXjOpWDfFNICngpNc49enNxhXgujNIZUp20631cHgfdLX2CritVN
 BMCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=PA2EMKNS
Subject: [Buildroot] [PATCH 15/16] package/perl-net-http: bump to version
 6.24
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

diff LICENSE: use "The Perl Artistic License 1.0"
    see https://metacpan.org/release/OALDERS/Net-HTTP-6.24/diff/OALDERS/Net-HTTP-6.23#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-http/perl-net-http.hash | 7 ++++---
 package/perl-net-http/perl-net-http.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/perl-net-http/perl-net-http.hash b/package/perl-net-http/perl-net-http.hash
index 094b9e5da..c286ee0ec 100644
--- a/package/perl-net-http/perl-net-http.hash
+++ b/package/perl-net-http/perl-net-http.hash
@@ -1,5 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-sha256  0d65c09dd6c8589b2ae1118174d3c1a61703b6ecfc14a3442a8c74af65e0c94e  Net-HTTP-6.23.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  3728289552dc5031700596e0cf4092b4  Net-HTTP-6.24.tar.gz
+sha256  290ed9a97b05c7935b048e6d2a356035871fca98ad72c01c5961726adf85c83c  Net-HTTP-6.24.tar.gz
 
 # computed by scancpan
-sha256  0ed700a4bfc022e999d83407f71ab62ead96662d8f7bbebfd857376bf3ed6528  LICENSE
+sha256  bd8fcd2e2a8c322e3d9ff9dc943b0ca651760327bdcb82f0adecd8573442c096  LICENSE
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
index 08e81f95a..df360c9cb 100644
--- a/package/perl-net-http/perl-net-http.mk
+++ b/package/perl-net-http/perl-net-http.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_HTTP_VERSION = 6.23
+PERL_NET_HTTP_VERSION = 6.24
 PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
 PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_NET_HTTP_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
