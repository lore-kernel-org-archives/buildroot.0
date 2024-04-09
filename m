Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C69C67861
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 22:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13F2160635;
	Tue,  9 Apr 2024 22:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCMhp0sS1LKP; Tue,  9 Apr 2024 22:43:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E73560692
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E73560692;
	Tue,  9 Apr 2024 22:43:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D0541BF846
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 22:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76112402A1
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 22:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99ABEM10382J for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 22:43:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=matt.stav.taylor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6841640184
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6841640184
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6841640184
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 22:43:33 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3465921600dso287045f8f.3
 for <buildroot@buildroot.org>; Tue, 09 Apr 2024 15:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712702611; x=1713307411;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=adbOT9a81i62P/rL6YB6eSlnqjLYVNV9zaBdHrLY41M=;
 b=pwQDXOyMaCVGuMg2piHJg16ZP6arf4/VCfcJLw27BOfJu0e2l9OaT6MnYnSJuL+xfk
 Se1+jQ410sJoP6H7M2namb3DbtsPltL95JC9s3LEIULf1spDlYvSkZ8KzZp8/D3QkcYN
 BjL2QGJ+7egxbE1R8ktMVJhzr7X8a12LMhDa1oyP1ksqM2cT1eLcpAplC+U0n7V2+Dzq
 rQXsUvTVW1uVMapkijffRvXmySKEtU0kb93iIjjWacIeOeIiADlenAW+Vq+4PqEA9yAd
 IkeI/VzIQyppvJQiQ99lgXQVdlQdzQ6ZSctSTAo/qUpcfZkfo79+wlNZF7sJZsMuBquR
 kpeQ==
X-Gm-Message-State: AOJu0YyJkpMmQZYOVIHosVqnPmfWTQNJSO4wjei8rgXL2yuqZDXkjbF9
 z3eBFUWq7HQoe6Zc0kkaNbPFHZI2GjwCrAvmew0bhM17/7c9F/O9tq1uwxR0Ipo=
X-Google-Smtp-Source: AGHT+IElXp3oSyJbcR2/7EW8tuyrkizrkhJebmheoWOBEaZFd2rihRigeMSURip9qYk8rvER+tne0w==
X-Received: by 2002:a05:6000:d4f:b0:33e:78ca:e039 with SMTP id
 du15-20020a0560000d4f00b0033e78cae039mr585669wrb.59.1712702611185; 
 Tue, 09 Apr 2024 15:43:31 -0700 (PDT)
Received: from localhost ([2a00:23c4:b436:9101:9ba4:f365:9eb6:5e88])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a5d490f000000b003439b45ca08sm12412320wrq.17.2024.04.09.15.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 15:43:30 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 09 Apr 2024 23:43:29 +0100
Message-Id: <D0FYEL09CD80.1UJQPUQZNKEPS@gmail.com>
From: "Matt Staveley-Taylor" <matt.stav.taylor@gmail.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.15.2
References: <20240408013859.732937-1-matt.stav.taylor@gmail.com>
 <20240408225410.6a8ba988@windsurf>
In-Reply-To: <20240408225410.6a8ba988@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712702611; x=1713307411; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=adbOT9a81i62P/rL6YB6eSlnqjLYVNV9zaBdHrLY41M=;
 b=LvEhD7t3e++4ySb+EuPDu09ZtjvcsUIoNYL9FSuejpkg4NCcJfmShL8QPa3OO2WdB4
 rDEhiD+/EHc+L4meIi4L5X9I1FHZLuxJceOorjS6hqzXgP8EkUFi477dkP2D/7JAd+yZ
 YueukCP33pY1V/cryQC9Xcg/TqHRs38kfVvDfCTnkdFg5HAx8fPOzNTOGq0r12tXpHC8
 2ZkmTEGb2VapmMp/cboqXah3SvCgRpCkUmiLWqjLQr3IZVDGRAI9pitjOyTzNZXDgzHS
 ToSiGDHQzGHmLFwiN2DR10GdeoctISmAoJjaqqPHMxAe2+CgPr8IvzfAXUp+7U5IdJqH
 LekA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LvEhD7t3
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

On Mon Apr 8, 2024 at 9:54 PM BST, Thomas Petazzoni wrote:
> On Mon,  8 Apr 2024 02:38:43 +0100
> Matt Staveley-Taylor <matt.stav.taylor@gmail.com> wrote:
> > This package depends on host-clang to provide libclang, which is used to
> > generate C <-> Rust bindings.
>
> But do we need to unconditionally compile the C <-> Rust bindings?

The main binary and some of the subcommands are written in Rust, but
most of them are written in C. The Rust main calls into the C
subcommands using a tool called bindgen which generates Rust glue to
interface with the C code.

So unfortunately I don't see a good way to avoid building host-clang
here.

Matt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
