Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541BCCCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CF1B817AB;
	Fri, 16 Oct 2026 15:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2F7h3fQOfzlm; Fri, 16 Oct 2026 15:06:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1B52C81758
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163194;
	b=KfHnagq3+mi2GNT3j37TtVLsbzhhSukigtbJ3ovb3NskKWvF//6v+32gUrScDlYKo6OQ
	 loZzkoBAdCdkpW+auRPSD0FQaEx7FEljI6Znn2cd+lsltT+pJPLN+Cs3RM1tAFBOrqPko
	 EU5LVZyER3c7HyqqvfRj9kgQabqMFvrXzbkjDw388cV1mJ+UUdHg/6B5EhSE4BEhohpRn
	 DXEKhKXpqSErJ75zxi/R3xTDYoimW/Wzvr7zmTFedI044C7Mk7F2Yks5kIA99evX5nrOO
	 FdFpy9slcsQGkkUSL/DGjj0CHBN+9FPBl6TJ8oeovMlSU8WJu3X1DvvUysH2xhCdQbA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163194;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YAN0y3QxlVOuXBrQ/D4JWLgOcNHnSgH7XxVgjQILibs=;
	b=jNbD+/i8HHhG9XSa74naWlqaxjLtBoWkWsqgsGEmwuR9xxGtsAnWHSQadaM5B9KDbTp2
	 x8MWsbtjW3VD5z577oRnmH0FP5V6bchVrXBVqA15uiK+khpgIgZKrdnZ4XJRSt1J8zdHe
	 2NJWWTiFA7hcMWXL9ZiAAfKb/ULeNCDeWBVCckIPgUYACd1ALSeCzWd6py2zpLh3TwwYg
	 QsTzFi0xDtK5j4XmCqTE7xTSW5hMTJSMpfb8YwjG9hE9+NnK272sgLpbyB1UU0xmhiBbk
	 h8gXdQa2uf1zxJkovLVqH9uGSmgOGFCeAOj6KNGMXiaMJCTGNz9YJ+EdOIQnHZBQ/gg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163194;
	bh=YAN0y3QxlVOuXBrQ/D4JWLgOcNHnSgH7XxVgjQILibs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CrhnH8lc3qOReBGpVitBhySqu704Gzex5f3LQhiP6jbIuqbQkIdzn/ELbUI7STo3z
	 qiCChbnyCDG4cwU4omGRP7QVXoWV/0wjycsc10I1oyZgnM/PnDuOMmmFLCop7q7Gzb
	 Q04M5bexvg60Jn1YsWeoDBDuaPGxmc3RcORBqPd06oQQkIEZxB3Xf7wAZ0lOEbjGst
	 O+vW6Sznk3W0WJPt0tQBmOXMVa7ZuXObkfL96TnKG6tViQOtkbwg5+BK8JhGEEOVA9
	 GFNKt+sH+gmcuMgIrWJQ2/KNsX1nWqdtpSNLFp+G7LWWkKYP1I2AMPXG5uN3eh0LmA
	 OJtwa6bZV8kLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B52C81758;
	Fri, 16 Oct 2026 15:06:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4689255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA49C817A2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dP-QIDE2wTCm for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:06:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E77B381779
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163190;
 b=SyD2aETMNzpqE8nElyeIk0PTLhiwIJifycyFISyz+vfpWvohVCMRaP4dXKylB6Mlvz8K
 /Tpf9EwihrDnW+xh8wvDldikVt25j/JtAwSrmrmyCErlkGe1HyqUz1cprpisynEC+2KhE
 2xSEhNu/isHVZgi2Ich8Ljz8ZtGY2rZRZgNA045awSsudZeLhXdhqPxS8RBPSWQ6T/Owm
 8CHtg4rk1VwZplmqI6hEuc2ApF4dc7I34XCFjjDpSEbwZIBzf0p1XL9q2nImr1OtnZBOB
 i5NEnFbGXeSZ8PfrrPWGmp8KkiKK972pSPKs22Z+LoKE0MHQHiX7DBdvKAs+Tf8hqLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163190;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=6ZCehO3ixq8JQlcyRyTr2KwXWBsN2xIlKd2OGMBVYpg=;
 b=FnzvLHe3KgFj+v1hi2GZHxPMV78n5/2AdVRcZ2f1VRIy92LJSWp1QULuc0za50eygNI6
 l+bk/8qWXnp3RT3hcBuJqHxUC/iIYIthlIEfFxvNgOrz90d3jmd6yKiU+sAT06jMo5kNH
 wrzIroc8rYGz/D4IO/J2slSztoM8vJ4AREZcqm/iqRNhtkMy8rZUV+oMl9h5s3F50xRwW
 K3EXjoGT4AZU7qbayMNLpVLRMlNsMykkfIWqBn33CNz6qDeCAZMcoC8Dl0zpFTV0wjddM
 j7nSZUJa9hwVwlShkgxE1Z6IY3VB8RJbHIOlTs9nDnduJkz3SyI0yhzl2Ed7wyaDIrA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=MraJD4hu; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E77B381779
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:29 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48b042c0759so4764100f8f.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163188; x=1792767988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6ZCehO3ixq8JQlcyRyTr2KwXWBsN2xIlKd2OGMBVYpg=;
 b=pAGfEqqQp32aAZi98LRLwU2dMJzNkD3DEomrkZA92UCaJ6XX5Moqn8RV4OtamLQUry
 6uFltX9+o29YPrq8Ee2YLai0SR5vhtbIDLxbQHZ8AeT2UHpc81ygy72bo4woKHQeX6Ns
 4H9ZVOZi7KWTbubx9BitjGyeW5+b6E1HuiFmdNK95dUvnhPveHxfAmMSZDwJnYDUoHLv
 95NKjKOGoJUeji1XHtoEHXG39m4WPh5Q2CinYQLul0o3paKQcIEnZGwBtzJ4fLWkWp+W
 1t4aPVJRE0uYNugWWYnSUwPWjyMldR90JtXKfLJerSmM5sctCg0LGX5g0zcUwXGKitTy
 9sdA==
