Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F6ECCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE50C40A2E;
	Fri, 16 Oct 2026 15:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxlzEaJLc5C4; Fri, 16 Oct 2026 15:02:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E671840A3E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162926;
	b=M66PdYyyOt21WBS3sZhkzUJVo5rBAkJ30x70BUR2/lyLMiLucTyvyywZ4qsPBNd+sqZ/
	 lmnxKPM1vnDwvmp+3b97mwAQfPOKDxkuJp2XeGYph5uHPn/Ji3PKhGKSSsIeJbGWKLqNu
	 9qtEz7+0Pv9tG714Ln4+szU35pqnxkmPOl0GP+m+jiKbr5QQDTAigAEG+Ke9PFOim4/w7
	 JHfNqBH0ZKtg0v9to4mupAUqCJkQn0hlKTz7Ly+vR9L69VmSU4chtVeFsDQBJDPcbsFm/
	 ezvOp3PP0B/E+60T4C7Nq7N3i+qTdUYsbvrL6+96W8yLqUQYIRjU5GuWTS/D2531shg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162926;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=y6gkJYshihprVeswZLNZv3k2GfxdJGWWrENS+cxdTks=;
	b=Olot0p7+dIrP2o1MK1ko5YT3dMr52ZxlhXFBVOEonVVthPlbyjJLnyuKiRM9/igdiZjE
	 ygRvSXB6it+W9qCpOnOFsmREy73RyCxeQ8NIG7oLYEr0Qf8pTz0YUPIpUNNaO9MOBE9fC
	 h4XoJKM42QC81QIJKmcClUddA2KJg3w/zZDPr9ticSCXj8PAlhdSUjXEAhCotagsGveww
	 UPiMILVRvz3DO2C+jPRYJM31JRDDfuoOE/bavyPiJQCog09todIt3jdexkmXa5FueX6HO
	 VxsochGopurQ6i+r6tlCUj3xOIb/u3roAe6VBWOJ+TCyPQoQQhS2x7OcK9mAaxnlqXQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162926;
	bh=y6gkJYshihprVeswZLNZv3k2GfxdJGWWrENS+cxdTks=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MYvs7QkF/ol8i0eUQ7LosGorZE4D0rO8vqReDpk6v3KAYb/lxpAAZAGyaP7/4AxqZ
	 CUNvObsiaOmzGB9Ofybo3DpJLLyq6VeIM1xx+r7gDal0CGReWohpJliMRNdY6HDUDg
	 AWZWfDNd3Laih3UTqDcMdDLC5MNiFqz+zL7IEFZYZef5CGbPIYRpSGH4dZjV506Fbb
	 junXaKeZJKUZiWuanJguWZQrDGpcVCkLZXUrZY5nGdoKwDSpibH6IpdomSsv59W/1K
	 rJuEgQBTHeCXp3D/Ndfkl1ZfCSbUSmsfwLeUhCniEDzHAYRAmuCmKwQPaFR0UDN05g
	 z31ZT5PO1oGLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E671840A3E;
	Fri, 16 Oct 2026 15:02:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 82829255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 744BF40A5B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cLoCFWUJcNTK for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:02:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5383440A2C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162923;
 b=XsXEqcS48H5KCESiWPxTNRbtH+O7Il2RTJ1YxoWPq6fwLxbVlXKQSjDPvvMrbA4O5nfe
 QKyTXnBz0Z8R11gBPcBjYPdZH0lgC1yqBRgl6MD+NZeF6vK3nNQmwYNz7g7+ssbAWAF/9
 LRdrTH9Cy9i0TxhptChrKDXr5ZKafgC1trnjsAv22vaGjXR22sf/R9tJUEBFK7H2qFDf6
 g5pf1X8p7XoeN80myN1P1x+AGFcYqc50c9j/MKQ8S1YXYV4+op3O90J/+Mvjy+v8PaEnj
 YHzh4TsHsyb4nD4LvdydgO5mmz/+DVJ14IU0Z0rlh23hovhvy5anfDZBoOQivVbBExQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162923;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=MyxiX4l5Dj3Rv8WFXWSSSt3oBT3BMZ3oljwjidtMaHo=;
 b=jcn52CbFIY0HiV2Xs6eTsmeCLppuhdzVPRtpjgp17GzeKCM6SA4FR40q7G6OCNKWiv1r
 ru2g1EVayscqekmt+MONtzc0jplImkLeCA8Qu3uXPdW0Wlyl0trwGm4qRW7ZiSFCz/Whe
 Wy+VQM1NkFWG04+nHp5s1b1mYoXLgPZTt0mysQI7e1j4ZrclGBCJY/n0mdr7eTXGwz7fn
 iYeMmN0vGxYFa+mmSdWjhBHY9M6X0D0QUwjQJQ4z8qlzG6dCSvIJ2atkI9ZU3qLbLv0Zg
 6CijogB/0ZvJrRGlD+JHXeA16TPb0uAQa9LmnmPeGmGjs+167hrk5AABryNJayL4Okg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="XyyPGHq/"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5383440A2C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:03 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so842440f8f.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162921; x=1792767721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MyxiX4l5Dj3Rv8WFXWSSSt3oBT3BMZ3oljwjidtMaHo=;
 b=ghwjXmlWkGXmrGezCir6dYm5xlz6fs/vD9LcdPlL9PfCQSG0nU0NSQZ/fz75pBR84+
 unyVAoGydhybWevPAcNWqe3bqDZb9ap3Ygunkcc7Eugg8mt/ucaVkLnURsbe/d5Ycobj
 L1e0cKnGX532iBqBlSEoVsR6Yuf7DmY2r5xnYkQUxUbCN26Yoj1xLs2FXOaDTU68gjYH
 bLeh7QNlxDNYhuMsZVU6kW4BrYPiEFt1uEIx/fBqOtM9X3Uc57KeNSvK4GbI/Orkkowz
 OcGEiKBhLXf5o85aC3Obkxa2dwNoNiW8DyyhLwEesYUhgL7z1o12bhGxx5LK2XhPqycj
 0fZQ==
