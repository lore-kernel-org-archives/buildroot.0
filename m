Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D531DC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 22:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4DA540127;
	Tue,  8 Mar 2022 22:59:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FNM6f7ptgzVL; Tue,  8 Mar 2022 22:59:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98D804016F;
	Tue,  8 Mar 2022 22:59:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA3D81BF30B
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 22:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4A4D41740
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 22:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dbrgn.ch header.b="dg8BhZ+/";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="FuP2owFf"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G8hXUOnmX1XD for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 22:59:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46DB141655
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 22:59:27 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 73A0B5C01E4
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 17:59:23 -0500 (EST)
Received: from imap48 ([10.202.2.98])
 by compute3.internal (MEProxy); Tue, 08 Mar 2022 17:59:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dbrgn.ch; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=TEGdislvUCT+j38oKLa3tsMv57tbxh8RAnmwPf
 K8BeU=; b=dg8BhZ+/zNubmbV7PBnoPqOFD7o79JvjqFs8uy7tQH3uQxfYPjyt6+
 l1J8cKgWSBqggKKmkpRQ5L31Qr1LeoVDASmJb/zXmBEOlW5LGSe0nJWswxskFx6k
 GSFdBTemO5bCv03pw2cPNn/wqFs/nPxu63a09azSqFCS0pMk2AbkHY38rdrWcZbU
 PcKbNg5ZX7PbqhgTqBUB3iibsjA4vocrUldVeq7k2GKbN5FCPZXlFgf+ii2PsMVy
 LmPNOfUQu93M3ljWA5o2PSG+0EeVZZxU4lol+qvxFUrUKKfH5rWS+SlgqPxZ5Lvi
 D2XFvxCJv3hUHdykaKM2vYei1a0y0ZJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=TEGdislvUCT+j38oK
 La3tsMv57tbxh8RAnmwPfK8BeU=; b=FuP2owFfN8hNv6MzEnP7mEVu/3IF8WnfA
 BUvZRbk1O+W4uAXBEMD/CSxbIoOoW/4TktEgPTAo6JMpRCtyus035BxeF0061NXZ
 5ybSMA2rjEaW826RzxGOf7X2DkbZKx3gNJ++oyBqj1azBL2EchR18uzQ2mnkxrIC
 OXeGUvrg8e64VRynFHEWoCtaNQ0ZLtahgvbYNPnFZB0F4X27hSq4h3O8e1m2i93D
 Szsqp3T9sui+vHC+CSN9pcxxepeifgEnC7JE6Bn83E7UYVeraxZWHeByOwsldPZd
 85yw10Gn8oGOWC7ykxD25xXreh2iYan5azwECsB1AGspVFazA0jlg==
X-ME-Sender: <xms:y98nYlDDxrXG84c-tL4vZ_VFHwDXsgQt1tlsFPml2hFmwPjb5yLatw>
 <xme:y98nYjgl0a6x3Uf7Au9X1wKOLCIKOth5ya39-_-IVzbChs_T2211gGfgHOywO4zVY
 DthL7qht0HBYCe6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddujecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtredtre
 ertdenucfhrhhomhepffgrnhhilhhouceomhgrihhlsegusghrghhnrdgthheqnecuggft
 rfgrthhtvghrnhepleffleffteeilefhuefggeejgeelvddthedvveeuuefggfegjeetke
 ejtdejgeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrihhlsegusghrghhnrdgthh
X-ME-Proxy: <xmx:y98nYgmBfS3ZQ7hfi0Bb7TfXAW5lc8gGurflxgd8p-8kcOOaZhL9Qw>
 <xmx:y98nYvxyjSdqrLTzNxFnrufWqFw1AmV8cSpUJt6G0AyUxqpCu1ddLg>
 <xmx:y98nYqQhHLHG68wvzkQeP4BQEWa2eB2jXDy_rnYDRapmC7hucNhQ_Q>
 <xmx:y98nYj5W7DU9jGMvbDlLiOXJuV8AJjDkmzmNfH6vFSCasm0rp1Fxcw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0408A21E006E; Tue,  8 Mar 2022 17:59:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <94327194-ed5b-42c2-8ece-45c0368c9622@www.fastmail.com>
In-Reply-To: <f4e356e6f59e8746890bbdc07ed684115043e762.camel@dopsi.ch>
References: <0e6293a1-fa3e-4399-b963-14634d3578ad@www.fastmail.com>
 <f4e356e6f59e8746890bbdc07ed684115043e762.camel@dopsi.ch>
Date: Tue, 08 Mar 2022 23:58:47 +0100
From: Danilo <mail@dbrgn.ch>
To: buildroot@buildroot.org
Subject: Re: [Buildroot] Patching buildroot package makefiles with
 BR2_EXTERNAL
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

Hi Simon

> I did expect that adding the dependency as you did would work but it
> failed: they show up when running `make arm-
> trusted-firmware-show-depends` but not in `make arm-trusted-
> firmware-show-build-order`. Does the same happen for you?

Yes, same issue for me. "make nginx-show-depends" includes "nginx-rtmp-module",
but "make nginx-show-build-order" does not.

Manually building the module before building nginx does work, but it would be
nice if there were a clean fix.

Danilo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
