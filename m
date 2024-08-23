Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CF9C531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15EAE84129;
	Fri, 23 Aug 2024 17:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wt7DC-SO7645; Fri, 23 Aug 2024 17:41:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C69AB84135
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C69AB84135;
	Fri, 23 Aug 2024 17:41:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29D621BF34F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17BC0612F6
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPbzIH7b8TPt for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:41:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04C52612EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04C52612EC
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04C52612EC
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:41:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D1C0C0002;
 Fri, 23 Aug 2024 17:41:43 +0000 (UTC)
Date: Fri, 23 Aug 2024 19:41:42 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240823194142.5620abe4@windsurf>
In-Reply-To: <ZsWZRc1pbliUXAk7@waldemar-brodkorb.de>
References: <ZsWZRc1pbliUXAk7@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724434903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HAMHOiHTBo1kZTa4vwiB1AEVFhvG6Er6X+8XFNhILrU=;
 b=ivjlPVUUSXpnP5o/vLyqhlO9KZobb06mutJzBEShrAaCoo9ku887c9rg2nyqAiwC/IW/+e
 dPasnZU7DrEj5skfko0unjzCUCxcYVxyj2AOk8abHc5MSF0P/ASCgUJbhvZGrKc9jPzWdI
 XLkWAZPtPrFt3Ma9jx3AkbGvMq/S/yyQXTt1ixrx4mqoXXl5U5ibxJF/ph2fJgUSYnDKHi
 pFAwxLPC9BQSSONaSjn1TWEdzzE0zK0BH8kUO+UMusjyq1VARUpVIjqnsIRWeZ56KqJLxJ
 KbFTkVvVJJELJIdXKokIBH0KjeMY1VrnUcetIJTFqz6EfGdiTAJTbl3d7dJWqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ivjlPVUU
Subject: Re: [Buildroot] [PATCH] package/elf2flt: fix riscv64 C++
 compilations
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

On Wed, 21 Aug 2024 09:37:41 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Fixes:
> 
>  http://autobuild.buildroot.org/results/63f/63f32c9d5d4097ef2b3cbba1ce665e13e9dbd430
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ..._RISCV_SET_ULEB128-R_RISCV_SUB_ULEB1.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/elf2flt/0001-riscv64-handle-R_RISCV_SET_ULEB128-R_RISCV_SUB_ULEB1.patch

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
