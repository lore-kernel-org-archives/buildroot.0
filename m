Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA68C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10F6780DFD;
	Thu,  1 Aug 2024 21:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fd8hoK3xGqTa; Thu,  1 Aug 2024 21:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 145AD80E59
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 145AD80E59;
	Thu,  1 Aug 2024 21:20:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2DB31BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0A8160635
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MTeNJqEfFUU6 for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:20:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 879526062D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 879526062D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 879526062D
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:20:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7ECBDC0002;
 Thu,  1 Aug 2024 21:20:15 +0000 (UTC)
Date: Thu, 1 Aug 2024 23:20:14 +0200
To: Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
Message-ID: <20240801232014.6ec310ce@windsurf>
In-Reply-To: <20240801153432.1741409-1-philip-dylan@gleonec.bzh>
References: <20240731145504.365492-1-philip-dylan@gleonec.bzh>
 <20240801153432.1741409-1-philip-dylan@gleonec.bzh>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722547215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x/vgDB8eZuwec0f0HiPIzBuix7q9yPBrrEakX7W4pN4=;
 b=Taof4uw1u1FO+vcgBsQ1kI0gQfrtNVv4EL4UCU8TFvQoKEqGKTS1JZM4LkGWCfjliPJjv8
 A4NBCKFxsNhiyqphj1Tccze4O7UhvN25iTSv6Mmu5dFHL7PQdlH5Zmgwuxl62KUwm3RSuP
 eo4Jd7o4o1uYhjDoMm+23I28tM2NrAr02zEre0c3QZTIA6k9o9AERfaFMzAl6nFyodpNXY
 pN8PyQLv3XfJbsemMTVI0DUPhXzP0qNnT7FSpBP+uwpIo28pIBtT2mrbcsQ7AqAY7MMKOc
 iRdt5Pozzo2Fo1qs9dpRAWqTO6N53d+TPMBiz7/mtoFCtqM/nBWz84sQWbheuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Taof4uw1
Subject: Re: [Buildroot] [PATCH v2 0/2] Udoo Neo kernel update
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
Cc: Fabio Estevam <festevam@gmail.com>, kilian.zinnecker@mail.de,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  1 Aug 2024 17:34:30 +0200
Philip-Dylan Gleonec <philip-dylan@gleonec.bzh> wrote:

> Philip-Dylan Gleonec (2):
>   configs/mx6sx_udoo_neo_defconfig: bump kernel to 6.6.43
>   configs/mx6sx_udoo_neo_defconfig: add hashes

Thanks, both patches applied! A couple of small comments to improve
your future contributions:

- In the first patch, I added a short extract of the kernel build error
  being fixed, and also a link to the Gitlab CI failure being fixed by
  this. See the final commit
  at https://gitlab.com/buildroot.org/buildroot/-/commit/44b921f605dffd07bb6294e6368c2ace34a08266

- In the commit title, we normally use "configs/foo:" instead of
  "configs/foo_defconfig:". No strong reason, just a habit, and we like
  to be consistent.

- The wrapping/paragraph organization of your commit messages was a bit
  strange and not really consistent with what is done in Buildroot, but
  also in the kernel. Basically you tend to do:

Some explanation here.
Then some more explanation that might
span multiple
lines.
Then another explanations.

  While in most projects, including Buildroot, we expect:

Some explanation here.

Then some more explanation that might span
multiple lines.

Then another paragraph about something else.

- If you do have this board, it would be nice to add yourself for this
  defconfig, and its data file in board/ in the DEVELOPERS file. This
  way you will receive notifications when the build of this defconfig
  is broken, or when someone submits a patch touching this defconfig.

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
