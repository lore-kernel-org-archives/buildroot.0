Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC661CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66AC560008;
	Tue,  3 Sep 2024 19:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mf9W9Jx0UUbG; Tue,  3 Sep 2024 19:53:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67AA2600D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67AA2600D1;
	Tue,  3 Sep 2024 19:53:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D2761BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A27D4029B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTyp588HlZyI for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:53:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 064C4402A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 064C4402A1
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 064C4402A1
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:53:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52CC8FF802;
 Tue,  3 Sep 2024 19:53:09 +0000 (UTC)
Date: Tue, 3 Sep 2024 21:53:08 +0200
To: Mattia Narducci <mattianarducci1@gmail.com>
Message-ID: <20240903215308.27bb1d2c@windsurf>
In-Reply-To: <1913421.tdWV9SEqCh@localhost>
References: <1913421.tdWV9SEqCh@localhost>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725393189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FzJqVJKsGfADTC+/TNz7uB1Ce0lzYLY1gTIWfo8sjlY=;
 b=nA4YbUFNxc/U/Wat92i9Wr4k/2aahu+J28k2AFRgkeK+zyIklkgtqN5H2vd0r1uPmcdAYo
 oveO1LunBEsWd3wodofZrrX5jgIyL9C4Y0rQUpZNwH5X5ElhFS0T/NYtv9e5BWx/B+IHyn
 uATbrTp2VqNDQHgIWhLbcxVa26PuJOGNMMiVk+6FK/mk2Cfx/5g3iuMHZFOMKrN+fYZ+aF
 SLFsrNYFt0gU/teDAPpe0t7OqUaiSgVEarOFjHtFVEABE2KXp3U7n6IBTHI9rKUXCxoC8G
 zOAm16kMO69GIQAdjl2dsALsSHohVkbLmrFdncg6/1nBS69BavJpGQmNNILqCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nA4YbUFN
Subject: Re: [Buildroot] [PATCH 1/3] configs/pine64: bump U-Boot version to
 2024.07
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 01 Sep 2024 18:42:58 +0200
Mattia Narducci <mattianarducci1@gmail.com> wrote:

> Update U-Boot to fix the following error when building with
> python-setuptools >= 69, that is, since 6b62384e3d
> ("package/python-setuptools: bump to version 69.0.3"):
> 
>   packaging.version.InvalidVersion: Invalid version: 'u-boot-2019.01'
>   make[5]: *** [scripts/dtc/pylibfdt/Makefile:27: scripts/dtc/pylibfdt/_libfdt.so] Error 1
>   make[4]: *** [scripts/Makefile.build:434: scripts/dtc/pylibfdt] Error 2
>   make[4]: *** Waiting for unfinished jobs....
>   make[3]: *** [scripts/Makefile.build:434: scripts/dtc] Error 2
>   make[2]: *** [Makefile:508: scripts] Error 2
>   make[1]: *** [package/pkg-generic.mk:289: output/build/uboot-2019.01/.stamp_built] Error 2
>   make: *** [Makefile:83: _all] Error 2
> 
> Use SPL and U-Boot FIT image combined into u-boot-sunxi-with-spl.bin.
> 
> Do not use the optional System Control Processor (SCP) firmware pointing
> the SCP env variable to /dev/null.
> 
> Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
> ---
>  board/pine64/pine64/genimage.cfg | 12 +++---------
>  configs/pine64_defconfig         |  8 ++++----
>  2 files changed, 7 insertions(+), 13 deletions(-)

Series applied to next. However, if possible I'd like you to test/send
a follow-up patch.

>  	partition u-boot {
>  		in-partition-table = "no"
> -		image = "u-boot.itb"
> -		offset = 40K
> -		size = 1M # 1MB - 40KB
> +		image = "u-boot-sunxi-with-spl.bin"
> +		offset = 8K
> +		size = 1016K # 1MB - 8KB

Here this "size" field is a bit silly. We don't really care that the
size is 1016KB. What we care is that the offset is 8 KB, and that the
next partition is aligned on a good boundary.

So could you test something like:

  https://patchwork.ozlabs.org/project/buildroot/patch/tencent_92439641515553684D208B3331676FB36C05@qq.com/

instead?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
