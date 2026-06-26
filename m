Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B89C43602
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50A2A823CB;
	Fri, 26 Jun 2026 14:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GO1KqXJSibxh; Fri, 26 Jun 2026 14:56:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 697C082361
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485769;
	bh=Cho4CffdSircP8/vaZPQ2c0EUX661HrhV9MTRMqH4nc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mCvp3gDLgiupSMgeTK3ITF1+xAfMmBKBxBN/R77MYWSILdNRy/bqTGbgfytZ7mddL
	 W6ALhSTS/fLOyeZj3Si9ht60Uj+2MVOuv0guMH+6jqw6yKfUxMm+CuTy8ydY1tm2WE
	 PqAKI2wNCKV3IB/wnYNDFOQ+PZPd2H488HcVSKM8gaNJh1qfRqJ+Iy5WxC3hD3Lt4P
	 OmAmkbw8UsSrEtqrQ9WNb/T6HAY+vTY/wAoZAglHK56Ph0DeCaSjYf/bARwTV4XDKW
	 Ehc9bVucZnkYjRMvGxBkBex3pi2ucTAWwYYMLBBbcTapFcCPGJILDHPRBf6gH09cgC
	 wHg8xv21rSwxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 697C082361;
	Fri, 26 Jun 2026 14:56:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 541DB231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44CE4411C9
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PGlDM4JYCAh for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F688411C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F688411C8
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F688411C8
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:02 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-46cdc80779bso940057f8f.1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485761; x=1783090561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XlAUj7EFPoldhj092X25c6DvR4QRFGv2OuAgoyd6qH8=;
 b=Ymtnrq1JSvlXmmEig8cS5ITtgREzREKhmSPS6WNUPKcfMCtVEcYi7Ml7iaplnBHWXl
 iBcciBKYEQnBMchFFwV9gUCn+dLD9QuFN2s989p7eyw1KaIYCS6ehIWmXu1bsoaPcfJc
 lK7bNckNmIucjGpupNWv0Os/Hf+aF0BQh+Xvfo03SZUHjEdK//cTyYjoHnd0qBUWM6yM
 7oOk1KqO81GRPiTX2S4WTwbpobzFXzsBpuHRPTtjLg50QdOio/GpkTdsNG4WkokRvNC3
 xi16qd+DdAQu3e7OIQnv0W8di3qU7S8u+fWO7q0tBU2CezO8tDJ0Kz6/Hxo1ATC5PEJ3
 GtQg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqOat2BFFkDMoR9w7D+yrP2vd/NTw58T+TTyPMP0rJ5eKbaVeXW/TW1yeiDJmQ8F9UdTjdmAWDH+7Q=@buildroot.org
X-Gm-Message-State: AOJu0YzsiqcX7uCVZa87/ALOuUAYSdUGkWA816trlvqLC3n0dzunM9ka
 uRRwuz3KJ6vFwPrCT3cHN2UZuDHTo+w9VE35Qvj5FE/ed8p9EeSrf2HHnDcg+qhxWvY=
X-Gm-Gg: AfdE7cmwvfIWvEvnxcYNj/YPUmDIehADPfHx6JmftkGwKXzkVV92tw6qowA7mLTWR/T
 WmOG2YVDk86KbM4ETlklsEvflX0ofDyJbL4tACzzW8A8/7mfkdrdahbFG9iPHQ/4ftcGiyfHJrp
 aSeYE5DIMOrURhJ4Ju5PiqmdEy90m0kxVySgHDP29fP3gSbBctrIG8QRQUTvIq4U/d1TbVvQl+V
 CJY6aT0YEMoftKQlPMFe0q81PXnfgMhDqQdyxEk2M4VoCmpeVVbFOhOoyAuSDLebTe/aXYJGkXg
 t5lAutrAjmV+X8BIKXbWuCAOKOoinY0DWuJueaga4rvFJPymnK2Nst7RhDpWN9+E944ktQil3BL
 FWJLL4kP3T1XgykkAFTx8ArpsDdTiPJZAI3RackPXXZ3bsOwdJkz5t1C0zDlsp5lGlQaJNes7Uk
 0NxWWYlisI/6uq3is=
X-Received: by 2002:a05:6000:4a0e:b0:464:6ee:4fe1 with SMTP id
 ffacd0b85a97d-46dc1b9bb98mr11314856f8f.33.1782485761038; 
 Fri, 26 Jun 2026 07:56:01 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1ee018e8sm28063761f8f.11.2026.06.26.07.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:00 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:00 +0200
Message-ID: <20260626145600.343531-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615202534.1281579-1-peter@korsgaard.com>
References: <20260615202534.1281579-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485761; x=1783090561; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XlAUj7EFPoldhj092X25c6DvR4QRFGv2OuAgoyd6qH8=;
 b=D3sU9FnTa3vpoVPqqjCdRJKDVbo3VHj8ddpo/orRHPefBbpg6YovkR5JD8LP0b4y8p
 aOM8SVA4hVRXpw/yJ0izmZBblvjPToYwGxTHn8M/mXCdW/rpvgilR0bOtqhSExjXnVDI
 bu11Tu512fgIu4VvpDqmSczBy4YBd/R03N3OLEfllIFvMGgl449NYyVpvHXCR+qI4gUg
 GOPVaw3Hi+ud1TSz2O5u2x8ZD2yf8uhJfYXN48xRoW4DKEaEmJYwomJy3PLiOLFJTXBF
 LUzfZuVPBRfG6VScltpyAQBGO/FDRtOs3NSMZ96QuCcns7K2HEAk6gI606jxKfMPni3p
 6o8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=D3sU9FnT
