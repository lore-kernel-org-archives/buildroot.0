Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C873BC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F2F742D9E;
	Fri, 10 May 2024 21:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ntNjhwUoDMh0; Fri, 10 May 2024 21:27:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB3A042C30
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB3A042C30;
	Fri, 10 May 2024 21:27:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5EF041BF36A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1831A42500
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DiRKyX9ljbRc for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:27:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E32A0424F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E32A0424F6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E32A0424F6
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:27:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07D29E0005;
 Fri, 10 May 2024 21:27:45 +0000 (UTC)
Date: Fri, 10 May 2024 23:27:45 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240510232745.538f6396@windsurf>
In-Reply-To: <20240324213605.769238-1-fontaine.fabrice@gmail.com>
References: <20240324213605.769238-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715376466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7GR56II7EIkL5f0+DG85hf97qJ5KlHIsEtacrFtie3s=;
 b=hGZWJpoXKnN0YdR7Dqi89GEDlBOQVXYLMvYbmIuqCsvYePXwoAWFDOFz9Q1Iha3JipeZeL
 jmVvL45Vhln//ye2ORJAVSZuGEOs1NwHEvdhMZDRzGSgsKczhxxj9kczokQuflzve2DkWq
 xe4cTBXuobIFbuSfD6egcfAVs3h/b3RzVW6b3AHdZDwZnTakSTp4hMySOfUi2zYgAQyaoV
 B6RA7FIaLe15qzkHzzla9dr1H54jXwjPBbRY2cqHhe+P6W3rLRVpCK7FgbM4rp7I6c0faG
 9T4Qwfo6+pFoljB7VaKrhqfKWjjS1EmNvY/37GQsauD21Q2+G9UMrIvwTP2J0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hGZWJpoX
Subject: Re: [Buildroot] [PATCH 1/1] package/dash: bump to version 0.5.12
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

On Sun, 24 Mar 2024 22:36:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://git.kernel.org/pub/scm/utils/dash/dash.git/tree/ChangeLog?h=v0.5.12
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dash/dash.hash | 4 ++--
>  package/dash/dash.mk   | 2 +-
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
