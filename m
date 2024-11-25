Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0D2D59D7F
	for <buildroot@archiver.kernel.org>; Mon, 25 Nov 2024 22:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2D3A42D2A;
	Mon, 25 Nov 2024 22:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QjXSv_tnyHwc; Mon, 25 Nov 2024 22:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A175942D2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A175942D2D;
	Mon, 25 Nov 2024 22:30:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C652280B
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 22:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17FF7840AB
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 22:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XpU-nWgpuWp1 for <buildroot@buildroot.org>;
 Mon, 25 Nov 2024 22:30:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6AD5E8128A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AD5E8128A
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AD5E8128A
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 22:30:13 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ffa8df8850so39684331fa.3
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 14:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732573811; x=1733178611;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/fjubBGa7vteJigNtjMRNw+Xay0puMCOCUQGDmk7/+o=;
 b=Qt7uLTZEn/NIGvVGrtvPsGd671ur+rDeTetES74XNsD31fudrlxj8SLZFo8eJDW3an
 XKp9NIRIf5S+McRUJtskT79eZt1c/KXpiQYT4+liwdMX8HBTHn+BxnYtW2THqF7q7sMC
 s/HiAk2anvNjPlruKtQ0+4lcgS9Y6be/rONcm/ZW5Z5ahCMAsuMy0A6NfvC15+Qrbk5e
 4xzFtmnqAPMGfjqFe/O7pbEq6c8Uv8rTjRIdIbJz+cT+P5vQLD0bnHx6TeFIuOccOUiB
 QobP++DX0Y0R6MdHTdy69x10GLgufsFdZz25kygUhr2f8NTMk+KbRBWrXvKahKPRwDnA
 3QSw==
X-Gm-Message-State: AOJu0Yz2JbBSbB060Y2ou6mt9kuMjJHjakqktE7X2NbeUeWwdAZF3GZD
 dT9sBoMOHc64kMh5ucMvqG+gmAeBxFa/aC+HjfZhPGARafGuGIFr
X-Gm-Gg: ASbGnctaadirzmDEDvQMPUcRi2BhFDZE0cRl1Hs7l2HWzW4Ac9t1pZ/klwBqczegUYJ
 YNr1tni2+Fbhgz6/+IeLux4IcfAl/eNX+b8Z/xHyOUU9WlJAiNIABLBYdxv1R41NjrS7QSBR+qk
 llfL/GFeSDWtA+BBafblwhDMEDsdJ08ww0rvFsJXx6L2/Q9ZlBb88WHbBjB8IF/ZEuyl+Ete1o7
 erI8vZxBF22Ggjqd2jIqia0F324uTcrscV/zBjuWam/9M9J2sN/muw=
X-Google-Smtp-Source: AGHT+IG7dnHZzR6EK1eT3g2p6EdCTiHdlD8ljXP5NZHgWwBoQijEFOoIn/RZdVjxs+V0ddvFQyYf9w==
X-Received: by 2002:a2e:a903:0:b0:2fb:4ddd:a8f0 with SMTP id
 38308e7fff4ca-2ffa7174afdmr58805051fa.15.1732573809159; 
 Mon, 25 Nov 2024 14:30:09 -0800 (PST)
Received: from localhost ([78.208.197.115]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b28fe55sm515422366b.4.2024.11.25.14.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 14:30:08 -0800 (PST)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: Zvi Vered <veredz72@gmail.com>
Cc: buildroot@buildroot.org
Date: Mon, 25 Nov 2024 23:30:07 +0100
Message-ID: <8455423.T7Z3S40VBb@localhost>
In-Reply-To: <CABRndgwO5RUQOK_VBbLgZe4qoNRA1DDw-JCua6h=ory4xquBKQ@mail.gmail.com>
References: <CABRndgwO5RUQOK_VBbLgZe4qoNRA1DDw-JCua6h=ory4xquBKQ@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732573811; x=1733178611; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/fjubBGa7vteJigNtjMRNw+Xay0puMCOCUQGDmk7/+o=;
 b=WhuisaMAr4yowd2nP0kKu4hV20yJ+kRWqPBZ0BsGZx3g8kuoDUEu4qcx5T9JnQ05rJ
 lb7wkbnenhBdlr4FgHIpHWLeDJcfTmSLwa3NZD97nrjXqzuOfhPMPy+22b1jvbBug/CI
 V8GotS18eCPIPGMgUMIOQS7V7lpvN0tApneEE7zCGakMA/uhsskDuyZ2UynH7gI3C8sq
 JjmlhoPRnQFP0oNSKJ5VreZt2CEl1JTDU/n4Vip7znnshK5JClJ6LVR4zu/vZX9I3euK
 Br4PBuJ/jLhXBvbOypU7qhzQASGCNtC5DGEEoQfjINbzYGmbk4T45HwhgH8w0V/R4lC7
 GD6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WhuisaMA
Subject: Re: [Buildroot] 2024.02.6 : modinfo for target side
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

Hello Zvika,

On Sat, 16 Nov 2024 06:38:09 +0100 Zvi Vered wrote:
> In 2024.02.6 I included "kmod"  in "Target packages->System tools"
> But in rootfs.tar built without any errors, there is no kmod nor modinfo.

the kmod package you selected only provides command line utilities like
modinfo when "kmod utilities" is also selected.

There are two options to get them:

1. do not select kmod package and use the utilities conveniently
provided by busybox. You should already have insmod, lsmod, modprobe
and rmmod available if you are using the default busybox configuration.
Just run make busybox-menuconfig and select modinfo from the "Linux
Module Utilities" menu

2. if you really need modinfo from the kmod package, first select "Show
packages that are also provided by busybox" from "Target packages". 
Then you should see the new option "kmod utilities" in the "Target
packages -> System tools" submenu

Best regards,
Mattia


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
