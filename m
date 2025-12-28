Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4993D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 23:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BD1C4073C;
	Sun, 28 Dec 2025 23:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Da2DBn7ud5KB; Sun, 28 Dec 2025 23:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCD9340732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766963835;
	bh=rak78SHI4xwayxnhPuq+bGxak2pZeApbmEJDwnrh9E0=;
	h=In-Reply-To:References:Date:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=g3b5u5RSIUz+FWj6kZqLCviqfDsyzNiuArT3bAo842AJEVMhdTVAqVVWQxiAGbsPl
	 0Qa4DuiDgECCuggkhEHPzN9w3C6D3GxNYocFXBDMIMHQvt0JtXAWFJyZWVDauGhUJM
	 TBBzqotfIc9+5ytJEZUo1Z+RC5EqCX/TAx77wXm1d6txpHnoBTj+wDOtonTcTH2t6Z
	 D97IJg9SiRA/L/yIRIRPeoHHmLKN2Z9djQJNoVKvpZsVciCRramcxp0YYjSelNxzWI
	 FaXce8b3qhj0HPwZH+7RtmgZiKpcMw5GPnk60ylmCVRm+gGNAIvV2Rka1AhC3C3T/F
	 CL4fK2leQZJLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCD9340732;
	Sun, 28 Dec 2025 23:17:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D8214D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE0E240732
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xkz6E4EshWls for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 23:17:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 74E7C40729
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74E7C40729
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74E7C40729
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:17:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id A4AC91814B9; Mon, 29 Dec 2025 00:17:09 +0100 (CET)
In-Reply-To: <20251228232747.6385eade@windsurf>
References: <20251209201851.1023802-1-buildroot@heine.tech>
 <20251228145724.309c6fc3@windsurf>
 <9a786142-8290-8202-436a-e0a634f8945f@heine.tech>
 <20251228232747.6385eade@windsurf>
Date: Mon, 29 Dec 2025 00:17:09 +0100
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Message-ID: <6dccc9f9-c321-1f0f-4267-57a00aa4fc1a@heine.tech>
User-Agent: SOGoMail 5.12.4
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1766963830; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=f+MMCgmwi8/HmWnH6UyBJDpYxbwhAPxC94jVokUmDFU=;
 b=NyL6sYSwj6AXmeDtA6KZOGqATaQoRM3KFXvxPDiZj4/r7zmZYtRqEWJ9AedcZltNk5SpFL
 VBxBmi+K73b4urZJfe2lVgJi+VS2QrZC0dlTD0iOfPSvPR66BCFsuDH/+6HxrQAYus/jcT
 ak3VXGWmoG2hpfWLL5sbetq2koIr0OY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=NyL6sYSw
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/4=5D_package/collectd=3A__fix_b?=
 =?utf-8?q?uild_with_grpc?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Michael Nosthoff via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Sunday, December 28, 2025 23:27 CET, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Sun, 28 Dec 2025 15:34:29 +0100
> "Michael Nosthoff" <buildroot@heine.tech> wrote:
> 
> > the "breakage" is introduced in the series which this commit is part
> > of when bumping grpc & abseil. So maybe the title could have been
> > better. I just oriented on the title of the previous commit which
> > bumped collectd to C++14 and is also named so in the collectd repo.
> 
> So you mean that in the current master there is no breakage, and it's
> only the fact that your series is bumping abseil and grpc that some
> breakage will be introduced, and that you therefore fix before the
> version bumps?
> 

correct. This is why it's part of the series bumping abseil/protobuf/grpc.
I just reordered the series before sending and missed to reword this commit
to be more intuitive. I can resend this next year with reworked wording
when I'm back at my working setup.

Regards,
Michael

> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
