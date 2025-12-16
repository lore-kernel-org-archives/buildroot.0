Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD932D5B87C
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 07:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A90540A57;
	Tue, 16 Dec 2025 07:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2Rw_bh7IXru; Tue, 16 Dec 2025 07:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDEBB40A00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765870988;
	bh=nJcwS+V3xsoahr7RjsVQqfxyzRN8layNzqwRjzbCgqQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DC1iAaEhQrU2Bu45E7oPcSF6sBPSFQWriq7UgXWKGPdmgYFmveqYaNf3sjna5Xjtm
	 iU3iIVMrY227DAVOPzU/hOyAWSMpNqcv/DNblHYi+z1Tg0qAQ9oWVniYBgdvALRB4O
	 b/vsLYFxdG40qKBVcrqlVvoeaCGlLmmUcEJ5PN7HocgTLYr9aEniPN6xJRswojx0Lm
	 tRLg8/dMShygYuaOzPvmUSHoTqy+jex4ZRQ4EZEMh/94JNaDW9RvHkUAOs8HXakg58
	 3zZzpkPFvLVielGvtiAgghj4srJe88tmu/8E0qHi35Ix4F+oLMIo8O2eYpSaMkTouD
	 eQrw5FVKtatbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDEBB40A00;
	Tue, 16 Dec 2025 07:43:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DD20F151
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 07:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C30D26066F
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 07:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqN5ebMpxNJK for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 07:43:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4001760644
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4001760644
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4001760644
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 07:43:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id ED2491A221D;
 Tue, 16 Dec 2025 07:43:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B63B16071C;
 Tue, 16 Dec 2025 07:43:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 34BD211942EE7; Tue, 16 Dec 2025 08:42:57 +0100 (CET)
Date: Tue, 16 Dec 2025 08:42:56 +0100
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20251216084256.1652f63f@windsurf>
In-Reply-To: <20251215223050.2231782-2-troglobit@gmail.com>
References: <20251215223050.2231782-1-troglobit@gmail.com>
 <20251215223050.2231782-2-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765870977; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PboIrDA4XnNHSw6zMOLfmSDKGzyat1j3G7IFZWaKsV8=;
 b=xhCOXitjQlxZJEOuaqqCAzeiDbUvtp4CWrHq79tmqxe28Q5lwBH5S0fBJ7WyjrVh9a2aDd
 +WUfsDeQ/1Ps36FFQw10DMIreqH/kaW/eAnSFK0R8oCdHooKreGPNaDv+2jC0JLKnDZLi2
 +z9dIOdY15NLVU+ZFT3VsBlGoc0wHEUnhmc1f3iLgd1qX1ubIDE3mIhx25d5yL07Oa7jPM
 O0svjr8eAqE+kZe67KYzY+VuKjrDHPZ335izZL9bDRAmOWc7x2x8Hd+DloZug/4itdBmgE
 Q5vqowzKFNRP0L1iSy//vZNa5mTiK0+8P5X2lN3RCc3G1Bw8yRryNfGeo9xZAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xhCOXitj
Subject: Re: [Buildroot] [PATCH 2/2] package/libite: update deps,
 requires fork()
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Joachim,

On Mon, 15 Dec 2025 23:30:50 +0100
Joachim Wiberg <troglobit@gmail.com> wrote:

> Unfortunately, parts of the library is not very no-MMU friendly atm.
> The below check fails due to runbg.c requiring fork().
> 
> $ ./utils/test-pkg -c libite.config -p libite
>                     bootlin-armv5-uclibc [1/6]: OK
>                      bootlin-armv7-glibc [2/6]: OK
>                    bootlin-armv7m-uclibc [3/6]: FAILED
>                      bootlin-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: OK
>                              arm-aarch64 [6/6]: OK
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Thanks for the patch. My understanding is that this is a fix, unrelated
to the bump to 2.6.2. Indeed the current version 2.6.1 is similarly
affected.

Therefore:

- This patch should be PATCH 1/2 in the series, as it's a fix, needed
  regardless of the bump

- You should indicate since when this issue exists so that we can
  understand whether this fix should be backported to our LTS branch or
  not

- You should add a reference to an autobuilder failure that this commit
  will fix, like this:

  Fixes:

   https://autobuild.buildroot.net/results/6c6fd2ae410a82c44da54ee13a09a38a7ab220c1/

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