Subject: Re: [Buildroot] [PATCH] boot/shim: add patch to fix builds with -O3
 / -Ofast
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
> Fixes:
> https://autobuild.buildroot.net/results/c6ad52a048ba030bb1adc3ee1aeb69ef880cbdad/
> https://autobuild.buildroot.net/results/136d1afc2ecacea6a4e12b915073e3eaf5c8ca01/
> https://autobuild.buildroot.net/results/a3f293371f6bd0125dc7baa5afb64373e4383f4f/
> 
> Shim contains an embedded copy of OpenSSL.  Depending on the optimization
> level, an error is triggered from make_kn():
> 
> In function 'make_kn',
>     inlined from 'make_kn' at crypto/cmac/cmac.c:81:13,
>     inlined from 'CMAC_Init' at crypto/cmac/cmac.c:205:9:
> crypto/cmac/cmac.c:92:20: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
>    92 |         k1[bl - 1] ^= bl == 16 ? 0x87 : 0x1b;
>       |         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
> crypto/cmac/cmac.c: In function 'CMAC_Init':
> crypto/cmac/cmac.c:69:19: note: at offset 2147483647 into destination object 'k1' of size 32
>    69 |     unsigned char k1[EVP_MAX_BLOCK_LENGTH];
>       |                   ^~
> 
> Fix it by including a patch submitted upstream which backports an upstream
> OpenSSL change to workaround this.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  ...make_kn-and-move-zero_iv-to-const-se.patch | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 boot/shim/0002-cmac.c-optimize-make_kn-and-move-zero_iv-to-const-se.patch
> 
> diff --git a/boot/shim/0002-cmac.c-optimize-make_kn-and-move-zero_iv-to-const-se.patch b/boot/shim/0002-cmac.c-optimize-make_kn-and-move-zero_iv-to-const-se.patch
> new file mode 100644
> index 0000000000..2baa0de56c
> --- /dev/null
> +++ b/boot/shim/0002-cmac.c-optimize-make_kn-and-move-zero_iv-to-const-se.patch
> @@ -0,0 +1,72 @@
> +From 7aee873d6f6b0737dfe566fc8c5cd4eaada9bd5e Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 8 Apr 2024 11:56:06 +0200
> +Subject: [PATCH] cmac.c: optimize make_kn and move zero_iv to const segment.
> +
> +Backport
> +https://github.com/openssl/openssl/commit/03cf7e784caa4c61febbf249be63cbae3e368ac9
> +to fix the following k1 stringop-overflow:
> +
> +In function 'make_kn',
> +    inlined from 'make_kn' at crypto/cmac/cmac.c:81:13,
> +    inlined from 'CMAC_Init' at crypto/cmac/cmac.c:205:9:
> +crypto/cmac/cmac.c:92:20: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
> +   92 |         k1[bl - 1] ^= bl == 16 ? 0x87 : 0x1b;
> +      |         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
> +crypto/cmac/cmac.c: In function 'CMAC_Init':
> +crypto/cmac/cmac.c:69:19: note: at offset [-2147483649, -1] into destination object 'k1' of size 32
> +   69 |     unsigned char k1[EVP_MAX_BLOCK_LENGTH];
> +      |                   ^~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/97b6333cdc7bad24aba7af1b04890679e0058299
> +
> +Upstream: https://github.com/rhboot/shim/pull/652
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> +---
> + Cryptlib/OpenSSL/crypto/cmac/cmac.c | 17 ++++++++---------
> + 1 file changed, 8 insertions(+), 9 deletions(-)
> +
> +diff --git a/Cryptlib/OpenSSL/crypto/cmac/cmac.c b/Cryptlib/OpenSSL/crypto/cmac/cmac.c
> +index 2954b6eb..27dbfaac 100644
> +--- a/Cryptlib/OpenSSL/crypto/cmac/cmac.c
> ++++ b/Cryptlib/OpenSSL/crypto/cmac/cmac.c
> +@@ -78,18 +78,17 @@ struct CMAC_CTX_st {
> + 
> + /* Make temporary keys K1 and K2 */
> + 
> +-static void make_kn(unsigned char *k1, unsigned char *l, int bl)
> ++static void make_kn(unsigned char *k1, const unsigned char *l, int bl)
> + {
> +     int i;
> ++    unsigned char c = l[0], carry = c>>7, cnext;
> ++
> +     /* Shift block to left, including carry */
> +-    for (i = 0; i < bl; i++) {
> +-        k1[i] = l[i] << 1;
> +-        if (i < bl - 1 && l[i + 1] & 0x80)
> +-            k1[i] |= 1;
> +-    }
> ++    for (i = 0; i < bl-1; i++, c = cnext)
> ++        k1[i] = (c << 1) | ((cnext=l[i+1]) >> 7);
> ++
> +     /* If MSB set fixup with R */
> +-    if (l[0] & 0x80)
> +-        k1[bl - 1] ^= bl == 16 ? 0x87 : 0x1b;
> ++    k1[i] = (c << 1) ^ ((0-carry)&(bl==16?0x87:0x1b));
> + }
> + 
> + CMAC_CTX *CMAC_CTX_new(void)
> +@@ -151,7 +150,7 @@ int CMAC_CTX_copy(CMAC_CTX *out, const CMAC_CTX *in)
> + int CMAC_Init(CMAC_CTX *ctx, const void *key, size_t keylen,
> +               const EVP_CIPHER *cipher, ENGINE *impl)
> + {
> +-    static unsigned char zero_iv[EVP_MAX_BLOCK_LENGTH];
> ++    static const unsigned char zero_iv[EVP_MAX_BLOCK_LENGTH] = {0};
> + #ifdef OPENSSL_FIPS
> +     if (FIPS_mode()) {
> +         /* If we have an ENGINE need to allow non FIPS */
> +-- 
> +2.47.3
> +
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
