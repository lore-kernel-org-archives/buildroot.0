Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09498C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 16:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAF0B60AB7;
	Thu,  8 Aug 2024 16:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjvz9OMd_4y4; Thu,  8 Aug 2024 16:57:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBCEF60B04
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBCEF60B04;
	Thu,  8 Aug 2024 16:57:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 109A91BF28E
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 16:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE0D9406AA
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 16:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sf59LBnzNrHV for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 16:57:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 756B0408C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 756B0408C1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 756B0408C1
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 16:57:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39ED640002;
 Thu,  8 Aug 2024 16:56:59 +0000 (UTC)
Date: Thu, 8 Aug 2024 18:56:58 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240808185658.513e43f6@windsurf>
In-Reply-To: <ZrTKdR2FH9o0gwD+@waldemar-brodkorb.de>
References: <ZrTKdR2FH9o0gwD+@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723136219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U4WlAhx6QSgZ+nSe7JTSH6eMAiLCa0t9oCtcrilOWws=;
 b=Kzy2yRUxa8JEXqtN9riuF0NnjPtkFrRR7+xitimvUSkwDBg9cuhsizEg+Nc3TA1f3Qx3tt
 nFEwHlYZ/pvPL2yd2g7DSJ1axFnCOl1t7+LlWVzdDZjVAWPEob+II+O9lEwNs8+cadCGm7
 yq2V6EEO9VR3nn9u4hhYMhDvmKiEzW0JOioVJY79I7GTb2FmuVdBMY9kt4Fe17mYJKv9lb
 XJfM34MbI2tfuKnHU1GwYoGiFRvPY/oKZNTNEU4VA64V4hEY9oy2VCPIxDyG7qv8VMFqTL
 kaa4d62xGDqHQURq4Bt1AcclQ+Nmm7Dk8R+q/9DHcueR6i316X0HVg3a5NDMgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Kzy2yRUx
Subject: Re: [Buildroot] [PATCH] package/valgrind: fix MIPS compile issues
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

On Thu, 8 Aug 2024 15:39:01 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Add two patches from upstream to fix MIPS compile issues.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/4cb/4cb021207d341b412ef6921c3368da3b644d7eb0
>  - http://autobuild.buildroot.net/results/d0e/d0ef7145960695bbbec23909b1ca24a5336f3c23
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...ninitialized-err-in-handle_extension.patch | 47 +++++++++++++++++++
>  ...st_IP_AT_SYSCALL-in-handle_extension.patch | 33 +++++++++++++
>  2 files changed, 80 insertions(+)
>  create mode 100644 package/valgrind/0003-Fix-uninitialized-err-in-handle_extension.patch
>  create mode 100644 package/valgrind/0004-Avoid-use-of-guest_IP_AT_SYSCALL-in-handle_extension.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
