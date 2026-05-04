Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474D1CD3439
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1814361578;
	Mon,  4 May 2026 14:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4P71yCX-0bco; Mon,  4 May 2026 14:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21DA161557
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906068;
	bh=SbJAqyPdBPQ2kZVNfaPXZe3U4BgHLh0XaxauB1WJpgw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WkGhfYlBvF5tAEyLNFxENhS31yyg2oEi1txPgvfiyx5sWsijBi0+c4WuGKT3sVZlq
	 wlococ05wVOq01dPkK0rYRPXzgqZC/Yuri/XKSmsOiZqo/yniQsIuEnDs+Owu7evwt
	 D8YiEwbOlYTCSqZsVSzANSAu90lgM8RGOErd8B0bE6GmIK3QPcqhIKSdRxBZb58nir
	 M7tkmU2JY3vVMwHzAKObTMmRW4N8KjsTxOUfyn/0ZFAcgSKlGOyu16lG4SBLZkAkS2
	 5y+JLXgRvuqG2cLNVE9Lt/J/eu3UkfnhMX4Rz5McyA9kqEFCZIVfdFMuirBe2EJDee
	 NCq5DeewXxNWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21DA161557;
	Mon,  4 May 2026 14:47:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B84425D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4177840E08
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gw7byQXRvGeL for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1804E4079C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1804E4079C
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1804E4079C
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:44 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so67754355e9.2
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906063; x=1778510863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PcpRSCEVsia/oOjxRtFG5fJF5ypliUeVtwHYvCkBWXo=;
 b=fGs8F8RsYV/PKq35FMMJLK9x+bZiecsnFqrfIBPs6oex6/TYaTHjK639rcWOx+p9y3
 EC8rZn2UiDldoDykdVb/BMZ7Utl2Ewnmo1+ap4AlPNE8k5TwxaZ05KykoZiedRAY4mYF
 Xq3sUBDTeT1QjqngIYMyAONVDIuP/qwO/PUHR5tfX6XKCKTO1grjoMok/SzGYTPwMRZR
 +epFm01SdKW+r6tk29SQiH7SMHx9kHAwKPcoN+An8O+1I0DxpZUtae7dclreQp65fXo2
 /oUmt43om8BlLRSwF7UdsbxPPYHot8XBdqHT9oNe5D+/tPAgi4ahQghfr+iWMImycu6b
 Ljzg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/5BqkFK01k65PJfrPVthD9j8EeHrdM+6disy7VR3jpLaIVc823PuC9zxl9ew7rHwOb5Gl+yyRNp60=@buildroot.org
X-Gm-Message-State: AOJu0Yxaj/7o+KoYD80tAkyEf7a2NzGyBHFZ+b4ygowoXn2WanUJatE4
 W4/lNf76VuWFVdFg7Qu65cLYKpyj8OmIvbNvX3plCxNzz4cwqwKkN5tYqVpUwTzHwIX7o4mtTqq
 xaUCk
X-Gm-Gg: AeBDieuzOf/fwd3laa6DwVwTWk1yZKVTgAEYMRkhGvJvfgWg3AZmglwhjJgnEkaWgun
 uap6uMwI4nzDyZW27gM3pPdd6v1b4YPaFRn3mPNddF1QMLECjleUtyHLwL/wvTOxlQKYSFrIRvh
 hpRNt+9wjrwU2qf5PqwUYxWXgUZHuv0HVmS7ZbaqAKauFuf9HEn85HwQ1J3DDMWncFj3YBTMiJh
 p/3hv/+mkdNtAoDZYIYcGh812lxpOuUtUMr1pRT+hdSp5F2ZLHWyLoNO4vdXNaWTB9kx9urZCr9
 3fB+3DDvl65C0KGkZATxKbQl7khnLECi1uKNYGexAY8LXE5oJ3Qc4Kg778xgBi6+G918A3zNJD1
 w6L0y3RzEy7dQ0S9Lz7/aCkXLFK54GDtPul+J5+Di14jgd3vI8PIl8af4USTwXMpTjqXqSSDWgr
 6uRvW9nuq6e56sexto25vc62wEUw==
X-Received: by 2002:a05:600c:a111:b0:488:a2ac:a34c with SMTP id
 5b1f17b1804b1-48a9863cde5mr113355065e9.12.1777906063112; 
 Mon, 04 May 2026 07:47:43 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a82301ad1sm512564465e9.9.2026.05.04.07.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:42 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:42 +0200
Message-ID: <20260504144742.10162-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260421172625.735873-1-ju.o@free.fr>
References: <20260421172625.735873-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906063; x=1778510863; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PcpRSCEVsia/oOjxRtFG5fJF5ypliUeVtwHYvCkBWXo=;
 b=YvmHpu+/7Tf+CkVQBn3ERR7rQoeR0+NPWQCr2oQN2Q1x4pXsD/Zakpe89G8lyW7S8Y
 nydf5gBvcntSrE5HcbfO14nXFE1jHuMNcX6POOk4weXLo/r4zaif7EDoHNIt0K7mC0j+
 iI0KOX+VdbmF4a+SFpDmQSwC3Wf4YUxJiSrvvQpxPazesF2NBy86CXmmyfTrA0B1QO/N
 3Bpl7BLIWek284tt9ulLO1WBdwrb+fB61Fl7d0GuEAeoGF+6dLVjo/jKbrDPlyl2QNUq
 BpUB5H1piIZUxWIT6p+Yd9g67ciOWbDjMhXD8T5jgZIRm9w2mKn58s1ijXtJibtubAX4
 F31Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YvmHpu+/
Subject: Re: [Buildroot] [PATCH 1/4] package/python-magic-wormhole: add CPE
 ID
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
> The CPE ID `magic_wormhole_project:magic_wormhole` is valid for
> magic-wormhole. See:
> https://nvd.nist.gov/products/cpe/detail/591D7832-786D-4BBD-A16A-04CBDE20333B
> 
> This commit adds the information.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/python-magic-wormhole/python-magic-wormhole.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-magic-wormhole/python-magic-wormhole.mk b/package/python-magic-wormhole/python-magic-wormhole.mk
> index 11d4a8867e..7b74113df1 100644
> --- a/package/python-magic-wormhole/python-magic-wormhole.mk
> +++ b/package/python-magic-wormhole/python-magic-wormhole.mk
> @@ -10,6 +10,8 @@ PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/65/34/08813
>  PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
>  PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
>  PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
> +PYTHON_MAGIC_WORMHOLE_CPE_ID_VENDOR = magic_wormhole_project
> +PYTHON_MAGIC_WORMHOLE_CPE_ID_PRODUCT = magic_wormhole
>  PYTHON_MAGIC_WORMHOLE_DEPENDENCIES = host-python-versioneer
>  
>  $(eval $(python-package))
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
