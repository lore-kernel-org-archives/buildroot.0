Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A7AC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A72594070F;
	Mon, 22 Jul 2024 12:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9LCbyfIRaxfD; Mon, 22 Jul 2024 12:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEA6F408BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEA6F408BF;
	Mon, 22 Jul 2024 12:06:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 068D81BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA56880C66
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ev5x_CC_fAxK for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:06:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C1B9E80C45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1B9E80C45
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1B9E80C45
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:06:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A354FF804;
 Mon, 22 Jul 2024 12:05:57 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:05:56 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240722140556.24233927@windsurf>
In-Reply-To: <20240722104859.1092677-1-fontaine.fabrice@gmail.com>
References: <20240722104859.1092677-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721649957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FiVvZPFiG310ZfiTfVSDs3su+7+Ug4jqXdlB3wTvSeM=;
 b=Qw2g0Hl7g4s06Kxbv0FqV/XD4eBOb6NiqYOVCQX8XzkUuO74IZYRMU4UgWw8/hQ3/pRxJt
 7sRgvPzDBWyrWzNbyooOlwVovXONc7MGlRZtfmQF9PSNdZN1JZ5B1hKAthUmF3AaoNc41A
 git5KP46WmlsuoIUOabxgvWW441OiZ0EIVYebVl9jzSJPJMZ5kZ0LFTmYsbZgsVVAXpr/w
 kYRLj+GBIGgQ61rkD88qpwZCFnSNqjO0Ois+YtaCG93aM3QiWHFp6cQAWQsVZlsZ4MDxxa
 6iZkJ66XSTyxeFZK1uGzLBwe4wJth/hjLJWrDY5o9Q7RYGcJ5nTpsgFu+bAUqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Qw2g0Hl7
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

Actually, wouldn't it make sense to modify the APR_CHECK_STRERROR_R_RC
test so that it doesn't need AC_TRY_RUN() ? I guess by building a
program that expects strerror_r() to return an int and see if it
compiles without errors (with -Werror), it should allow finding out if
strerror_r() returns an int or a char* without AC_TRY_RUN. This would
allow the test to work for cross-compilation, without having to
explicitly feed a ac_cv_strerror_r_rc_int value.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
