Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1887CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A817140A34;
	Fri, 16 Oct 2026 15:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WepXKxQf72gi; Fri, 16 Oct 2026 15:01:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C94FA40A27
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162913;
	b=eUgQ6eXTLwPLU7eBOAzUx0WJgAa3yDfB2e0oRKnt/EgxZaqeZl38WV5DZT3Cpcx7ttfs
	 0oSK94LlCI6jGxf2E5YsMFTSaVeKak4JuIwpVdrJcrB+F27r5eQJu1rAAQh9ZAHj49/fp
	 yVe18Afnbg0NgyF5gm5x2jtqoLlUktHPU0fvJSdS8TQ/44B/z+Q2LblV/3CCvPIpHyVFr
	 R0vgIIshyE8XbYLIl/m4I4OWLl8CLwB9EOPKIsv4+kOlScEP1gFqoeobOveGlVR4ZZnkv
	 ACiPapisdRbtyEtU6ByJvL9X08ikgz3yxHYr7S0rnQBQ6i8VQsAfjdux68Px8U9Xlug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162913;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lFKxSK7BCnHuYxdTP/eZsGUGNJOV9Sw6nv5CYkAM/zE=;
	b=a72YxVyjrsOF0XJ2sPQ/SvKIyDCwq4K/fLoRaVviKMZqhfyEwjhozrzzk8/1p8imk6sb
	 FmFwzTR2SCsn6UPeAL99T0DYhDH/Lm7PbXGry/X8+fihCEe0T06h0lY1f62QnxoO70Aon
	 IScjcWb4SiB9J6e7KjN2vMZvScD54d78/7JuH+HU9ZmA9Qz/ngPvGfRxEsDB9Oo1idY/j
	 rjYq+G6Inb59B9f2pC9LNGn9c3EYlBQOetGAaYbYDXL+v/g+VwG8F8en6oSuP3zaV5lgm
	 kMnKv9CFO8XdxMlRe7b0IyMifAag6bJDEhSrm9lUHFcKVdLw7OZCrnXfnpzuJ7x8K9w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162913;
	bh=lFKxSK7BCnHuYxdTP/eZsGUGNJOV9Sw6nv5CYkAM/zE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DGS/lJ1La1Q3/VTSwsEYlQoK2MRV9aTUS04NBat+tRgMGzbCrfniHedXp1f7N8NeG
	 r8x/uGI+A70GVuGJ3wyYfRLhZTczipAmUogT4ToFUd+GW4DHNaHmf8/r4SKJsmbPOZ
	 OSIu9j5nGA9xDiTA6KvZJ+ZM272zGMdzwlx+Ae58Ts/Hj/xM1HugXmmr/jsES85YWo
	 FqBVK/KGP9mzWifmUTVM90W9lk1RSckF9yiCfiiDT/v9luZFxZxDDlmPZvuJ/o53rK
	 0IPNuOX0SCri9r+DeSx/QZGGgV8UBlojx2u8ce2LHdkzZHdh6W4ZAwAyXe3RPUms5F
	 7h+mrcpvfLbDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C94FA40A27;
	Fri, 16 Oct 2026 15:01:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B11BB255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABB4660B27
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXKdzp9hX1wc for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:01:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7435E60B21
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162911;
 b=l1VBia2TU9UxF26KdtkNnDlP3veO3wCEKiMoMFeC9+sdDo6zCNWwLiTObM+D9fQ6LBtk
 47mx2gXcrjSRjRB6dIdGpd3agPqdeEkEoE4zu6JtnJt/k7muxaoKE+w3o2IOo0K274QYz
 TPB2tBVzzHHmkjoIRzvc8XIrbyAe11qfZBYs7mTO9p2rkaQCSHuA0CdZpJ9LQyKPPNvmZ
 AxAQQC4D8DsljG85Mny31g1hukfP+oHArgIvaA87nyuILfscr+RurmdnSeMr3zwBEVtAh
 fHgXFs8E8B6LzKozFNTnAEGTTrNlfHiS8AdqmYgnQYbTpUGfidfpAEEBj4RJgwovo4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162911;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=KmJdiyA2qjErOHCm/Jtp18VO3nb+KUUB8ybL4iwLMjI=;
 b=l/+XFxmNJ+lo7i9JXB2zyNeRGGGd/0RgzKvodEylqP7E2mafMP1EaoVbcp5ol0u9udZc
 mtek/fJuYGhsABczGHlX3YQ6yR4cxxk/omWXIElx0HGs3boTefWNcrqTGe2MqYQ1+Ti+s
 lf9AoPIEPwO7H1HCTzYiNYtIhlgBirjiADTL5H69mqqyM1EAaf/MMf9e5pWFeGSlU2+LS
 NPS8UihkxCpSEzCMtgTX2GxQh/n0LI8rpEsjlI27Ww33no8zzGUymzfZh4/vb91dBuQUz
 27tUnVQFfbxy/kTN8tB/DIF42njibx/0ETjJ2qvlOL1f5BBIg3TZomr94SM3ruxVU3g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FDv9RLrr; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7435E60B21
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:51 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a1d75f2f11so174065e9.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162909; x=1792767709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KmJdiyA2qjErOHCm/Jtp18VO3nb+KUUB8ybL4iwLMjI=;
 b=HTblPMjwaA4SgL383H2tRpunWxJlUtyL1Hahbwuf9PjnS6wxBPa5x5AAX5l+ouTjXl
 lekom6sdwspF2dCuC0lqVbKKW9Sanoh/nXyDjP2C0I0Zw3bsAhRPCRad+KPJFQEMGerO
 JUkxq64cWV3EvRV5vNyz5QPw9BM8jxmAqOoGOpv+0aLlQxuT7KGbyALS4fqf7MQwZ3r7
 0rFs3fUXPjTADLesFMY6Ymh/L9GEc+VYQZXcPRN/xBCqytYPnenZ/MHdqXT0VhQEt5QV
 xxMenIS0Aq7F0mBj4mYpZmi0l/3qir4qsAtXed85wuB6Oo31cR1uNKI+Shx1/lQvkFWr
 fXhg==
