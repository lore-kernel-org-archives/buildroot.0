Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75298C88E50
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 13:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 477E080D2C;
	Mon, 14 Sep 2026 13:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wA6p0TXBKEkI; Mon, 14 Sep 2026 13:10:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8C05A80D1A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789391444;
	b=NdvynnqZal1Pimt3FT+5O/ffoqtN7j1ZNniRwzzUGPbdcqVH2hfv8R6T+attvzQ69EGW
	 +vMbSbwtL1VOEuD+lfKu7crg5mWSFbHzqHDGo6eLVccldI/voNZmbAk/rNdHGiG/4UPQa
	 XfXw2l9aEhjR4zm+dJeJqladEXU6zO8jM5UGlQa1IaBbqKDCjjDKEppyOLa1p5ec/csKN
	 VLW8IRfx/URHZX7D6RbYBLh35Cq5LTvK0/BXQPzOVTLDwDLiHF9kOZL5+J4Z6jpQsNSR/
	 E1OSpdh0iwZUi6BCqzKCR1dXsUaaW31FXBJiyvx/VSyiq84rTojGx7hP2Iun2pdqLog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789391444;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=obqqdgapgpswYbY1rgGQWaLRjgELgTAh443nHj4buns=;
	b=WHb0645gUk6XdHDxheO0bQCrcVIFPSbLTrPPfmJGaRf3YAqUcl3sbQWkj9KSgsx1ZqbP
	 G8sETEJ1iaE4IBa711dyh3q5EujRwzU16l9OY0n0H9SJCyfB8y/1cUMe0HfE0KIW6R3fj
	 hdHrNUF8VOpatI8ygiM1X4Cs9xD3tnr9xetDEliWUaTlFQX4B0g33oe7FhWruqdfjADTw
	 mo/TNNBkIp6ouZnpsKtBiSIVs+dKZ7Wu7w3lu+86pmLz82uALgDTbAvj8k5i9ZgMxDVK0
	 PRmcA9JCFr5QgDoS4y2CnK9MLmtrBNR4VK3W1ycn7OhWHgwRAokjObyPI7wghZmx3Ow==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789391444;
	bh=obqqdgapgpswYbY1rgGQWaLRjgELgTAh443nHj4buns=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=KAHYShqTuvnoSyP8XEdm1Lj7+lDHx/kSDu9JP1r+Kapyzi9ZNJ0yqKC7ei7MZaA1Y
	 xircNSTZvo/gjs5sU1TUdcUkZE1b0NetLwCJSRvaCYTatfcI2NMNoYKLa2LysFn+yM
	 jC62/DbS9ucCf+Uom5c+t76Q5PwpP3f61A7AGwUOvXEZjrWR/FRtTHbrviVKnr4Z3S
	 JFMqxqL3ZduxRt0eSSgPQcFbeSV/t3VOSSXQMQLzLLuG5syD0Yu49ZEB5EXgLv0mfq
	 ZbITKjyqYCLysVAzUcMiG3rJ9/kvPED0ajuu19YfLryGqIstfTWWUBMKzcac/xK0Dn
	 gAVMgDqVLofCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C05A80D1A;
	Mon, 14 Sep 2026 13:10:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B4DE493
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 13:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40FEA60689
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 13:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBa1Zfvy-mvp for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 13:10:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AC1556062A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789391442;
 b=F+ZqWBnK3O93JxX7WStaPzFpqVBli17vJ9deKbGvFZ8hdT1t3SNnFW8rkzKltkMUWOz1
 hTHQd/8HM/WfKvkbhICbq+8Po2Fd2cDrjm1m3y29xbdEUJs0tGwU0qtBAA3Fv0B5VxP/h
 BR8EzXdRx9ei/UMIwAdKDMOxmDGnh2zH5pYYl+5T3jlSnVMTeWM/APg2EzROtZzF3NbsZ
 1VOLSNb8+81nL7qOFqS+fOkrnTUrY2RW660xKhSY/P5/Be9JJJ/ybvkOJs6H3Q2KNyB5u
 njMBCQEWhoXdh0D/pS8dA6RakM7ivIGp3+SSvzBR+M6Fq/a2Ri+nW8pQovw+WiLmJqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789391442;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:References:
 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=iUHIRhhpdb2rfDNGie+eTjP5INZ4HxniCstBGLG5W2o=;
 b=NwHdaMG8YdEVUXkNZ7Uqpn+tu2uLnNz/5ZjGY297i/UfQE33pud63Wuvn0wWO06O3sT3
 qjBm/B6HL531boK1C2Qbv4A24Lhxl49FF0J207NAuKOolWb3vQrMxZSTNxg1/sRmnTmhM
 K8KL+BWhT2ckMPBrBa3B2Lh4mWnPSbCik2rY3NoxxW6WRV6T9N7NIcPVBFqVqD1sNIsZY
 YK7IY6+rdsPHOidw8j5ynjAs+R5U40Y49kOFdCqRlcCzoT2qpzD6R6WxHW4yWg6ssLuTi
 lfuQL1okp0TW8LmLpVdGT9VlZC2YqZgpC8h9qx/4Eexf9mr/qDD0Sbnhu6pcL9q3UuA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=smile.fr; 
 dkim=pass header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=fKs1gF2W; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC1556062A
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 13:10:41 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49e6deb520eso26092525e9.0
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 06:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789391439; x=1789996239;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=iUHIRhhpdb2rfDNGie+eTjP5INZ4HxniCstBGLG5W2o=;
 b=hHa3iOof1B1eN55quskCV16oxSOB9gexV8J18W7DCwJ4hiWCclWBXRXmX3bXg2VNIj
 PVdIEKQPqZYkX8KEDtoJloWEtjLiJqmHmrWiHkDuC7ZQ/ho5HTN2er8jngvR/pBD09pt
 awvNmmO42lTuF5EmJBJP6sP1+rcCHgfLKxEFcmqxnt/oRu8dNbaclNiwEjHJ85fAnyyp
 zzFVFdNiPO4vz8TRmFlbWeIfEr186qg0zdRfiyhqFsmfy4893mZA6oc8tCi7P0VFljWI
 GoLQez/1GpPir+tdIMnTTTqxx6gLT4VZaKZtK5lWSvC8Hb7OC/t4K+j4PfdCGI+DfWy+
 rf4A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxku1zRC1TeQWYBGLGc3/35tBnKoXH0mzyR0Ls076yuDpx3gKhpFe+Zyt5smTuRE30GieOqxRA4sZs=@buildroot.org
