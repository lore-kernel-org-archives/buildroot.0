Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4699FCA9ED6
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 06:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 474EA40627;
	Mon, 12 Oct 2026 06:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jK36T1OahdBd; Mon, 12 Oct 2026 06:25:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6013740651
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791786353;
	b=haLfQDFClNn/ZYFxUw/4U1UnuJmQQtoNu+GEuFJwRJ2pZbzJZKiUKSl9CL35xy5puDh1
	 /L3QN+mL7x6p6ECPmOKMC8yXaj8kJmtj8gnvSxj8m2t64lg+XwNQsjMpMx7+6KzwPAumg
	 coDuDzYO9XUqAOE2zE/wHtKA1nojCTECHuMyG2bqZjdwDA9ct9AxpO1DgaiOA21eP6pZI
	 8GGZjqGmFqHlRSJrNMCBuoFnKdDkupOju6oU9M1ehB+c7z+pDy52rnSyosnoPRR193WsJ
	 KSp8NzqMiNMwQDJs3CKeOplg2N+vax2egav4PJyMYWZnXY/beugFjbf81b6IqlYUE+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791786353;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=0ZGgXxtNc/k9XZCNTQi6GAjt+Yvui4sPXvmOZinrogw=;
	b=OOCzeMrxMTRy6FETXM3ur8gPz2nxp02yGLtMfePfWAVPvSP47I5/D3ZmuW9fCPnNma8v
	 o916I4BLCLJWySgCiRok2OPAU+C0h8WO3+ZWj8K51FsfUbQzpH317E1QJ6x+N4nd6KHMG
	 rUHwY+JxFwQquYfE0G5zvbfU33IhMsgY/pICcUiNVo5E9MeaFo67dqsjmpR8TpQ9w5AL3
	 vUzgFMA/U2sxNl8ksV5Z7IQDm+0aKzVZZ6pC8LO2eDhZE7Nn9RmqMXt8OVi+x1KRtAm0c
	 XZrq2KApSNSfe/hgrtej1DbukO/M9wT8ieg7fS4ofy0VBC7lYW35i0L20cO9ndTmCjg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791786353;
	bh=0ZGgXxtNc/k9XZCNTQi6GAjt+Yvui4sPXvmOZinrogw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=htVMNd+4dJntVYmb06KB8WJhrYRmHkUSpmsL+r7oCX3wcAu0hdCqmo8MfEbQHpKvk
	 nN6hH1TFxQbEIM5Whsidbcniqu/vnc69LQyzVR2zV5j9PEMmF5GtynjITsRsf+uNIG
	 8ep5+ddAGl80AOSJrLAu803+tb9ZcpR8IVXZrAowsx1z3Pb/ZkQEfJa84J5hq+WrN/
	 ukKqah6F7mAFzDT2y004HQQBzurHq0KXK4HLl6206wGLg/1g+GPMYxLNJDnsuclSsX
	 KTzrGuSnn0hhqjAxtC7SAGAy/soidvdUtFXGi3saG5BwX30iqdH1xvHWWYy04NupDr
	 krHNAlahTR8uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6013740651;
	Mon, 12 Oct 2026 06:25:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 691EE9CF
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AE6180CF8
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id divr1NiRN6nk for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 06:25:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3808D80CEC
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791786348;
 b=il9Uy7eRF0igwnPnPzZwi0O/Y6PSGL9C39uAMm++jWB+Yq5czlYqWSKnajLTFCIoMYl+
 tT1HYP1EMT/szvKrByc5PfS96bfClrx7m9OMgWSpi4lb9cwFzefu2GUHX+NWtHg6WGK9T
 5072BmbpvRbY8uf6NmAMAESdgahU+HlbUZwWa3uf+xJqBYzjHWdOfiHOUw2W7b3TEOMZ/
 kzR6WQr+Q0iasyKcJcTBW8HIFJ6CQVv98kxdtpMEK8DgJAXdST4kLIk/3F9FkzyaAcSEI
 /gOjWd/CW1lciswL9GgfT8GPI5jMQbtGTH0UfTPjVkH6u4UwJSA0Sj3zmhObblFq8gw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791786348;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=CRHN9PaXYzIRflBq7iyKGDBNCT2ki4kmW+3hq9D8GSA=;
 b=ZMeRTtkP+Ypp5klXpXZ7Px+ekpqxpbkP58GM89GiV4+RA8FrklBHz7QBiGlbW5GUPuko
 vI5zC9Lr/560Y943JM2ZtMnm95uxlQCYOw0NouwkYHTyrH0aUC+TYsrZV0X5LG7LszclF
 F6X5EN2dg2p8baVtHVGiZRUQrTmUG/otjnUmzVp0cxFjrGGtrNq4YCX/XFkg2Cd8iE3uQ
 IehJH3QyJAS9bYDzEpfEINMpQMgKKp1w21J+s/LdM/ZNf6TOnMB+amRexD1h7FvOjPr5m
 LZuUNf3g1T5S2a5wLZKIhfRwP0owLb4DXKGSGoT2qIojRYeyTDU7FlzHhWQgWy2/AKw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PvVfJdbG; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=PvVfJdbG
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3808D80CEC
 for <buildroot@busybox.net>; Mon, 12 Oct 2026 06:25:47 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a172eb31f0so9773795e9.1
 for <buildroot@busybox.net>; Sun, 11 Oct 2026 23:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791786346; x=1792391146; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CRHN9PaXYzIRflBq7iyKGDBNCT2ki4kmW+3hq9D8GSA=;
 b=PvVfJdbGg6n6APTvVznkO1cVtMnN0NP+FBQ96LWgk0NgqzmvyPgx1d7YsPfWonTXIW
 ROvc+rJfy90UPITOiu3W8T+FuhL7m77KFqsxvEEXdBWKb4uGEum7okyyGq6+p2Lfk502
 vfufOaSJ2EFx6/6LGE2r15Kmkb6fTvOzc1LdzTyvN/pNNHdUVHjrfR4oHQf8KutDcwDu
 Jgt1ar72R9hxlbIyo3RjCy82WSx76hw86gNauzR1Gyqq1iDlvIEdNqXVQlelehCcA3tN
 O5t5+knMQKe0yNYiK/laZHBfN676KfIfs+n9YC2/tAjeAPze0oVwo6TyA83JbNoouNQZ
 VrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791786346; x=1792391146;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=CRHN9PaXYzIRflBq7iyKGDBNCT2ki4kmW+3hq9D8GSA=;
 b=Leuahme7diWaaKKqwnL9PnXUiiUjOzcM9GB53lYeNNse6MSiusBoePIhcShnUYg6SS
 evK1vSt16Elt8G4om3Ubq78/agmld6so1tyKcA2W4usQ6eBQSLhdeipLJtRn15f4p8lq
 5WwvLk9DDIkGhUxYEQwNhTUeG7BowYkmQ4w133Gj/hWsYjrVb6ZbOZlO0lWp/MSPcC2Y
 N2mCh4p0hZFUOB8Qy0qbyEzjGBYSMxn/cQJRZ6P0xXhBnb4GQtWt7mWuDwNVXJWWpo7j
 mcJpoasQD8ICsifwA+h6wGGfn6YKp//gI9QCqM+BHUdWmBy/9NduTzrhdgt5CoBWWgsW
 /9tQ==
