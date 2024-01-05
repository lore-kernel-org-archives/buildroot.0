Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD9EC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 09:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8A9E83DC5;
	Fri,  5 Jan 2024 09:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8A9E83DC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OKYJMTn5nc_p; Fri,  5 Jan 2024 09:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3CE283DF5;
	Fri,  5 Jan 2024 09:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3CE283DF5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF0B11BF306
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 09:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A084683DED
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 09:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A084683DED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kd1Ur4X9EFrs for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 09:07:09 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EA8883DDD
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 09:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EA8883DDD
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-50eabfac2b7so1446129e87.0
 for <buildroot@buildroot.org>; Fri, 05 Jan 2024 01:07:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704445627; x=1705050427;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L8WZBDhY6HOAZHOgIgwopdZci/rK8NI9oRMf/KMdmT4=;
 b=vgdUiVTaTvfsTidUcf3jXoA8nZGrXn6kh9CNdPTG1IGk0C4cCSxTmG/Te3HnqoLtyL
 xwgRIgzqG4HL9nVdXjAL1w6nWVm/fouzhNPiEXstuFs+sgWoJxvO08iqVAYvOEvbr5Dm
 ayGjfxc7U7M3cwxfT+YtQ7m6nwrx/01egBAY6ocC0jbeAa63DcBSl5k6nLd3y1w17eH2
 cnFxEjJk6W40BiFHn4trC6f+HREezOyW8Ot0LlGS4dtphAkn75Yed1urhqGpMvQ9dciz
 RK+YjJbJ04+XRdCmspSbsfCxRtmG5tsTZa1DdnwhyYEYq08xWPJw3gCQ+fxm23GuDCf8
 ZtEw==
X-Gm-Message-State: AOJu0YxlNK/kyKDQ1EZKJytLyZ9XJr5zy8jBFyjS7yHXj0sZm5k/VEEW
 KQJcgfKPb2v6qM3fvL4s0jQkAR3X4PynLw==
X-Google-Smtp-Source: AGHT+IFyemK6Uba8FUzSSxDP7VFlATWDe1rMexA69TkFjLDp7x+CoXkQDbDgdSJ0k4L+PVMbjxAUnQ==
X-Received: by 2002:ac2:4d86:0:b0:50e:698c:3426 with SMTP id
 g6-20020ac24d86000000b0050e698c3426mr867243lfe.118.1704445626425; 
 Fri, 05 Jan 2024 01:07:06 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 u28-20020a19791c000000b0050ea8c7b2edsm178515lfc.304.2024.01.05.01.07.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jan 2024 01:07:05 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-50e759ece35so1437229e87.3
 for <buildroot@buildroot.org>; Fri, 05 Jan 2024 01:07:05 -0800 (PST)
X-Received: by 2002:a05:6512:31d4:b0:50e:7de4:8626 with SMTP id
 j20-20020a05651231d400b0050e7de48626mr1035423lfe.108.1704445625731; Fri, 05
 Jan 2024 01:07:05 -0800 (PST)
MIME-Version: 1.0
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Fri, 5 Jan 2024 10:06:54 +0100
X-Gmail-Original-Message-ID: <CACXRmJirxfxvBcAV0cyzw+CmOzC7F4sSSOv0Po8zLxMaCndrfQ@mail.gmail.com>
Message-ID: <CACXRmJirxfxvBcAV0cyzw+CmOzC7F4sSSOv0Po8zLxMaCndrfQ@mail.gmail.com>
To: "Yann E . MORIN" <yann.morin.1998@free.fr>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>, 
 buildroot@buildroot.org, Peter Korsgaard <peter@korsgaard.com>
Subject: [Buildroot] bump webkitgtk
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

I have an open patch series to bump webkitgtk, which has been open for a while.
https://patchwork.ozlabs.org/project/buildroot/list/?series=381656

The patches have been tested and acknowledged by Adrian. Ideally, the
series will get merged before the 2024.02 window, which is the next
LTS. What do you think?

I also saw that cairo is outdated, for which I also have a patch.
(https://patchwork.ozlabs.org/project/buildroot/patch/20240102090933.64969-1-thomas.devoogdt@barco.com/)
That one is a bit more tricky since the build system has been changed
upstream. So I can use an additional pair of eyes to check that one.

Kind regards,

Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