X-Gm-Message-State: AFuF++kL0blnEIXvrnYWB3I2kXQ9uk2+URIwtVrcGqsY7YNrRBZ5m3/k
 hhQm/ih3sR+B2vaGj/dmAW0yJmQ/23pXNdvBlJp9YLdzRpHOOQnj+b/IByerdUkm3NG6B6ToA1N
 I166KsHsnwA==
X-Gm-Gg: AYBFou32X128JAfa0Php8m5IJss4dmFGWc989WW4PcMsxRxemvtlBZ8XVyX6tMol2fs
 OvSfKWNkrXqkkXsUWgUGkPniWQZ4YxmXEj2CFCWCI7lPP+PS7T3Qp2I08bCSiA6RLJP3rBzZUBE
 yiOAIDbHHuOdfY7P5XFKwKzjxzZ0xVYdluXSJWV3HRFXNr+IkNSt3c676x6VvR5gQS+R1pH4ouo
 2QJmCN4VndABmBpY4McKdp48FdVzIOx5Naq6xUSFPECBFXimdrjbBuPZkhsiRp5WrrmtNu2W8TA
 S56cO1gyRaEaSYybgMc+GCaLWvhoV1HN0A2wSsW8Snt9HCbQ4Yg+uJnDJChEJY5ShHFNp+4qvrN
 3M1z/KP1GU/iJjiGaDx+cNok6TY7yWvJY3BAe+/oVsb2gumQeU00feZy9UC1Aq4dYXQek2wOo7E
 AFlFs4TcobXaScUz2sNddyESbLEdqIaSNmF7IQ+IW+96nk2V1PppWwKHVxm8v+cE//sd5jGu9Ef
 saF8VVO32f7mw3U2wBxDOTyld/1tHFBd3GL5gwTlZgqjc16ThjOAYzM9PBOnIZh3Q==
