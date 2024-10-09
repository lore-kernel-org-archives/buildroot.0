Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BC5CEE350
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 21:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56F9981347;
	Wed,  9 Oct 2024 21:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cRw3IEZkFiGg; Wed,  9 Oct 2024 21:23:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6399681351
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6399681351;
	Wed,  9 Oct 2024 21:23:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 077481BF3D4
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 21:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E879E607DE
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 21:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eE4Tq-aE8DTZ for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 21:23:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C0C9860663
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0C9860663
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0C9860663
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 21:23:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31404FF802;
 Wed,  9 Oct 2024 21:23:05 +0000 (UTC)
Date: Wed, 9 Oct 2024 23:23:04 +0200
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20241009232304.71ef7b41@windsurf>
In-Reply-To: <20241009113410.5077-1-tianyuanhao3@163.com>
References: <20241009113410.5077-1-tianyuanhao3@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728508986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GsdETXesfynJxR1u1VKxcJTuUJBju9f3517Vke9MAM0=;
 b=j7q4+NlEmndrMuQuPkj7gTc+JjKOJbATGOSbuDg4bWK7YaWzpW0SQekJA0fYwpt9GG9Y9G
 BrcNy6xu2VSoBPz0FOcl1HakpM53W7u+nI37ENpBbwgC5shkQTpL/AF8jZeVOwbDY63JaZ
 I3YVQx/VyrHrR0TtT8NfKY6Bmmye41GABMxygJ6zdKTF5yEGAqplFd0Sw/2aL2KZhTzhfM
 +YmFx72DpMKOfUZMHH5LG2nwACAP/I5S3I3wRVmOoqPZxE1r5b96A8PnTUL7P8d6Xu3pS3
 Vb+zKoSqPwc2OiRAX3lioAZQUiaGpe38xVVIO9xXUSOe+73JY96UVGxhZNdnpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j7q4+NlE
Subject: Re: [Buildroot] [PATCH 1/1] package/gnutls: add patch to fix build
 failure
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

Hello,

On Wed,  9 Oct 2024 04:34:10 -0700
TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> This patch needs to be applied before [1], otherwise it will cause the
> following build failure:

Could you then send both patches in a series?

> diff --git a/package/gnutls/0001-Fix-HAVE_LIBBROTLI_TRUE-and-HAVE_LIBZSTD_TRUE-value.patch b/package/gnutls/0001-Fix-HAVE_LIBBROTLI_TRUE-and-HAVE_LIBZSTD_TRUE-value.patch
> new file mode 100644
> index 0000000000..b389e387e4
> --- /dev/null
> +++ b/package/gnutls/0001-Fix-HAVE_LIBBROTLI_TRUE-and-HAVE_LIBZSTD_TRUE-value.patch
> @@ -0,0 +1,32 @@
> +Fix HAVE_LIBBROTLI_TRUE and HAVE_LIBZSTD_TRUE value
> +
> +"with_libbrotlienc", "with_libbrotlidec" and "with_libzstd" may be
> +empty, which is equivalent to "no".
> +
> +Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

If you run "make check-package", this should give you a warning that
you don't have an Upstream: tag. Has this patch been submitted
upstream? If not, you should do it. If yes, you should include an
Upstream: tag with a link to the upstream submission.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
