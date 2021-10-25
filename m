Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645D0C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:02:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2907860E52
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2907860E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E984A403D2;
	Mon, 25 Oct 2021 19:02:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1kNYod0ytJcz; Mon, 25 Oct 2021 19:02:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FE11403C6;
	Mon, 25 Oct 2021 19:02:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 841471BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0264380F25
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:01:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h2-yBfE3-Drv for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:01:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18AEA80F26
 for <buildroot@busybox.net>; Mon, 25 Oct 2021 19:01:45 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z20so3580518edc.13
 for <buildroot@busybox.net>; Mon, 25 Oct 2021 12:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M6z40j+e2s0w2TBcyS58ZIejScC6ZAA3bwhiJ7wlgRc=;
 b=VYn0yzop+c0XJHnDIrnvZblmbMJduRYUXu1cffVv1R9gxRGEmt0di50BC4o8OSGli4
 iUN4WaMiRnRNM9eKaSRgQd5MarnyUMqBkuEbBtQI2Mnz1UZU5B0K7tPjGgQWnCCj7jmj
 6ZDkD149lWeJA8vfHBtLN/0vau/QT90skZpxElecb0UYZOAm36LXFwZG79JcrcOuo5rN
 NqVLdvtBzy95wcPRL5ZragZfxiKcbhc6JvitudUKAMHLESGHG0ayIaSdBchPbshqarkL
 0qU5vg0alYJqg1gJaO/yu2N1dj8JHUhbqMusJ9KAyaNBRrXtUVVyjNNVcfbPnliYZalJ
 +2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M6z40j+e2s0w2TBcyS58ZIejScC6ZAA3bwhiJ7wlgRc=;
 b=7Y1o47EIWkBKHflCq1EE0oO0hbgGMI+XX3W0Qx4dGF1OvaydcoIuXtAgcn48V346zl
 ozerOz0QfclHuUrHTsk9UEniqxMhFI0egUUhvHBcV95A3IVKvOWLjsontDwczEoEkFak
 wfMGEUP66uKLft5wRV+GxTeXArY91ZzDnq+f7nicHRjIhsppXDa96I3gbKFX/tgoZpt+
 iv8ULZdKjqABp/OVLP6be2E3IqjGdo8ubdCz8agDO2ufZThvI4XH1e0El7cbSqgNzePu
 3+GAxvoATT2Iyuh/R/BO/dzbEJo+8/3V/s2Sp/LHsFGfmwj9E1VpWUJhxZrDI8hKJTqf
 UXWA==
X-Gm-Message-State: AOAM532MH4U9vb0JMCn1VUxv7HHGGjepjFhyn4XukAd3Ky25mayrkUWV
 ycaFsyvfedzfGpyuKEoLLc07uyHjEAc=
X-Google-Smtp-Source: ABdhPJyzl/qIBtyEhrojNc2K8+8JWGrXIohFKlkFfe9DIrAjGzaGScRrj3uYNLLUlUJeap4uLpTCOg==
X-Received: by 2002:a17:906:c18c:: with SMTP id
 g12mr25256579ejz.458.1635188503219; 
 Mon, 25 Oct 2021 12:01:43 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id g9sm7890584ejo.60.2021.10.25.12.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 12:01:42 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 25 Oct 2021 21:01:32 +0200
Message-Id: <20211025190134.1273703-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025190134.1273703-1-francois.perrad@gadz.org>
References: <20211025190134.1273703-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/5] package/mojolicious: bump to version 9.22
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
index fbb1c7d99..cc29c3553 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  ea3861504ab25b237f124842f8765b01  Mojolicious-9.19.tar.gz
-sha256  45056d66b08e544fd77033fafe1730c1d45615e46a92892fc77fb241754a1a97  Mojolicious-9.19.tar.gz
+md5  c7a00b4bd8fa2db991c9b918d34041d3  Mojolicious-9.22.tar.gz
+sha256  6b76e024d3d6c077ad984ea3b3d229f093373d5e06438aca248235150d029043  Mojolicious-9.22.tar.gz
 
 # computed by scancpan
 sha256  19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a  LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 8252dc7fd..559b995cd 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 9.19
+PERL_MOJOLICIOUS_VERSION = 9.22
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
