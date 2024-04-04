Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5151BCD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 09:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED7E740102;
	Thu,  4 Apr 2024 09:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwFExJ-3KLEx; Thu,  4 Apr 2024 09:35:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFA4F4038B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFA4F4038B;
	Thu,  4 Apr 2024 09:35:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 943811BF3D5
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 09:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D8674038B
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 09:35:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vlhxINBUDbm9 for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 09:35:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 22F6240102
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22F6240102
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22F6240102
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 09:35:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3BFD60004;
 Thu,  4 Apr 2024 09:34:58 +0000 (UTC)
Date: Thu, 4 Apr 2024 11:34:58 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240404113458.1edcb9ba@windsurf>
In-Reply-To: <Zgp_stk6lBnJJSUZ@landeda>
References: <20240206225928.2290100-1-thomas.petazzoni@bootlin.com>
 <d486cffd-3faa-465a-a966-08809329c87f@bubu1.eu>
 <Zgp_stk6lBnJJSUZ@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712223299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTyPpypiWM8pxDa1G0pm/oROKd8hwh3sDsphegmljAY=;
 b=Qn9DOWgYAnkF8HDUwmIgxNQztUd91RIQGBXTsaQM4KGDEiyMaslH36HZWzSFkSLq/j5g5L
 aEJUUhOtKaHpluEJ4xjGubOfqpDSgoFyWxhlsMMHjYO6vrPs5Fw7YhaxutV81WUGFXF0WG
 f4IwARJeJ+9kdPrgwMb4LOJ1ukhl3PQFexyr8/ZfyM9QkO5QIw6/zYU1JZ7vlidgchbqHw
 eVdz1CabqEHzsneVA8NgQVVroQxfbBtXd1p759TE8t8wRAKm5VPHkyLYoqcrLH2QEYYe6E
 lkt+nEwfSTfjYyt4llK996GCnbygQX5vFVu45klZ54BVzpsgNz30eqyUHbItvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Qn9DOWgY
Subject: Re: [Buildroot] [PATCH] package/python3: add option to disable
 ensurepip
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 1 Apr 2024 11:34:42 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2024-02-07 10:58 +0100, Marcus Hoffmann via buildroot spake thusly:
> > On 06.02.24 23:59, Thomas Petazzoni via buildroot wrote:  
> > > This module takes 2.1 MB and is not needed in most Python
> > > installations.  
> > Thanks a lot for this patch after my suggestion! Patch looks good, but given
> > the unfortunate "non-cooperative upstream", I still wonder if this wouldn't
> > be easier to maintain if we just remove the installed module after the fact
> > with a post install hook? I suppose a similar thing could be done for the
> > other optional modules as well with the new py_cv_module_XYZ, which disables
> > the native part but still requires patching makefile/configure.ac for not
> > installing the python lib part.  
> 
> I agree: it would be better to remove that as a post-install hook.
> 
> Patch markes as changes-requested.

Thing is that we do it differently for every other optional feature.
While I appreciate the non-cooperative nature of the Python upstream
community, I still think we should be doing things in a consistent way,
and how we're doing things today for other optional Python features is
using configure.ac/Makefile patching.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
