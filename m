Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829E3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 21:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 080F040BFA;
	Wed, 13 Apr 2022 21:02:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9F7ocrbZZb0E; Wed, 13 Apr 2022 21:01:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28718403AA;
	Wed, 13 Apr 2022 21:01:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 084F51BF38D
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 21:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E857F40348
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 21:01:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dg9ey0VGNj5R for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 21:01:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 940A34030A
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 21:01:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 17D75FF802;
 Wed, 13 Apr 2022 21:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649883711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ROxKduQ0PJwrKEHjCXIrU+zopznFUVAjWcyxHinUO+M=;
 b=fZ979C/Wt34TFGLYfEDp/K8D9ZW5cOc/qJXkmF7lz/PqQ/qCStKQqt65mXoj/9pJhI7NaI
 mWNVO/QeN62GeMZ8LdwnX07HcjJ3pTDIP4Fi18/6Is3PfUwcoC+lJO7Qk1IsCLMzjY6xW6
 QO3AWMeNCnaI07BLHiQDhu81F82X53kOEv5u1LAy90B5qlh/KGcbR8H+hwcgPobrOyM1MZ
 8ySYDs5LgMJSlBo6q0nOLeeo2VaC4Xjh4Zdni9VSw6McUfwjc3fgR/2QODA0SRovaMXTD3
 Ps6rKd8HwmVGarU4BvpUes8IG2Mf/9sYcs+PGuxOYGsp76cvTxBSEqSiyQ1wcA==
Date: Wed, 13 Apr 2022 23:01:50 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220413230150.55deab70@windsurf>
In-Reply-To: <20220410043227.602485-1-james.hilliard1@gmail.com>
References: <20220410043227.602485-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/2] scripts/autobuild-run: fix and
 default to python3
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

On Sat,  9 Apr 2022 22:32:26 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  scripts/autobuild-run | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to buildroot-test, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
