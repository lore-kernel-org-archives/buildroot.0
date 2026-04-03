Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D71E7E367
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2861A81B58;
	Fri,  3 Apr 2026 10:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BgWnjV3H9G0; Fri,  3 Apr 2026 10:27:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2DDC817AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212070;
	bh=AC7aFue7BiWCFbfpC2fM78bHju650+vWqnO1T4wsFvU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eBVAU9zTtM8gYTPLF7ZL+Hh6thmAD/dMdk2i0ton9hhe11Vr3rabZgO1j6HGNv6tF
	 uutUCrHcXGfZ2PYZlOoioVH+XUk2bRRB0mAKnVkIHxPETi9Dm0o4YJE6+ZgHoXoN8O
	 RZioLEbRHt1UmFeGfQem7pPwe4LGg8+LYZEfPlE+TDa0quVMHeO/YQfouctL8thyKJ
	 2Rw5UnILFTEUxH05lvgu2MyH1yW5kkChgEKmsPJ7+QM5+0J2z596rVJhlkdrpSuQa+
	 5XeSSBd4Wa6VDkxTqj8mblEpNrAgEqklzH/RwDeB3+tabdu/fUVdEu4dY1GIR42Kmz
	 3F72UQ0mszEQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2DDC817AE;
	Fri,  3 Apr 2026 10:27:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A2B061A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9445F40E48
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dgpYZvR4red0 for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:27:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8A1DC40E46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A1DC40E46
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A1DC40E46
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:48 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-488a041eae5so960035e9.1
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775212066; x=1775816866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PFJApSbCiU6UnDuVj/E3koUnO9feNcfvmb2dQetzTjQ=;
 b=sSkSuFLWqk6kwTwjnG1mKlGN53u4fjobLc+m9RPd45LWqB/GFHOw8jcbno52uw1Wgb
 1ZAYBiSEuGFipMZSJ6Yo0o9LFLrZp1hDR6eKcpJ6lowHWviQcbBdgV3G3hfK2nCKxGsJ
 DWWGk8N8TFJLUbePAk1CN1sZNXYnGqOgk/TMWORbvq0lRIDCvzw+xPfvLd40ZxrvfBUE
 bt6t3AOBK/Q3nYXqeA/DRvjKMhK9y46ZURMpT21ZTpo93EYD2UlTghfSFK2+0+M4BKTm
 f2Zpmy5zP7n14+1ewHkPOtaohSvs/ePNd1CF8qHuamG2lz7BrIy51Ah1G5QwfNPRO4rV
 q+eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEIVuDGNUkW6DshLdKdXtgSvKgzUp3ANsrULE1ivIVyho0sQ/j8Jflmc9RRcaipNMeZnV9Ntu9S3c=@buildroot.org
X-Gm-Message-State: AOJu0Yx4CF7Wn2DijNzIwC+wR+aHxEPSLnhlTLjXc4o+85gmsIG3gSV4
 SUM4hImcw0zW7IhoQwVfMipNGFCeDmVgoVJpofV6HiptPsqsPCiCudIem8F4Qqme6a0=
X-Gm-Gg: ATEYQzxpDfvoDXatPLqouCL3k8vcrlvyABVvqdcYgNX/fzYq7ckfY4Ow3QLDwxBTQ5F
 seu4FyreeXUK8uzGxJC9u526fqmWz3yXhMwJbh6W3CS/5gKDCjUc1hAFgv5V9JKziw/Il11CPRT
 8lqNsR+DL4NpZP2Mg4D7WukCdZFQvPh66nM9Zm3fL+eLhWmB2y3oouFX2k3QNkdAvI8onAyGVbC
 JtRm+TeMATQyivD6TsNGklhxVFAAt7414N3dIfgGjr8Hk/H4s0FbTIezDIeVU6c58p518YyYGQr
 k+mU01hA5jLtWPLxxdSeNluHZDsLLjHLgHx30mYVvQWTMMMl/vknaOPp47DegYup6rSUdOPT5ye
 8RdMcKoXNtMFzSSsiT0RpuBLofydZZV9cgqKLEBzH/jAyVoeRE6hGdKdFgvulSr5soHcGKMm6IL
 S5l3DyVHyuMd2Y6fVH34YOiPpkrb0=
X-Received: by 2002:a05:600c:4ecd:b0:485:3f41:e113 with SMTP id
 5b1f17b1804b1-488996e0c5emr38809495e9.1.1775212066245; 
 Fri, 03 Apr 2026 03:27:46 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4888a626100sm227486995e9.1.2026.04.03.03.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:27:46 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Apr 2026 12:27:45 +0200
Message-ID: <20260403102745.209683-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aYOKhsGmWtZsI5Xy@waldemar-brodkorb.de>
References: <aYOKhsGmWtZsI5Xy@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775212066; x=1775816866; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PFJApSbCiU6UnDuVj/E3koUnO9feNcfvmb2dQetzTjQ=;
 b=eaLOQCa7WT9Voz5UpzKijvY6K1BG7sKnTniJbmEUn1x8bRoO+oPoBzRHfezXMD/O9Z
 ehCKH/G6crysEES7blynkHYR6NF9uovpNys10XDp+HH6KuCr9yoiA5wP3KQq02YcGZlt
 JN9iRoN4OgU30hHADDuO7It2Qn5CZkkWAmhyqO76glf6PoqtEVKGPsio2lWmEy4Ng1a8
 VqycTn/N56iqyvB91+DpUazJ9Xknopxf4hrDxtECaOLRDvxCyb1id/chi8qnDlTF58Yk
 uHie2V2V1uy013zwt5YZvqEWsQL/p8W8LGjCAglmHYhYYjIcpQ7VH7O7+Lf5vy0ww2X1
 lXsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=eaLOQCa7
Subject: Re: [Buildroot] [PATCH] package/asterisk: bump to 22.8.1
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
> See here for Changes:
> https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.8.1.html
> https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.8.0.html
> https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.7.0.html
> https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.6.0.html
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x. Thanks

> ---
>  package/asterisk/asterisk.hash | 2 +-
>  package/asterisk/asterisk.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
> index 26175667c3..f1573f6575 100644
> --- a/package/asterisk/asterisk.hash
> +++ b/package/asterisk/asterisk.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256  8a94650b6f348af1f1c9cce7ed3585d280f3a31b0d3820084a42b03712df95d5  asterisk-22.5.2.tar.gz
> +sha256  4f30af0695a0131fc091d85e7b91e22504609434b3fbd263898c7354d41959c9  asterisk-22.8.1.tar.gz
>  
>  # Locally computed
>  sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index 9a071fb8e0..b59f2bf5aa 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ASTERISK_VERSION = 22.5.2
> +ASTERISK_VERSION = 22.8.1
>  # Use the github mirror: it's an official mirror maintained by Digium, and
>  # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
>  ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
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