X-Received: by 2002:a05:600c:4694:b0:49b:d45:703e with SMTP id
 5b1f17b1804b1-49e7a662634mr30405015e9.8.1789391438939; 
 Mon, 14 Sep 2026 06:10:38 -0700 (PDT)
Received: from [10.5.90.81]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb2ecfc3sm26030844f8f.4.2026.09.14.06.10.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 06:10:38 -0700 (PDT)
Message-ID: <8a5f8a63-fe17-4a64-a010-fe9f852f5b28@smile.fr>
Date: Mon, 14 Sep 2026 15:10:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wbx@openadk.org, buildroot@buildroot.org
References: <aqZWi-3XxmbWmJbA@waldemar-brodkorb.de>
Content-Language: en-US
In-Reply-To: <aqZWi-3XxmbWmJbA@waldemar-brodkorb.de>
Subject: Re: [Buildroot] package/chawan: new package
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

Hello Waldemar Brodkorb, thanks for your patch.

> +CHAWAN_LICENSE = Public Domain
The license identifier "Public Domain" is not a valid SPDX identifier. The
presence of an `UNLICENSE` file (listed in `CHAWAN_LICENSE_FILES` and 
present
in the `.hash` file) indicates the project uses the Unlicense. You must use
the valid SPDX identifier `Unlicense` instead. - [Source: Expert Intuition]

> +CHAWAN_DEPENDENCIES = host-nim brotli libssh2 openssl
The `CHAWAN_DEPENDENCIES` list is not sorted alphabetically. The correct
order is: `brotli`, `host-nim`, `libssh2`, `openssl`. - [Source: Expert 
Intuition]

> comment "chawan needs a toolchain w/ gcc >= 11"
>      depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_11
The comment for the toolchain dependency should repeat all non-toolchain
dependencies of the package so that it is only visible when the package 
itself
would be visible. Since `chawan` also depends on `BR2_USE_MMU`, the comment
must depend on `BR2_USE_MMU` as well (e.g., `depends on BR2_USE_MMU &&
!BR2_TOOLCHAIN_GCC_AT_LEAST_11`). - [Source: Expert Intuition]

> TARGET_CONFIGURE_OPTS += \
>              FLAGS="--os=linux \
>              --cpu:$(CHAWAN_TARGET_ARCH) \
>              --gcc.exe:$(TARGET_CROSS)gcc \
>              --gcc.linkerexe:$(TARGET_CROSS)gcc" \
>              PREFIX="/usr"
When a variable assignment is split across multiple lines using a backslash,
all follow-up lines must be indented with exactly one single tab character.
The continuation lines here appear to use multiple tabs (or spaces). Please
adjust to a single tab per continuation line. - [Source: Expert Intuition]

> define CHAWAN_INSTALL_TARGET_CMDS
>      $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
>          DESTDIR=$(TARGET_DIR) install
> endef
Inside a `define` block, command continuation lines should be indented 
with a
single tab. The line `DESTDIR=$(TARGET_DIR) install` appears to have two 
tabs.
Please use a single tab for the continuation. - [Source: Expert Intuition]

Best regards,
Gullient Dowan
Assisted by Buildroot Review Assistant (used 
nvidia/nemotron-3-ultra-550b-a55b:free).
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
