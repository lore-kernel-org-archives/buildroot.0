Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80670CA9ED6
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 06:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A4BF406B3;
	Mon, 12 Oct 2026 06:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UBhj1NQKeJIy; Mon, 12 Oct 2026 06:26:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3A1B4406AC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791786360;
	b=etBVovUs7m+Qvfo7St0F6kr8Hd7PpRHNVj7kbVqfQh3pVBdcBNueiIOeFfQ8E3vY6T5L
	 +BDqH6rZ55CymOEw+ZgrnhDP+Lt1SBF4VJeM77mFFN1ZUTEMMFkOOreNzz5TrmMFqfoAb
	 NDk4/AjSZpVFu6c/pDXA5h7+1iIJoo7OABdPqJLUsUM8ofq4oJ/GMsv/jT2I8ytISNhCl
	 yQ6IJfZG29+3gdwigPXtDPeQWMfP+UFCd5DWAAG6Ikp19ElmFc7bahgEuh+EDng/ZdwSm
	 nHhRjCDvmGWWwJKbJvcg5Vz3PUcT3RKg/mCxc0jami5MInxRyOi9yg9qGjt3YWHyFpg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791786360;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Eytx03LHjVtWBsGZ/lUWKt22rJdKwWF7SdouKQ+vpcE=;
	b=lapWfyNTS+WtOXZ1HiIkM3PPBt0vzg6V7A7R/sNc0epxRnU6BftjPjgh5RKiyBQqO1Uv
	 tuPd6ymSpIYC8wGSAgX0i+XZgWkxEXdsRCFl64zafhPcQTij5qOYoIVZsQJsfXXvpJGXF
	 b4367Y6WiiqQk0yriyOr5RaEsXpOf3mMMEU395+4qpzjxJvm56QRQhpTAb8dkQDdekbjT
	 MiR1JRPt7280GFzyfLpXTPZ74+ByCUwSspKHSVdUTzA/+Ia29+R6lw0YRYxOCIxidoq4z
	 wCW98yRp52p6aEP7uB8AMW+IfFmIT586XmnGg+qtdCWBvBkwUvTb1rM845dYyEP3G+g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791786360;
	bh=Eytx03LHjVtWBsGZ/lUWKt22rJdKwWF7SdouKQ+vpcE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KM+m/PLeDBYhC3X1ThJMdVdFgJlebHncuG1BpaR+KfOuR0sha9ZvLjdUimYyvYt7J
	 7Www75g72UpbmQ2AaYrJO8de4X8Xzg/B9m2A0dhNvoW5K1d5DgVjzw/6fnALk6gGvW
	 w6tU/xaAGOAHzRGqB/KXAq0cP8gtL3nCGOzP9lWwIh++RUNptzqKDLeZy146P3qb3x
	 D1eyNYci4Lx71HLhIBB84tUacly3GqtxYctnmM2C9eMliD+1tQiTNU2sBXEe1jifOZ
	 Yb0W9VXhjV7DQmEUn+QU8u40tXw3RKKQnwZnkWsFVTaTQbckZGvTmwRxw+rNddTEqK
	 P/W484PifKPpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A1B4406AC;
	Mon, 12 Oct 2026 06:26:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D5159CF
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 534EA80CF8
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0onOjsZYtFbf for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 06:25:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 46FD880CEE
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791786350;
 b=LpB6cOABD8AYIKrpb50+J5h8rA21Hdqi9RgpkaKX38a+KDfh3hwf6eALnv1MLs5LS+9y
 v9CFbtvrDRa4qMKOvIPGVmK1IMTHMzvw4MafrybfACNtP7Bro42mZBwxoUVFFjrUB922V
 QhffZh9pzG7bnBZdigLN3phKW7IxEdAEMQSk8r71g7MA59yIbyvrslif4YgurrJt+iG8D
 /hBKYoWgDMuJY3jlTC7Fq14rLmsahl+22LxXx3Zn6ComksCwjGHJONugd5QFbTlSzw7e3
 aiWLTTwtTksNhPOuKJvMjda/9KkWeqyvnugy5RH52sngGX5zdm0sA9LX74M3JjpIE/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791786350;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=6oeHl7B0C3IqU3zgTb/fRNN3pHw9Fjw4pggbR03gY/s=;
 b=pUgNkh1Mi+SRpMB++xQ8IpS3gQ3x5giSPAwhDZYKDObOMW6kUoJE4StAOd5Bc3CWGv6I
 LFlYg8eQHTxFkbaSq9WZUq9i4Mnzz/llLJ46YHBOtPBecmxxK1USgznsd++qXTy6upYht
 ePk+hhv5qT5C39P/baJ/StqoJdn9Bg5pWu0SH/IM96fErTZZFrEvKXtRDwopub7NpLJZx
 CsX3l1jhUMDILKosvIaFWyhGkU/A3xCYdkdfslmXI9j47XYidJnuuAYfIY9S/GhFkvb6J
 1/P/exUF3RjP3G9shUJdzWNQ5G2OeSPMgyf4ZG3TTh8585a3J5huqj8K/oeKQnwfV/Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=FkbclHPW; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=FkbclHPW
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46FD880CEE
 for <buildroot@busybox.net>; Mon, 12 Oct 2026 06:25:50 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a161d9b8c7so9239205e9.3
 for <buildroot@busybox.net>; Sun, 11 Oct 2026 23:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791786348; x=1792391148; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6oeHl7B0C3IqU3zgTb/fRNN3pHw9Fjw4pggbR03gY/s=;
 b=FkbclHPWcSAEuY+Kh102e4M8iM9zvtcsz7n41btYh17PfEYzA5yMuwifISCWs89A5O
 gm+IUf1rsbjVgimwEB9l6RUTZVR67zhtovdocI7eeWkAifRfH/Bcm6SUDsFUWwwk7ULl
 zFPBgxz2w+CnllWqv6xqxrpCBL0++VVRREyeVaK+Qfg75VlXfEEW9JK6/OsXrYOJ/gRg
 Glbcidn0i4JgDXTbQwx0yVWWcniNwpeGykHw/Kp1TcxeDLFV/Mahqf6BFy8I0kTRriSR
 rqx2MfIW+Bd7Ujdd2e7Cb+V6nTt3Ocy+yMIhA6EeZKXGELw7mjlWG/iXw90go+8Mt6nA
 kVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791786348; x=1792391148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6oeHl7B0C3IqU3zgTb/fRNN3pHw9Fjw4pggbR03gY/s=;
 b=jRb0Xqt++lQbFTfBwAFiYkThdOZi72n5g6Gifikt3uXpeZSSE4cCbJROR9WRCTKcev
 1WD89HDNK/bTFSELRYIEeSR3PW3gGxC9PEih1dxTeaDa5YyBa/bgJv4RajzltyqxRtXn
 iBUG6a34TTp80Vh0CAWiL/DpJ9QMRWHxLBbIZEAAb9iRCv1JOuPumCYh7LPI3EAphkLJ
 /5gFQuCml4B8MnJKeXQ85+Kw2Ym62079D8TDKuq2syp0r6wB67CfNPF296Wiz6VAqNMo
 XMYHghcbsOgh2b+Dks+VayOYdZM2f3Acgh9sPMISy7on8TsCdwowAZoPlpFfDN8QO8Gr
 OY1Q==
