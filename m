Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1A6C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 987B06FB0C;
	Sun, 18 Sep 2022 10:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 987B06FB0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZwZvqgcWRESO; Sun, 18 Sep 2022 10:20:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6F9160E2E;
	Sun, 18 Sep 2022 10:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6F9160E2E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3672E1BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5629421E3
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5629421E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r9Dexflp3beq for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:20:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA5CC41BE7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA5CC41BE7
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:20:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9650A40002;
 Sun, 18 Sep 2022 10:20:46 +0000 (UTC)
Date: Sun, 18 Sep 2022 12:20:45 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220918122045.2a7710f6@windsurf>
In-Reply-To: <20220828195445.3354590-1-yann.morin.1998@free.fr>
References: <20220828195445.3354590-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663496446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hK/NFQeOef1hCTyymnF0svL0srm1x+Els5bJsEHoa8A=;
 b=I5x326bv2Yqu0hwt7apOILmXWfpi7LndCITw8YqCWa0MU3c00i63P0LqCnq/I/lEbKwAuf
 Hn+K6PcoVYauQtX9c48KnOnMyAJbk+x5OpQ2uN53B3pLTn/0m9VT4rP7VPN8e5O5WG79ym
 lmxZI1gY7S8zCyGqrM5lUSVrKIXmMlT142S/HtewcCPPvlpiYlWfhymrcUoUFdWCkDwJ0T
 9aL4B52AfBDaJbM9hn3UK4LplNCtZPBzkwu/L5gvpJUNEDO33tWOW0zp+0xUfkqnR0hAWN
 2Qkqf81Ls8T6UFmv7TRTkfmsK2IxhVyF22JZNVGYT8Y1DOb06HEkv/FLd+iBpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I5x326bv
Subject: Re: [Buildroot] [PATCH] package/mbedtls: use pre-configure,
 not post-patch, hooks to configure
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 28 Aug 2022 21:54:45 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Currently, we use post-patch hooks to apply our configuration settings.
> This works, but this is semantically wrong; post-patch hooks are there
> to amend the source code to actually fix it (i.e. because it can't be
> done with a patch for example).
> 
> Configuring the package, on the other hand, belong to the configure
> step, and if we need to tweak the source code for configuration
> purposes, this should be done in pre-configure hooks.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mbedtls/mbedtls.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

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
