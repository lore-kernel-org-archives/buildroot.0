Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DCBC5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FEC981396;
	Fri, 31 Jul 2026 12:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1V-ZWgIr2Jdk; Fri, 31 Jul 2026 12:05:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 289AA81387
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499552;
	bh=Xed1lwjafN2tPSI5oM6y/e4POLi+IZFnsHziHiPQy+g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BIUUQvL2uAEFRFcuxP42CkGDQsJIviuoq3ug0dD9mgZemADcv+twcBlQZGXepQizn
	 EylvhNt7XOSDduWcKR6jsA2Q/8x5dOVYEctyKrd9t4uC1Fuq036q8Ef8uFoQEqkgy4
	 KC+0HOXLjdC8UMyeRPmuWQ7y6GxaoK//RfVIkSo1Z9RP3PEmxvDCIvJ2dLRPFqz8J/
	 LtnMqPpt1qobGCHCagFXfruSbVuDZ3Mb9O6AMPf5n1Hzp5rE+u8VryeadhvDe9Vh11
	 a7+I2RXi69frr0bmjZ7PLX7eGCfjpMZfsYSDwJt3AR5WpIUQtBtWAVTckpOSz/RIKK
	 2EkUmgusy4S7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 289AA81387;
	Fri, 31 Jul 2026 12:05:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9738827B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85B8360B61
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9r8Zveq2E2aB for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:05:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 52EF460B35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52EF460B35
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52EF460B35
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:49 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-47f703a9d05so572416f8f.0
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499547; x=1786104347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ILkPetOzokMZ2cBTH50R34j55V3oiV9BcgYY0kdWnRk=;
 b=YaZnDriOKdPBgmiwGUCHPgfD/nRiKHw+ddGTWKnSWtpj9Dr4YyBjHKwnEjXin/ylX2
 1cT6WXoC9sxcsDG0/5xTab0fhPGQ/kUDllqwq3sGz5OJvGfbWgKgzteo96P9rI2MaCGK
 k4Fk4Frr/eU3Iw/pjO+/OGiXwzvBSBc53NK+KgoUZZnKKJyLvn2PZJ2dLioz5APtGCBC
 qk0NGRYYSJzQWZTky8xYni6/6oNBCSaJ3b2glqmCUEYjHDyVGyeUCAma/mu9rKTJ5Gyq
 X387UAPUsOltRKGim5hu4CS/Ii0IEG+BcrTcflWTc59UYgo8UWU5epodn1g+LTIkOdMX
 e7ug==
X-Forwarded-Encrypted: i=1;
 AHgh+Rql40tHWdv8M+nQj6VvFnumUoxKwctXLiirFZAo/GvsQh69VfOt5eCOqgRBhxlZEaCVh5asfv10bZU=@buildroot.org
X-Gm-Message-State: AOJu0YxSPS3veri7+WEcBD1g9loAkuqb02PJD7hobZuDIjUuSMC3LJ9b
 QFsy1hHhCpGQEbcKppw3wftXBFNkKuml/LjWmntUGRU4e0/RqrR3wh4lA0S4lVQgBg4=
X-Gm-Gg: AR+sD124hykBpIw6LI4C2lXkwm8M0g5isRMbznHTCkVVs28+bBUD4/0FlhP4J++ja0+
 OXFF/m/PkKNomKzPZatFs/e8iGgtcRrzY+A3hoOYM3P8JLlTvgVElBter+K51ggOItYfnoFeyI/
 2f5NvR82x7NWRDTvKYCB2ummYVIGyipKbVdRkYRMGQG9wPa0YG1u1HjG/cJJ1dna9BxyesYkWs0
 6s8qR4ybmhVVdrT2GMp/rQT+76RI1dFrcDkETFWM25lbyk9JxvQxM+Uhe8z5CDUSpTaZN5TksOx
 KDeVhLr6kTZ6zQLuMZFtBWTvHQ4/d4jrzs/uyH3knkXIBb4moEqgNgw4OYC+Hc2n/XdiBmMNf9k
 qJYfE4RXGFINDn+OyQfoHvrMOsFDyz8rppJEG5yqLbYKfwRDyA5DLirs/eW8cyh5ciQMoVutUAV
 nuGoiPF4TwS1hPLs5eK8Bux4DT2/d2Hv5BdxaEw/FoVeOxm97ZpII4c/1FJgRNNRqlUKfCpmSHh
 pB98O9TorgLA7yWo58JZgmr9A==
X-Received: by 2002:a05:6000:41f2:b0:47f:81fe:12f8 with SMTP id
 ffacd0b85a97d-47fd2ababd7mr4193076f8f.1.1785499547180; 
 Fri, 31 Jul 2026 05:05:47 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd456a6d7sm4257330f8f.19.2026.07.31.05.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:05:46 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:05:45 +0200
Message-ID: <20260731120545.4042-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722153224.624762-6-fiona.klute@gmx.de>
References: <20260722153224.624762-6-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499547; x=1786104347; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ILkPetOzokMZ2cBTH50R34j55V3oiV9BcgYY0kdWnRk=;
 b=PjgoG+i/+L1SYotwEMHuGad63pD4CXxmKpSNdQqZncT9QJl61VQxsU9uXWqaRYAWiZ
 Ft+9xm2uyFy27OdQD3KnzTPh9137lIw3sjo0IDWkFjkWNoc3y3jg9LNbBbcExJim/Zz1
 /70DBnHOFHeqVT/PnXr3jDSQkjhZreORjoxla7TuBZEcvwIzzHKFo+qrdI6XviVMW/35
 FR5LWr5BMmzuKnlMRs7QBVRZML/qUEvv5P6XhK6FdKwsdG4HTetN7Jl47w9rUcwyrJor
 ucYdt3djLz8kCTJatjhom1df6Gf1k4NrXEMHm2slAl6PQ83seY0m3/R5NxwIGIja4K2A
 7bkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PjgoG+i/
Subject: Re: [Buildroot] [PATCH 6/7] package/xz: fix license information
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> BSD-0-Clause is not a recognized SPDX license identifier. 0BSD is used
> in the source SPDX-License-Identifier headers, and the associated text
> [1] matches the COPYING.0BSD file.
> 
> FSFUL and FSFULLR are the "few permissive licenses" of certain build
> system files mentioned in COPYING.
> 
> Move "Public Domain" to the end of the list because it applies only to
> a few files.
> 
> [1] https://spdx.org/licenses/0BSD.html
> 
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/xz/xz.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
> index 91eedd7a83..056c168057 100644
> --- a/package/xz/xz.mk
> +++ b/package/xz/xz.mk
> @@ -9,7 +9,7 @@ XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
>  XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
>  XZ_INSTALL_STAGING = YES
>  XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
> -XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
> +XZ_LICENSE = 0BSD, GPL-2.0+, GPL-3.0+, LGPL-2.1+, FSFUL, FSFULLR, Public Domain
>  XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
>  XZ_CPE_ID_VENDOR = tukaani
>  # autoreconf needed to fix a musl static build failure
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
