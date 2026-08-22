Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83DEC5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A784780ED6;
	Sat, 22 Aug 2026 12:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bRIVDpZduMGp; Sat, 22 Aug 2026 12:30:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787401803;
	bh=ftdnDVQZfIJzK1++t0QzRxTPCTjxF2ATXaDR16uneq4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YgPAAOGgt1YBVc4B2Nzif/b3j9cvNbj1/Vl7ngWwiYZPL63BWLyNSMLHpoDf0grNY
	 G1tywMqNvRG9MLRw4x8BRkSeBKQyHQUSbKAfLaJ2oDX+wLUhLFaXr+vTlkNbOz3io8
	 7oKDAK/lOI3tPYEhNymvZ6TkXXBCOXgCiiRD2IP02XboPOnYX2O9uTXBDdXivqdeqF
	 uZ8Snwu4exz3TQR2z68FaIM6XcdPtrJ7KEk5DErfr2xSoO55qHkBRmn5NJrciMkS+e
	 vlWwbtIshxTlT1fLQ5jVQtYLlvF9ZGITpqh+om2qnGAp2oE7CJ+oKLMSeo014/K3Ja
	 jORdyxAnG4e1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5E8380ECE;
	Sat, 22 Aug 2026 12:30:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D33A2B2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7318C605FA
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RnJmLvuwQBP6 for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:30:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 703BC605F9
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:30:00 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6983d3dae7aso4999456a12.0
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787401799; x=1788006599;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/Wwe7xjZNiQ8q7gI9eVzF5zS4KqHD3PETyk5lC0CJ2k=;
 b=VDsugQuDh2KGJhbWG0xswk087aY7M3Kk6bJdMIvlsevMYwPJmDRo1NI6zNJ4pOOUg0
 oQ/0Ih6fqmvxF2UcFGX8HjsEnLvD7uu5D30E7OXf+Me8ZHhHQIlmJcVTAO2ryozcr7Nm
 eHZ5XBMACU//g6/7kBmu4rDb7so5PdGwWhO8eBK2s5zpchf3TEmaELl2L6rnlDhJPHd1
 MPUKW/5JZVfxGpsJ2qZinLZC0eoznotKlzrpVpB6r+3qYOdHmVgxdHGMPWCkYLyGcNF9
 CpUkK3izcpTlBRtbmkyM8bwOxV+zyxwAfmZh6zkWhibZOjTo2HysWAwfBWnXFnL/H3mu
 sHMA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoniouC95CFwz/GyK+StV0hc2sw9ULffEGwv5M2Ys130K6j0GcMNoM3nj5LosnN5HbnLBRio4cN/xY=@buildroot.org
X-Gm-Message-State: AFuF++lO4IVPyINKshm5LYav0I4her2dtnXLxIfxE8ZTXBNmTEVWhOgH
 HdavJP0jpELRGpkM+3+M2Fq5ZyeWdWN0ScH0FrxisCwyYRZwqGFmtpSXuSTzZpomrcDpoRpyEl8
 ctw6w
X-Gm-Gg: AR+sD12bsK9LI6q2umbvkZRt8NXVsK9jx35GV/jpomuct75Qi/XTtexzLoviM48Drdz
 EcbbPZNYmZT69XouXaz5JjyohFZi1TdkVdfhznpzLw8FC0fvStqtuhR2S0t2OAxb/ZbOwmTakAp
 aKugRFe2MsoNc0eZqq09w2h8dR3sYMVxl/s09DZ8HrIOGnxIG71YKRtw6SNuzzma9asRW9P423C
 uC2jySV/t6zCnd8ggzO9NEyQhgeY+cCG4jHKbxvS8UhvWIVeSi66ybAiMrcl+ZdB3c+a/uTuLVL
 +SPVu7eif2T4PY+sZpAJwlidA8JUupEOtPbZt44U0k3iK1jFgUhAqP2Tgy7tQ6w5dEhsx+UEMrZ
 37tr56dTLU7ae9ZeY1vhCSSPJVewqgQ0GMqKt4xVE1thsAaXx27oSgTH+wzv0hiajDMKQbBTXQ7
 8G9FatzMxDDynAt3Wknhp2rNvLXQtsWbmkb+PNPB6A2ZXmBbzbUX1ioBjuO6NbWk0GCuSpxoH2I
 tqnGjYLHJs35TdvOdZinQwlWCwPuxXqpCsOW1Zjzh1qKk8I
X-Received: by 2002:a17:907:1c19:b0:c16:785:cfb6 with SMTP id
 a640c23a62f3a-c246d5b7ebemr1211077466b.3.1787401798673; 
 Sat, 22 Aug 2026 05:29:58 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606b208sm284912966b.10.2026.08.22.05.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:29:58 -0700 (PDT)
Message-ID: <ab89a2c7-634c-42be-9075-327117028d52@mind.be>
Date: Sat, 22 Aug 2026 14:29:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Thierry Bultel <tbultel@free.fr>
References: <20260813143405.2868517-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260813143405.2868517-1-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 1/3] package/dracut: security bump to
 version 112
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 13/08/26 16:34, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
>
> Upstream changelog:
> https://github.com/dracut-ng/dracut/releases/tag/112
>
> The changelog lists multiple "security related commits", though only
> one mentions a CVE: CVE-2026-6893 [1], which allows a malicious DHCP
> server to inject code into shell scripts.
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-6893
>
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Applied to 2025.02.x and 2026.05.x, thanks !

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
