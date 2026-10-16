Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97E8CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83FF640A3C;
	Fri, 16 Oct 2026 15:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QI7iFcG4mWS9; Fri, 16 Oct 2026 15:01:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9372240A28
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162887;
	b=P2+iJnz6jDgMnKVGDOvzVdq0xqOZbU1dmYU0tSCnaZFWmeIOru/FF0h/I8I/OpgpaebR
	 IBhGWlgF2gXA4jCAmWGS96zrXX19vEKbHUjNPi2y7YFJ+D05KiRh3GffHYBcmUMzksItJ
	 HyNNmKdIKjhDlN7VlDFZW+PLT+twLrznTZ4lArcnItw1y2ZQDiVu2kswAtZPN6I1J4xOH
	 WeyuThd1qPgGFYkJgEOi1kd9mVt/fZrE7yrpcTb/NIXJa++ALXJL4+yAibnEdQUZd6+Fh
	 XnPZNxkHKJsVyLy5peT/vcyj5U7n5Gpfl/1E9iJQI89+L+UuQqGYr9Rpt3t9/DuNEsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162887;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=K+rHtwimin6mXQeEvA1SQ8heHi6ThriFHMLjglkI614=;
	b=lkf7LA4rOnNzF9DcEWv7AYEx9MY3zMgwMqXrZmkaJgt5Mnm8dkihgDzIY66IPw9VS0u0
	 aDnDNrKRmnfA+eZS4CvV0fo6orTK+F/LH6YbIpMKMh4saXH37HlTEPq6PuLzf6NlCWY53
	 dc511Zqvi1ABAbNCAzsZ+S6w1/XB0HLkcGIbdB6s6Zc06hI5/IxqQQPUSpK5X4i/4Hj4O
	 AV9Os3b64mATaTdgtxFW283T4v//NExVGuxID5rqKe3oeKiCD79e5S+jGwHHpXkK8faqP
	 JsZbozcrtCWm7QayAOxqEQTawPi2mVm9zwv+VI16MV5DbjkNtubfYMiD9pQrlt4g5iQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162887;
	bh=K+rHtwimin6mXQeEvA1SQ8heHi6ThriFHMLjglkI614=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WXXV3y6l4zPwAix4A2Uj0qc6xNDLUJilt6AJS1eF2sEq7pPSBCIt0dV+lL/UZ3ip/
	 COINFkB9M9ApFRnmyqwder1jEfyJFutS1LnC+7KB94OBkEDbXHjDKGSv1yaBAgKsGh
	 WJg1Wg83tfcBtN4uUXnbqZ5bHGFATLqm3h3XEVBxp6qjJzyue+oCH8oXq8GN5BGty/
	 w0D0gtB/jDsavzP9ZulpvMVEMba7i32D/UZ8xR3jArQnHBSR0wmkOK2RLhtTkbDERk
	 D+k6So9L80gCLnUJlzTbt0cIGESCjp1aJmsLGEJyxpUg38ZKy14HzDP0Sgr4Ym2zeU
	 virSYgyrd1IrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9372240A28;
	Fri, 16 Oct 2026 15:01:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 08523255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEA4160B27
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5NvCjQPpfXX for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:01:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 14ED260B21
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162886;
 b=r0wqzo7R5bnypBGnR+Atzb9wKoIbFzdTDu8amPi9Gqp8yvhONv6/cJbEmD2DNkIUi4lR
 LQtY9NIEABAX1Rx6T4T/wboyhQS0CyeFDHf8kx7coqqnjhywoWUHGKaWhKnxGgSugLAMF
 7GXCpyT+CbotuSWTfzVf0zoODxU3oFKBcedeoME+ufI074AIBAIwYbynn3FGBzLFF0ppd
 RnSyo3rSbhyNKswTpTWtouO/t+O36mlsF8Xjt7rU/6Va3w+8rC6yL5NFN82NRXnM6pize
 FbB779rC5oYwkA98prC7rtP0fR0f/QAEVcBtvp6FMXN0nvP2KOj7KQHwGzy3tpsusQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162886;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=1T9HSWg9j+GS0h/K8cYpNmpYWhq3yqcX393+mhWd9z8=;
 b=PoDwUGWagChBv6OGpgOh36ex4f1C88/wPNuz8b73Ndy24ZUTwlH4btpdz5xMQrWvUMQU
 v60RetNZ1IaADiZ1MgTDa5Xz3mfEt2+AlkX5KbV0/p3rpym8iS3VKfCEcAIxAWcICSWwZ
 bqR7/Q+jX8o9hf3wDly8I51oOAad6D5OeUMqVm8FrYqBK0bytHzGftikhOheX7X+KyLQr
 UsorpxoHrgygWKYR2d+I32+FMMBmZmf6z4yCiBl5309HZ/NqZhDvoJf8xHJmmCo+bPFS5
 Zsw08EhHMgMcpferE9G5a5JCf6vJtnqLbk78k/15LeGr8ciEmkU63z6uVbAPz5bSmNA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=V+m6Akhw; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14ED260B21
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:25 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a171b677d2so471615e9.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162884; x=1792767684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1T9HSWg9j+GS0h/K8cYpNmpYWhq3yqcX393+mhWd9z8=;
 b=PVpUAohaukJVvNbQ5xU1pYK+HhRBISTUDNYJ04hbf9tkoVHYGy6DN3fdTpLvtd7yp2
 hfscXCQuxhAzUooxd+uF8cBwTlggq47mxgfFIirS6Ph2VMteLqT1HaxSqP/ibqNUtViy
 NsAZjHNUO3YU+nDMksi6RrS9/jdbP0G2HLxbZhnbIv4ZqmiAfvBkP75J/wtOma4Tli3p
 9zYtKcczWtwlI9jYvqaMULWC2L1OhNDatRRFYmZuEM0c0PSCCSFfdWhSIA5tkSKDMfuu
 9tnbiy52QEATBKIHtB2B+RirPwizmYE5hqVu7ptUkoVFP2TE6X+toBiNfJzivNcdBDYs
 MEnw==
