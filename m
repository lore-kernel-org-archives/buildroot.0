Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5A5CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B74D981510;
	Fri, 16 Oct 2026 15:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27o2kCtunNQ0; Fri, 16 Oct 2026 15:01:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C274B814F2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162881;
	b=IjlPy47oyMibAIVjOmm8lsEp/hsHfABAH2isu99GmH74w/CnTtquEyVDlEY69CdVq2Dn
	 +BNO55NZ8bkREIR/9TAUNbHva7Uu+4TOK7l+NSnsekGEC4com74seLqGh2kAcvgVP8dfC
	 qTmVJSPszOG/KS3mIMrSF2++tSLpFu8t5zaoWcHQJEPLyxt7cIDjdIdxewqQbGzJk9ajc
	 ZGD72zu/GKt4tLdIqSYnoFDA6pPpQMR4dFdfb5/A3oFMf++wA38LyShJX2PGkrg/rm92v
	 jEfbFI/4tg9CtOBeOkNUWVO73ZXHB1sEllVwBCa6+pPUc6OGIXDpBpD2D4v/pE/zSJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162881;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Qo5sV1Fyw3cB9FbUV1xwfgkfpUtG03W4YIORGehPe6s=;
	b=TAQ8H3j7PsK7w99T7dzkt49QaN0BMJ8ZXPta53C0/29QUVow7HeNwQLDD2fsDRAGrVU5
	 Jpm7UUQlU8Ye6kZvXMPvQY2hLGMOLzI+UsHjNA7958h5h4haZ1hb8FCjDUvemL7OrSVlA
	 SQEIul/KH8sgdsJI2ADpW15+/8bS5xcHht/h0ZXrPgMN6+gtd3Yydya/p4tiITElhZKex
	 YIekb7LF5zBEwKgUFvFJsKsbGmYzKlXE4EbWZs4nFzWzZP5oFyDDVAL+kan81xhmD/i6U
	 l9qT5ELXPqTxSkKAM45dH7uS99I4zl8HFg7+lf/8ivGT0CJQNWv1Cqd0LfnW6WIj+4g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162881;
	bh=Qo5sV1Fyw3cB9FbUV1xwfgkfpUtG03W4YIORGehPe6s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GXD4qZgM8ywPpWYTbyh854e6/5vO9HbGqBZpYkQhSQnB5syLhJkBhfH+lQy4atoi/
	 nKh5eW2u+fBTeCGOhINYbxhvQEOmcrwPsbZ62aIA+rVv7LnVNnhL/ywHT/Jg5wqGfU
	 +7LuPsSt8vIE6EaHShbniQsXgiLbzLzMD90iX6g5NVlWHxD3g2e7LdqYQ9PU9la4DT
	 MQYe0kKhNUnwL2ySTpZ22t1jQyPL73VIByXbdbY6A2T58b9QmaP+uW8ku4ehR/qyWJ
	 13Y4HNJUnn6woifguzMYgDj7Kw+MOMvuCzPU0cSegJPtPmdGgdDZfN+U90VCCwNYTt
	 9f5/g8qyV/ZiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C274B814F2;
	Fri, 16 Oct 2026 15:01:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10F95255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB51A4016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1wPHyz9rcBF for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:01:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5865840042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162878;
 b=SlBu1xFoUZjSky7qs4Kti0Aa5p+CTw0zDB/xLrib2Ov91btnRmGC34eiojcUguGqR/eY
 JJxaP8855Ip7roaP1LVwdj8gUsNo+vpM0x3IkKFxxypBVLces88Hk6zhXqfpPMwYHuTxv
 eIOl+8qfu1oructSM2nY3RtiC5CFUU6Tr4Kpq6lVOFNqG/3hNuDOOBrgDHV/DOFqhAiZ1
 5A0Bo+At/PbajoRqT4a3ICHWi7jz8zfZruYD4uTixyFieLYnXrHy713Z4gGlbph2UGJth
 Dz2ASLKDSsXotWxndS9Xf2hCfyviYVHOGpQ8nN2hMjnZasgDkH6P6A3x638zM7ObXbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162878;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=REsR1tvhV+I63EGVSBSqCaWqE3eEqBC5E0cW7uS9Py4=;
 b=P6XwD5UyM7hiF8WFMBttqdgpOTRCaE49NJ2+jkaz5Kj4A7PtbvRq64wGkDH8S8zgAnBk
 NVKBErq/SpCUxKcl+ilQ3sHdd4lNwOAZkF+C9omEv+pwVGUoheLjv9q8FimqsPegTGRMT
 wu/KMWIHmQostZI2webHYqFhgSi7SmHnTiRc1D1lHzRoOL6H0/swdCEVOw+dL6frjgxOW
 wXYvsPVTKAtA5ZzydU6kNreIblmJMvWyYQGfTlxYxVxp4n9JryGovS6c92iqGI42i35jc
 gFyxhWv2RWGDMbpzEk0eT2lu2v7CE2BwQTwPfEIpqmvfaIk9RFGLIgdOk2/sY9F05Ww==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dtUoH66W; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5865840042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:16 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48dfdd431dcso468231f8f.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162875; x=1792767675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=REsR1tvhV+I63EGVSBSqCaWqE3eEqBC5E0cW7uS9Py4=;
 b=OWecdZOU5LgAM75jOvcrxqwqYfvhM3qT3ULrUzUGEy6kF5o6lG6/TyNNuBkdSXiLg6
 8UlfRr2U8Q5G0nU7l81k5d8i53LeRpvuwaUkFje1UGk16Iyn36oUA7hgmId+/sZrDFMN
 T/Jmp3XoTDXyhqLPkKys9K6r4xOCxdJk5ZHBnI4TdY6+4Y2/fNaxi+oNf9NloJiyungU
 3diG7Ld4tMUpdQSEgKdd8moNWGgHRj03KNRSnER/I0QzpINvUur4Gge0/SHb3TbVY8dB
 nPzscN1IcbKdG7GlCSAvoShS1iqez0M9qzB2v6LOZ/cctBbFmD4Ied1jeU6qU4YCCSlO
 6eBw==
