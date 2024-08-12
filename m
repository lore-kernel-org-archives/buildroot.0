Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7113AC3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 19:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C89160761;
	Mon, 12 Aug 2024 19:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJMKLEkj5uLl; Mon, 12 Aug 2024 19:29:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55C6B6077D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55C6B6077D;
	Mon, 12 Aug 2024 19:29:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7FB1C1BF59A
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 19:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C8454028D
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 19:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTCNfvoKNtfo for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 19:29:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F62B400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F62B400B8
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F62B400B8
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 19:29:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 648531BF203;
 Mon, 12 Aug 2024 19:29:48 +0000 (UTC)
Date: Mon, 12 Aug 2024 21:29:47 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240812212947.1c5c11cd@windsurf>
In-Reply-To: <ZrkCqifa1uXZ6QBQ@waldemar-brodkorb.de>
References: <ZrkCqifa1uXZ6QBQ@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723490988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IbsHnVEUUQWIH3SvnL2PRqgd7+aCV1k4ho6PRNEboyk=;
 b=FYUluExx5h5BpgmDWb1oGp2HUgs1WsTeC4mNGkf6bZoi9+ddmzhMDwAOSRCrRl7KDt3ZCu
 PAzCkxyDOhhm/a5EydCY+r5NOPbMt/u3Vsoy+jHjVGzJuWCCWlHbiO9sYPRNxK7XXJdrwo
 Iy2Nj7ihG9aSpe5DioBFPYDg25pURxjevFgQAlpYznY8kTdTjAPLBUQjCbPrFXRl9f28Y+
 JGxgeUBz5ZHFdd0ECA/S+Lf/7MmF41aP2cQadQKIKeAFHm+SO2ZoemtrDOT0azXsuEqsZP
 PxghvB86Wplky6rwNbkbeXrsvTKArF7FbsXnVhCG4al2rBmOThAMXxvk2F2hGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FYUluExx
Subject: Re: [Buildroot] [PATCH] package/uclibc: add memfd_create syscall
 wrapper
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

On Sun, 11 Aug 2024 20:27:54 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...005-add-memfd_create-syscall-wrapper.patch | 467 ++++++++++++++++++
>  1 file changed, 467 insertions(+)
>  create mode 100644 package/uclibc/0005-add-memfd_create-syscall-wrapper.patch

Applied to next, thanks. What about cutting a 1.0.50 uClibc-ng release?
The number of commits since 1.0.49 isn't huge, but they are almost all
fixes.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
