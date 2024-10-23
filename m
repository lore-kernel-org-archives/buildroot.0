Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA02DCFA44B
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 16:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77A0440691;
	Wed, 23 Oct 2024 16:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JX1sj3_40G0t; Wed, 23 Oct 2024 16:00:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 949BA406B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 949BA406B8;
	Wed, 23 Oct 2024 16:00:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 181702072
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12D77810EA
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ec_RXkhbEPfZ for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 16:00:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 05B38810ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05B38810ED
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05B38810ED
 for <buildroot@busybox.net>; Wed, 23 Oct 2024 16:00:27 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4315eeb2601so84624415e9.2
 for <buildroot@busybox.net>; Wed, 23 Oct 2024 09:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729699226; x=1730304026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wq/JQ6MCfAo0fxeSQoLujnr3keOJcrR+VeB7ztwZ3OM=;
 b=p2nprLChF+UTjN7r9HSFBMAcBwdRH09jZgnBj4NLE9DUtWcputBA154GAFPi89YuSZ
 s+K5iFb0daW0Dj8BYTnpn2MuKsEEXZ/I+lQoRdcyCJK+Wl5A2nOtitB5WOmaG2xH6jvE
 1nnofIHMn/L97JHm9R3UKNoH7QGQYVaZkFumEpJsKpz8eabmDGWiXrvj7wVQrvsrbJTZ
 +eqOAET5bm/jF++NKelxZBxGtECfLfOGsYJ+vd4at9daJIKOpZk5h/9Zt7fBnTmK0xDv
 L3XPwTdTS1nY5tYFpHeuw+2vGNZju/KBqygg9S4G0QhgHgrhmePkEwi6RHNYsTCES7rl
 F5OQ==
X-Gm-Message-State: AOJu0YxNscgus9KGtYc0u6v6n/ZdpoyF/C8zqAnCW6bS/FHlhLvR6Gqz
 y1FpmCAh9qq9R5DqU1UWPn/LbJa/vrQdGMHCj49uz7fid56FWb0SRoC3X9k4Bh2w/ebKP2WMa9t
 pMg==
X-Google-Smtp-Source: AGHT+IHGkuOuoLJ4B8QEy0ficmWQBzmuHx9/n0aefeGWXq0fFHLO0pkUnYyfU4k4x2aTQ7XbRJndAw==
X-Received: by 2002:a05:600c:4fce:b0:431:5465:8072 with SMTP id
 5b1f17b1804b1-4318424f0e5mr30829855e9.31.1729699225737; 
 Wed, 23 Oct 2024 09:00:25 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b94356sm9214111f8f.67.2024.10.23.09.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:00:25 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 23 Oct 2024 18:00:11 +0200
Message-ID: <20241023160014.568872-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023160014.568872-1-francois.perrad@gadz.org>
References: <20241023160014.568872-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1729699226; x=1730304026; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wq/JQ6MCfAo0fxeSQoLujnr3keOJcrR+VeB7ztwZ3OM=;
 b=Z2MJwSqIRK9HxLs5hSx5AXD7x7Vi3WjlEJLd9/KDBrFKGXmfm04sdNpiZiTywSugbQ
 4eTArNDp3dL/s0juzzkEArlnRMPNf8zrhsf9QvqGuXJe1LSY9san5jTqjYS41vd4KvNQ
 ODB3CMCYkswe2JimSqWNfTGqzzeBu2k6N0FUSCyvy/0PfXWl1l4AsmO932FD4S0gc8HB
 cu8QY0odYf0A1y9MyEpGz5sbTYmc9JD8p/fts3PVZ159pZtSHM8Kmf1tGaSWKqJyvxcz
 f3S10b5dk/xSZHe2ZPYtPMCLD4+eK3uVqgQheX8WCK1/Ga8YcHjhQc1Gqd/cgtCriJvL
 hn7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=Z2MJwSqI
Subject: [Buildroot] [PATCH 4/7] package/perl-json-maybexs: bump to version
 1.004008
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff LICENSE: use "The Perl Artistic License 1.0" and update millesime
    see https://metacpan.org/release/ETHER/JSON-MaybeXS-1.004008/diff/ETHER/JSON-MaybeXS-1.004005#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-json-maybexs/perl-json-maybexs.hash | 6 +++---
 package/perl-json-maybexs/perl-json-maybexs.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-json-maybexs/perl-json-maybexs.hash b/package/perl-json-maybexs/perl-json-maybexs.hash
index 3b603310f..872f6cdd8 100644
--- a/package/perl-json-maybexs/perl-json-maybexs.hash
+++ b/package/perl-json-maybexs/perl-json-maybexs.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  bee9d0cba3f87e05e9613684e4ee2159  JSON-MaybeXS-1.004005.tar.gz
-sha256  f5b6bc19f579e66b7299f8748b8ac3e171936dc4e7fcb72a8a257a9bd482a331  JSON-MaybeXS-1.004005.tar.gz
+md5  63cf8b82a0dadda0dc445f9c70141383  JSON-MaybeXS-1.004008.tar.gz
+sha256  cd3937afa78831f80a2ad5abab6c51b9e82fca4c31e5856ea208d598db5dc867  JSON-MaybeXS-1.004008.tar.gz
 
 # computed by scancpan
-sha256  de7a14750e81d97e19e111df58a3b51e3f2c8ec2d2dd90f576f54243251972c6  LICENSE
+sha256  1505d172444acdfab81b917a3db10543f0b247821932e9c211bb9521467e42dd  LICENSE
diff --git a/package/perl-json-maybexs/perl-json-maybexs.mk b/package/perl-json-maybexs/perl-json-maybexs.mk
index 13c9439ea..76ab2b28b 100644
--- a/package/perl-json-maybexs/perl-json-maybexs.mk
+++ b/package/perl-json-maybexs/perl-json-maybexs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_JSON_MAYBEXS_VERSION = 1.004005
+PERL_JSON_MAYBEXS_VERSION = 1.004008
 PERL_JSON_MAYBEXS_SOURCE = JSON-MaybeXS-$(PERL_JSON_MAYBEXS_VERSION).tar.gz
 PERL_JSON_MAYBEXS_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_JSON_MAYBEXS_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
