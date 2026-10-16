Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5FDCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7663F81509;
	Fri, 16 Oct 2026 15:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdluIJ1owNZI; Fri, 16 Oct 2026 15:01:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8E334814F2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162862;
	b=niM8Xs60vCB8EoqhHzwdrQt3z+Ca0o9nyHTVVBgbbdtjVvzCig1/rMa8SYr1Xpz0Uqjr
	 DrNQIjRt5lwYj8lb5rLSaVQ8RvkDtQUCb83IdV17X4mXAcEQ/gL9XdyEcCeTEU2ehTfDm
	 /8P4VPar1wxHAC6mGRO29TPRfrhLrTPzk/hto0KyinG3gRsPH0UZIZXzJSS+8spSUMl8z
	 YejLxRD/AYJj+2LeQU21C+iYS6HXzAzpMg+I6vL6ZyD0v4tqpUZ7tvqDZki2v9vy8nElO
	 +0IAejg9FsDfaTmrV9IbNSHILIkNK6M6QPHsEXFijKsD5WaQcGeVClAiQXXl6MHHh/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162862;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ubxrOCBRl0Cmx7v5wPBEMhdqePd9bEtkqmvlmD20lsE=;
	b=IFswI1SBE6tpv3Xwk+RdpJXVLCrWlSFBHwSifPtBarpbTHbE2ClKXFVSWuRw7G7e4ibM
	 GsWOIs/3DdJGC8FXpgcu/OHE1VfW/9mnOs5Zw0Ie/N1zJWvwFWmtcCWV7Yn7q4rS4VqNw
	 9u4ye2DhVzMF3/JDjReuA+LAiI8VfU8FBn+8nmdZnUDsRDKG7JcwlHJNB+iW3KZlWsqF1
	 2f04E7X/dA03OhEtDbsZNJoGrTSWRu0dRMLZS389/I1HizxZJEyvq9/FQGcQj1WqOsGO1
	 PIzpTka4I7xU+ZgMf5d/odWZ8cWb1V/Uvh8ljSQi9mZV2+NFu8tggoM4MHkWtAwwTrQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162862;
	bh=ubxrOCBRl0Cmx7v5wPBEMhdqePd9bEtkqmvlmD20lsE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XNUAWG3WHg/ki5kVIgNdbsqU1O5tPrjRIK0smxxqBe55/n+55Hwh5DcCaRcwgM+ya
	 wLQwe3IusyDSdAYZYTC2tjBpbFrt8mESOz9dZ1ElW0mqDG5HecTVMRiSd8UJwrvmyv
	 xtrWO4ig+iT29vvrC9N4QiCAZXiX6Z4b7BgVHkyqPbAriMdTauykWZp6ent8Qq1Fvk
	 vKIxTWjeeqXkD9qRLFy1krWwEn7vON4FMRl1styPV77JUI5DQkRz085Op5IBth2Ae5
	 teoEKxtvSM3daymEaJua82wRPq7w5G1klGn8Ooi/UJUOS1IrD4feWluPK9pzO0DJIy
	 6dvExRLuXlnjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E334814F2;
	Fri, 16 Oct 2026 15:01:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E9673255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF5AF814F2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WaOyBwOs4FZ6 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:01:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A87C4814C4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162860;
 b=QBThrNhiYOyWEu8u+/tehYnfWQxsFOjs81rsifsT4Ub5UJub0o1vgkYjTfqyGayEbAdb
 AQX3ksPfPG+t45yhwnJRYs8P5QzKHc/684dCcerPdi6Sqk2/r9nfrvYvQ19WXRyY8fm2t
 WodAAEwzxKgi2Z1mv+yHWFElfEVuvPIzWdI1x4u08RGADZnUqp4HuKanW3Hje1qpJMyq4
 Hi66kU/chnzRZJm5QO8WPvpIdwo3qi5NOnutwY5PNTvP5TtfCBDWtCa8r78XnMctAyjW8
 6LRg3SKBtif2M5BYIU3YmYIIWR9Xq30FKkbC5ZcVkCHOyY7b6tFuD8yYtnq7jiDQAjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162860;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=6V82NAaNlkfUrSxqdeKYxfu6/Yml3gTmHyU0hqn99IY=;
 b=o53rbycqFWb5K+rpOxECKpmo7AYOjqMNiP4K542UVTz3jAI0fQQdeAsCgEmedMpC+9Lj
 s/Q2PLE3wgwlA+HmDe4sIWpyg0HQ5y5zS7/61JYUFkp2Qy+ILVB9qL12X2GnX8+iy0aln
 +YAHeuWXchme6dzx/Rg8R1yDQEPVlpKflsT/ggGoTMynN+XcbO+UwwsZPISCzgpv00NFd
 FjyQV531aCOYgwgM3mWmiVw2Qt4ins8oKqbLHwx3Gp/Cckb5HesYDLSADBl2c+RNhi8TM
 waLEsWmftNWpBBO+QDRa7gih49DrxsTzE0Hraeaj4CP1C+jhzFH6ynvC5PgEZIH0NlA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ne1LP0ku; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A87C4814C4
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:00:58 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48df54150dfso1205690f8f.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162857; x=1792767657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6V82NAaNlkfUrSxqdeKYxfu6/Yml3gTmHyU0hqn99IY=;
 b=cnDbc0JxoWCPskb/AMzJShKJB1i1VnSxuYJndPyXc9E22I9lOp2XsgsovEuOV1CpRb
 ZiwxyjM+hOzP9O+fexPV8poNfO9e0KNaBewFqLUGPZCEahUVoJug11WoriP0OM2tbAQG
 91FUg/GEAg5qPK9nnnKqDfVOjR8amH40Uxtzk1aFlMTqv5xoP3QK1ehl4xpnp9L3X83f
 cyzyxMEK8Bt4s7scH1JFrEkuGxtnexrU6z0jbeulLXrxc1PycwN283IlJfeuBvfLixJM
 ziwDo2FWd+h2cMrhKsjcUV7+pwAUbKile+A8zvo4BOVSyl8dZi97ZtRs9I6G1QEk7tSA
 SlsQ==
