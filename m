Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2AED6D255
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 03:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05401607AF;
	Thu, 28 Nov 2024 03:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYtXStMpmBfd; Thu, 28 Nov 2024 03:21:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29AE960B3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29AE960B3F;
	Thu, 28 Nov 2024 03:21:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B3A21167
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 03:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B140607AF
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 03:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nw6PM9m_3fW2 for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 03:21:15 +0000 (UTC)
X-Greylist: delayed 587 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 28 Nov 2024 03:21:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E83260859
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E83260859
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.150;
 helo=fout-a7-smtp.messagingengine.com; envelope-from=julio@meroh.net;
 receiver=<UNKNOWN> 
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E83260859
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 03:21:15 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 2CA8F13800F0
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 22:11:27 -0500 (EST)
Received: from phl-imap-13 ([10.202.2.103])
 by phl-compute-04.internal (MEProxy); Wed, 27 Nov 2024 22:11:27 -0500
X-ME-Sender: <xms:Xt9HZzCnNWPO0oFu8dqueTrdptCWi-XxEbaB6Z7PjvAiXpqhjXMW8A>
 <xme:Xt9HZ5hrQ3oniAasW3DCtlGlDaUSsDWAKrigZfp1SwmL5vpL2U1OZ3vsE-vS7Tdx4
 t61rRl_PwlgUjxqsW8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrhedtgdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
 tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepofggfffhvf
 fkufgtgfesthejredtredttdenucfhrhhomhepfdfluhhlihhoucfovghrihhnohdfuceo
 jhhulhhiohesmhgvrhhohhdrnhgvtheqnecuggftrfgrthhtvghrnhepleffiedvteeggf
 dtleeitdduvdelffeutddvfeelfedvjeeiffdthfegfeeuhfdvnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhulhhiohesmhgvrhhohhdrnh
 gvthdpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
 sghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-ME-Proxy: <xmx:X99HZ-m335hw0UOvI8dL12kCPuWsmLDeOLcHkIGRGp18ZxuzfWWjWQ>
 <xmx:X99HZ1wQLPRIR3cX40oN5ID9jBUIXzkBwQGHZFuhmDOCYPnuq4EckA>
 <xmx:X99HZ4RjiaYFlyEo8foRAN449rFcQ8lYwFLkTgZ_upWOmKPFrnUygA>
 <xmx:X99HZ4aTfg7ek-21lDO599ELdOHEYMeSamM5sh3b22CBYyk1j4ISlQ>
 <xmx:X99HZx6JChwjdZa0_MKval9wbRkaYFGNiKRl6kQkqxCu5Q1dFMfbK4oU>
Feedback-ID: i25a14935:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id DC4DB1F00073; Wed, 27 Nov 2024 22:11:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 27 Nov 2024 19:11:03 -0800
From: "Julio Merino" <julio@meroh.net>
To: buildroot@buildroot.org
Message-Id: <52f63db5-124e-4be0-8ebf-3c177b9f9b03@app.fastmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=meroh.net; h=cc
 :content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm2; t=1732763487; x=1732849887; bh=RVkIx1k6EC
 KUcJWognkPaPysNM5QTZe/088QT07CjQY=; b=IwriyWgXCS5fnHuOyxJTd7hHq4
 ecvo0Mf51IlRHg67v/C2MImOmo+o4l4uZeyZzJDeUJYcGNIFmVSCwr+f/ThPszei
 J59iYF1jytcxiYHIOTa6NeCJi4wtDCXkn89ideVpvtinN05Z9rlA/e/ew3i0z56k
 JiEXmtkVzBxHFqJCjoOwUEui0fhX0CFJS7TWBYC6btquqW0fRFBqG+3+dBh07k4Z
 utha3XTvx/739oiRdZXkUE8uOnNdbnpSaOel1nSqB1lIUl29Wu+xtdqb2xfmsLhd
 IkuGwdS42gMoKg7pdGGjEqUA2Cm6zbRD3VMkL1ZDF+7h9sWNrxck3kstYepA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1732763487; x=1732849887; bh=RVkIx1k6ECKUcJWognkPaPysNM5QTZe/088
 QT07CjQY=; b=qHIQP6lzv9XYY8ew/c4LbxnGcC5jmheFXmf/g8jSTAhot7039NN
 5y9M4HkFznDqFoYy1yhy6Cx2elx61Ga1T8ZotBljZcjwv1CeoB+2OQHclb+O3mVt
 RdZG2zmRTsaVmnu6vWaFeEklemuuFLBanFjkHJc1PyZ+MUJKy0qXzn5t/OKJiM0d
 yefx2EDv5LM/UNCZxuN0J+9l0ER19cmXuVIhirzrjPM+DU8iCwK+T+B1IthJmtWp
 gHQ9K7ae2BLZY3+XBzyA4FPYl10xfS18F8yuUAL0LRS8AX5wIcTLuqNRzvKnMhcn
 DcNCzHF8sTUNqjNZnv+PqZnEe9jhCmJt2cg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=meroh.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=meroh.net header.i=@meroh.net
 header.a=rsa-sha256 header.s=fm2 header.b=IwriyWgX; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=qHIQP6lz
Subject: [Buildroot] How do I generate the vendored Cargo sources?
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

Hello,

I'm exploring creating a package in Buildroot that uses Rust for building. The process seems very easy, and I think I've got everything in place... but I do not know how to handle the "cargo2.tar.gz" file and I cannot find any information about this in the documentation.

As I understand it, this cargo2.tar.gz file is a "vendored" copy of the upstream sources with all Cargo dependencies bundled and locked at specific versions to guarantee reproducible builds.

So my question is: how do I generate such tarball given just the upstream tarball?

Thank you!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