X-Gm-Message-State: AFq9FYK1ScLjASXFMGfCAe8Sn4oD/GKThyp9LrlNwga6l+FRjvZ51A8b
 R51KiUWM32gf9uquhs7Znnyp3vuTc2ZGeg49HGuxafMK8Xr8OHFaPNbSeDbSJemZ3BvjI241+wF
 CFjAQcYc=
X-Gm-Gg: AYBFou137Djns3iAwvKPcrLGf+mmu1fJhj/dPDg0NKS3YatP7hafnnIfQRpATK361Q+
 CFhNMESNVSjy37T+nalzUrIMgIdfimilW2w9SF+4GiHbZPQGXIGkI40D0NsahG4YSkLkB/lxvQS
 TjL7C4+LaObTH3yV5cqZADlWPX1pf/INrpr1Suvb9YazmdgBE0icsMaOnoWpx8KMTiw7MRo5PZ9
 6aQz+Fg51fO9H+Fc+ZA8kaFvVqO3A25wnaP7xBh1emBi+FQnOetOoRxW/K2Wcw0XAjQdJdKXgOH
 OtcQF0KClqCb9MQKlyunRIPJnRU6ZfPNify+G0HVziGbzJGdbe3FfxXng+xePnsfBWjCKija94V
 A11KkzTqaIPhwqSVkc3dHfd7G8Te1Cz+Jym9DalXDed2/AdC3HENmDl/InqQ/ysfaGfnoVBNEXp
 4b42QuWC0Va3Qk787lOJQ4rFF0x9JdVzkXmwvcxiAQRgCNgVLir58QFpfEVYjEANUa2CrN+tDtF
 UZoKRoeUI8bnkpNjizaT96rBVPFRvq+mYF/Z91ZMQ==
X-Received: by 2002:a05:600c:3b17:b0:49f:dd9f:6038 with SMTP id
 5b1f17b1804b1-4a1d7612c55mr1178575e9.25.1792162882867; 
 Fri, 16 Oct 2026 08:01:22 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1d2e93a01sm31795645e9.0.2026.10.16.08.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:01:22 -0700 (PDT)
To: buildroot@buildroot.org,
	stephan@asklandd.dk
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:01:19 +0200
Message-ID: <20261016150121.60027-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260314232106.2944800-1-stephan@asklandd.dk>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/util-linux: fix mount helper
 lookup path
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
> When using /bin/mount to mount filesystems that are not supported
> directly by the kernel, it delegates the mount operatin to helper
> programs, e.g. mount.fuse.sshfs.  Normally /bin/mount searches
> these directories in order for a helper: /sbin, /sbin/fs.d, /sbin/fs.
> 
> In reality, Buildroot installs e.g. mount.fuse.sshfs into /usr/sbin,
> and as a result /bin/mount fails to mount sshfs entries defined in
> /etc/fstab.
> 
> The patch changes the default search path at configuration.
> 
> Signed-off-by: Stephan Henningsen <stephan@asklandd.dk>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/util-linux/util-linux.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index f43a1a128b..a2a11c35d3 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -51,7 +51,8 @@ UTIL_LINUX_CONF_OPTS += \
>  	--disable-makeinstall-chown \
>  	--disable-poman \
>  	--disable-rpath \
> -	--disable-year2038
> +	--disable-year2038 \
> +	--enable-fs-paths-default=/sbin:/usr/sbin
>  
>  UTIL_LINUX_LINK_LIBS = $(TARGET_NLS_LIBS)
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
