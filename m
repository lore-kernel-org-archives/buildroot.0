Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F6BEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E28541F64;
	Fri, 13 Feb 2026 19:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymExuHa4Qt23; Fri, 13 Feb 2026 19:37:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61A7641F14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011447;
	bh=m7HmyddP7tfo0REdTUHdEYcYFpBcqydR9k4Z0lDwhFI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Lc9YyK+txEnm8n2of0j0f0CbrWaGnWTiWyHAxEzZAO6vCZWPGuyBq480RfIaAE4+d
	 jF/m4zfc2Wv1tzVMx9rzfhshvzG6kRRiHJMQ6KiRPtZj4+LV6bgYpYuIovyl+dCPsg
	 jviO2xU3GkvoUcjtH80t7PV8ATl1lLDomqSoZc50xdkeZZy1OQCn3XmNAkus2VChMS
	 jD9qKMn6DloQdqD7Om9NSJrO2vp1o7ThFX2YQiVS/XSAsTWpuvXckgrAvQYiP/3S/t
	 giGhDYfgAt7QyW9ud/CWUIDygWao+Q6KOTxhGdeld4tE3/m4WFLpTvjoAg6xNXir+x
	 YUYBuvWE12HKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61A7641F14;
	Fri, 13 Feb 2026 19:37:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A54D169
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86EC6845A6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JVpnZuGtjN5g for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 64325844B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64325844B5
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64325844B5
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:54 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-436309f1ad7so1049303f8f.3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011412; x=1771616212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=COXpimueFPL77CSwtQlm6/0dYnIUq0C+dcbytBO1Xc8=;
 b=fWZzwekFNktVDuE9iAU0+kmKpxWLeTbdaepRyhaRMyW5TfbWke48GDg55FQyA42C2h
 McNnle27R2xcVwBz87PsIMDR5AmqTPxN/dZ3N5NjlZuyOeWyl19FBcXVDnmLSfCsfbjj
 4FdCvKCDUoF7HNeAim6Q3KMBXFXct85/j95dCFdk6qwPI+qlXs4ucPTVt6BO7J96bj2g
 bhpNq02kLXvhfgtZup2XYExnr/oaE2upvKfCD1tqWCLZMGFxNAhHmmWunE2mUd5nXG3t
 ewx4Ljzw9SSHtN8ETIotX35OYhS7Z0MSELw0Hteq6Ao7bM+QTat90+whLGKRh6jj85BP
 6tVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCM/fjxfXs1hvaRzVQIgCESpQt+Yu+HkUcR7lwn+taZbuJCV7189rcV+t5laInKma/KcZT9UMYKXA=@buildroot.org
X-Gm-Message-State: AOJu0Yyy+5SyKNFE7j8PsMzrwqyz6l0oCmsKf3ZFcXS+UzuBp7wb2GNz
 y5xKWRizVVTKCeFnLFeFw8HpZRuDBwCQtYZhuVXc/7cpOIUc9xwq5be3mOWPJ7r7dLgmFJj+mh7
 tBpOm
X-Gm-Gg: AZuq6aIRmW8vz6O8MTyfWh5f0u9jcLLizPqm9cBE1/sY8WdPZx7RZ6QxwjJLga6vx6c
 4cRt49XzVuSsjSNBffcptIFjTzPVQGyEd28f30IU0rCQ2qkj+Xh5FX102i9Diz7/FN5gwuqs9n+
 kVtY1QU0rsOcz9lDWXiVJ34BgtFSYRZAUnkLiZrRUwReimoJcdoQ7pj84bTNYBPMpphSPAFCUE5
 9S4HxU3h/y7BELmzE5ZePOYcbxt/08i9zCxYgog33+uwQ/v45gmyvc9KF5BGY7om9pMoFclE7vj
 QQXAEQ/JU/T4j7HIxpJXa6ul5PpvB0ldax8LTFnkrca3OQhOr0q4c/irTyTTN4ymdDa06UquMcX
 6l4XbNfggS2sJY86jE2Kndw99gq8rDy+4gdEw4s4DS1Z5WXaWHvIrI3faYuabXB2F/Hhfyf95Un
 JAfNuoF3/gc8l/rys=
X-Received: by 2002:a5d:64c7:0:b0:437:6dac:4580 with SMTP id
 ffacd0b85a97d-4379dbb0c62mr1153437f8f.62.1771011412008; 
 Fri, 13 Feb 2026 11:36:52 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6a5f0sm7411464f8f.11.2026.02.13.11.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:51 -0800 (PST)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:51 +0100
Message-ID: <20260213193651.38391-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202144704.980271-1-ju.o@free.fr>
References: <20260202144704.980271-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011412; x=1771616212; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=COXpimueFPL77CSwtQlm6/0dYnIUq0C+dcbytBO1Xc8=;
 b=XDBMB9Fi0d5mjQaCoU4rq3jtwezHo21oXm/ldOTH3EF28eC2bFlrgCOx/+4JAohSbw
 IFyyvClAJF1R8H2A7aqAK3OhudGEdD4CnoQA2qtr6vPVQDj3ouY/Qx7CDnZ2lnseveti
 54hooz6es7o4aPr8TBrZ1nwVMV0bqNWe1Tw8AmjqQmLfOPZ65lMny9zmU6lt4nntinIR
 2LExWEWQzkR18kvMWBHY8flH5S8K77mpBw4s+jbyS72TmtMxLXK4QUtlJT+JURdeP/S0
 nBAhMBWaBrLLTt4i3/sMNAL5gNOdrGMrVVd1qEBnQsrAgUswkFUE7qNMOaQhDB8EruTz
 swRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XDBMB9Fi
Subject: Re: [Buildroot] [PATCH 1/2] package/qemu: bump to version 10.1.3
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
> For list of changes since v10.1.0, see:
> https://gitlab.com/qemu-project/qemu/-/commits/v10.1.3
> 
> Note: this bump is a bugfix release for the stable-10.1 branch.
> This commit can backported to Buildroot LTS branches.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.11.x. Thanks

> ---
>  package/qemu/qemu.hash | 2 +-
>  package/qemu/qemu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
> index f4691af1dd..ee70e67694 100644
> --- a/package/qemu/qemu.hash
> +++ b/package/qemu/qemu.hash
> @@ -1,4 +1,4 @@
>  # Locally computed, tarball verified with GPG signature
> -sha256  e0517349b50ca73ebec2fa85b06050d5c463ca65c738833bd8fc1f15f180be51  qemu-10.1.0.tar.xz
> +sha256  fbaa7a0d7a9a1deb5695b125916746ec28fe0de6275d4454f3e3bbaf8b339b53  qemu-10.1.3.tar.xz
>  sha256  dd3ce02338c3a48abb6ba59b48809f7108a8bd242cb0cc8be90daafa30707c28  COPYING
>  sha256  31c90ce76b6f5aab90a205851e71d5c27e31c0aa3d7017a4383b98a6fe3f1faa  COPYING.LIB
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index df81ea6486..5cc98138d9 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -6,7 +6,7 @@
>  
>  # When updating the version, check whether the list of supported targets
>  # needs to be updated.
> -QEMU_VERSION = 10.1.0
> +QEMU_VERSION = 10.1.3
>  QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
>  QEMU_SITE = https://download.qemu.org
>  QEMU_SELINUX_MODULES = qemu virt
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