X-Gm-Message-State: AFq9FYIKoLPsulTTZmGJKd9X6Cp0RDpWsjA0cm0THgqdLyFXeKCv2V+h
 +qgI5SpUcjegJOn8ioERUtGoOjqWSF+RLv4kZYZzNitJByGJ02kg6kIf9ZhoO/a6wKwAWWiT6EC
 S8WKMQ1w=
X-Gm-Gg: AYBFou2hTdHIAmGEZ86Wsf5mjRN2/2n0pLXxY9AhoGmPjyvbpNxLzXufq5XiaiQd8+U
 ZPS/LTkpfe+Q4qxIKY77606l1q2pDBGY99IEXwWfEwyROdPq4WqVZ/PwsH5zyC0YUeaAX2cfucj
 HwL0d+3loJzWUunnYEyb+7OhaGytgNDWnxQm+UeFr98SJb7NYIMnRxFYxQsMl+NCxuDDI6Gj0UD
 xaCY5Nm+ZF43WLfTd8hxaibnZjaXqc9Uel+JKM5A9hlF4LRCcXpf6+Tvb6FxDaLGcmHgD6FfwMk
 i+OnyPKdqtqRPdqhA4cjy7yqkzZ+vtdRT8auHyv2K+wHvTrulnvnyyVvQxzMBcnB0tW26sKO+5e
 EXXueEZyMYT6Y0crsMHIN9bm89F5/RxdZ9+ey09R0YjFtfV90Yox1kI8X+VzOjI73O05eCoB0It
 D129byM0pOdgHij1CG1z8ObsqkUCe+KWYmePcwTC7l5m3FZzVTaWPEp3BZ2ko01c5dS4sqVw2V/
 Dkcv1KeKqQTmA9SyMpjUo0CjKWsATkedPAFr+ahxA==
X-Received: by 2002:a05:6000:4b16:b0:48d:f957:bca4 with SMTP id
 ffacd0b85a97d-48df957bd0fmr9633447f8f.44.1792163187842; 
 Fri, 16 Oct 2026 08:06:27 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4ee183sm5517993f8f.29.2026.10.16.08.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:06:27 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:06:25 +0200
Message-ID: <20261016150626.77048-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261011133348.713816-1-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: adding myself in packages
 with LTS policies
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> To better track the version of a package before a Buildroot LTS release
> is made I'm adding myself to DEVELOPERS file for those one so I receive
> alerts for this subset of packages.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  DEVELOPERS | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 01d98f8698..4324774a49 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3239,10 +3239,28 @@ F:	package/kvm-unit-tests/
>  F:	package/xorcurses/
>  
>  N:	Thomas Perale <thomas.perale@mind.be>
> -F:	package/go/
> -F:	utils/generate-cyclonedx
> +F:	package/asterisk/
> +F:	package/bind/
> +F:	package/clamav/
> +F:	package/containerd/
> +F:	package/dpdk/
> +F:	package/gnupg2/
> +F:	package/haproxy/
> +F:	package/libopenssl/
> +F:	package/lxc/
> +F:	package/mariadb/
> +F:	package/mbedtls/
> +F:	package/nodejs/
> +F:	package/openjdk/
> +F:	package/php/
> +F:	package/python-django/
> +F:	package/suricata/
> +F:	package/subversion/
> +F:	package/tor/
> +F:	package/zabbix/
>  F:	support/scripts/cve-check
>  F:	support/scripts/cve.py
> +F:	utils/generate-cyclonedx
>  
>  N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  F:	arch/Config.in.arm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
