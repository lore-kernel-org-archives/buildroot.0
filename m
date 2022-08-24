Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8D2C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 11:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66F128193E;
	Wed, 24 Aug 2022 11:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66F128193E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tmecn_71mfaS; Wed, 24 Aug 2022 11:16:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A09988175A;
	Wed, 24 Aug 2022 11:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A09988175A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 330691BF37A
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7E908175A
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7E908175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oBwhfmTn8k9e for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 11:16:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBBF78161D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBBF78161D
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 11:16:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 552351BF203;
 Wed, 24 Aug 2022 11:16:36 +0000 (UTC)
Date: Wed, 24 Aug 2022 13:16:35 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220824131635.4d911f32@windsurf>
In-Reply-To: <20220823212346.7415-1-fontaine.fabrice@gmail.com>
References: <20220823212346.7415-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661339796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ajA27ipxzRosaYe+vphyiR0w2n0A9B7poQomqBvHSlA=;
 b=eUDpi9u+B00AKLImm+caLkLzGL3LnXxjhgx67QLVRu8l8oG48zc3vZR4qIYBzecXoQatUZ
 SsZR+RRD+tMkkwhM5e92erPJbP5yjSRwNFiDKtA2zbH1XYAO91QxK4jga+1dPLPj5uAsVR
 sc3Xn1wBepGwRuOaWb4HPKO99r2KbUdee+TYwGxl/Z3emLhKm5TRsg/5JuVZgLkIhBw/pN
 d65azyX7/PXVcSpF44iUoAdyG7L5A5oHr9Ie/GrEzbMrQt4uyhOvmgtnisht4HZtZ0RwJ3
 U2nHUiN4vnsS+66BqwoxJk9sFn6vZijx+jWDN+z3WAE67dCJTYrIlr+H1vIHSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eUDpi9u+
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add aufs-util
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Aug 2022 23:23:46 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add a custom case to make sure that a random configuration with an empty
> version for aufs-util doesn't fail.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e242cf66a02983bcf6e95b37f8e458bd18aee683
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  utils/genrandconfig | 3 +++
>  1 file changed, 3 insertions(+)

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
