Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E745C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 22:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AF0860F8D;
	Sat,  6 Aug 2022 22:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AF0860F8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCVV8-kvvvXa; Sat,  6 Aug 2022 22:21:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E230560F85;
	Sat,  6 Aug 2022 22:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E230560F85
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C97791BF580
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95EB841761
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95EB841761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KYnTOKCAASFm for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 22:21:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1C9341733
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1C9341733
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 22:21:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E8A94240005;
 Sat,  6 Aug 2022 22:21:24 +0000 (UTC)
Date: Sun, 7 Aug 2022 00:21:23 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220807002123.6ad5ef3b@windsurf>
In-Reply-To: <20220806153651.4013424-1-giulio.benetti@benettiengineering.com>
References: <20220806153651.4013424-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659824485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hGJv1s1D5NPOVqdWZMF/7WR7+h2QZkn2d577FL+7P40=;
 b=AGx3RZ97T6JTGBJgBCIOlmpMHfkzuqSlIyjbOALLfLo4Fo52i/huAbpNfl6VuT9tvJcDkA
 NEYpinGxXgLOjTLjrdH+PuYpYSvVplnmnCOSslgENHCAnrdpGXPNFTdrQjghfH6DCa3kfS
 rLUeWDRcJvJjIDIFSxh/ONJUk1i8fh3cpjr5zG92+mNOXVAIh4ukIItrSTzvHYRhirG2l9
 QAYlmJY5p6ZkZjgxhdCpVEKtnJ73bpxw13aU2mD830z0Xak2dlj3F3SXAFqTfs+OcLVx15
 R/8ya2dV201ozy7USo1ifR6bmavMGGAga376vhDcIvZr6bzsaFedz/lhfyNhng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AGx3RZ97
Subject: Re: [Buildroot] [PATCH] package/libnss: fix build failure due to
 missing missing libnspr in link list
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  6 Aug 2022 17:36:51 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> FREEBL_NO_DEPEND is usually set to 1 and this means that:
> ```
> build libfreebl3.so with no NSPR and libnssutil3.so dependencies by
> default
> ```
> But PR_SetError() and other PR_*() APIs are contained right in
> NSPR(libnspr) that we already build and it's a libnss dependency, so let's
> make libnss to link with libnspr by default by setting FREEBL_NO_DEPEND to
> 0.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c5b440bae5cd6dc6d5f1a632a6b5950b32d13f66/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thanks for the debugging, but I have to say I am not convinced by the
explanation. Why is FREEBL_NO_DEPEND=1 the default if it doesn't work?
Why was it working before, and what broke it?

Setting or not setting FREEBL_NO_DEPEND has impact in a lot of parts of
the libnss code, I don't think we should do this lightly.

Could you research more when this broke (i.e which version bump in
Buildroot), and then which commit in NSS causes this breakage? I don't
want to blindly set this obscure variable.

Has this issue been reported upstream?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
