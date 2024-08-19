Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3F9C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 21:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51EC8605C6;
	Mon, 19 Aug 2024 21:22:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jB5WVEaf0UqK; Mon, 19 Aug 2024 21:22:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6573560826
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6573560826;
	Mon, 19 Aug 2024 21:22:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC9601BF398
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 21:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AADF460826
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 21:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FT8Gc0cxEux for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 21:22:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B95E7605C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B95E7605C6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B95E7605C6
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 21:22:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CAB4B13F899;
 Mon, 19 Aug 2024 23:22:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 19 Aug 2024 23:22:48 +0200
Date: Mon, 19 Aug 2024 23:22:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <ZsO3qDmsyWLWz2Gt@landeda>
References: <20240415162229.1357491-1-thomas.perale@mind.be>
 <20240415162229.1357491-6-thomas.perale@mind.be>
 <ZltDc6AXn_CC83Gy@landeda>
 <CA+h8R2r9ogzjdAjVon5UsU9TPp5wy+cYC+BUSGnRWF3bgnkMcg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2r9ogzjdAjVon5UsU9TPp5wy+cYC+BUSGnRWF3bgnkMcg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724102573;
 bh=aLEB67oOa1JF5RbjCpTwVpNNFvfyvlTDiLh7pOshii0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mq6l2fkvqCyjepd1va6z2ViGOMovXKSu8SExWOaVgad6VwISvp3VvObBDK6XREqCz
 sGXgvhiTHfqoG+XWZmcL8iL6+VPYwcFn5HynarrbEuMnr9o3isznqvwRfM7xxWnC6p
 Qivqqg87veM0kh6Gg07qlth8Hr10v+lJu1A5+Twcbw1xMOguQax1AnZyx8Fejz6zxk
 NwWKWa7uLNfd4PbDuIogXIcIqjmINWBKZy5Iu7o4v/9SZtoFtINELdovHFRd1TDZ/U
 uImXiG2B3xBedWVbVndajifM187rHutfgrBGUs09Xd99HplB5dc0vTUHmmvZMpCEBu
 MggdSsK8jf/wA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mq6l2fkv
Subject: Re: [Buildroot] [PATCH v2 5/6] package/go/go-bin: new host-go
 provider
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
Cc: Thomas Perale <thomas.perale@essensium.com>,
 Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

Reviving this oldish thread...

On 2024-06-13 21:07 -0700, Christian Stewart via buildroot spake thusly:
> Do you have the modified version of this patch posted somewhere so I can test?

Did you eventually had time to look at this host-go-bin issue?

For reference, here is the issue I encountered:

    https://lore.kernel.org/buildroot/ZltDc6AXn_CC83Gy@landeda/

And here are the two patches to be applied on top of master to reproduce
what I locally had:

    https://paste.debian.net/plain/1320319  package/go/go-bin: new host-go provider
    https://paste.debian.net/plain/1320320  support/testing: add tests for Go providers

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
