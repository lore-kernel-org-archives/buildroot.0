Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB93C3DA61
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 07:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6316E80D58;
	Tue, 30 Jul 2024 07:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnz4IR-YtbdH; Tue, 30 Jul 2024 07:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58C6C812EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58C6C812EC;
	Tue, 30 Jul 2024 07:35:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C302A1BF360
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB04B812D8
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qf76qLk3qNVE for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 07:35:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A88FE80ECC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A88FE80ECC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A88FE80ECC
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 07:35:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBBB31BF20C;
 Tue, 30 Jul 2024 07:35:39 +0000 (UTC)
Date: Tue, 30 Jul 2024 09:35:39 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20240730093539.4364ccf5@windsurf>
In-Reply-To: <20240719205802.2095144-1-thomas.petazzoni@bootlin.com>
References: <20240719205802.2095144-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722324940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fCSkOK2YGzb0Gz386f+kr0F3b2vyj5h5iQIgNy3GkIk=;
 b=doq1mmA0sWGke263ehz71Vi431Cq41yB4ZSVPl4c3QiHoFdpfaGbP7gjD1vahTU2N4PNl/
 EubNlx1jOp16qg/HJ7xPhffHXnd8uAQYCVI7/zN8KMSnniIwNo69BM1lq0gccBv/Zb5i/2
 jEN0VevLS/P/ICZGsF1UMkv3B+22F5Ssp3okiHheB8AzlvlE3ANBrLvCiPba6lI2Pk/n36
 Pzr/KSua0dZUv3ByME+62Wb4f+1UZgarbU9EFaxIIFhmUFYJBvklybLsCPjVemKL+pHWl7
 pxgGecdBb5G94mRSVCEKvWVHoCt66O7ScL7LLoZDk4tiOwt3ftj5gawnnE+tEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=doq1mmA0
Subject: Re: [Buildroot] [PATCH] arch/Config.in.x86: drop knightslanding and
 knightsmill archs
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 19 Jul 2024 22:58:01 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> According to the GCC 14.x release notes at
> https://gcc.gnu.org/gcc-14/changes.html:
> 
>   Xeon Phi CPUs support (a.k.a. Knight Landing and Knight Mill) are
>   marked as deprecated. GCC will emit a warning when using the
>   -mavx5124fmaps, -mavx5124vnniw, -mavx512er, -mavx512pf,
>   -mprefetchwt1, -march=knl, -march=knm, -mtune=knl or -mtune=knm
>   compiler switches. Support will be removed in GCC 15.
> 
> Using those architectures already emits warnings, which when treated
> as errors cause build failures, such as:
> 
>   cc1: error: '-march=knm' support will be removed in GCC 15 [-Werror=deprecated]
>   cc1: all warnings being treated as errors
> 
> Therefore, let's drop support for those two architectures, which are
> anyway not common at all, especially in the embedded space.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/ce98c41b22212f52bf7b53d84871b8e03409dbca/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  Config.in.legacy   | 14 ++++++++++++++
>  arch/Config.in.x86 | 26 --------------------------
>  2 files changed, 14 insertions(+), 26 deletions(-)

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
