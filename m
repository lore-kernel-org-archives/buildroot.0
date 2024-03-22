Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73ED1C47DD9
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 21:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0325E408CB;
	Fri, 22 Mar 2024 21:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M8r7AjpvvLqV; Fri, 22 Mar 2024 21:56:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BC6B41943
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BC6B41943;
	Fri, 22 Mar 2024 21:56:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B60F31BF2C9
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 21:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B017382FB1
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 21:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Sb9cumhqDnJ for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 21:56:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f35; helo=mail-qv1-xf35.google.com;
 envelope-from=jeremypeper@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B75B082FF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B75B082FF9
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B75B082FF9
 for <buildroot@uclibc.org>; Fri, 22 Mar 2024 21:56:45 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-690cd7f83cdso15875516d6.3
 for <buildroot@uclibc.org>; Fri, 22 Mar 2024 14:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711144604; x=1711749404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hyCqP7aAt/5HdqlZfT60UgbCxpLbpb9AjPO58UZp2f0=;
 b=pGO2xD4uioJI9tVWUUgQiG/+IqQK93gvBvU966eJ1C8q2Dm9uEAsG+ZpsneD369vil
 9rvFfFjcrQQW2QCqlxBwtTynISJ7OL7kSt9KEl+feDIejoEvGCg5de2mQFNA3wR1WqRW
 atgg3ZLUzXR5sNPBv1p8Uy7YrjGLkVqEL+EG/ozFBohk9+SV8t8so2+8roNl58BrERg6
 MwxSne2/QucwQEXr1J1lDhwP7YLqo3gnFQgLbeUhn5tYqqf9s7dQArktvxRAk5DFOc0G
 aLooMtYsPqpW74/JSQXNQ3QMP3UCKrNf+xDF4cleDyIwOSOuGTgiASe3XFQv+bBna/8r
 5Ygg==
X-Gm-Message-State: AOJu0YwNliBDC3GKivGxTsTtJWIpQh9EKga/PqVM0NrFTJCa2CI2XN+o
 5NKalFhxsu1N2wuIUUgEoHWjCaun/UIYDR+REzoulswIsCeGsh+acnBnPtQK7YU=
X-Google-Smtp-Source: AGHT+IEL1N4fvOEgiPtg+pq0S45b37kIEjw9+z8Ad8/F/qimhBxDzCX9z+Lz6jL+mOO9oAdFPC/mhw==
X-Received: by 2002:ad4:5cca:0:b0:691:8508:fe21 with SMTP id
 iu10-20020ad45cca000000b006918508fe21mr685593qvb.29.1711144603681; 
 Fri, 22 Mar 2024 14:56:43 -0700 (PDT)
Received: from earth.localnet (97-127-36-49.mpls.qwest.net. [97.127.36.49])
 by smtp.gmail.com with ESMTPSA id
 jm12-20020ad45ecc000000b006913ee4a16esm1465744qvb.24.2024.03.22.14.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 14:56:43 -0700 (PDT)
From: jeremy@jeremypeper.com
To: buildroot@uclibc.org, buildroot@buildroot.org
Date: Fri, 22 Mar 2024 16:56:42 -0500
Message-ID: <8175291.lOV4Wx5bFT@earth>
In-Reply-To: <bug-15991-163-VkxGjgu66P@https.bugs.busybox.net/>
References: <bug-15991-163@https.bugs.busybox.net/>
 <bug-15991-163-VkxGjgu66P@https.bugs.busybox.net/>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711144604; x=1711749404; darn=uclibc.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hyCqP7aAt/5HdqlZfT60UgbCxpLbpb9AjPO58UZp2f0=;
 b=Ng2aeB+2bpCRV60bebIdS6IukoEfr0BF3GaLadZZ7NqPpzh/XFArisbegRsFgBNOQw
 /TRYYIwb/g6bdceS80snrYNKBZ9H+21m//2Ube4CIZQcNnjiBbLFuWnEkRG7bm/8nM4X
 ldX4CmfghizN+iORJMvrxjtfGaaA9JwClcvG3WrOlq6GxhveR+ecqpmoYNFFXPWPjXQc
 rxYJlAd01lBPymfr/OhG+k+gFlGW779uo49ilHru7Wl+bwLdkT7hO74GLjhpAzYKJ1db
 jFb8FULgVU5f6g+ATrkKMHkcAEap1g+eY9BWYUkDslgduHS7J0WpC0EOnohUHMXlmTii
 jTkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jeremypeper.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ng2aeB+2
Subject: Re: [Buildroot] [Bug 15991] host-heimdal fails to build on Ubuntu
 x64
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
Cc: bugzilla@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tuesday, March 12, 2024 10:40:09 AM CDT bugzilla@busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=15991
> 
> --- Comment #1 from Bernd Kuhls <bernd@kuhls.net> ---
> Please try this uncommitted patch:
> https://github.com/heimdal/heimdal/pull/1229/files
> https://patchwork.ozlabs.org/project/buildroot/patch/20240210103634.3502847-> 1-bernd@kuhls.net/
> 
> I did no had the time yet to respond to the Thomas' comment, sorry.
> 
> --
> You are receiving this mail because:
> You are on the CC list for the bug.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

The linked patch restored my ability to cross-compile samba4 without the host-
heimdal build failure. I think it's worth pushing to the 2024.02 branch.



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
