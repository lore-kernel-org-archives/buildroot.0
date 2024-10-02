Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00566CF8542
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAA4F413F6;
	Wed,  2 Oct 2024 21:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8Z9X68W3vVH; Wed,  2 Oct 2024 21:41:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E697413FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E697413FF;
	Wed,  2 Oct 2024 21:41:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 381861BF97E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33245413FF
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZipPjX-u69sI for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:41:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E6F5F413F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6F5F413F6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6F5F413F6
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:41:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD66860003;
 Wed,  2 Oct 2024 21:41:10 +0000 (UTC)
Date: Wed, 2 Oct 2024 23:41:10 +0200
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <20241002234110.60f688ed@windsurf>
In-Reply-To: <20240922184324.3469302-1-nemaakhilesh@gmail.com>
References: <20240922184324.3469302-1-nemaakhilesh@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727905270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NbAwhKMYPBGitkLfnO2QDUBodBM0au3MYN/A6+K0oCo=;
 b=kP1RWAEzA0BcQgJcadfF1TDPmI1t3dHJHqPyMYp83W9PH3SHl/2Kqio7STRh4pcP6nptzQ
 oSUqv/4/7EaZ9esBnCRhfNHVYHfI7G/FjOs9stQU2by2ntnDwOFPzmLVADl0RzvEcQ71fy
 yFXZnXU+BxjxWmyW5p+CRoUasfIR7fN95+KPpmaX5F6j0452fP3d+G3BfeUZa9gUgRBZtO
 xCOwc4DqaIkxYyIYeIwAABJat0wuX2KpoMfuBlAt2cvNPAKdMpSvBjo6QCZ0t7KgOJ8SXt
 2RMfcU567CZuXbSxa5Q2yd2A3vr5og1xc1Y0Pkbza4Q7xqmm6fnsoo4ZHv7wMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kP1RWAEz
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: bump version to 6.11
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

On Sun, 22 Sep 2024 11:43:24 -0700
Akhilesh Nema <nemaakhilesh@gmail.com> wrote:

> Changelog - https://github.com/strace/strace/releases/tag/v6.11
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> ---
>  package/strace/strace.hash | 4 ++--
>  package/strace/strace.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
