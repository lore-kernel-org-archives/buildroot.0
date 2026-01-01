Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8555DEEB579
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 15:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC3944081F;
	Thu,  1 Jan 2026 15:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNkwfAcdsTgr; Thu,  1 Jan 2026 15:25:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E367040819
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767281132;
	bh=Qid2RmjrVDcC5N9JcAJ8UlgaOguE/ot/x5IQMEQhWzs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BT24vgjy0YSzmNTNQUddM6v4gQTIc+gvltx3K7LDYAaaOrnRAm1SYiUomsFDrtIIB
	 ZmvC87uHjrKBrGViPCnJXEJ0f6cEC92fSccfrykLWJReSi4me7uNFOXnecBjL7v+w2
	 OL/fVhCyjoHurYGfjAR6ds/kMM7CyN7/kUflxPGMsg/kFwN0zfbQERdj8UBktAneSx
	 zK9KY5jXvoAwi6+ayBdl5pPf+awkcYB7bEa2/CirGLX/J4OUz2CC0hyCNZnzd7+vUx
	 Eb2UYRLrVH2niJ4wqk3dyZG6xByS9kq77kp8DDZ2qNBeXX4WiFIjekRoBMJQmlggpt
	 LI+2lsG64ZwOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E367040819;
	Thu,  1 Jan 2026 15:25:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 603D019D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 529624059E
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HssA6GB2jIhn for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 15:25:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65B794055F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65B794055F
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65B794055F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:25:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id F3C8E1A258F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:25:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C1D3B606B6;
 Thu,  1 Jan 2026 15:25:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E2637113B029E; Thu,  1 Jan 2026 16:25:25 +0100 (CET)
Date: Thu, 1 Jan 2026 16:25:24 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20260101162524.4aa8a0f8@windsurf>
In-Reply-To: <20251102115436.1399397-1-bernd@kuhls.net>
References: <20251102115436.1399397-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767281126; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=bWtsxVEIQKEtf4jdJKdEKSrlh/CsUub0exT8e+rprUA=;
 b=2ZjUlv2QOPRSBlEp3AK1126bKUrNdeg0oCpdEMwZ9IxQJdxesmgF6gancMVmfKRxhK5QvE
 tidVY0elXdhREzI5NyU7XXtbkH/BveArA1vpJ+jS/gK+GonZDaR78QdBEoV3oFlB6tPG+w
 eCWBCyk6Civ/jFPuxYnWCxZfcCru99uFS8vEf9pUEjXFu+QSUUj5f36SQ+wyTvznkvd3Bv
 2WkYqK4+KOGgxmyfGKgj1xy5V4f8bnvKZPsElJc7kv1dwbOpxiSslSQuO/T/IqfLqaLXK8
 s0kxnS97EnuDi3GKIEy7Lp/3qSX3pcbSzB1w038jv8r0Y7432GSdNXxHGN/f2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=2ZjUlv2Q
Subject: Re: [Buildroot] [PATCH 1/1] package/vorbis-tools: Fix build with
 gcc 14.x
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

Hello Bernd,

On Sun,  2 Nov 2025 12:54:36 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> https://autobuild.buildroot.net/results/135/13520e3cbf6b6d169985f4d1378c2a1baab852e0/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../0001-utf8-Fix-build-with-gcc-14.x.patch   | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/vorbis-tools/0001-utf8-Fix-build-with-gcc-14.x.patch

I'm not able to reproduce the build issue. I've tried with a glibc
toolchain, a uclibc toolchain, with gcc 14, gcc 15, but vorbis-tools
builds just fine for me.

Could you provide a minimal reproducer as part of the commit message?

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