X-Gm-Message-State: AFq9FYIJv2caeohh1jYpdJ8n5S7hQXjTz87xMIoTSOE74EwkgkAt8aar
 /o0r8+lVwU0JrnyFoC/2fBUlZeAU1H8VFygRDw8TxSdbegmMBvFFrm42T/0H5X7Fgmpo/s1hRJ/
 HVbwiUDs=
X-Gm-Gg: AYBFou3oUXUOWCvvB9Aqd3ynCtui2AVBrcpxo9TDSr2Ui/6VeWnVZ6CTK1Y0kPN97QX
 gsgbh1Hqve1pg+Ew9Hw9NU2Wf0CoKF8lwPQPzhs2tL9Ut42sON2i1X9Xn4FqBDpybdGrfZ871gr
 TysBPo4bkrWx8HMxrctNXTEsJvSHzvFmCX7oFQ+wUXvjl2WX2odCh+cnst6DbKpUa1k5KiHVa51
 viBZommTS8JZ/dqk4Mq0rlYKNH6jksBhAcBV1sOb/717roJ90OInqh59FUnmzQD4LWbvhfpaqmP
 vH2VjenmzoQOU7Ehr4i+xPF9QI7zHUXL8nWkOWR3SpxVPJ4PAI/uos0tlthzQI059BJxmtiMAMh
 FbRf4L/eT8RFhkhs9MhXcUYhzHMcv2Q4LMz5R4RvXJykU7oWzJ2wyRJvRInwhjLfkhlt8FhYZCa
 5NawvsIix3tWKj49JXMvuqCrHaFbHnLlq1yHuJhiTb6fIW0C7r6HwF2Va2Y2l01rIyFX8Bz29Pr
 23fJ0lg5qe2VXztm/CY4iQ9Ir5W7hXkqMnq2DHO88MuC5OQxtxk
X-Received: by 2002:a05:6000:98d:b0:48c:4a62:9af7 with SMTP id
 ffacd0b85a97d-48dbaae9e03mr40353770f8f.28.1792162921196; 
 Fri, 16 Oct 2026 08:02:01 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4c5942sm8760312f8f.16.2026.10.16.08.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:02:00 -0700 (PDT)
To: buildroot@buildroot.org,
 =?iso-8859-1?q?S=E9bastien_Guillaume?= <sebastien.guillaume@vendeeconcept.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:01:57 +0200
Message-ID: <20261016150159.60309-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612121516.1634-3-sebastien.guillaume@vendeeconcept.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 02/11]
 package/gcc/gcc-initial/gcc-initial: add CPE
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
>  package/gcc/gcc-initial/gcc-initial.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
> index 1f8b76a942..5ddded0a42 100644
> --- a/package/gcc/gcc-initial/gcc-initial.mk
> +++ b/package/gcc/gcc-initial/gcc-initial.mk
> @@ -10,6 +10,9 @@ GCC_INITIAL_SOURCE = $(GCC_SOURCE)
>  HOST_GCC_INITIAL_LICENSE = $(HOST_GCC_LICENSE)
>  HOST_GCC_INITIAL_LICENSE_FILES = $(HOST_GCC_LICENSE_FILES)
>  
> +GCC_INITIAL_CPE_ID_VENDOR = gnu
> +GCC_INITIAL_CPE_ID_PRODUCT = gcc
> +
>  # We do not have a 'gcc' package per-se; we only have two incarnations,
>  # gcc-initial and gcc-final. gcc-initial is just an internal step that
>  # users should not care about, while gcc-final is the one they shall see.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
