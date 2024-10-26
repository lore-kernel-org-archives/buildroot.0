Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D09D10BFD
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5340D400DB;
	Sat, 26 Oct 2024 14:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HmAsNJJobScL; Sat, 26 Oct 2024 14:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 406A04050B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 406A04050B;
	Sat, 26 Oct 2024 14:36:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E06D5C53
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 556F5401DD
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XmzVqy5LOYVy for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:36:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 22DFD40175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22DFD40175
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22DFD40175
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:36:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70EC660002;
 Sat, 26 Oct 2024 14:36:08 +0000 (UTC)
Date: Sat, 26 Oct 2024 16:36:07 +0200
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Kadambini Nema <kadambini.nema@gmail.com>
Message-ID: <20241026163607.1138fa04@windsurf>
In-Reply-To: <20240922024031.2620153-1-nemaakhilesh@gmail.com>
References: <20240922024031.2620153-1-nemaakhilesh@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729953368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjQy4kF3AOVqOkDAQMhoiINDlB4beMrd6f9t9l7rUjs=;
 b=Eh+Wd/0jPWMaeOs3w7BP6ymF2Pl9mIC3JgtNRNPsonX0OH7NHp1aJm2aHncLkVWwSXFS0S
 gOkkRf/BPmgx5w8AyoNDtTuIGxyOKJUJfUH847voPtjs8xyfJsJNklV5NmK9lWLa8HSsXa
 cwa3+L2bAA1bWhFWWvewtoxP3yw1PAl0NB4mm/QxzJSyPZz78GO5UpUMpI0BLrk8v9CNRm
 /tYLr0RAf/5eD6lXi7oYFFcOcsxWZLItVGsB2yG0FtQmr0hMr2SNZFpCwmPYbGWLXk3Xhc
 NiWMAPPbbFN1EdH9C0L7yEpdU/g66SJQuglGroN935yqOCHA4qQqlnbMtV5Rrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Eh+Wd/0j
Subject: Re: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.16
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

On Sat, 21 Sep 2024 19:40:31 -0700
Akhilesh Nema <nemaakhilesh@gmail.com> wrote:

> Changelog - https://github.com/pikvm/ustreamer/compare/v6.11...v6.16
> 
> Drop upstream patch 0001-src-libs-types.h-include-sys-types.h.patch.
> (https://github.com/pikvm/ustreamer/pull/273/commits/0ce1d6e1f61dfbebae35a9c3a8a77c69ee43a8b0)
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> ---
>  ...src-libs-types.h-include-sys-types.h.patch | 36 -------------------
>  package/ustreamer/ustreamer.hash              |  2 +-
>  package/ustreamer/ustreamer.mk                |  2 +-
>  3 files changed, 2 insertions(+), 38 deletions(-)
>  delete mode 100644 package/ustreamer/0001-src-libs-types.h-include-sys-types.h.patch

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
