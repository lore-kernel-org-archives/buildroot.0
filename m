Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E6DC5B54A
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 15:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B426400AD;
	Wed, 28 Aug 2024 15:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mvBRa5fe4c16; Wed, 28 Aug 2024 15:41:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F32E0400B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F32E0400B7;
	Wed, 28 Aug 2024 15:41:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD6C31BF2AA
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 15:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA645400AD
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 15:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uxOIHZa5Fvr for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 15:41:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7911D40086
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7911D40086
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7911D40086
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 15:41:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2797F40005;
 Wed, 28 Aug 2024 15:41:33 +0000 (UTC)
Date: Wed, 28 Aug 2024 17:41:31 +0200
To: Daryl Spitzer <daryl.spitzer@gmail.com>
Message-ID: <20240828174131.7a9f4721@windsurf>
In-Reply-To: <CAG94F8pYTZTid25CSrTR4mSo_WtAE8qOecLATN82AnNW_jcqQA@mail.gmail.com>
References: <CAG94F8pYTZTid25CSrTR4mSo_WtAE8qOecLATN82AnNW_jcqQA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724859693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S3C1Usnjh9lIynJc1+R8wGMXEO4gpO4eF307B/4sqZQ=;
 b=dg1FefTY7TGEiUhlxqTakYJcImLIy9BK8/o/S3Mb/uNxg+0VcOZ4gFGoWf3MmDR7/JL1tv
 QFtsUj34w/EqvZJHwyIF8GVFWJIbi56ATUWn/6A97DFTlX/5e8mMbbxS67JK7/08tuZIoL
 17gVFao9WDz8dGu3Dg0RAsWAeC3BSiwkh6L6mDEwr7U4xoYAKVslXC1qdTUR+5DMesTtps
 C07dpub+4UOlQcZb3u8m31keVmU8fPUi8bo3byT+hRKLzU6yZYpCu0rBaZuxEhjaU0/26m
 dLuaTRqnZH/TAUUmbnH8q0ha2Q3Tsle422znGcSft2Rju7Pdt9CEeGhhCRNEfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dg1FefTY
Subject: Re: [Buildroot] How do I include glibc versions needed by node in
 my buildroot config?
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Daryl,

On Tue, 27 Aug 2024 16:31:03 -0700
Daryl Spitzer <daryl.spitzer@gmail.com> wrote:

> I'm building a root filesystem using buildroot (running on Ubuntu 22.04.4
> LTS) for an ARM Cortex-A7 target. I'm including Node.js by selecting "[*]
> nodejs" in Target packages ---> Interpreter languages and scripting --->.

Could you please specify which Buildroot version you are using, and
provide a Buildroot .config file that exhibits the issue?

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
