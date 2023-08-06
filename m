Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6550CC001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1216441296;
	Sun,  6 Aug 2023 14:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1216441296
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hKUw65gbc6T4; Sun,  6 Aug 2023 14:29:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1B7441477;
	Sun,  6 Aug 2023 14:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1B7441477
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 184411BF97A
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2318E4035D
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2318E4035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UVwlewaN2gpL for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:28:22 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 175FD401D8
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 175FD401D8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FCAB240004;
 Sun,  6 Aug 2023 14:28:20 +0000 (UTC)
Date: Sun, 6 Aug 2023 16:28:19 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20230806162819.0859d51c@windsurf>
In-Reply-To: <20230729212159.403148-1-thomas.petazzoni@bootlin.com>
References: <20230729212159.403148-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691332100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bP+UPuG9CIGLrebc9XjdIs/DcAN5oX3G5iXzGMZM6fU=;
 b=S3YI1eP+FjAKTozUtejHW2/Lal+b5ywChMZ4cxlCchGY61dFFSqIK97Xo3NKnXvpqaUWRM
 zRgB/2ZJNdXsDfr/4DHctkpfJKhy1EH8CSs4If7GSoQHo50CTFNwvnKgaFJIk4QWSNC2UN
 TISf9GSDIaRssuS33Bu5QquIFV/3qDpHmT8U9rGIDw5mRH1tl/RZF4bkxnRPIBjQYxnmUj
 /NjqKwdPCtRMb5FtyN6qXMVSgYJaV3TPY8V+ZPkiKMNIvVThppbodPkvF+c2ZGHPmI/686
 NZZZU1zkr3Jv7PaWlBU4J1jS4K0MRS4AGsAVIkaKqH2bEoqsDs8DZexoc1H7JA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S3YI1eP+
Subject: Re: [Buildroot] [PATCH] package/crun: allow building with uClibc
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
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 29 Jul 2023 23:21:58 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> uClibc now provides fexecve(), so crun can build just fine with
> uClibc. However, argp-standalone is needed, just like it was needed
> for musl.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/crun/Config.in | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
