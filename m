Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CBFCA5FC4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6DD881274;
	Fri,  2 Oct 2026 10:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSt8zz9if1bm; Fri,  2 Oct 2026 10:33:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C317B81232
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790937211;
	b=pmHEWbD6VwOPDUd4Zkz6/N/5nqiqPscIhkyJId4qV2tocd0C+rXpDxXK4TuJkSWA5lDe
	 xWNS+mfyl+Tywu7YkrWvkwL0HT0KZXzhy3D0ZhUkerHHgDWrl5y7vWQT/T5pbsLoq055i
	 XFUSBGjMkbsS8JiTy7buF6trc0K8v2vH1AtcH0WDnAXrOSx6zuFtVNxG7mWy5WU36FOJM
	 Z5uf6TriWiVl0qnDMR6y+bxON83pEQhvFTEVUMugEeTbVCLcCnLtOqa+s+SJ4IC9Ae3Tf
	 cd1kDpT4bqFYzbRIeeyj5UswAzXumxQ2cFUtr6046upZSFqHlVkABcNe4qNjBdBetbA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790937211;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aumxkyuV9JRvhD3BpyIzfGgKQnaGa9JLIlU5C5SG6z0=;
	b=LdvIcGWbErnp3O/Z6d/FCtlftUQHNdLjLAz5Z0OGuqlwP+gkCDY1wE8xrSYXqXLDKUM4
	 Yht3QcHzR628zDEgZG8UsP55qk7/IXg0ggM8WxNketulzCtGhll5bTIwBhEm8sTZX0Yvc
	 g9IGr3VcImH0myiccSxP5DTWued+2kHchySyRN2J2T6G+zFFIQWWRnjO5VvHsxIZle/Vn
	 8ox0LwjnA/WVPELaHnC+2RXxkf3vwv+g5/mCN3FncPvoLpzPO0s6re5xL7pO2jvifpgxL
	 ebe4suo7fnoqi+ncHZkYU8dct9izOlyt1+85yauwSXRMYoADSqgj3MceYdMebZSn1AQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790937211;
	bh=aumxkyuV9JRvhD3BpyIzfGgKQnaGa9JLIlU5C5SG6z0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BgTKM6mjr44VMXyyF/7El7sjvda/lMrNPtA41BM3pNvds7Ay31bhl33lDorpPni1e
	 2feP6xtNP1w8byf8xQQPwzf3f5/rl+OUaHOjrEZKCbFukBCFQOwwmOPdMEPKnum/oL
	 IYYtcs/R1iQfYTgtl3oUq1iE7jpec6fDQj6aB/Jv8n0/n4te2fhBaN+dovRyXr7zl0
	 uu8LmiHGFJihf1nGChJVIv0oz98swhmzpVXrBIWAAJWVGknJVG/QNYyq36GaJwkGLD
	 DxKVH4uWwo6QjgeB6Bpizhy9Yu0KXQZFpLgjoyyrorfQsDDmwgU2GRBLva/7UADn2Y
	 e8bCtMkh4M8+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C317B81232;
	Fri,  2 Oct 2026 10:33:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ECD4434D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEE3040BB3
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PoF7nP4YhWy5 for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:33:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E082C40BAC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790937208;
 b=aWbVlsdBKcfaJvJURsOo6COVzUTRBqZjqhiKWYmqJkpsc+3eiKggIMmk/Gkv5W17HlwV
 3wIFR7nqvPMkGCYlnrxXxuR81lVqbw4h2exSt3F968F2IKcSzBQYgaH0pOdQWyi/nveym
 5zpnql0BFC6gqU+fl/bE6B2pQuYzGTCDstE7FgXkerqimgjn5QX9B04Rv2C3TR5UK8lEa
 kUKF0ZOil9C5ndFdUHxRvBsSuN/cKy+nbxZHRG27dYqiIYdegW9XUxiS82YRZ2cUI3OHo
 uSA1TtE6vSkghKNFSiYY4aw/ChCeIdt+clKSH5RfVmN0rzLJ1LzlWj/NXA8TG5gfMHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790937208;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=ep2L2aO8s596NXYVfizsi5+FYXh3x444HFPk+dBkXHc=;
 b=cNRNTHI9jEhi4hZBunMd/aQ/Av4mdjVm9bInLUPAq0fCoO6jGGLsVoFdB8e8m57NeINT
 mVp4IMuhvkkRZ6rUxYleCaGClNNeEQB5dBLwKsFJWHsatUwOgRPM2Obow5C82jZBB5HQi
 VGnT/noUrMiNFpM4MpObQbdS6bAVBzXRBn809bWJ8NcP+pd3tH4O1TlQYjt+uKaOAOnF6
 Gr0WcFhhedKXXRGnIAtRBbvXJkcnxMAm3YbcYKZ3rGXOhcrgaX8p0GX5vZmq90mZoVcJx
 NMtK8zbr5lguAdn7EJqAH5xU4mih6vOThsU8E5yF+XVloO7nLjfUWegtmSIM49kPurw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VusN+rK7; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E082C40BAC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:27 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-4a024e16179so7883505e9.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790937205; x=1791542005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ep2L2aO8s596NXYVfizsi5+FYXh3x444HFPk+dBkXHc=;
 b=SM/4sL/T3V71+EPdPnmZsn/gq9sZSoIPk0fbVS4k1CbOZGvGcrtbqzBnUjO8NrOayD
 P2xwwmkbdrqE7IOt9lq6nzpghCrMoGWrmONmCPEYVbCbEhPPuStPn3ZwIiMiDJTdOlVu
 jt5gF5G0afaA3LIMhZTb/EpSzxBE0C8qgvks0ShGsHUC9pKCpz2sW48xQ6a8p+ZB0adj
 wmXiux72lxyZWosu9wHSXNAOHoTpn0kK15uByCU8bSCqkYa1lyIk9woTBEs29NiT0j8Z
 lVWaPI6eA1yu093l4N4qc6Llp+6opsD/hzVN3VQljKJgErIVyjbtogvQ3DsM5nMmK4lY
 UriA==
