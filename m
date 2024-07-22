Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F1DC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 881DB4025F;
	Mon, 22 Jul 2024 12:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id daagm9u0n2eQ; Mon, 22 Jul 2024 12:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37B66402A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37B66402A6;
	Mon, 22 Jul 2024 12:03:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 752011BF28C
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60D7E8100D
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lOXpQPFkqL-Y for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:02:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E4F2080F82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4F2080F82
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4F2080F82
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:02:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCAF01BF206;
 Mon, 22 Jul 2024 12:02:55 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:02:54 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240722140254.632fe259@windsurf>
In-Reply-To: <20240722104859.1092677-1-fontaine.fabrice@gmail.com>
References: <20240722104859.1092677-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721649776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yM0xn4/m7z4wxkGHttzXx1SfLYT6TFJVMIl7ZxFIZDQ=;
 b=aKEfyc8ry/EVvIXYXRGB++nrcwzCrYPXEK7lEIDSwt80KCPZyh6gdLCwlH0i3y8X86r7Xg
 vpYBRSKQ5pXh4Y1nzN0A61mEnAyq1W6XVhLnWZGZ8uCMkjdZGg70CsNhTBG2onNzJuYDv/
 qQJp3qLK+N3jNdF6USI4fxrpDQtUzLFQj9JBqiP4MoEn8sHSymxROgwFpkyKkFK4L0+aEK
 Ai8eJluqMlyWA0U3rirp9tvGnJddIOiC4VpLXBeinlXGG/6uE69GNrf9i8jxsWdt8rXhNE
 0PW7X7ajkGg40xEwvuAbDFbnKwM7vy5Vti4DSxZWXsaSvO/JrvavaaF5Huf4MA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aKEfyc8r
Subject: Re: [Buildroot] [PATCH 1/1] package/apr: fix musl build
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Jul 2024 12:48:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> strerror_r on musl always returns an int since its addition back in 2011
> with
> https://git.musl-libc.org/cgit/musl/commit/src/string/strerror_r.c?id=0b44a0315b47dd8eced9f3b7f31580cf14bbfc01
> 
> As a result, setting ac_cv_strerror_r_rc_int to no results in the
> following build failure since bump to version 1.7.2 in commit
> 783cd8d90d37b5e0b59d6f0bfca6667855b2b9e1:
> 
> misc/unix/errorcodes.c: In function 'native_strerror':
> misc/unix/errorcodes.c:385:9: error: assignment to 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>   385 |     msg = strerror_r(statcode, buf, bufsize);
>       |         ^
> 
> Fixes: 783cd8d90d37b5e0b59d6f0bfca6667855b2b9e1
>  - http://autobuild.buildroot.org/results/9a42a4427ff64d47da61c731abb99d7585781cdd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/apr/apr.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
