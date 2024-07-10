Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65A5C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 15:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 629A381450;
	Wed, 10 Jul 2024 15:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lB_hOrUVtWAk; Wed, 10 Jul 2024 15:18:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 695A282031
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 695A282031;
	Wed, 10 Jul 2024 15:18:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 267CC1BF5A7
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 15:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 140D482031
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 15:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKiQl1SYeIqO for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 15:18:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 14FAE81450
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14FAE81450
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14FAE81450
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 15:18:19 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ee98947f70so56837771fa.1
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 08:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720624698; x=1721229498;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5/DsyWZgCkrxUdEDakSBXQ5vrnQ74V0vEDbch8ZNAPg=;
 b=rS2sLkGYYIUdTe+O4EkcHO6JYnx8VacW+U6TQDG6r9fefSfE7qLUhXhZERYhu/0L6K
 cFYixFXNcSG0Txwj22ekoZWtlkuY6Ws61eQIbEy2KDqB36MGRu2YCQ4egPdaBUZRcjm6
 6EJ8ya1vhOWl5qbsWZ9vteH/JFD87PtvX/t1vFEBYOE+9nkrlX34bJ8DOJYlwoelyU6S
 +84yoj42e+3ZpIvV4QuhvG3L4ZrSt7IaIbZHvIEpkhpO9yGqFNofXxkzJZkTai3KC49D
 F+onC56XqNlJn5WMUswDVEGzKNZTkg5S7S6ljj1g6MuRNMfuYhltqjzQpNwOXQ89439v
 Mt0Q==
X-Gm-Message-State: AOJu0Yz3ZSotXm5DhJn3XmUkGaK5l/vFy6mn1bMoCVRCI6SYoXMCbKef
 H/zlfGk9iJxY9Z+LYOyYcf3J5dY2/kzVoinFLuxYttFUXtXl2Xln7my9nOVzSVfYeuNCa8oLXAj
 S1B2/MFsar4bqhIVXvIogwl5M+5k=
X-Google-Smtp-Source: AGHT+IHVloZubu4PPYuNKy1jnJkCMYVPMLCVLhVz4r0vyAo9QkTdQorFewnITMc+H5v/Ksre6IVt9XsolVf2kEFKKFU=
X-Received: by 2002:a2e:a615:0:b0:2ec:500c:b2e0 with SMTP id
 38308e7fff4ca-2eeb30dc4b1mr41231031fa.22.1720624697612; Wed, 10 Jul 2024
 08:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240709202438.27298-1-heiko.thiery@gmail.com>
 <20240710165106.5066873b@windsurf>
In-Reply-To: <20240710165106.5066873b@windsurf>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 10 Jul 2024 17:18:05 +0200
Message-ID: <CAEyMn7bp+gGZcqH-McgCpk6qMAQaVKCwe+JXUk6b=CTnPbANTQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720624698; x=1721229498; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5/DsyWZgCkrxUdEDakSBXQ5vrnQ74V0vEDbch8ZNAPg=;
 b=h5krOfSuiG6Y+B8cI6tooG92VohVR/XU8av7o3eBDYUYtHiMqmAv1gcQJX1FMQlN3q
 wSq7XkN6KCWiijVBhBuigekqksAayGBjxerlxfuD4RTwRZIkWXG5ea0qyShfZ5AOaLJF
 7i9xZD7VIsJhUbJkd+UzKSDG45D7hkKEN098P5wku9IwR5mwIOU8suvE68S485GxbB3/
 1iteycMCOak0NrBFf/IR1QsWqh7Wem303D46tz0HUgPzbiDnOoL3qugfAMDpc07xFUkH
 LKGm3IECHXOQ3nE1Ij5BpVron4hiyXzeaudaxXLzeuzdOTGFZbE4wOuieWKz3GioDroV
 69/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h5krOfSu
Subject: Re: [Buildroot] [PATCH] package/libssh: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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

Hi,

Am Mi., 10. Juli 2024 um 16:51 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Tue,  9 Jul 2024 22:24:39 +0200
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > This fixes link time errors, undefined references to various ENGINE_*
> > functions in case libopenssl backend is used.
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>
> Is this
> fixing http://autobuild.buildroot.net/results/5bb/5bb845be7f861dc3540a8dc618ccd1a0a759f2d5/build-end.log
> and similar build issues ?

Yes this looks like the issue I had.

-- 
Heiko

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
