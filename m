Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FDFC4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 22:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4176606CB;
	Thu, 11 Apr 2024 22:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glCB2yMaGcPJ; Thu, 11 Apr 2024 22:52:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F40D0606F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F40D0606F5;
	Thu, 11 Apr 2024 22:52:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D7F821BF3DE
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 22:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0AA541F2E
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 22:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9IIMEPIGr25I for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 22:52:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=matt.stav.taylor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 30C5141EB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30C5141EB8
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30C5141EB8
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 22:52:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-416c4767ae6so2680455e9.3
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 15:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712875919; x=1713480719;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=A6ImAYotI5e14HGcHTyb2mphhl0f40LkOPgHk5xXwPM=;
 b=PVxoBqb8r/bPjMv/QrS3tYIJu8LCklddgsYP28bMEWcYsP52Cfe/WyG/U0DjWJ+r/b
 dEIEuo1HVJZCRf3FlsFZq+2/iijPsDcqUcd3gMe8ngocgm9uvqUR04auMOhZlQG9vlK8
 U2acQ+j45iuNvq4rwzbP27fjSPxPlALZROIIoc0+g7yNnxhYcwIk8iBCuMemjGC32L+f
 LF08z0WoETrUONYQdudmTRbgqyVUleIph2gNEoYCOq2pvjJYDFwyihCAdD7yuRdZmbCZ
 gAIOhnv09+XtIabWqQc4v0dSgWbr2faTAaMsxUsDRLiXa0ltHquWmjwvHXszHgJBb4ty
 95hQ==
X-Gm-Message-State: AOJu0YyomQM7jDbL0AqCugd/cXQ2kbVab+DKNJpbxuwNvg4BvdLzfbbh
 cibZGHEQNBOyyIuqCYjVZ9Vpq/GXKGxqoiHOdAOe5Ol19JAj9WKJ
X-Google-Smtp-Source: AGHT+IHjxycwUCO0rbMpMZsZc3aIBd1E/1DsWoKR8HeQF5CUX//VEJMyYqDR8GyZSF7quq7M6eBq/g==
X-Received: by 2002:a05:600c:4f01:b0:416:97b2:aa58 with SMTP id
 l1-20020a05600c4f0100b0041697b2aa58mr696086wmq.20.1712875918756; 
 Thu, 11 Apr 2024 15:51:58 -0700 (PDT)
Received: from localhost ([2a00:23c4:b436:9101:9ba4:f365:9eb6:5e88])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a05600c349500b0041680911b0fsm6894089wmq.30.2024.04.11.15.51.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 15:51:58 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 11 Apr 2024 23:51:57 +0100
Message-Id: <D0HNU5GTK85W.1677VO1E2EDIS@gmail.com>
From: "Matt Staveley-Taylor" <matt.stav.taylor@gmail.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.15.2
References: <20240408013859.732937-1-matt.stav.taylor@gmail.com>
 <20240408225410.6a8ba988@windsurf> <D0FYEL09CD80.1UJQPUQZNKEPS@gmail.com>
 <20240410113043.419ef54b@windsurf> <D0GWMG6HYQAC.1IJW02HTVHSQB@gmail.com>
 <20240411144804.03fed97d@windsurf>
In-Reply-To: <20240411144804.03fed97d@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712875919; x=1713480719; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A6ImAYotI5e14HGcHTyb2mphhl0f40LkOPgHk5xXwPM=;
 b=Y5AjC/TBav/IJZt/lD/WKk8qfvtITu9l9dxe0758/nv+5GPMcq/i3MFBDNTPjuDZLr
 6W5cZ57Lw2u3xnu9LUqQh+2FUdWbNKZYFpZHg0+4Zd07gz+omK2O6W5um+rs4XjI+rvl
 O3vUOirt0o6/OlGN5RCu61W+DJz7MCIjNalOGplQdxeNx3P0XPwdDO4seegvMMiDohpM
 GFj8fHuk2sxcuTZaJY/I8xGC10+P62LWaE2DzQa2/786q3veOFFREWwmz3Oh8EwMB7iD
 NfzJICOko6d28f8JzbPF2ACln9DaR+U+vXTQtdPCtvyPKkbdTtKhAbb5O1Sk4uU1h/i6
 2ZYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Y5AjC/TB
Subject: Re: [Buildroot] [PATCH 0/2] Add bcachefs-tools package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu Apr 11, 2024 at 1:48 PM BST, Thomas Petazzoni wrote:
> It seems that
> https://github.com/llvm/llvm-project/releases/tag/llvmorg-18.1.1 has
> pre-built binaries, but not for the very common x86-64 linux host
> platform, which seems odd? Apparently, those binaries are made by
> volunteers. Not sure how much we want to use those binaries.

Yeah, agreed. Perhaps there is some Buildroot infrastructure we can
leverage for building these ourselves?

Failing that -- is there actually a problem with merging the patch
as-is? I can see a couple of other packages that already depend on
host-clang.

Matt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
