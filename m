Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A888CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65F1C605CA;
	Wed, 10 Apr 2024 21:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FiWoXSz02M7o; Wed, 10 Apr 2024 21:12:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A17560E8D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A17560E8D;
	Wed, 10 Apr 2024 21:12:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C4931BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28DF260E8D
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YmPA77VsHqp8 for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:12:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DFCD4605CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFCD4605CA
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFCD4605CA
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:12:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31E7CFF805;
 Wed, 10 Apr 2024 21:12:34 +0000 (UTC)
Date: Wed, 10 Apr 2024 23:12:33 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240410231233.534e2599@windsurf>
In-Reply-To: <20240330090336.567660-1-fontaine.fabrice@gmail.com>
References: <20240330090336.567660-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712783554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QAwenq2KjNPpM3znxoj9OIgY4tV+PvPR4au02Je9V0A=;
 b=pYm+hzaMduubH5UdOmKZr9IHxKhex3I0SmGk4rom9nx3aNpYL/bt4Y7PGrDDme2u8kKA3E
 Rdv6j9eIefDEWsaO6rRlfQx3n3lr7mlXV1l3LEDQaxibR4zux/PpmXBY5thikNOXoxIGU6
 pBCVDLtVZXBuI7003HGPWnuIncgixpVJIsQVU6q6tb8pflgISoN36F4u69UwjDduUjixZN
 JqMhrdFG6xOsAeZ6UeMFbRfk1lW+o6R8BUrlyLOPym8/OsMfjs0s/I327rbYnM8Ist8yPp
 GeDYsc30eSqnKPOL2cZomrOuMXCh1Wt7a2/xzWTogeGun+jamTMbEDrR72tr0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pYm+hzaM
Subject: Re: [Buildroot] [PATCH v2,
 1/3] package/php-xdebug: drop unrecognized variable
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

On Sat, 30 Mar 2024 10:03:34 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> --with-xdebug is not recognized since the addition of the package in
> commit 7b7dffd0984e1b274273f5638a975165606384f9:
> 
> configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --enable-ipv6, --disable-nls, --with-xdebug
> 
> Fixes: 7b7dffd0984e1b274273f5638a975165606384f9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/php-xdebug/php-xdebug.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Series applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
