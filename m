Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F599C7115B
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 10:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4C8B608C4;
	Wed, 18 Jun 2025 10:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mkHWAXPNY2Q0; Wed, 18 Jun 2025 10:39:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 353FE60882
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 353FE60882;
	Wed, 18 Jun 2025 10:39:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58FFC151
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 10:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A78F80F58
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 10:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFIW3rtUYlrA for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 10:39:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 56E3F80F5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56E3F80F5C
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56E3F80F5C
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 10:39:50 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6088d856c6eso11973641a12.0
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 03:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750243188; x=1750847988;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bm4B48FIL7y7+tEPc8YQTktNMcRhw72gTVH91n5bKW8=;
 b=onHKmHYQJ5hfxGneYp6sd4nPIUhha3T1My1tAgXZ3nnf+QbLPVEQe4JZIxVv1wq8GR
 2r6UcFUGMlwT2ZZgGT06RxMRvL3vWvcsz+lIM4OiMIp14lHGRTvU/Qm74HwuqhB7NHIF
 vMFn0bfFWxShIorBdISmTzpoPsV5YjMfWBAzx8/HqP5Mld9mfzWkYUDXC5M6E93Xvcq9
 KKkkMUkUuFJIvTxYXs70mEgQQ5OKvbKzMYtXdiEFRM4Du7HJlIrcwzYQpq+dKJm5FeiK
 Uby9ylhSvhuvazB7O24/xVYS8EpEtw7mu0YVZg4rwRi9bZcx1WI6o3/j9i5V11xhpI4L
 HImQ==
X-Gm-Message-State: AOJu0YwJM/AEwRDO8VJH3nJ8LybzUBZ74r4z6l+zC03Ueu9SSClHC1Ob
 Mzd4Xo/BVSIl2PjuHS5bs66dHqU8gBnS0vEdEnMof8/1RtUOFxkKjnxYSoywsnRbVIrguEd+8mm
 wqfNlUAXXexzbcf9iThiZp/cvyQ5LD1Xdk+wp
X-Gm-Gg: ASbGncsgjzbrEirwykAqGSqRsUfgSABmxlCdXHcYBcPk4829CWv1Tyqe+zdIv35zOAJ
 +87qwZoHRs2avec4hyp1q+3nPl+Xlq3Rzno273fwLr9oO06oHMjQ9OoGwCgkufc6RmLb99/rQKr
 QjGKj7f03CcRaXcO2a9piR7Rj4VNyd3vXCMvTtY1c4PHVs
X-Google-Smtp-Source: AGHT+IHjwil955DIjJjU0GIM+g5HdaDHykqPsigS8jsleV/AXT6KCFcO4fqYRKZlHPrIPQOP35N+ccBYMi22Wuf3d1I=
X-Received: by 2002:a17:907:1c9e:b0:ad8:8529:4f86 with SMTP id
 a640c23a62f3a-adfad5e2b12mr1712200366b.58.1750243187936; Wed, 18 Jun 2025
 03:39:47 -0700 (PDT)
MIME-Version: 1.0
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
Date: Wed, 18 Jun 2025 12:39:36 +0200
X-Gm-Features: Ac12FXzc173XdTu9MwVzxflG5e0d2SMxibrFNCy95vgT0Iy92TfBxIS-mvnxOjk
Message-ID: <CAGkXw1Ujq2LVN6-O47xncy6euWZfS7Jx4YXW4JUr+na72uqDiw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750243188; x=1750847988; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=bm4B48FIL7y7+tEPc8YQTktNMcRhw72gTVH91n5bKW8=;
 b=K5QXz3SxHN0+IXqWVrtBvV10Pyqb1frLa1STLbgPNGPUUrJ4m+SnC5mJDSpldnFcvm
 aK5bE8Q8lsNPNiGAk8CFLe43JI95B87TPkJxBvPB/s7atvPmdkFroDWQmv9a6IjU2mGS
 lP1vs6rSk81PJCGGAhTymYs59somt/+RLq34BLWh8A8/8DmwOMJBLvFd8rpWNvc0EJCJ
 Dt+ZyE/gFD6dSEcFByhh2irDw1tv5rOKjCK4wdtdxX19e0wnMQC6e5XBkMw5kwycbOQ5
 pfJMcTvoe3yZxEBZYkHexQXctr8NmbVcRbm6d+GJxCNhYYeV00E1X+yfGLrPUQg8kH2V
 GQMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K5QXz3Sx
Subject: [Buildroot] haproxy - req to bump version
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

Hi,

I would like to update haproxy (https://www.haproxy.org/) to a newer version.

Right now, we're on version 2.6.x which is a lts version with support
ending in Q2 2027.

Since version 2.6, there have been 3 lts versions released (2.8, 3.0
and 3.2 with EOL in Q2 2028, 2029, and 2030 respectively).

I think we should move to a newer version to ease the LTS management
and also to support new features such as production-ready QUIC,
zero-copy forwarding, ...

I can do the bump work (I would go for version 3.2.x), but I would
like to ensure everyone's aligned.

Also, I'm wondering if there is a thing such as legacy/latest version
functionality that could be implemented, i.e, when selecting a package
such as haproxy, have a tick box to select an older (legacy version)
instead of latest one. I feel it could be possible.

Best regards,
Fred
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
