Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31051EB28D6
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE6A96119D;
	Fri,  6 Feb 2026 08:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zk990wP4O3xw; Fri,  6 Feb 2026 08:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB10761198
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365496;
	bh=COJyWJPQUcyHOZbwIL3PkiUOc6YhLGr6ARb9AOOgodY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qP1gujrruGlMHIFzqT2LjnrgbOuo3UpzmtRIiTXOYCAQv0cD6dAOPDR0YbbMcNYf5
	 00ncqTx6PGoVSSsvWnPf+Gniuz+EEAhwWwAc5rpdpPNOFQ7iqu/i2bhADJwsC6aF0K
	 p9q+5Lz8CDxMW0LxxvLu/Bmybdf3PwRfQTw/c1ri39VAwZBSz9H8WMBz6b3SN0zOa7
	 SN8jacxVtIOBA69H12vyiIyBh8K3xitfWAFY2YqUfEZ/It+TokCtYAMKCDtYU+5JCt
	 ntxeVzh7r0+AnsNmQ17S1uzzVoXo6HTmboKrLdwXCEWDDLpsskQKykvVvE5OVIVH1c
	 zrQgzQZbtCoMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB10761198;
	Fri,  6 Feb 2026 08:11:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3267219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8185C83BC7
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pw8AIPm2kJRz for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DD6783412
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DD6783412
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DD6783412
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:30 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4806b43beb6so3991865e9.3
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:11:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365488; x=1770970288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2zNDFZliTpyGymUQnfsN85pDE8nrxRSep2AB2dPDDks=;
 b=aFdHc1P8sy4Lp0Klo1fkSkE0SKVXBXdsEBv8Tj5UIAQ9hesMVsAWApT042ionhuAAT
 kCGYDb7VsKIvimFDzRLtRiF+VRJ9toOJiyXfQHoSUTQJdqA13ppGxVxYBn1eBvzdd+Pw
 C7XOYfgYNLikmFzvjF6QxR9ztraLoSXbPrbXnjsSDvks48UyuvhWifJuE29q75vH/8If
 uvrh96h9fhHm9M/rOrAOxKIc9+/ohR2CAMERo4zyWgHGaRITQLi64qgwBSPK0ZyrNJaL
 qRdcTi0kL05F4K+tAlEPqCA6PymZfDwlLQHfZUQ9YuM0Tnc2KTxEgcQN+TyCNpfFt32b
 ro5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSzet/8LCrdm+Qef7ytaLpoZtNYeydcxskKj0+eZqrAl9Ew7tn1EO7xDCW1CFXZEaFF7LSCIPoQuc=@buildroot.org
X-Gm-Message-State: AOJu0YxvG1aIBf8I9Ebat+SdR8gY0VCk4e1uI02ZiO61hXU0oFxeNkDn
 KO16S7QWF5/+CYplk8EpULKpsj0HhHVlCWDKg9g2VnXhvZSC8Fwho4KmLoAWq5uTGHc=
X-Gm-Gg: AZuq6aKbUcm4MjX581OwArwD3j/wLogLsGgzBiIdhoKXFBXy5UExmwcJWG7//Yi4L40
 CBJh8AhTVWXTIlrljvfMLE06dZdS5H3lIlXMLqtiOx4xHnqWE1jiQM+8gkDAoaPiwgcH1NrtcpG
 IKeqnBxk+Lhl63O9Q0Gv8qu5a8QLITaWOgL6mXb2xzBiFfk+BNM/5rfwIJIgnnZfnyJSBP2s1wj
 ZKgyEgB+YEo+o0fHvjAgU4tWXkjq0Ex33HozI8fBZF8tsu+7DfSNfxiER/PeCAf1U0aHX0z/8tw
 nHWgJwNmCOzG6/LU1a2tMr3+mOP6PtqkkCDDlgYScviJu5UYha1yjFy1QP6hkP8czT1jmFoGfwN
 9SZmUnY04dRzIz6SEpZv9+mnSKi9uyJd0cbjtQNs6WOuFHkZc+9ZS6LhQl9AFXnW5DIiRgsGBz5
 LTYzA=
X-Received: by 2002:a05:600c:1390:b0:477:5ad9:6df1 with SMTP id
 5b1f17b1804b1-483201dc4bamr27893345e9.3.1770365488186; 
 Fri, 06 Feb 2026 00:11:28 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296b34d2sm4327986f8f.1.2026.02.06.00.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:27 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:27 +0100
Message-ID: <20260206081127.31592-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121110208.3355429-2-peter@korsgaard.com>
References: <20260121110208.3355429-2-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365488; x=1770970288; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2zNDFZliTpyGymUQnfsN85pDE8nrxRSep2AB2dPDDks=;
 b=c+Qbjq7nTFoz0q472udvH3hMQJ9b+7GRQuVfDR9njr0Kz1ZAhv+eyPCgPaK+iq+zqE
 O5VMIqMSKo5/zJlXtCGruQ4ZI50P8qj5rBZzRkCj8IMFp+OV+KjNxGvFU0v44XrfDxCF
 vEjGvKCkKHgJC47MqQW994TnrL8qgCzpLuRvaDHydBPUn8NdYpaPGutFrGbopJoen1IE
 AprMbPO5XvRxCKfUQWTDJ01U3ekgbJZkD/4yXN+BVQrl2jH7J9ZgMV2YBREufiW4cke9
 4dn2MkJGs2b3+eQ4tcjq7ojz1E+c8oywDR5pqwV8yOLvK5ONQr6EGkaoSBGxfg7OzUMU
 r1aQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=c+Qbjq7n
Subject: Re: [Buildroot] [PATCH 2/4] boot/uboot: fix 'bootloader' typo
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
> Found by codespell.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.11.x. Thanks

> ---
>  boot/uboot/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 22a5c35821..29f3f40b1b 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -685,7 +685,7 @@ config BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE
>  	string "Custom psu_init_gpl file"
>  	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
>  	help
> -	  On ZynqMP the booloader is responsible for some basic
> +	  On ZynqMP the bootloader is responsible for some basic
>  	  initializations, such as enabling peripherals and
>  	  configuring pinmuxes. The psu_init_gpl.c file (and,
>  	  optionally, psu_init_gpl.h) contains the code for such
> @@ -722,7 +722,7 @@ config BR2_TARGET_UBOOT_ZYNQ_PS7_INIT_FILE
>  	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
>  	depends on BR2_TARGET_UBOOT_ZYNQ
>  	help
> -	  On Zynq the booloader is responsible for some basic
> +	  On Zynq the bootloader is responsible for some basic
>  	  initializations, such as enabling peripherals and
>  	  configuring pinmuxes. The ps7_init_gpl.c file (and,
>  	  optionally, ps7_init_gpl.h) contains the code for such
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
