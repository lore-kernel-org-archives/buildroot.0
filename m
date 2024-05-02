Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F76BC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22D2B414C6;
	Thu,  2 May 2024 07:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aY2HrHUT5SU8; Thu,  2 May 2024 07:50:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF0C3415E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF0C3415E4;
	Thu,  2 May 2024 07:50:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A8CC61BF83C
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D752415A6
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkdBrPtRnd_O for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:49:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 03CFD4157F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03CFD4157F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03CFD4157F
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:49:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F05BFF802;
 Thu,  2 May 2024 07:49:46 +0000 (UTC)
Date: Thu, 2 May 2024 09:49:45 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240502094945.376cede4@windsurf>
In-Reply-To: <20240411210245.2128044-1-bernd@kuhls.net>
References: <20240411210245.2128044-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714636186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wck5Yz39wo0NDlxOb0Q43TwoNuSPKX0mNUYTvP0jj+o=;
 b=EQ5Y4LjgBh+lyd3Am7VbuYvJ1zKENAmIxBVqCimJwhHlNJ53B3L100DSui+WWZsLfhXPYi
 0sKqrZ6VXvsuUG0se9xkiUHI0NsDBA+HeTCaIHIZsp3AYwfmsHM3IBipaqIq1NYs/SS42K
 rfWfDVbGeWrHzzmAduI6eV76q6Eg1YGukBBCJ2vWKe0DkMPuREhHbXBF3UZqcguo+KP3i5
 ToTgXrWFysR7++bsi3CMr86RWa6sCAurO4OOv84GWdVrkhCZCgGQs6wCCrfLv0SpkmormZ
 fPvvCEagnl/Tyi+KEFSbmMNMmvnzNTYqWxD8z7MC6EN30G6pU8ZTvsI+heHmSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EQ5Y4Ljg
Subject: Re: [Buildroot] [PATCH] package/libpng: bump version to 1.6.43
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

On Thu, 11 Apr 2024 23:02:45 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://sourceforge.net/p/png-mng/mailman/message/58741099/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libpng/libpng.hash | 4 ++--
>  package/libpng/libpng.mk   | 2 +-
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