X-Gm-Message-State: AFuF++lrTxYX2c5UWgXP2ywFgkAv2kN60oNsc+QGi8Y57LLmaWQTWfjt
 Yg07JLqcnmw8ZA4SmSobK7yG08PLL9S/qYrTiMvUyhc5QRtSmncuP7cIkTDi5D5aZ0Nmzm4HnUK
 3IdK7DKQ=
X-Gm-Gg: AYBFou0saxuD1ppabuB+KErUUnQwSdUhLkBzO73CYOFOqAT8FTv0ylVtRi4BQHdM03P
 xuZieMkJbppB/utvRsrFIWDCcSbWGdGYC3anhr7l1aTY8duYesA7OOsrxUsNln4ckzHw5DWsxcA
 UwmjyHqZtdy0nwqmQUmTw8u6cFgLbcZ43tZ+PPEab59rG5FOI2rFXDxwYBokrMnSYZ/1vuLhuHp
 ceD0AcUMfzcONIFcAorvBN3N0BlqIhUUqBvhYyxo4/FxJu29gPp+qQphkGSZtrYN2vRmx0UWzzX
 QJ6bB0U112Xvwfi/vEwztDnyP0K7veXwwMLJQKEY4tRtjKOvKMCWhNaf/hcIQ14CltFNk+34Jtx
 /+qVVuK7zSIYfselq/gTzFBu0sKCVL668RkdQK7sM3s2V78MbHpcwTdTFKcxFMYRN+Tb35pKYV3
 GUugtYQ8ZKEZD2FOqkHWTLJYWzGN1r6Jve85aowBfH/q/dWcSXYI9dQ95FjRHz5iN0oNK42nmW+
 kd/COk5zUsMDN1U/Za+hr8xHNxuhQ/EzyUFGCKmFL3KS3wTQw9+
X-Received: by 2002:a05:600c:c16e:b0:4a0:13ea:2ec3 with SMTP id
 5b1f17b1804b1-4a02769ac74mr39270165e9.35.1790937205479; 
 Fri, 02 Oct 2026 03:33:25 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027725c6asm80757305e9.8.2026.10.02.03.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:33:25 -0700 (PDT)
To: buildroot@buildroot.org,
	Titouan Christophe <titouan.christophe@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  2 Oct 2026 12:33:23 +0200
Message-ID: <20261002103324.77404-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928105634.825845-1-titouan.christophe@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/php: security bump to
 v8.3.35
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
> This fixes many vulnerabilities, see the changelog at
> https://www.php.net/ChangeLog-8.php#8.3.35
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index dd336f0e65..99ce84673e 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php
> -sha256  e293ed620cec74651bb4a071317892a478aa6840fab22db45c72d77cd42f9676  php-8.3.33.tar.xz
> +sha256  ff4630fbbbd94359134b7d3c223db59329905bdc4f5a9ef93d257b48e358619a  php-8.3.35.tar.xz
>  
>  # License file
>  sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 3389b9c530..497ccc49e4 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.3.33
> +PHP_VERSION = 8.3.35
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
