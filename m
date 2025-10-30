Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DA6CCF9F8
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D02F81858;
	Thu, 30 Oct 2025 08:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5z8smb7jE0Y; Thu, 30 Oct 2025 08:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5446F8186A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5446F8186A;
	Thu, 30 Oct 2025 08:24:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CBDC02A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B077F6128B
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTCSvkom2Vff for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:23:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CE24561325
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE24561325
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE24561325
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:54 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3f0ae439bc3so429637f8f.1
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 01:23:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812633; x=1762417433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=044iXWKmNpmAy8ULsau8TfKEHGjripoW2lTOom+Ece4=;
 b=GREUhRo2+mu4EFqSSI391RjC+4xrPgWdoTjnTJt03b8LzRoxJkZcEy7KyEhnAwi5sw
 eMbAGzTTrHJanhx+3gaS6lYLmwAiHtrtfEGxbjmNZvqX/KXLuidcj1nB0InhrOchOV93
 r3yOE4gW2rccxVvJ+CeeDEV2NBuDgI1YNs2pLVvmfueG3BvTrsgeY38qj2qgg0YVSFNP
 sNWWawPltX20i7KbooU4YQ8FcBNWyEW7/iekqZmvzSe0irohNrFT+kRXvpbWo2y1BTyW
 kU0MeZmDqOG1oUw+HN9N+TGVOAc07OKcOaRC0Y2NeV6C6n2I3/Kl6pqW1xY2zyFDDnA0
 iiwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdQ7bgOawb0bqsYDCBTCp2zbldUIIIgFRhw5llMZHgK2a6hGbczF/PaWOmo3ZllI4/JebnlMXXb0A=@buildroot.org
X-Gm-Message-State: AOJu0YwZlmQIxToAuQASwgzBt8Yg3I9GZHLyGsrnV3Gn5Zy5/HsX6lZk
 onwJmrToRIJDpLRendDcckcvRkXkSH8wePrXszgZkHl6A+yzgyBTxoohFO8tDBfs/lU=
X-Gm-Gg: ASbGncssfXVRt22nRlNKoTYP0zXHl/hY21T6jT+stZLcZAo/SDGYevysAYzNmEJ8uga
 unjWxsbBjzWoSZ6Q3SMcdOqYnsbmfBqO8BefTmuJWVFN6FBlhVvAx4AX3m4XMYszd4npambtJNF
 H6oOjSOlMaUZb7nKZhdDlIunJ0dXziw4mX+JAP3MY2csCrGvOswvPRcbk1rkr63o8PYU11IoOkK
 WOTdUfE2PLKOKIFjxgfEbtxRdVi+ys1ADbOI+lioKcRbqdQxr92K0IxaDs/hunMk5ax2EX+p4Kr
 5x/jrwgme60bj9YTEELVpkXWQKFJpks2F+Uva30NQW0rB0SwK5EWOOyaD+XND2jli2itRE9wUF6
 ycmmt3HBozhHkqj5phOhJuv6PuzwSTnGWJ/Gnt0Fhztfn/HkMetNvSwsku7YO7zMinzIVvtOV85
 J9sy1csPMD7Ue5/d3YFQKtfgYsTjsT1VfQHz12
X-Google-Smtp-Source: AGHT+IFNxTpznP71T4aoWYJWHkKm4WGSf7ZUdNJvYM8Oy+kvela0dY84oTGiM+wRRVs8AnUKIC287Q==
X-Received: by 2002:a05:600d:4342:b0:470:fe41:a93d with SMTP id
 5b1f17b1804b1-4771fb4546fmr29088745e9.4.1761812632816; 
 Thu, 30 Oct 2025 01:23:52 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289e7cf5sm27984835e9.14.2025.10.30.01.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 01:23:52 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:23:52 +0100
Message-ID: <20251030082352.35292-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023140527.544948-3-titouan.christophe@mind.be>
References: <20251023140527.544948-3-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761812633; x=1762417433; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=044iXWKmNpmAy8ULsau8TfKEHGjripoW2lTOom+Ece4=;
 b=Ck4IIX2zLEAHOQYhgOMZxd0MaUuoTYFCNC3fzddBPFUlA8nwCvVQRt5hVlzCfPwey1
 jh9lwjmbZ3MmxCgKw/fVAqqbZD2SKjdSB65EoHkSO94GwjuilncdzSFiwAvWS2oi2BvQ
 /HuKuXLBLeFdcqdvOf+sHXRzFVveGyLSDIiL7ikhxqcSlCnvQDjRyILXgCZBsfQ2IayB
 vjlONreJQgVozCQ2XzSn4B2PXsvVkO0jJGarEtTd+v5QGleRfLjvZ2oerbxPQ8IRdtWd
 ujdq4RNK0DXBvEhd43dMsKHEadUc/Ut/G/lRFiomFvtoEXPPpaobhBS5bkAv5o78jTzV
 VunQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ck4IIX2z
Subject: Re: [Buildroot] [PATCH 2/4] package/libssh: ignore CVE-2025-5318
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
>  package/libssh/libssh.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
> index 3c7e77a206..2be9013454 100644
> --- a/package/libssh/libssh.mk
> +++ b/package/libssh/libssh.mk
> @@ -17,6 +17,10 @@ LIBSSH_CONF_OPTS = \
>  	-DWITH_STACK_PROTECTOR=OFF \
>  	-DWITH_EXAMPLES=OFF
>  
> +# NVD database is missing an upper version specifier.
> +# This vulnerability only affects libssh<0.11.2
> +LIBSSH_IGNORE_CVES = CVE-2025-5318
> +
>  ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
>  LIBSSH_CONF_OPTS += -DWITH_STACK_CLASH_PROTECTION=OFF
>  endif
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
