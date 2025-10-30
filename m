Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F13BCCF9F8
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D458481766;
	Thu, 30 Oct 2025 08:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_7pQV2quP4m; Thu, 30 Oct 2025 08:24:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE41B81544
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE41B81544;
	Thu, 30 Oct 2025 08:24:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 25C69160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1742561360
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJ-E6n51w0G9 for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:23:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0EDA76128B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EDA76128B
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EDA76128B
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:53 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so425039f8f.3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 01:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812632; x=1762417432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ZGXabmmVkz9qBGIA8NKeU6Pfv221E6QnCpo7R9CxeE=;
 b=oeoQaWo/A8RT903zShUTio0tjYp+TK9qq8yTPFkJTMBTxvOhllnCAwjx79da/eplqT
 25AoF8Qk+XgCckgdHe0hvJX8vleRshnhlM48avfHkIizXYhlFHNpFDfbpqVfOtF74Lea
 dxujpaKJwdXEDXH0bXCbzH1IpcClU8AyraALH3ueB5mYu/6ZOvZLlY0mCpbOO2eqPKAA
 S2kS3rrd56Sv32z1Juv0DLci42bTb//256s706Qc/tnmFlJso1qIq7H8Bl1qSk5NSzZZ
 SKkwnfkrj1Dyq+K1qITAlZvSQVwJ8lk1K71X5FoaXcfhnk/zjwe10Bb6X9tKzq8oxsGS
 3/wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqprfH2kePiv11R3139oJdK3pb7+L40Zn16PGNcNThCt2duMszuAH1yHlM08ShqDA0sEauiWOFXfg=@buildroot.org
X-Gm-Message-State: AOJu0YwTFw+Uy+n4R/H5TysRGXEWcFJ7L9pGf8VNE7RHNXYoCZ9Szpyt
 5WIGDambWraKBALDXcMUY6Z/iSFSChuwe0omiII0reqhOyYQGeYjQrxfryMrtK5l3IA=
X-Gm-Gg: ASbGncvkUiwnBlEuRfIXLDRg8XTX86VUGFsDt99AlZJy56a4Q/4WPRTOSL/QXjUnkG/
 K3ret4g5A+QLIuIFcbShz9VR8gATlLFC55MWJLngmHLWIPJgeIgMy7REJ8AujcEiZEvom2MTkJz
 sfZa4cdyezuejWsVwXKETN4oe178hFuT1iCUfnguETaFZ4/NrvA/0iRXEGL5fMXqbeM0tTmz2TX
 CzOJRv/vvF7hETT73+wgsYCd6NKfuXccUsu0Icd+om65jB8juIA0DQsdqeVOBT9U/N/pcjpAHW0
 k85KRFipsQUl+nGCfVZna8ipSxERMzVNChgnFZcR8Eg+SZRbRq1i4CEyTkcOpLhHVozXDp+vzos
 /9xZPZBco27mBYoJIlh4yG0Z9OgmufEWk9OBMg/wAWz7tcLweeu8q1y5l9a+NF2Sa+nTHL3p6GQ
 eWNVq0+TOcBVekOqzxCPPlSramSGhwf6pbzHlO
X-Google-Smtp-Source: AGHT+IGqyJSQHwl0DNwbeBtS2sRcD4i3UTTI+B5gFsgRdP4zmeG2lZaLUTvQ5ExQc+3gcI8Z0cIu2g==
X-Received: by 2002:a05:6000:2386:b0:425:6866:ede8 with SMTP id
 ffacd0b85a97d-429aef77d5amr4277123f8f.8.1761812632023; 
 Thu, 30 Oct 2025 01:23:52 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429ba445463sm863512f8f.10.2025.10.30.01.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 01:23:51 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:23:51 +0100
Message-ID: <20251030082351.35240-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023140527.544948-2-titouan.christophe@mind.be>
References: <20251023140527.544948-2-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761812632; x=1762417432; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ZGXabmmVkz9qBGIA8NKeU6Pfv221E6QnCpo7R9CxeE=;
 b=UUC21fxkyh5SWVgq04UiVFp2HzFWb985LURSoXlvidhAXsrU56GWcVupWqy1G9pcZo
 27lb4eY3B+VmJgbpGoRZFWDUZOjnFUmpUgqawbyPFCIt7AVrXXaT1tsqAXYy7/ho4pC+
 l9JW3AC6veNpIqI6LAlBoMIrRDVsGeG07EcBoevmTsAV6vMITN0i5wrTIrL2zxIX+Ns+
 J0szVIdZFX1iRof/4QKMfvR/8bUqNgoxw0tUeZw4TzqzkLk45FsT/1DztvJj2WETAYdO
 tyc2ttbNI4qLcL3PgpZyzX/aFGo8+04WwQ07+oKNZo0MZ8beowi7S88FcN8VceZp7qIp
 NghA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UUC21fxk
Subject: Re: [Buildroot] [PATCH 1/4] package/freerdp: ignore CVE-2025-4478
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
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.08.x. Thanks

> ---
>  package/freerdp/freerdp.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> index 3a1ba61621..391b9a4675 100644
> --- a/package/freerdp/freerdp.mk
> +++ b/package/freerdp/freerdp.mk
> @@ -13,6 +13,10 @@ FREERDP_LICENSE = Apache-2.0
>  FREERDP_LICENSE_FILES = LICENSE
>  FREERDP_CPE_ID_VENDOR = freerdp
>  
> +# As explained on https://github.com/FreeRDP/FreeRDP/pull/11573#issuecomment-2904160524,
> +# the affected code is new with 3.x, was not there on 2.x
> +FREERDP_IGNORE_CVES += CVE-2025-4478
> +
>  FREERDP_INSTALL_STAGING = YES
>  
>  FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev -DWITH_GSTREAMER_0_10=OFF
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
