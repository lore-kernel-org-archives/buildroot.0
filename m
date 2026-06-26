Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7942BC43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 13:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 257AF81F69;
	Fri, 26 Jun 2026 13:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ei4CSuLAT1vw; Fri, 26 Jun 2026 13:55:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FF7481FC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782482130;
	bh=SuyGFM/FrdeQbu+ouaIq0ghDnH5Qova6ceqz/MmQSY8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=UbUn0JtFae5xLmzZnI2bNo/wClUKZqydNIn3MZ4nEggDg6YTQEZtVrAXX8Lt4j63+
	 5eadVknu5qH1PlaD1WbJUxxPk5QqD1UQSEaNO8tJTQokuUAqQLJyS/nBXplmMfE7HD
	 50Q5JV5c53g4pYYk6AA8V74IQX866UErGbfmzGcNE2Y7L6PG86SVafpRyxu6uPRb+f
	 9v17PdGfO91oWXeDrs9IntHeMtT1+NHEgrxT/lmssB8/fqdF0F7tWRVgsViLvHAynl
	 a02a0EzHkgBscNhKXyNKbcyRGep0itqxaG6mO4ERz862w1wL3/eAJvpbDcPbPcoU72
	 2LyZr9c9Te+Gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FF7481FC3;
	Fri, 26 Jun 2026 13:55:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10217231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 13:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 018F840648
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 13:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fR-4Dyn_1d1s for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 13:55:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F3B1405DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F3B1405DA
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F3B1405DA
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 13:55:27 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-491609cdd8fso6549855e9.2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 06:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782482125; x=1783086925;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LDo0lFlENldNC8xanbNCoNG6LuvT20xCpxXrJwupjxM=;
 b=bnCWoBKsR8MS4hS0t1mMN2Y/x/5bZAFTiXjpOcxMZ0Omtieezh34kPkYO140ZgpOXo
 cICT7EeI5sDdyHzW89xDG0JrghUW1Uxiu4Qsp05ZZUqbd5/sx1MMLXRvBt7egtVe4lFT
 p44it/RWDmTahEpy1AmVFJ8xM3WHNn94ZyHT6PWX3otWMmp3mW3g5yTd+2E2VIvlB+/I
 OeCtzTa7HJV8BAe6tubylYRX/xpiiFU1PbpRCcoru7cknCraX7KYCLCr4rZMtW1Rn5c+
 blw0E4zyr8Ns3c/QUud83Yj3DePKPA9hQ6+66iXNR6qkz0zFcWgwwdNv5jlW56IuVHBz
 QNYg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/FuoqvBTRaFiUD3yogdVcTxZ8xTxOOa8b9nOrq8QjkNo0GQtVZJkNXvl05QUROHbM+Z6isRZcgugM=@buildroot.org
X-Gm-Message-State: AOJu0YxEYgiy6vSn+npW/cOQgFWQATXmt5k9SujI+3n9ymhp2zWVzVsv
 WbTRIULTPvxeABGtDnx1C+9OJ1fpGYPLnbYKEvCUex6GtnbR0KXCxP+TDnT2O/hhA7s=
X-Gm-Gg: AfdE7ckEcs3rcAGR3jA5grPtBqkxwaNSlyNtsfcZJZ7WX5XXmDOdavFzw/zNv/zZnGA
 vNf9D055bLvLvk2ezzRuVYRp6hwTRVNVORpHes5iq8A/T2Q+3SXIaG/QojA2Tj0c4NA1YNh7qv0
 9+SYLBDn/jGCmniVoIEG05m7DhtE0lbbJe3tui/miHkDoRlelT/zhTGQkL4QMl75JLslYFEmkI3
 fxVRVEozRWIP8XN6/quH3JC1rdgQHFyTTkF/a9lkPF3h4Mh7R9UyonMMIJ0EmMxXlWCBgNxoYWM
 FW2HxvgVuQAtImwh+MBTiH7/9Y7jZ7VQNaVBinY+VVmfI+PYDMtGVNfFK2BRFo/rW4I1T9n5mFb
 oSGEurm9c1s99XIJNtEKr6kbwhl5xQzyPvk3YSPKT+sVcAi9xkQlwMoG27hb68Vw2I68HLUAFAG
 N/jRyeMA0EGlI76HvX+PqGg0pAy+h0N1kBRxRzQTUJtNSioWfK+Q1uJWszDuJn2VIliE5ZhUixt
 u2ewgU=
X-Received: by 2002:a05:600c:8a16:20b0:492:490b:a604 with SMTP id
 5b1f17b1804b1-492668b74a5mr82348295e9.37.1782482125150; 
 Fri, 26 Jun 2026 06:55:25 -0700 (PDT)
Received: from [10.5.90.81]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268f7670bsm79895905e9.0.2026.06.26.06.55.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2026 06:55:24 -0700 (PDT)
Message-ID: <ea6a253b-396a-497e-8660-021c4f8d578c@smile.fr>
Date: Fri, 26 Jun 2026 15:55:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: thomas.x.weber@gmail.com, buildroot@buildroot.org
References: <20260506152755.399373-1-thomas.weber@corscience.com>
Content-Language: en-US
In-Reply-To: <20260506152755.399373-1-thomas.weber@corscience.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782482125; x=1783086925; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LDo0lFlENldNC8xanbNCoNG6LuvT20xCpxXrJwupjxM=;
 b=KT9VBIIarF+HFMg24Y5Wi3X+H2W9QUQhkc3eVDJ2aUimLHyrhYLRco3+EgwagBvT/Q
 KKZ8WaoR07NvkKnUYV7LFroGrhHIetb9mQlCsjCalTEH9IJUSBdaFKviifzaGfJnQfaP
 iN86wVUJti6zmm+Xpp83nqR+TJvsDfRRLxeM4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=KT9VBIIa
Subject: Re: [Buildroot] [PATCH 1/1] sdmon: new package
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
From: dowan gullient via buildroot <buildroot@buildroot.org>
Reply-To: dowan gullient <dowan.gullient@smile.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas Weber, thanks for your patch.

> +SDMON_SITE = https://github.com/Ognian/sdmon/archive/refs/tags
For packages hosted on GitHub that do not have uploaded release 
tarballs, the `github` helper function must be used to download the 
source code. This ensures a stable download mechanism. - [Source: 
https://buildroot.org/downloads/manual/manual.html#github-download-url]

> +SDMON_SOURCE = v$(SDMON_VERSION).tar.gz
Smae thing here, when using the `github` helper, the default tarball 
name generated matches Buildroot's default naming convention, so you do 
not need to specify `SDMON_SOURCE` explicitly.

> +sha256  641c3d0cfa3efa23bb7deecaaef1271916065cd0a20d6f63594c7ad6b37fa3ca  v0.9.0.tar.gz
You might want to consider adding a comment line at the top of the hash 
file indicating the origin of the hashes (e.g., locally computed or from 
upstream).

If you switch to using the `github` helper, the downloaded tarball name 
will change to `sdmon-0.9.0.tar.gz`. You will need to update the 
filename in the `.hash` file accordingly.

> +	$(info Installing sdmon $(SDMON_VERSION))
It would be better to avoid using `$(info ...)` in the build or install 
commands, as Buildroot already prints standard messages for each step 
and this can clutter the build output.

Also, when contributing a new package, you should add an entry for 
yourself in the `DEVELOPERS` file so that you can receive notifications 
about build failures or updates related to this package. - [Source: 
https://buildroot.org/downloads/manual/manual.html#DEVELOPERS]

Best regards,
Gullient Dowan.
Assisted by Buildroot Review Assistant (used gemini).

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
