Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57664EB64DD
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 08:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 035ED80BFB;
	Mon,  7 Aug 2023 08:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 035ED80BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5tG7owxvgt5q; Mon,  7 Aug 2023 08:15:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42CEA80C3C;
	Mon,  7 Aug 2023 08:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42CEA80C3C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 911A21BF852
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 08:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61BAF6100C
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 08:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61BAF6100C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 34XEX1pJx9fD for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 08:14:36 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20D8A60743
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 08:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20D8A60743
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D8A924000B;
 Mon,  7 Aug 2023 08:14:32 +0000 (UTC)
Date: Mon, 7 Aug 2023 10:14:31 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230807101431.40cb9d54@windsurf>
In-Reply-To: <ZNCiPEKIjPhDgxLN@waldemar-brodkorb.de>
References: <ZNCiPEKIjPhDgxLN@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691396073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=95tIz4QfKL4f5+fkcu4KvydG9qKEKg/apFjrALboSCE=;
 b=i03yEShymEfs1XiAi4VFJS1JLJrGNDcv5VpxvHET6k90zxW4qjUvCBGypMuu59H1yqG1O7
 f8AOuwT8mXToeeCbjE0AtFdULs40Hw0uG6ZjhsKPq0JzXiljXMZYQsBAVHTzgWIMppGZMl
 cysapWG7Vut/fHFlCgJpghE83wZGI/jOL69Ilv6elvWPuqQvY/R+n6uxGeIrtIUXJoVsCP
 F19i6aBOBxz3v9WDLok1mmSXRNRZ7YhK3wMznP3TiR82NNcpLWi2ORH+S1ev66KBb7Yhfl
 2viRLWSpBmuJ8j9KNZWyj8QSJmwK5zubPxdig4nXo5dFBTgNobNZjG/LygKzSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i03yEShy
Subject: Re: [Buildroot] [PATCH] package/elf2flt: handle more relocations
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

On Mon, 7 Aug 2023 09:50:20 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Fixes following autobuild failure:
> http://autobuild.buildroot.net/results/c16/c161f191d85f9d064626ee6fcfebea61d916e434/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...e-relocations-required-to-be-handled.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch
> 
> diff --git a/package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch b/package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch
> new file mode 100644
> index 0000000000..c619a1d068
> --- /dev/null
> +++ b/package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch
> @@ -0,0 +1,39 @@
> +From 5acfed0012f2fff9801b25403bd8a5e1c2ccfea2 Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Mon, 7 Aug 2023 09:30:34 +0200
> +Subject: [PATCH 8/8] riscv64: add more relocations required to be handled
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Thanks for the patch. However, it will raise at least two warnings from
"make check-package":

(1) Because it has 8/8, but we don't want such numbering in Buildroot patches

(2) Because it lacks an Upstream: tag

Could you address those details? Especially the Upstream: tag means we
expect this patch to have been submitted upstream.

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