X-Gm-Message-State: AFq9FYIjqwTXLuJpjUyy54cs7YsojJeZmLDIjT/d+4QiU8P1LLeI3svC
 FUFaeJn62xplQptYR9j54php9BA/WNIRutRfvKStkXCiQhRpe1bdi9w2e17aIaCJO96nXpPjzze
 mXDnesis=
X-Gm-Gg: AYBFou3zBGyQd+rN+QFpf+XOGVYyJGTuIKEz1EAkg68H5me+ku50oSj5p1qfmuP9vVN
 ksNcUYoXQwbU/4XwaqqkYHTyDdoB7PLDMujooG95ViKCpe9LdSD1rMj3NnVK5QpHLmrkg4h+D7x
 C+PCEpd9BYt8wegQMCgBVMQwETqV0qrC1iQ2WpBvzXfv4M1oX0I3Kv6TS3FxajUTlk06cO/HJQn
 VUII8LBBRMLP+y1aNs6rvaqtSZbSdk3b9+MinyqMRdq9W/ivyqYps1Byub32ovDg0PT1QixD08g
 YzQ4Y8UaqznC2+uFM9UbI/xFf2pyAP1Ml9kSMVvyOmZKuoZUQeNKmqH0ZZFqkTNT2Wmqk8e+vtg
 SHt8pcnDu7BISSHvx9HLwCExUEckk/IEr2EXyvSWSGiHUfZWJ12Ez6BG5hV3qZeBVP4bQGAR70K
 LUjrXPgujHRiy2nKPKU1cijPvzlxPjJ+M41ruQppPPIFimVHPe6ZLMknxzPrQeLYEGmq9eGKIwb
 pJBd/JttNiVfT6UyDKT8jlg2rXV1oKJRl2TtZNugVQcEmnCDuaa
X-Received: by 2002:a05:6000:41cd:b0:48d:f14a:917e with SMTP id
 ffacd0b85a97d-48df14a9316mr15286989f8f.11.1792162856628; 
 Fri, 16 Oct 2026 08:00:56 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfe4d2321sm5722181f8f.19.2026.10.16.08.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:00:55 -0700 (PDT)
To: buildroot@buildroot.org,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:00:49 +0200
Message-ID: <20261016150051.59764-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20240826214434.1530363-3-geomatsi@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] package: binutils: install libsframe
 to target
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
> Starting from v2.40, binutils provides libsframe, a library for
> manipulating the SFRAME debug format. Buildroot installs libsframe
> to the target image only if BR2_PACKAGE_BINUTILS_TARGET option is
> enabled. However other dynamic libraries from binutils are linked
> against libsframe, including libbfd and libopcodes. Any binary
> linked dynamically against libbfd, e.g. perf, will need libsframe
> as well. So libsframe should always be installed the target together
> with other binutils libraries such as libbfd and libopcodes.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/binutils/binutils.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index d98dd7b830..b459d4a271 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -120,6 +120,7 @@ ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
>  define BINUTILS_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(TARGET_DIR) install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libsframe DESTDIR=$(TARGET_DIR) install
>  endef
>  endif
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