X-Gm-Message-State: AFq9FYIRnQ+0FVxvjjyqBtwDl6TD63Noth5ipJnWQdi1kFQVaByjf1mP
 eIaApWnhEJmImkdrHn5A2htiPICjaz/yqlSqES72JdAss+FHCQeIkfyvNV0Keg==
X-Gm-Gg: AYBFou2PDsRXM8+1ls0g4JUTMEzzxghR1sfc340fDMOUF7pPBkIrr9QdQUXS1D6SW2G
 ls3rMfJ7LU7EeHMfcTZVLXuj7KSqlLAh6bggxxCK8Aih0iDO4aIcOOW3X8piHY787o6NlSpCf/K
 JnMpI6Wb6iJQztZhh1dEuTEbOF4IDzCgS0obtzVZUVrmkvoJwRP/p+U2PDJRtSwRLqTI6gkD++5
 UJMeDg768rFA+lsFqWDJ75cZ5Iyd5OApUYO2xrqoE5rh/RuMz59BZEGJEI/8z2UBWfBy9I5Cjrv
 3lYQwc9X5PojJmQ5P6eG9N5QjbPSALGoyCE18dKgUuXBN7PREmgZ6+djckN4z/D86ZHUFgbWQSQ
 oAcC5Wg+sQo3T7V24rKO7/v3aJMUIYiE2CWwrABMeAKhL+CEwxKfF0XhBi67MqKNLyHnPC39yXJ
 5sbgVoHjtMXYlEAiV55rqS6waQNmVeKGDAsd+ibkXxf8O9WGoBKX3E1N+8ys3QGbuAp6+3ftLmX
 CAtLTFkom+36VtvfZtsHOPjZG/W8seAwnEVjyED
X-Received: by 2002:a05:600d:1b:b0:4a1:9661:14b7 with SMTP id
 5b1f17b1804b1-4a196611b9amr74085645e9.32.1791786345755; 
 Sun, 11 Oct 2026 23:25:45 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e49792bsm421486625e9.4.2026.10.11.23.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 23:25:45 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon, 12 Oct 2026 08:25:29 +0200
Message-ID: <20261012062536.78874-4-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012062536.78874-1-francois.perrad.86@gmail.com>
References: <20261012062536.78874-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 04/10] package/perl-libwww-perl: bump to version
 6.83
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-libwww-perl/perl-libwww-perl.hash | 4 ++--
 package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index 1271c656f..f89c627c8 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  dd84e119517e07a1af261b8eb1fafe1e  libwww-perl-6.81.tar.gz
-sha256  ab30552f194e8b5ae3ac0885132fd1d4ea04c4c7fe6555765b98f01af70c1736  libwww-perl-6.81.tar.gz
+md5  dfca8f917f4727ddbdf3d81d0979172f  libwww-perl-6.83.tar.gz
+sha256  e75f0fa9d3c6f0daf5a5a72fa9f8b1c9c0d23e3a84a8522ccb4f835232b95505  libwww-perl-6.83.tar.gz
 
 # computed by scancpan
 sha256  994ab45a4f8ef43f47b7baabc48d100838c42d226d8d161d6ac1f49c5f9d7c84  LICENSE
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index ff1cbba45..a0db61868 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.81
+PERL_LIBWWW_PERL_VERSION = 6.83
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
