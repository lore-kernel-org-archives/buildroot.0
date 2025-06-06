Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6A4C61CE8
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 11:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1760140D7F;
	Fri,  6 Jun 2025 11:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLZKoCt7pkZ0; Fri,  6 Jun 2025 11:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47BA240D4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47BA240D4E;
	Fri,  6 Jun 2025 11:42:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8ECAD3
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 11:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEE7380F67
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 11:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id plY0tUNaPuoL for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 11:42:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F38680F1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F38680F1F
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F38680F1F
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 11:42:54 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a524caf77eso298634f8f.3
 for <buildroot@buildroot.org>; Fri, 06 Jun 2025 04:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749210173; x=1749814973;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/600vzf2Y265FJUqC+HCs3zQ7zi++lGUYyP4cIF4D7w=;
 b=Qn+8fTcLQGDBtag2SMoX0o3V38ofk/Y98VXxr5ey9nlOG32oHsHQnePBaxUFd+AQnD
 uywKOIqgDR+CU0eC7sNeVMdlxIWq+FV13D3WU3Cm9nCpsa9bdmXotRV0oQkGVypy7oIx
 HitewMa5NowSVVtxO/rHCeMW9Jck3bbZtSKMmA8mVWdas907bhLroaJ4iymMIeHlmE92
 P1tRmzQ9h1YzCSAhnqADbFaCYPq8VnZzBT6GfazbM0sx2wXOux/8kkWlsAiO5gi5pF5k
 q4Jfvss+OyuoP92KhTpBEWrKrvYZgub4GhAOJw08NP+jbVwReSQyucja4w0m/CuNtITe
 MXzQ==
X-Gm-Message-State: AOJu0YyGzVFOUH7wNPMR0y8qYVnRltdfUdCpL0Y7uy9VXQc8/HOy+Kq3
 TBBX3qWHCJc/2dRHsWfEVsq/Pwb0n/u4ACoqHEZWiQava5xEZX561Fn51WaF5Q==
X-Gm-Gg: ASbGncv1XneSN/95nYRIvrAXXFE4HHKB7Ugf0OLvWF9fY7ntPF2VsVSInlm1sgF273o
 KHqaUnmBFhzE1Vb3yHhTpvwmfDjWr8lwXqC/Zi9y3Ct5FRKY1RfcfSY/MO08Hq5F12svA0P5irG
 lYujpGO7T/kF07JM5bLiMOwRQdEApf3cdsXxsSHeI5742OIINpeytGoep3z89/s1T70NjBc3WJk
 9slOmnMHgW6tDhCVuCAJrAPlNdMnPNbk8yxveg3KHXAbcfOQQh7I+slNagQeKuDA6ieaEGfGf63
 Y6qO1mPW3rJocVuAWS3O1AUc46PWfjBV7kkc6RylCc9MUjNRbA==
X-Google-Smtp-Source: AGHT+IHmNy1etDtZq/2J0ngqDvuhnUFbM8489WjX5a+1qRFTYPWPoAt8CQq926OsuDnpM+XpwRkIuA==
X-Received: by 2002:a5d:584a:0:b0:3a4:eeeb:7e70 with SMTP id
 ffacd0b85a97d-3a53314693cmr788253f8f.4.1749210172789; 
 Fri, 06 Jun 2025 04:42:52 -0700 (PDT)
Received: from skbuf ([86.127.125.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a532436871sm1614360f8f.49.2025.06.06.04.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 04:42:52 -0700 (PDT)
Date: Fri, 6 Jun 2025 14:42:49 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: buildroot@buildroot.org, oss@ew.tq-group.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20250606114249.qq33op5vguahk4mu@skbuf>
References: <21834b48ff096e427bdb722be447f4ea8a770135.1749133483.git.matthias.schiffer@tq-group.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21834b48ff096e427bdb722be447f4ea8a770135.1749133483.git.matthias.schiffer@tq-group.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749210173; x=1749814973; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/600vzf2Y265FJUqC+HCs3zQ7zi++lGUYyP4cIF4D7w=;
 b=MKlRkK9m/OQFr8l0qAyh8rEr85TIGW1QhgyKaIivO+C5vegdUa/n1chVlDZY/QoQKN
 wVyOyMBHB82uM8tF+21eh6QrA0Tn/EqPMr7R9Azz2NehI2JAASSa0emj24IXZ49RCAUE
 iqsgBZ8X0aflzKiUBZZyQT5uIlOCWLOhELmR7Dh4fEdfiRJ7re0TtnigvTG60ZEQlqE7
 tOdUEprdv4PcEo0MmXTDWE6RIMK88YCCWH9pKMspFM0GPZ0ck8J+ErC8mPrgWBTxkr8s
 Z9qRy2MzCxXykmwzPL1W8c4l9O+YCRzSGMKASH31mRsV1F39AU7fkZCuVPFqfqhoFsdx
 yUCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MKlRkK9m
Subject: Re: [Buildroot] [PATCH 1/2] package/qoriq-mc-binary: fix target
 install
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Matthias,

On Thu, Jun 05, 2025 at 04:32:40PM +0200, Matthias Schiffer wrote:
> The check was referencing an incorrect variable name.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  package/qoriq-mc-binary/qoriq-mc-binary.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/qoriq-mc-binary/qoriq-mc-binary.mk b/package/qoriq-mc-binary/qoriq-mc-binary.mk
> index 68f00eda20..5ae2e48c65 100644
> --- a/package/qoriq-mc-binary/qoriq-mc-binary.mk
> +++ b/package/qoriq-mc-binary/qoriq-mc-binary.mk
> @@ -15,7 +15,7 @@ QORIQ_MC_BINARY_SUBDIR = $(call qstrip,$(BR2_QORIQ_MC_BINARY_SUBDIR))
>  QORIQ_MC_BINARY_BIN = mc_$(QORIQ_MC_BINARY_PLATFORM)_$(QORIQ_MC_BINARY_VERSION).itb
>  QORIQ_MC_BINARY_INSTALL_PATH = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_INSTALL_PATH))
>  
> -ifeq ($(QORIQ_MC_BINARY_TARGET_INSTALL_PATH),)
> +ifeq ($(QORIQ_MC_BINARY_INSTALL_PATH),)
>  QORIQ_MC_BINARY_INSTALL_TARGET = NO
>  endif
>  
> -- 
> 2.49.0
> 

Thanks for spotting this. It seems to have been introduced by Thomas'
fixup (the QORIQ_MC_BINARY_TARGET_INSTALL_PATH Make variable is not
present in my original patch submission). I also did not notice when
looking at the merged form of the patches.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
