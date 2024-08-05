Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96405C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 07:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 296558105B;
	Mon,  5 Aug 2024 07:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eE5ipKVOLuny; Mon,  5 Aug 2024 07:12:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAC8E80F39
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAC8E80F39;
	Mon,  5 Aug 2024 07:12:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D3251BF333
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A564402A8
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNsSYH2i2ByO for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 07:12:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E0EF5402A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0EF5402A6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0EF5402A6
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 07:12:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5C36E0003;
 Mon,  5 Aug 2024 07:12:16 +0000 (UTC)
Date: Mon, 5 Aug 2024 09:12:15 +0200
To: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Message-ID: <20240805091215.6ab959fd@windsurf>
In-Reply-To: <20240805015711.112117-2-wilfred.mallawa@wdc.com>
References: <20240805015711.112117-2-wilfred.mallawa@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722841937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k+bCsxWjM6UwhDGsIQju/rxT2FsUc9gSt9tsi+7qdWA=;
 b=a1T1l39w9v6E0TsLRZR1GqNFZYCkISb0qBKpV0CWGj2EBd/gwf1DnYUihVvbNn1b+Ova9o
 MwpIruXCF+xDvXcp/Gz0tZZk1DbxkpbOvWkIjcqQT0LZS0XOkdmGfRLJBOL17pvENSMrYx
 r8SdkiKgNTetiCdSWZQ5a0k82BKCNgRGnqum8BtO4lp81EFGfvpyLEpzfy8bNPhTx29XCj
 mATytJKn0WnN+JNhP/7sCHQ1eEjakeX5i+EOiwtNb43cKtFJiWK1L/IWTezc6Cwm1qgpZW
 EGZYdB/HBXaHvoU+4oUla5wu8syIbbg1AbA+r+j9gvr6vXN0fKN9VFSgLKIamw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a1T1l39w
Subject: Re: [Buildroot] [PATCH v4 1/1] package/libspdm: bump version to
 3.4.0
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
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  5 Aug 2024 11:57:12 +1000
Wilfred Mallawa via buildroot <buildroot@buildroot.org> wrote:

> From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
> 
> `libspdm 3.3.0` and later support the SPDM event capability, however
> this patch disables support for EVENT_CAP as it is optional,
> and requires additional functionality implemented at link time.
> 
> `libspdm 3.4.0` also introduces SPDM1.3 measurement extention log (MEL).
> Leave this off by default for the same reason as above.
> 
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> Changes V3->V4
> 	- Fixed up how we pass CFLAGs as suggested by Thomas Patazzoni.
> 	- Removed the unused ".." CMAKE directory argument.

Thanks for the v4, I have applied, but there was still another issue:
the license file has changed between 3.2 and 3.4, causing a breakage of
legal-info. So I fixed that up, and explained in the commit message why
the hash of the license file has changed.

See:

  https://gitlab.com/buildroot.org/buildroot/-/commit/f0e4448e7c38d604152b6e727dcd6fb6d23c286f

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
