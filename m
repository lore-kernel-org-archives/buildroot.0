Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153AEC3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3D6F405F9;
	Sat, 20 Jul 2024 21:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46ZZ_0sQImCK; Sat, 20 Jul 2024 21:09:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D02E405BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D02E405BF;
	Sat, 20 Jul 2024 21:09:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 803A31BF868
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18DEC819BC
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bM0VfWVvBlR8 for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:09:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0723B81D3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0723B81D3A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0723B81D3A
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:09:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B48B240002;
 Sat, 20 Jul 2024 21:09:08 +0000 (UTC)
Date: Sat, 20 Jul 2024 23:09:07 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240720230907.169eea41@windsurf>
In-Reply-To: <20240719214118.261441-1-fontaine.fabrice@gmail.com>
References: <20240719214118.261441-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721509748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hKf+YRp1vdZHddDPlYe4vA2FFouaC8tnwcaW/ahL1Ew=;
 b=jJ0LPysyK2u7ajU5Z9eFLg+21+WkDS1K1LRYWvQNEI6lenE41qEbCuy/fs23ke7Nqf8UEI
 +aRGOt557w7mwjpwqsUYu8je72wpxC5SdE1EICV903RHhIxuiXYpbaBv9t9rsWjLvQzGU8
 2ot1RONc4/sR7SUuT9U+RF6VsG62vTHo3cLtNq7x7gC8f/ASrPTuE6ZvB6OXM9z9kH4Pcl
 TZug5hiXbRCWdqVOV+tL8bsQB/niPbtzWZefLLQUrCtwU2+XRrBsuiu0JnaITxumHLnuWc
 Oa7ob2xgIVLUDR3jab2dcXQ0doUq+6H9b3/9w8h4yNsV5B9wVX+4/Mhb9qZJ3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jJ0LPysy
Subject: Re: [Buildroot] [PATCH 1/1] package/libxslt: bump to version 1.1.42
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

On Fri, 19 Jul 2024 23:41:18 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://gitlab.gnome.org/GNOME/libxslt/-/blob/v1.1.42/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libxslt/libxslt.hash | 4 ++--
>  package/libxslt/libxslt.mk   | 2 +-
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