X-Gm-Message-State: AFq9FYIqmFJkeykFxph59BhEKQxEjINmRKd2K1e4rVRQa3wbW9Y9U8Oo
 TWbRrOg0CnwSYP9cSpvDlR6yJ/I28rbc/ILQxAULbecQdbULJ7klNanz5x7mvWgFsVz3GDIDJFJ
 Ez7oLuso=
X-Gm-Gg: AYBFou3zSBrh72I23CTq6hz3QuwKnw31K0duqNQtwRgpLUpjAj8PuNLBNRnRiB3Zp6S
 4jbaMkr4oMjTA1UuqUcfOMIFU06KyXA8F65pFJEePxqVNeNF15CsTpch27zich3cwYgtpr0Lq8r
 q8d6VKqVtqO8WywAw7G9gBOxLoiP6qDJCJjZut2CnNMbc0OjpychWMeFVdQVV5anWHblUN4Fy5n
 8ib44EH+sFsOOhKSy0ed10yf8U74Z2cMU0eHzdcGxItZCOrcsuet6DSIqzUnNkaF1aFjxGdtJfi
 PSQZurjJUE9Loz0vrb4J+yTABqd8KhbYuSWfH1SVi3x6jiQuFvy2URw2gKadDu3SbCKKpzFxMPT
 FXneoHSkC0DSNIhOuvZ27u/ghklNQJHts7GfZWjVWc2rpgXG4Y/DnLFvzA4wrBxhnfgKKk77bLF
 KWy1FuOpR8mAOhWAaWi7aaY3FkKQibx10exjEOglWFdKDYTYMHsZ/rP2FxDsyxpirauGX06HhMU
 EQ9EU36FE9F46JoIHxkHi05Rg9pIGmzeBgooshBwg==
X-Received: by 2002:a05:6000:46c2:b0:48d:ed0e:6bb6 with SMTP id
 ffacd0b85a97d-48dfadf3364mr5580198f8f.1.1792162874528; 
 Fri, 16 Oct 2026 08:01:14 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4f8bb6sm5948324f8f.34.2026.10.16.08.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:01:14 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:01:11 +0200
Message-ID: <20261016150113.59960-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20251226150000.919800-1-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] support/docker/Dockerfile: make $HOME
 folder read-only
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
> The $HOME folder of the br-user inside the container is currently
> read-write for the br-user. However, practically speaking, it is only
> read-write when the UID of the user running the container from the
> host machine is 1000, equal to the UID of the br-user inside the
> container. For any other UID on the host machine, the $HOME folder is
> in fact already read-only.
> 
> Because we do not expect Buildroot to write into $HOME, and in order
> to have a consistent behavior regardless of the UID of the user on the
> host machine, we change our Docker image to make the $HOME folder of
> the br-user entirely non-writable.
> 
> Suggested-by: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Of course, once this is accepted, follow-up patches will be submitted
> to update our reference Docker image.
> ---
>  support/docker/Dockerfile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
> index e7677ac6a9..cb3fdba151 100644
> --- a/support/docker/Dockerfile
> +++ b/support/docker/Dockerfile
> @@ -92,6 +92,10 @@ RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
>  RUN useradd -ms /bin/bash br-user && \
>      chown -R br-user:br-user /home/br-user
>  
> +# Make the br-user home directory not writable, even for br-user
> +# itself, to catch builds writing into $HOME
> +RUN chmod 555 /home/br-user
> +
>  USER br-user
>  WORKDIR /home/br-user
>  ENV HOME=/home/br-user
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