X-Gm-Message-State: AFq9FYI6iHUZEUrH2o+4W//FAPgcKg4hNuE1m1T51dz+PcHJWs0NJ5/U
 6c/0oEnQhl2KhvA9VOJuVeEvEG7Jnm3LHigMq5KUyDkiEqt/DFwLAXYItj7CkDvAtVRXW54Zlo2
 CiicZzPk=
X-Gm-Gg: AYBFou3TLYq3SIHXqlt20BPUR2+s+s4MMh1ZP4klTf4o2W7jR/cQjfuPNEZIFmttJ4R
 iYjD0cTFJTfo/lU4y6YhPv9B55Y81G8pA8e3uSu3PizLc+FUlsoHvK9doWDvp81a5vMlqFq+tL0
 HxISQpK1iPb0I98uyalmDDUlJHQXEkkUQj//XVF/2VKh6zdCll79JL/dXlR7IKxM+ZUjT/5+I0i
 tSqqVDu9xi7vsIF7P/QaUywLIhKo5VQZ8W38dSXpjjOzMQFJFwZEsWgHQfLlBz9Jakl1RKz4UsU
 XDT5Vq6xKg9vjPqUJFMnFqz6k+68tXKBE52iwR4DC75rIDcg+/6yreriKX5GojzDRBUlxoDewDl
 oxtLRMRcmVFlKgE6xT5wQ/V4GiVT1o9/oadEHFm+TDbp4Shh9tWmwdMXZH90zmePdiU1UGLKru/
 ar/yujlz8nC8i7c9piLP+VfL205vDTxan3+exLVDeLJixwL90XXEApMKaUlVv0Mu6chlHfyIPfP
 k/ywtwXq3pYPNO8mKrOW3olAOWv5xd5qeBOMzXUtw==
X-Received: by 2002:a05:600c:3b1c:b0:4a1:c646:3edc with SMTP id
 5b1f17b1804b1-4a1d75f2aedmr1435985e9.11.1792162909280; 
 Fri, 16 Oct 2026 08:01:49 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c9a6787bsm39584305e9.1.2026.10.16.08.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:01:46 -0700 (PDT)
To: buildroot@buildroot.org,
 =?iso-8859-1?q?S=E9bastien_Guillaume?= <sebastien.guillaume@vendeeconcept.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:01:43 +0200
Message-ID: <20261016150145.60199-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612121516.1634-11-sebastien.guillaume@vendeeconcept.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 10/11] package/seatd: add CPE
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
> Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/seatd/seatd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
> index 69be691cf6..583755a560 100644
> --- a/package/seatd/seatd.mk
> +++ b/package/seatd/seatd.mk
> @@ -10,6 +10,7 @@ SEATD_SITE = https://git.sr.ht/~kennylevinsen/seatd/archive
>  SEATD_LICENSE = MIT
>  SEATD_LICENSE_FILES = LICENSE
>  SEATD_INSTALL_STAGING = YES
> +SEATD_CPE_ID_VENDOR = seatd_project
>  
>  SEATD_CONF_OPTS += \
>  	-Dman-pages=disabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
