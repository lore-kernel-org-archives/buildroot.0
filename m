Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61395C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 09:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E370240925;
	Tue,  7 Feb 2023 09:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E370240925
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tMBEoCp23C-7; Tue,  7 Feb 2023 09:21:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD8AA404EE;
	Tue,  7 Feb 2023 09:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD8AA404EE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D92D81BF2C2
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 09:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFD73813B9
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 09:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFD73813B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f3XUoEv7jZ49 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 09:21:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89878813B3
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89878813B3
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 09:21:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1802D1C0008;
 Tue,  7 Feb 2023 09:21:48 +0000 (UTC)
Date: Tue, 7 Feb 2023 10:21:48 +0100
To: Markus Mayer via buildroot <buildroot@buildroot.org>
Message-ID: <20230207102148.28d2ed73@windsurf>
In-Reply-To: <20220624221901.514921-1-mmayer@broadcom.com>
References: <20220624221901.514921-1-mmayer@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675761709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30YRfoQ8ao0j9aUvDnqWButN0r1Pri4Hh4GfENPpFfs=;
 b=mM2VEti/J/V1M6a9ZEg++DXZXQP8McUNDWqumQwKJ233p0pGE/sKbVMx/9lFCOjspcii7/
 72ILqhhWJhSWojDQPLOQX7S9IBQUAz4WKLwgTy+OhBWioqq46iJdDKmTP7zWuK+l1XnIHp
 l3Tn4e+6nrtGR987pBhv5fN8WyQA5IIB+Qx67nu8pBtryU5KCrUEZtsS+CQitwWM3CXPsx
 6MWJ0GlO8eAzzoSoHTjeQkiwpvDjPxodbVSGKshhQzvvlBiCCj1ox7flRsby+k6LOYue45
 xA/ZLmKixKJExTFrKbyq5xgQVVFR88p/ke/62l8D3+EgS0f+EkWE1CkEiPs3mA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mM2VEti/
Subject: Re: [Buildroot] [PATCH] toolchain-external: handle case of dangling
 symlink
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
Cc: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 24 Jun 2022 15:19:01 -0700
Markus Mayer via buildroot <buildroot@buildroot.org> wrote:

> copy_toolchain_lib_root was not handling the case of "readlink"
> returning nothing, which will happen if the symlink it is trying to
> resolve does not point to a valid file on the build host. This
> shouldn't happen, but it can.
> 
> The end result of this situation would be an endless loop of error
> messages that would only end if aborted manually.
> 
>     [...]
>     cp: missing destination file operand after
>     '/local/users/mmayer/buildroot/output/arm64/target//'
>     Try 'cp --help' for more information.
>     readlink: missing operand
>     Try 'readlink --help' for more information.
>     basename: missing operand
>     Try 'basename --help' for more information.
>     dirname: missing operand
>     Try 'dirname --help' for more information.
>     ^C
>     make[1]: *** [package/pkg-generic.mk:384:
> 
> Instead of looping endlessly without explanation, let's abort and
> inform the user that something seems amiss with their setup.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  toolchain/helpers.mk | 5 +++++
>  1 file changed, 5 insertions(+)

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
