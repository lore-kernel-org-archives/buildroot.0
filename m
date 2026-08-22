Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38764C5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07C99811C1;
	Sat, 22 Aug 2026 12:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wu5hbnMn-IRk; Sat, 22 Aug 2026 12:41:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787402462;
	bh=Su4urbi045cukCDhF1uY5kmMzEP8ooxulrDb8B0yX+I=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=kkrfH2TZ5xeBKXrl45gXLGp88bsTUAUHhsYMFehTGr/JFCUHNyWLb9BnMfRlilibA
	 ClLFAPbW6Hqw4My46E4q0u/gr3C46wuG0ro2R61eLUmMXglYR+PT4EJiFdcSi526Kf
	 Zkjj8t4YvEk7Gml5wMuZMeWKWbUHjrH523yOQjSbTdyspeNR4HfUPBabBxSeo1PASC
	 CGC3lcuVoxFv2PzM1BKxgZanEi15fJ7Ug8GXo+T/bmm4TkENieH2KcYVOvb9MkMMff
	 W+DraOUAsWR5fSNeE0Z0q7jpP85Pe05OH7CU0Lp/9T8lyAaIcjqLoVj3SZONYLJfR9
	 LIFK1jQjgZRhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7478A80EFC;
	Sat, 22 Aug 2026 12:41:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A628118
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C52F40073
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6z6f8aiOHzV6 for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:41:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 156DC4005F
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:40:59 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6a0a4aa99bdso3473298a12.1
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787402458; x=1788007258;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gHX2mNbm3RFa3mJSGvYIvDx+EZpsj+ko0AvMFMLa3s0=;
 b=R0u7l0TWtdKuFWccDKZ34LeBnTVjyDEc20at+sCBsrAzRWxn/QTCOqxZdbLsLIhiBu
 b0H0xrJ0/djzfIyNc4rIYbuWDHTFM7wsdzIBDqrYAp7O6EW45tmz8qOs+ZPJhjQ8u2of
 N0SExKEES14sCNd31Tzl5wWpfw2AbOgIpuMxz19gpWMJGFuKI6FtCzC3QntBl6ulK8La
 GhejmiFpKbBKP1QpJ1Q7j/a0sSmQYf+u6Z5g5BjkN8UMZ8vywke2QO3T12dyor8IcCwr
 9UHKsHePjC97ZMhHGs2awXRXB5bQ4lQTd52pcg2/DxvSP0YlSLHC6WxjELaFF6pszC9s
 MqXw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp4IGT6ZDBkrMN9lWCZNFOCivtX+xdvctlIrmTUX2D9+l9+Q8vRIexyUJOxVfuxJZ+wEX3ElrQvwG8=@buildroot.org
X-Gm-Message-State: AFuF++mgW43Kt/cmRR+UR4AP8tUiTbSR+LcwHhAO31BrnNH9fyzhGIdq
 7AightcE8qB/bFWHT1lN3qDFZmOz+pxqITjLMt2OCn7nw42KDZadWnettv0Udxaqcmk=
X-Gm-Gg: AR+sD11iALHcqtXwqvXoFDIHc1oqc7ZtRVD68grBcI9np9Stx3gGjQmLukhlszhyqAC
 ZKONwIXdam13pAVDvz/HdxB02T2Oyhj90HNLuJujMpkJ70mbaIKIPBIeT9pcDvyJapRue8f0sHw
 eynSYYd71dcnJNjQj7X3W/dC07EIugwZHqttofb3Dk76rs8uXwD3QlYfwraPHraE9aJBMX71vvF
 KGgyITH34AXpo/ZYcP6CyDiYYL6Q7WpuumMgOj8WUfR21zIW55rrjkTWcsdziHUKz3Y3IK+C1sg
 nfdfMn6RELwgQlsbg6hKSDYWkkfWYHGdoQnE2Krp8SWunTzf+rk3jwg3AhuXu+zlM1tu9zRoaxr
 boMC0dgeB/J+6YVLbPZoEgaMEuYoEEW0iFNRU1IbQclfbjiKxa0wbB+xmyR6dcPO2FvNhEpvB51
 v1/FXww9CCD1Ej5jwyuYyVPuHTg50uCDJ99XYCT+nmE6n6OsHX9aWD4oRDokq0Rvo3P/x4nBc48
 uFwHx0rFJu/edvIsJPqrX30VaK3ZKLr3uHsvGRV7j6YsbLS
X-Received: by 2002:a05:6402:21d4:b0:69a:928:9405 with SMTP id
 4fb4d7f45d1cf-6a582af8853mr5542531a12.1.1787402457734; 
 Sat, 22 Aug 2026 05:40:57 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3ff17df84sm15721748a12.31.2026.08.22.05.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:40:57 -0700 (PDT)
Message-ID: <81dfa324-0e37-4f9d-9371-e721e319e27e@mind.be>
Date: Sat, 22 Aug 2026 14:40:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <aoGDFa6rPRC6pXm6@waldemar-brodkorb.de>
Content-Language: en-US
In-Reply-To: <aoGDFa6rPRC6pXm6@waldemar-brodkorb.de>
Subject: Re: [Buildroot] [PATCH] package/quickjs: bump to 2026-06-04
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

On 16/08/26 11:29, Waldemar Brodkorb wrote:
> See here for a Changelog:
> https://bellard.org/quickjs/Changelog
>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
