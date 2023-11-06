Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D7AC4167D
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD7EC410C6;
	Mon,  6 Nov 2023 22:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD7EC410C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N6VYFZgR3Zqm; Mon,  6 Nov 2023 22:09:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E276D415FB;
	Mon,  6 Nov 2023 22:09:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E276D415FB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4BD81BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E8B681FC6
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E8B681FC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLM885UjN5zL for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:08:22 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8CBE824CE
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8CBE824CE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0EE6560002;
 Mon,  6 Nov 2023 22:08:19 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:08:19 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231106230819.47de147e@windsurf>
In-Reply-To: <20231104224820.374897-1-fontaine.fabrice@gmail.com>
References: <20231104224820.374897-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699308500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i3lcmm9lz+IPDfnYVPd0PCAy9mfZVuqqm90leDj1KhY=;
 b=U8G0Doo6C+IHzUDw1PJ9xeW6sA5LZ+jqsDE6ef36PJb2KbDYDCpszVsAAunP+54GQG592Z
 TsFBJ/BR/1NoW2cpRoxBOf34wKWNkNwpA/TGYti6NY6+P6pulQ0PEV75EcK02JVqJdv0qG
 R9VtT0aQwZtLRX/YQKk0maR6RLgbZKz2Kd0skM23jISEsgL8viZQbkZfiW+pTjNrayfMg4
 rpKsWyAMWtqcf9ykP+WTwsbns8NMdvIvHL8jL/8RtDEbEdGRKNr/Vo9IKG/Gk2z3WxwEHZ
 R4AesgBA9D4mhS9CpUCcdC1I7bLDh+uyyttmPWUa8Esil6ojE5biU/rDQxg0VA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U8G0Doo6
Subject: Re: [Buildroot] [PATCH 1/2] package/freeradius-server: fix python
 handling
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
Cc: David GOUARIN <dgouarin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 23:48:19 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> python handling is wrong since the addition of the package in commit
> 736c4c1655d93652a9a7e79235bbe726b3d46176 so disable python(2) and enable
> python3 if needed
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/freeradius-server/freeradius-server.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
