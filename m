Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B39E77188
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 09:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ABD583918;
	Fri, 10 Jan 2025 09:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UMDc6eYwGm7; Fri, 10 Jan 2025 09:41:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEB7983925
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEB7983925;
	Fri, 10 Jan 2025 09:41:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D461D942
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 09:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B52934091C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 09:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZT3K4tGTEDYJ for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 09:41:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 75DED4091A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75DED4091A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75DED4091A
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 09:41:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 306E940007;
 Fri, 10 Jan 2025 09:41:35 +0000 (UTC)
Date: Fri, 10 Jan 2025 10:41:34 +0100
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20250110104134.7638d728@windsurf>
In-Reply-To: <20250106043927.154476-1-nemaakhilesh@gmail.com>
References: <20250106043927.154476-1-nemaakhilesh@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736502095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJ+dEBhYlwMjYMiENgGs0weIoA8zsg4KNqmgBDqLyV8=;
 b=oKhMxccJZ1bx94vv5dmaaO1S3UFHA0nZbahNP1xB5lnzdhiaujz5HwZ1l36LjH3mBrqAIn
 Vajh8RC+yzGhr1EutPZQwjn/VQW69+X/YPeewnRHJ6a6vpojai4n+KgOAlMIxiAdlCm05L
 A6i2Dek67jjLHssU4I8TBHwMvt44PlfxF1CVehKd9eXGJJdNGVrOl1zrkvt+p8kEo4U3W4
 VyiulwoVXFjnODi2HHwfJiWlYma4TTxBTkZQ02WKPn1Eeh1sBv2fZSJhi89Ln9DV5hKxIN
 iigMzmGY79yEyDPeO/Tlo+fvQDAItXQljkwgRreXrdBcRKG4K9q6b4cyfeALtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oKhMxccJ
Subject: Re: [Buildroot] [PATCH 1/1] package/msmtp: bump version to 1.8.27
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

On Sun,  5 Jan 2025 20:39:27 -0800
Akhilesh Nema <nemaakhilesh@gmail.com> wrote:

> Release notes - https://marlam.de/msmtp/news/msmtp-1-8-27/
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> ---
>  package/msmtp/msmtp.hash | 4 ++--
>  package/msmtp/msmtp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks for your version bump!

However, it seems like it is causing quite a few build failures in our
autobuilders:

  http://autobuild.buildroot.net/?reason=msmtp-1.8.27

Could you have a look and send a fix?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
