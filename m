Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06257C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 13:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B77BB810E8;
	Mon, 15 Jul 2024 13:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iu7JUbiCSBZk; Mon, 15 Jul 2024 13:07:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9B97810E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9B97810E4;
	Mon, 15 Jul 2024 13:07:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A06B1BF3BE
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 13:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA63140393
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 13:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqYD56iuH2oM for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 13:07:16 +0000 (UTC)
X-Greylist: delayed 474 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 15 Jul 2024 13:07:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 747A54035D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 747A54035D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 747A54035D
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 13:07:15 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0F7983536276; Mon, 15 Jul 2024 14:59:17 +0200 (CEST)
Date: Mon, 15 Jul 2024 14:59:17 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZpUdJSlXXfp3T/bg@waldemar-brodkorb.de>
References: <ZhuHcg6qHhbBCUCE@waldemar-brodkorb.de>
 <20240715144514.56030468@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240715144514.56030468@windsurf>
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1721048358; bh=7pjUzB8wmL1x34fNUPtxFkGlNJVfwdUgGXWwXNzLnw8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FVoNPKU+ytCUT2/Ltd5RylBuMk3VDaKXVRjoJbMyXW0sGDGjem31EvAjHzm4T2HJW
 oIBv1MuEKx1TkiWqfFlcPTNAqR+um3PGsU0oyxV53+Rl6pDLzaC3yz+58+jx2TwfAW
 8k7da87gz0BYtQ0mpBtrvqzg4GdOXr6I0kShBA6+ZwFIFYD30I50F1V59HoqgkTj78
 3t0SijbMMYrrf8j+g0U66woJUm/VKi1LX4so/25fwNKmSHk+xojgBKJ90Q73MOzy0O
 f+ubT03GUJw/+Iccsbw9M3oKxOg5J3rEIrlgk3ZoIDDy5+Et1e4fTReCw+nNddYy/W
 wnDsjUDWIYh5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=FVoNPKU+
Subject: Re: [Buildroot] [PATCH] package/uclibc: enable time64 support
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
Cc: Chin Huat Ang <chinhuat@gmail.com>,
 Dmitry Chestnykh <dm.chestnykh@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,
Thomas Petazzoni wrote,

> Hello Waldemar,
> 
> On Sun, 14 Apr 2024 09:36:18 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > uClibc-ng supports time64 since release 1.0.46.
> > This commit enables it by default.
> > It was discussed on the mailinglist and one suggestion was to
> > enable it by default without a config option inside buildroot.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> >  package/uclibc/uClibc-ng.config | 1 +
> >  1 file changed, 1 insertion(+)
> 
> My understanding is that since we've updated to 1.0.49, this is anyway
> the default, so this patch in fact isn't needed anymore, as we've
> already enabled 64-bit time_t on 32-bit archs with uClibc-ng since we
> bumped to 1.0.49. So I marked this patch as Rejected. Of course, let me
> know if I misunderstood the situation.

No, perfectly fine description of the situation.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
