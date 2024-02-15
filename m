Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461AFC4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 14:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5DE7605CE;
	Thu, 15 Feb 2024 14:13:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V3hABw5NbMPv; Thu, 15 Feb 2024 14:13:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D534F606F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D534F606F0;
	Thu, 15 Feb 2024 14:13:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6699F1BF844
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5451083ACB
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PqTF16s8ZC9b for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 14:13:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=dave.mehler@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE57583147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE57583147
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE57583147
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 14:13:23 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7c029beb8efso27890139f.0
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 06:13:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708006402; x=1708611202;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DpjHaUXsVz/MAFArxhMTxTdfqRvgrnQDIbU2ioddWOc=;
 b=YYN+m+ma0iETvjpURTypnhlh8D1TKjgHvzRsfexN/Xcxown+fgr+rT87DHLHjiC3Ys
 nLyCIEeQG4d7dZ1WBcW0wS6Be7YYFtlv4qvXszFu7fuy57qzW+84+w555GEzXTA10Mh9
 hPfP2NFURYPRz2AXSWSBEsZsstN7A0SfNP35Ou/0T8U8XnWtpjfBQOLXtEZAm9Dso+sl
 5K94lrn54Hj5/pc6OzJKoaJi53os7e6fErvs6RFjfsIiSyDsSyD1z7sIERhK5uwpT/IB
 YB/aXLrd489Go8jXBNJFsEgf9YjGUUd0MxDpF2cC/4jr4ZblKAw+76yYkgPCqIuTI1sx
 WvlQ==
X-Gm-Message-State: AOJu0YwpEETn98CgxhFcs5vcQXdfN9YjQiJPi2yxrKaU003KM9HIUK43
 LzzHDbN36RAAkE9jADmaxf6YHLKpIS45rmaMk0QiHS220jR3vsOi15+ExCnTiI/9/qvTpKHFoJk
 Lbr8X/Yr8XE0PabZJuB+gU3czjgYfYwx5ieU=
X-Google-Smtp-Source: AGHT+IGFtF1gHhhMR5OKTDm1a3bmPuDObs/Pzk5ZARWFULRSYM15zHnpzOW5RmN0X0n8kf+epMixftartCnwjW9VzB8=
X-Received: by 2002:a5d:9f18:0:b0:7c4:9c9b:30a4 with SMTP id
 q24-20020a5d9f18000000b007c49c9b30a4mr598881iot.4.1708006402435; Thu, 15 Feb
 2024 06:13:22 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a02:bb0e:0:b0:471:32cc:1378 with HTTP; Thu, 15 Feb 2024
 06:13:21 -0800 (PST)
From: David Mehler <dave.mehler@gmail.com>
Date: Thu, 15 Feb 2024 09:13:21 -0500
Message-ID: <CAPORhP6xkxChh7ptk4dWctcLJjB3RkrVUe21y-Nu0KTe6u5L7w@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708006402; x=1708611202; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DpjHaUXsVz/MAFArxhMTxTdfqRvgrnQDIbU2ioddWOc=;
 b=Ld8bX0A8hARFci52ZqKnQLhyMOv4sTFEfCTcTY/zOp6yAGvnAQL2gUxc16FlDtXncu
 25zlxCskEEfMBSjHYhcd5nnSWtU19LIUykr6REpuYj/QaUoRz9VMOjrotEsOUw7Ah5WG
 6Zomstd1WtmEW2YNWDQIo6SRKs1nmNZDD+d8FpgmLj60XVzXEy5HQG8g/tJNFn+wZLTu
 Yusa+QniPMubMRZxoQqTL4scSAex6dGKs0jSMB8UqPHvOVX/X0fJC6ZflFGVcwTW70sI
 a0/PQez/u8oSAsZjXOKeta4wISV3fEL/sx73tKZ3w//f/fBlfGmVO0elkIvou4uiagHv
 d0KA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ld8bX0A8
Subject: [Buildroot] Headless setup, Raspberry Pi 4B and zero 2 w, Wi-Fi,
 Bluetooth, SSH?
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

Hello,

I'm using the latest buildroot and apparently I'm finding outdated
information on these subjects because nothing I'm trying is working.
I've got two Raspberry PIs, one a 4b the other a zero 2 w, on both I'm
wanting to use them headlessly, so I'd like to do the following:

1. Get Wi-Fi going on boot and connect to a dedicated wireless network
2. Get bluetooth up and running (and set up a bluetooth serial console)
3. Enable ssh so that option is available
4. Install different custom packages for each unit, the 4 and the zero
won't have the same packages aside from the Wi-Fi/bluetooth/ssh setup

and in the case of the Zero 2 w:
5. Configure the camera module so it is up and running and ready to go

Up to date information welcome.
Thanks.
Dave.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
