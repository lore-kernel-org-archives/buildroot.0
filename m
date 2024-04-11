Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A44ECD1297
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 01:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1182608A2;
	Thu, 11 Apr 2024 01:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qK79GoaEOScz; Thu, 11 Apr 2024 01:32:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7E5260AA1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7E5260AA1;
	Thu, 11 Apr 2024 01:32:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C394E1BF2C2
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 01:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD2F560AA1
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 01:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wyMjHUiEXGkW for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 01:32:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=matt.stav.taylor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4960608A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4960608A2
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4960608A2
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 01:32:27 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-417d08135b6so2665965e9.1
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 18:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712799145; x=1713403945;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jeiB/BFtOZMU1kYhjc92VIkALCkF8YE7ySiyQE1x9dE=;
 b=FlqyUA2HUp13d5uRYdMOL6Z2xeX9TNn7jmE3VSruD5MsjbnIKklt6WbPL5SoX7Sjes
 +TZNYzf2gWI+t7/sDiWV4tBDL4T9TnBt7xr+GM9yXpDOyGffgiuO4e+LwgfphI/leBrU
 S+pH1Ot/Rv320YQoxoS3Uh8By2tA7caJWfDDQqmQ5n7iDIjWskN+IrQodUlx47CMWQ2y
 59SIMaCns/kiyCZ9R15z4fbvu17EbgTUx78iXKpL6CnpDlfc6rzmCP8XQaCAc3ToQfho
 LwVScKMQ0fsheOjcZpgfFBgXb+qtD6b+kEbg8iGxEEdPZ70/yE8tQ+vR+VibHt8OL04X
 +paQ==
X-Gm-Message-State: AOJu0YwptawpSqvxH8NmBGaC+hOw3g2ZjC0YV4lpLeX21LLWKgEt1pyv
 hFO7yxA4AgcE8hE3xCCuw9SatjLa3ny4BrNeDi5c4jPiwKUL6L7U
X-Google-Smtp-Source: AGHT+IEZIgLoznYhf/T7pScKl8gafcM1E6FimBRUV5RsrQbuR9jVEh4mxiDeZH4N5PG0hUL8ROz6ig==
X-Received: by 2002:a05:600c:558b:b0:416:3f85:d49 with SMTP id
 jp11-20020a05600c558b00b004163f850d49mr3615030wmb.18.1712799145249; 
 Wed, 10 Apr 2024 18:32:25 -0700 (PDT)
Received: from localhost ([2a00:23c4:b436:9101:9ba4:f365:9eb6:5e88])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a05600c198700b0041622c88852sm3964673wmq.16.2024.04.10.18.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 18:32:24 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 11 Apr 2024 02:32:24 +0100
Message-Id: <D0GWMG6HYQAC.1IJW02HTVHSQB@gmail.com>
From: "Matt Staveley-Taylor" <matt.stav.taylor@gmail.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.15.2
References: <20240408013859.732937-1-matt.stav.taylor@gmail.com>
 <20240408225410.6a8ba988@windsurf> <D0FYEL09CD80.1UJQPUQZNKEPS@gmail.com>
 <20240410113043.419ef54b@windsurf>
In-Reply-To: <20240410113043.419ef54b@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712799145; x=1713403945; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jeiB/BFtOZMU1kYhjc92VIkALCkF8YE7ySiyQE1x9dE=;
 b=IF2ZNwcj4MYEpHdfrC+MCE9CoOykGbcyJd27DhwiJBqHC8esyyMNOc7UQfugagldsJ
 YfJ4QrBI58VgPr/8wIHKJvBfPbW9UEbkkOCkfOuaCJGIUGX4w1tRVCjd4gfxlvKpcmLZ
 2fsCP4LQQoCMHkSnkYKZe1H/WtpLOOEcUM1B85V+s8gYUUzpfEdXlqV3zRwXFy89/26b
 +lAD0HETZWzF9HC1aHhoLOeAQEtClKXRnYcegTIFCMfqCPfKk1Hdt0/04rz5DWobnM37
 H7UajaxghV7amgBoqmyYnRBnp8+kTFb2T+Lk0GrE9wttL3JgQNFaTvxA3hIKoj0IdBLR
 poSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IF2ZNwcj
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

On Wed Apr 10, 2024 at 10:30 AM BST, Thomas Petazzoni wrote:
> Indeed, not much we can do then. Thing is that host-clang is extremely
> long to build, obviously...

I noticed that host-rust downloads a pre-built binary from somewhere. Is
there a possibility to do the same for host-clang? Or how do you want to
proceed here?

Matt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
