Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49B4ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 19:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F1094171B;
	Mon, 19 Sep 2022 19:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F1094171B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJ9uy96ejJmE; Mon, 19 Sep 2022 19:51:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1606C41711;
	Mon, 19 Sep 2022 19:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1606C41711
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 620DB1BF59A
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 19:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D9E7607C9
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 19:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D9E7607C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l93Dqc1NugIm for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 19:51:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62CF0607C0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62CF0607C0
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 19:51:29 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id l9so454993lji.4
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 12:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=DsOKuxJgq1t4tSZi3DtZnQcFi3ehaqo7xsntZYtMhgY=;
 b=A0tkx7SpP8/JPnmLcRBnbPw4HLPwkFw9FzzB/AabWkO54fsLWfC0hFS5hDX9niXpuk
 kmSS/zG1/6e197CvMqEtWFprfF9872S07qhDSk4HV4dnSmOdVQWK3ufrpE3ySsZHtZHv
 NlJ1IuLgoy79Zm5GdvduEQ04rIYHwFm8pKfiTWDdAjUy71maTPghJfMbpTyly7TlGT0P
 KUB6OWNA6XZJC1QVJhMw16whoDLKp28vgaBIe2q4m5jTbqY0KJ+PhNPokktu2xJbV2I0
 xayWhhg8Gwmn2YKaJc1EC8ZWVNwsSsqtsd3guMPIU7+T68lEFkQMrLkVDZHTOdJNCf6W
 vyzg==
X-Gm-Message-State: ACrzQf3U043LaPwZWpUa0r0vpqiwYry4ZOQU/NaYVFRNg/xIQYdLGkAE
 fifoJxAvA/Y56sjnfCakjk4S3al4SxA=
X-Google-Smtp-Source: AMsMyM4Ao27m4MkM1C6BeOtHHXjxv4g+n/Vo0Iluh030xjh8kRZmg3FxcHwZz8cWBQQymr8heA3kXA==
X-Received: by 2002:a2e:b0f1:0:b0:26b:dac2:d53a with SMTP id
 h17-20020a2eb0f1000000b0026bdac2d53amr5694989ljl.253.1663617086850; 
 Mon, 19 Sep 2022 12:51:26 -0700 (PDT)
Received: from gimli (h-176-10-137-51.NA.cust.bahnhof.se. [176.10.137.51])
 by smtp.gmail.com with ESMTPSA id
 e28-20020a19691c000000b0049c29389b98sm4022126lfc.151.2022.09.19.12.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 12:51:26 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20220919193841.GO1419013@scaer>
References: <20220919034622.306672-1-troglobit@gmail.com>
 <20220919193841.GO1419013@scaer>
Date: Mon, 19 Sep 2022 21:51:25 +0200
Message-ID: <864jx3w3b6.fsf@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date;
 bh=DsOKuxJgq1t4tSZi3DtZnQcFi3ehaqo7xsntZYtMhgY=;
 b=RKXZDfjW2PJRPnMBm8XvaNPi1Z2C170dd5cV6FiX65BiKe6i+ogGeAeGyofQWRF9NQ
 3/2SRubS1rXGnOKNXGjnjenBD77jdijWxHK/EY+Qlk8xfusd7r9+Ov2RjH/LTAouUZnp
 AFHe/L6nE16pWn8qQ7kmySyjJ3tnNOhNHgVCsALaOHeomzlqsJpvOh4EFm+Pjjlp72N5
 9xDttJAIfFWJTEE7RpeR+fNR3+vzi1wUMRhC5DngU8HiT677z8tI3KdlhhjJb7rJAGRd
 FlJ0Hhce91uniGONFJxE6Zq+KY9ZlseHg4Nmd8JTlCEMIJIte17NMPnCjmYhh3fHCmqs
 aHbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RKXZDfjW
Subject: Re: [Buildroot] [PATCH] Add myself to a few projects where I'm the
 upstream maintiner
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

On Mon, Sep 19, 2022 at 21:38, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> I've fixed the typo in the commit title, and took the opportunity to
> rephrase it slightly.

Gah of course, thanks for the attention to detail! <3

> On 2022-09-19 05:46 +0200, Joachim Wiberg spake thusly:
>> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> Thanks for adopting those! :-)

No problem, there's more where that came from.

Take care!
 /J
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
