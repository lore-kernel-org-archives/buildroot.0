Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B326BCD98F6
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 15:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 607D5611EB;
	Thu, 18 Jun 2026 15:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7reRPgQCgiJP; Thu, 18 Jun 2026 15:00:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CA71612D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781794808;
	bh=p6LVhnHt7+guG827jppKZXPzk10A13ugnS2H4cteiI8=;
	h=From:Date:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hSVgg3EjQdsPTmZFmsYi0Lo6FwHqJEscjifii+AhP1QoY2DxVCjSmwMYqLosSvTUT
	 7XyZENKpBZyFJQSmCVO17bAd5HQtu6fQWPYXkAqo16CwbPRHVwrxY3+BtTQtc50suU
	 dKETEKhpF5MdoNqLfPGRa2wuIM8DezIJjeLtZdhUE8iALUQ+gv0Ar2tsKG+UPgbHem
	 zyMf+Du17d22ZWtJQKYeq6DIgAFTe83KRvOhNVAC8xak6giS/8EA92jPHPr1Wj7SHR
	 DOlfsrue7XDjErLXaJ/r7qnSW7WHBBm9A9H8zNnDxVEska/iq9rlKYDobDTv6VkXFj
	 ml8ERv13X2jKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CA71612D2;
	Thu, 18 Jun 2026 15:00:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42ACB1F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 15:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28A8083AA6
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 15:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KlZMsP9R2El for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 15:00:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA9FD83AA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA9FD83AA0
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA9FD83AA0
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 15:00:05 +0000 (UTC)
X-CSE-ConnectionGUID: wuQa4/o5Qleer3vgQjBAwg==
X-CSE-MsgGUID: F4tVuY9fTCOW4vvHwK4e3A==
Received: from unknown (HELO opfedv3rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 18 Jun 2026 17:00:02 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 17:00:01 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Thu, 18 Jun 2026 17:00:00 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 18 Jun 2026 16:59:59 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: unxODyPCR/GabUZ2paxIJQ==
X-CSE-MsgGUID: /lHL1Wz/Tn2SkkRIwmjt4w==
X-IronPort-AV: E=Sophos;i="6.24,211,1774306800"; d="scan'208";a="436641211"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Thu, 18 Jun 2026 16:59:59 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <ajQH75Zam4xELadz@yd-6wlzhs3>
References: <20260617174208.3968183-1-james.hilliard1@gmail.com>
 <ajOHeaIobPebbK+f@yd-6wlzhs3>
 <9b0c655b-ff65-4841-9390-43515fb06d56@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b0c655b-ff65-4841-9390-43515fb06d56@bubu1.eu>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1781794806; x=1813330806;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=yz72WuhXixv39aGcKq/m35XhvUuexUjqmu6xKd7XOp4=;
 b=gTOTYlLFFh/aU6SB5vz0+GM1/R1b/ubZmVbeEouHltxlQDmWgMw775lK
 3CEVgFT7JzUnIvFxu2SObACwcaATr4BP5C7hb6q0amtiJNHPSZS5X+agU
 ynSPlWMy9C2RB5Uh4Z5g2RuU64Ywm8VJbwrwzxhl/c6wHHKkyC4oPr3dO
 ryr7bmnYZ3+ZViJpWyBoLfNs0kfvEOfN7s/D4i5vOMduN9TAFfSyD3YPC
 5SLqx5gvw2uG49v58avxr5CNLovlACBLzg4x/s7MIH4Io5g7403xln3cO
 Di7wxwTCo0I2ht3b8QDawu7X36FJGJNsjbM12JzztmfaQ+2qCcjs3feqW
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=gTOTYlLF
Subject: Re: [Buildroot] minimum system/coreutils requirements (was:
 support/download: add blake2b-256 hash support)
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, James, All,

On 2026-06-18 16:04 +0200, Marcus Hoffmann spake thusly:
> On 6/18/26 07:51, yann.morin@orange.com wrote:
> > On 2026-06-17 11:42 -0600, James Hilliard spake thusly:
[--SNIP--]
> > b2sum was only introduced with coreutils 8.26, but we support running on
> > systems that have an older version: we already check that ln supports
> > --relative (introduced in 8.16) and that realpath exists (introduced in
> > 8.15).
> 
> Coreutils 8.26 was released almost 10 years ago, 8.15 was released
> (slightly) over 14 years ago. I wonder at what point we can assume that
> having a version with the required functionality is a given. 10 years is not
> thaaat long ago in lts distro terms, I suppose, but even debian
> old-old-stable has b2sum already. I also wonder if buildroot actually fully
> works on a 10 or 15 year old system. Without known users or actual automatic
> tests being run it feels kind of weird to assume it does.
> 
> Anyway, thoughts about this? Anyone got actual experience on running
> buildroot on these old systems? (I'm more on the side of running into
> breakage on the newest stuff on archlinux)

Thing is, either we clain we can run on such systems, and so we extend
the existing checks for those, or we don't claim so and we can drop the
tests.

But since we have the tests for ln --relative and realpath, we either
need to raise the requirement for coreutils on the host, or we also need
to test for b2sum. We can't test for ln -relative and realpath on one
hand, but not for b2sum on the other.

[--SNIP--]
> It's not super great though because if someone where to add a blake2b hash
> for a non-python package which then someone would try to build on an old
> distro it would still break, I think?

Sure, but then it would be a bug in Buildroot; as I said, a package that
adds a blake2 hash would have to have a dependency on
BR2_COREUTILS_HOST_DEPENDENCY.

Unless of course we decide to raise the bar to require at least
coreutils 8.26 or later... But since this is not currently the case, I
think it is easier to also check for b2sum for now...

> I guess I'd mostly like to know if this complexity is actually worth it and
> if we would want to at least define a minimum supported coreutils version
> which we could bump at some point to get rid of these checks again.
> Opinions?

Some people did complain in 2019-or-such that they were still running
with system dating from before 8.15 (released 2012, 7 years before), so
had issues with ln --relative and/or realpath. That makes for 14-year
old systems today; even entreprise-grade distros that are that old and
still in maintenance are few: RHEL 6, released 2011, got EOLed in 2024,
while RHEL 7 was released 2014 and will get EOLed in 2028...

In any case I was just pointing to a discrepancy betweeni how we handle
various tools provided by coreutils... Whatever the eventual outcome, I
don't care much, as long as it is homogeneous.

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
