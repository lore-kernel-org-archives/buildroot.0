Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BCAEF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7243D84994;
	Fri, 13 Feb 2026 19:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id osHRiLHOLHtn; Fri, 13 Feb 2026 19:40:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DDB484989
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011618;
	bh=Vd93eXpq7cyBo8ba33YYNv2xSuvpG5ZdqI2qth056JE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SoWmS2xQ44lvU+ciJiZvdn4+QvCKYk02oov2A0RrOjTWfAJBwwOZWiqoRnS3bXRQi
	 X4igbTkw0GlSA5Osbwc9AgbiZUmAJa+ejNQ1uPkaYxlHBpd9OkMugNTfLynhcCKCDN
	 2ohJn903d2sQ0iPNfZyhe+GOtnNvUh41BXN8AeODgG+VINGJJuZsNORamGYVFgx0qd
	 eP3vOS6UfW+I27rEDTr1yu/+qCwTJNSfDb0z7jG59Q42q+Cf/rZxq9ruhRQdQqOhoX
	 ihOAK7dZFcVuDCC7xgQwIxHXgHZtaUDaJMX7cKQIKTW7tvCFGdb8+lFtznGQYsE/wM
	 Iepd080uEvlGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DDB484989;
	Fri, 13 Feb 2026 19:40:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95543EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AF02413DB
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOpqPsVKC-ff for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 63124413D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63124413D8
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63124413D8
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:35 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4833115090dso11598945e9.3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011453; x=1771616253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U01DS8eV1kklWsm5VHHByTYKp/TxF1rIx9AyMgk/mko=;
 b=UWTRjD5Nr35BgmW/LTBmcqY7IAJrSjJUjR8/E3BGm2VEllxZRS25a20RxC9u7PIZvk
 uZlVPiU3/ggkeNCzPgXaDU5K7ACBUxTCWYEcFIUpBcoRBlPT1SW3jR58lLlw3ZE0dCyB
 zKuMWmU+wrA2hlgoXLDnBTcWy1R7fKeV5OvtgRw+NrEULy00KWkeuegaaNZOkiAo9GPH
 telWdoedgHiuubrLM2h+TVpMNi2Yt8VtPZrQ3ncE7Q+Ahyclk+wvobOeCgWn4VnEs5GW
 ut3lN+cSP/TRapkD1vwZYVtoxlyqRnfmG2zgFXdMhqxulYBP3xZWUq5bZClPjZWLNNXy
 eq4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWa3je723GJ9b3sKi2+Wq5u34G12Uza3kXz83R8RFm+90FXIICxX1DI02YteSpUEau3v8823GtFCOg=@buildroot.org
X-Gm-Message-State: AOJu0YxUyP7sUlDRdPYVeW7OwTINOQF+N+t/1Hn+NL6MLQrw+VN8FCjX
 kRzQ5nFUvaLlchcZ3ETmlgtfrb1+3LkBC0kyai1yv9RIyWf5abmEwlgeMTDq/oX1d4WoJPRkymY
 7ON7U
X-Gm-Gg: AZuq6aIlEXMq6sfSlnNAeuwX2ck71M7bzj6UZTJmqzlVIEGj/3joc4S9Q0lQ1VF/sTa
 adTaZBNyHpwi+9EP8AqLGGqQz8GXJtLqREh+ps1PVtIVSiQLGPWvsKwmntxNwZHXfLlfIwbUmSX
 FSl4WInVaHYNATI4CbH8LEqnGnQRp4Qk76Wojf2/J8nfBNc0JIkAyrh4QXHQEAtj649GujZVl4L
 14/jthhr+GM1kBKXfKpYhIY2s0KcaWYX6ock5bnAeLXbW619/Wbm00EFrBhKze6esVq9GycPtim
 YqPcvm5vliux+ypSxO9Z4ztHz6P3XZdRS0CTxSIWG3vjEAsmxjmnX+KqJ1cwM87mtqi8VCH3kHm
 1APeuDwbByDcPLP/R4lLvtf/2/KXD9lYn0rsRCiXDlGcNaiA3z76QDRqF7QEL5eiaL5Tk1Dwn9M
 jutPp02t7TWzCUDok=
X-Received: by 2002:a05:600c:c172:b0:480:3a72:524a with SMTP id
 5b1f17b1804b1-48373a5d591mr44762055e9.19.1771011453456; 
 Fri, 13 Feb 2026 11:37:33 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48370ac3564sm66137935e9.5.2026.02.13.11.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:33 -0800 (PST)
To: Joachim Wiberg <troglobit@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:32 +0100
Message-ID: <20260213193732.39905-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216093534.2558659-1-troglobit@gmail.com>
References: <20251216093534.2558659-1-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011453; x=1771616253; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U01DS8eV1kklWsm5VHHByTYKp/TxF1rIx9AyMgk/mko=;
 b=JqeB4/ewmWVM5Bo1TByiTYtSk5/61Qx6XixCxydglVwgPjXTMtk3gSwT/4jdjQhVnR
 Hu5tuEwef9zdqeXIZc9ql1ZhWPwXVqC6a32gJyXcQfkNpVwflE87UsGcBqyqA8Hlc5Pt
 U+7HKPRmFoHAYH3jHQby3sI/TGMgb6ZvhL4aCHLZylh8zgZdEvaidriQtv0hTdHt4yCD
 qHkAEjT4vQN+LMvmOolz96NeZ5eGJq+GXOnAye3lI7dervfFVstWJlnIMV33FSXpiHRn
 YNtzF67JdOmNh9wKOkUimYHuHdQ+B1JliNRwAVGOxKgOi+xEUTQC4tixdHB28GdHWKzO
 mO1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JqeB4/ew
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libite: fix missing deps,
 requires fork()
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
> Unfortunately, parts of the library is not very no-MMU friendly atm.
> The below check fails due to runbg.c requiring fork().
> 
> $ ./utils/test-pkg -c libite.config -p libite
>                     bootlin-armv5-uclibc [1/6]: OK
>                      bootlin-armv7-glibc [2/6]: OK
>                    bootlin-armv7m-uclibc [3/6]: FAILED
>                      bootlin-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: OK
>                              arm-aarch64 [6/6]: OK
> 
> The dependency was introduced in libite v2.6.0, so this patch should
> probably be backported to v2025.02.x.
> 
> Fixes:
> 
>  https://autobuild.buildroot.net/results/6c6fd2ae410a82c44da54ee13a09a38a7ab220c1/
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> 

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
> v1 -> v2:
> 
> - Clarify this is a fix that applies to previous versions, including LTS
> - Link to relevant autobuilder failure
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/libite/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libite/Config.in b/package/libite/Config.in
> index 80d29791db..516d1bff98 100644
> --- a/package/libite/Config.in
> +++ b/package/libite/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBITE
>  	bool "libite"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  Libite is a lightweight library of frog DNA. It can be used
>  	  to fill the gaps in any dinosaur project. It holds useful
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