X-Gm-Message-State: AFq9FYLVZ3mtDJ9TGYU7ht2KYxV4Z9U/VXnX9iX+2Lv9gjOLintxovcj
 w7YdslqiWlp6h/eeGoNScfX6tCYWG6/BJ4H4Ascz4ty9rG90xZT6lRnuMs3Ldg==
X-Gm-Gg: AYBFou2IbxC2Oa2z8UGiyGPikJmauUq5G3FtLOhWw+JRHeXekn36rhk+7f8ZqrMDVhK
 Dmt6Sp9wtmkUOs2yHhS1qLIg/sksyTBTh5pVpieRMu0uusBGgt3zBWB533EO9SigerBubC8whHg
 CrHy97v6A8bjQkpwGY5tVPXGnhoD0m1iG8LP4i8ODX1uAhE+/Hfdb3dE0StMLpvD3wHECEzLosQ
 SjAqGuJp22z7xFv3x4NZKwd4+WFpNU743mHKUkoqUzdSJZ3iJobeaTlNnP/pyddtwWUCYdcnOp5
 PZub3kj/FOKmQVqc6DkaQGb6b3rf/R0zggSUpz0Kg61uOH6v+84zkcl33j3sKBz306F2kJCCzeQ
 Rh47Hh1MRO2r3ABzSwLSxWF/JK0rquddz9W+3IjNGtojCFD3fPVTxn3JJrLV/xRq6375+eRnlcl
 5RAwPtT48q0fbgZHlfU6ABrG3/qk+D25qRCJACn74DsJF7c00VY8bqxYR4niJ+b1Xj6jNOS9qVB
 mUIaakjTSTd8B0yljMxa+f3RNM1YdyUbYvIO+g+
X-Received: by 2002:a05:600c:64c8:b0:49d:1df6:2592 with SMTP id
 5b1f17b1804b1-4a18e4c41b0mr143625255e9.21.1791786347949; 
 Sun, 11 Oct 2026 23:25:47 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e49792bsm421486625e9.4.2026.10.11.23.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 23:25:47 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon, 12 Oct 2026 08:25:33 +0200
Message-ID: <20261012062536.78874-8-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012062536.78874-1-francois.perrad.86@gmail.com>
References: <20261012062536.78874-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 08/10] package/perl-net-dns: bump to version 1.57
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
 package/perl-net-dns/perl-net-dns.hash | 4 ++--
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index 6d78a3413..b5f8f1f00 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  af907c09ce60173408d13b93a0a0ab1e  Net-DNS-1.53.tar.gz
-sha256  04acb4f177d57c147dcedc4bd70e23806af3db75a532f46f95461b2bc9a94959  Net-DNS-1.53.tar.gz
+md5  5bd876dca96f71ab261fa6f25eacad21  Net-DNS-1.57.tar.gz
+sha256  7c98de329cb5d6a99abbb03aaad2866cb041092ed9936a7246908e170005b058  Net-DNS-1.57.tar.gz
 
 # computed by scancpan
 sha256  1e44fcf65509b47a251eda0ce1f8bd6aefa13517e38cb1e95b8d36120fb15452  LICENSE
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index dc5ba8fd5..6c119c290 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.53
+PERL_NET_DNS_VERSION = 1.57
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
