Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A24F436B7
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D386E80FF9;
	Fri, 17 Apr 2026 15:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVrCuQG08rN0; Fri, 17 Apr 2026 15:25:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD50E81B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439532;
	bh=D1gCL5AjRgetmRjSU2s2Ay3klcOEM/ipEletcV0nh0g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m0rzEss62q/yLAG1CPbNaF/muKbt/EscyZdTw37dkTh8i+NIy8Y5Bj8v5nknhIT/g
	 QZ+vvJ8QmY6Dk7vRsYg21mx05ypoDUz5OSWTYSgbRu0DgArxD+GKGDa1h/yWBPPdDa
	 poqSByV0H48bQqDsP4Fbb+MSeY/agxO94PzD5RaR+zCvGJDN4pdskEVr91zk172Abs
	 BBnRpvQ1JurL37ef/oiS458zmlzLSbf+E+AKBSRB3w/lxuRG1L8y2J+yyeWurlSCLe
	 2AxJJ32nzehmufDpF1xFbqsyITCqW7LzEU2jk1+m/odBo5Ps8azUGHumT1069c4D3S
	 mWjl+UxyIHCOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD50E81B70;
	Fri, 17 Apr 2026 15:25:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DCE49396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEAC960EA3
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qSFKGMRCLPrc for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:25:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A234860E3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A234860E3D
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A234860E3D
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:29 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso9986815e9.3
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439528; x=1777044328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PdwqPFYTtzqlQF12n0ETXQ9x+0SbChKeooK+0e5g/9A=;
 b=kJA8izsnXNXf0o/BaF8vtJPfABzdd4I9Fvw1+Sa57Qb9zFCG9BCJ6RriM9cliBqvs5
 C9LVw1RyGHTic3bWety7LvCHElN51WAp4AwASGpvLmKhKgyb50k8l6EyN9eohLDM+Lim
 qq3JJgMQyAL4anXCEMp0bNz1WBryGDwh8EhLP/A7cIva/JPlSFuzcXUXAYt1Sy7e3GF6
 C0vta5+8sjH8XauGGqSQ1Fe5UWeJ7Gvu/RxKm6kH+n1jPxBVh/c07jEXBGDNwW93GzkP
 Dsj1SHECcLl8uKnFBPVmZKQieSUFq1frXRq3141Dg7ulGz7aRIaBBAQt1Ywt0qmuzIIB
 06Og==
X-Forwarded-Encrypted: i=1;
 AFNElJ+NhxKvBAIqCeGotAaKw620pOuP0YNtNfugLaTsU4x6PI2a3W+eKYhPvJp4VwLF6q/EWSOlCedXqWg=@buildroot.org
X-Gm-Message-State: AOJu0YwsBkrCJjdOW7iAdO4A6OLXOTe2MZq0x+OjPVnX55fJwdfd0OAQ
 OaqAcLsSCz5SvR8yF72V/ynbbV7SlFhknuKmeKlv+HXa6d9dN7UmDt8gtjpOlCB0osM=
X-Gm-Gg: AeBDievRlfmAf4GFAQZ6WCYJ7QLwvEX9yDxIIHUjwnZNHBs5pZ4PHjGlSwIUdBrxmiU
 LIAFN7+Jd2IVbTvHYzibKpXAYeh7UcTt8+PPDPWoO+KA0tPuoINY+CZUzfpa/Mv/3OcdA2MW8Va
 uuH33IKqA5NOg4TUHgSCotRuHuoFSmgmQ5LaGqnrtIsGF//h5QuGgCYYt4g3U2BRn0alqfHthHE
 HZwunTZoC8+AszqRMlH+gBH0IToXD+ypbpFDnA+zORoe2vR8Ax5jU8djrUx/4PpJc5ASRC/HYAJ
 LP6ke5nm7M9ISNyEenViZOwClvSdH9i5g6tlmUQ/Si8OnAdQCV37Y7u1QFtA+gDSoXnjPEd1CHo
 ABwF0InmMFwnSPjHtfoJYrGqBm51Jk1XIt7jpyS+FNMrGmI5DRzjlJyY9JqY7iYwvS8cK5ehtZ+
 hJ1JOu5qu+zHrCjgX/NibXwvTzdGeAvxSwUnXMRw==
X-Received: by 2002:a05:600c:c089:b0:488:9db9:5235 with SMTP id
 5b1f17b1804b1-488fb771b54mr35057565e9.22.1776439527634; 
 Fri, 17 Apr 2026 08:25:27 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb6dfa33sm31201985e9.0.2026.04.17.08.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:25:27 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:25:26 +0200
Message-ID: <20260417152526.314078-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307180711.1025866-3-ju.o@free.fr>
References: <20260307180711.1025866-3-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439528; x=1777044328; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PdwqPFYTtzqlQF12n0ETXQ9x+0SbChKeooK+0e5g/9A=;
 b=UAovhPBToEMswzW8obyB6SJMFcjt5hthnrNJKlrjlXqmrJcpsFYnAFLAKlMLf5FvuS
 OQ+W2aIvRgjyE4WNbqmilYmRIYAOrGNcgXlw0g2cemGKKZja3rGj64CErjaK+Jx8zkT0
 66ahUBsFFzBdNW2qaoz47PnTUYyfZui9+vfPos41+KfZfRqy8XchahbOgqmOtG/tZXZC
 4WWlqQJTFYKqZE4yYs2AEKldH7zWrHgFi2u0NXPED9xREnwbU2jdyn/a3Zllici39t8X
 C55LHwSVm3SXnca49WIPi7QWGbzfyqwIMUj9CFhQo9JlLOKktBCtwyZC07f5TvFfcSll
 F+yQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UAovhPBT
Subject: Re: [Buildroot] [PATCH RFC v2 3/5] Config.in: add
 BR2_HIDE_SECONDARY_TARGET_OPTIONS
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
> This patch is needed with the current kconfig version in Buildroot.
> If kconfig get updated with the series proposed in:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=490997
> the current patch might not be needed.
> 
> Suggested-by: Arnout Vandecappelle <arnout@rnout.be>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> Changes v1 -> v2:
> - changed Kconfig variable from string to bool (Arnout)
> ---
>  Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index d730f2034b..0bfe6d1ab5 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -15,6 +15,10 @@ config BR2_HAVE_DOT_CONFIG
>  config BR2_BROKEN
>  	bool
>  
> +config BR2_HIDE_SECONDARY_TARGET_OPTIONS
> +	bool
> +	option env="BR2_HIDE_SECONDARY_TARGET_OPTIONS"
> +
>  config BR2_VERSION
>  	string
>  	option env="BR2_VERSION_FULL"
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
