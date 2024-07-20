Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932E7C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 634F24061E;
	Sat, 20 Jul 2024 21:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5IhZYEDzmI1T; Sat, 20 Jul 2024 21:10:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CB394060B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CB394060B;
	Sat, 20 Jul 2024 21:10:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 716DF1BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E9A040373
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4RNZkky-ARY0 for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:10:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0DE1940151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DE1940151
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DE1940151
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:10:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D43D360003;
 Sat, 20 Jul 2024 21:10:34 +0000 (UTC)
Date: Sat, 20 Jul 2024 23:10:34 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240720231034.65857cf6@windsurf>
In-Reply-To: <20240720095213.335126-1-fontaine.fabrice@gmail.com>
References: <20240720095213.335126-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721509835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NlszmiJ5lZZrlU1BXbliZQ0ogr5c+oAdg4KqvKSFpIs=;
 b=QVwBIs95YRT5UbfEvtaQadK+nqlAuaxZ2sA07w3v81Q6okbJhF2sgFfPt+aqUhiJ5FvPpa
 yeM/ZNmR7HvGDDW+muSdPLu4u6Z4/cwHPz85PETFwtzNP0mmlTwNCTObYYCEW/tg2wRbts
 hz+hVpAJLNKiEMdmOVbNp1ifxXDmaskWt4wXKHiWMkN09CK6Pf2r1wynJrtsz2ugmd0WW4
 qCrRwY7EjSg5vHeRXkaDnMj9KNtY0A6YSSlQB79aQAGdH34HLA7SKm1VgxJuwq6caX18fH
 orF0wuu0Mv8E2RT4/LMNlti5WLXP4LCmkqORpoCf4qWl+9wCJbaCk8Gx8X+o5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QVwBIs95
Subject: Re: [Buildroot] [PATCH 1/1] package/edid-decode: switch to
 meson-package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 20 Jul 2024 11:52:13 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Switch to meson-package to fix the following build failure raised since
> bump to 6f117a8 in commit 4f5790116b42768bd1bd982245e00483440a6311 and
> https://git.linuxtv.org/edid-decode.git/commit/?id=cdf81907def8658a66041a76ef2542e9a888cbed:
> 
> make[1]: *** No targets specified and no makefile found.  Stop.
> 
> Fixes: 4f5790116b42768bd1bd982245e00483440a6311
>  - http://autobuild.buildroot.org/results/c569b0484dcd33f6ea88a9b6f11df5b54401db96
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/edid-decode/edid-decode.mk | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)

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
