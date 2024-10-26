Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27362D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91B44401ED;
	Sat, 26 Oct 2024 20:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_gt0ck1LED1; Sat, 26 Oct 2024 20:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35FCD40111
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35FCD40111;
	Sat, 26 Oct 2024 20:13:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B4C95C53
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 694934012D
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLWt2fai5NF9 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:13:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C0D6840111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0D6840111
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0D6840111
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:13:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F14BA240003;
 Sat, 26 Oct 2024 20:13:48 +0000 (UTC)
Date: Sat, 26 Oct 2024 22:13:47 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20241026221347.22f27cad@windsurf>
In-Reply-To: <20240924090756.735949-1-giulio.benetti@benettiengineering.com>
References: <20240924090756.735949-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729973629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5pxAGWjw3wi7r4YCbtgs5zYjtvgetzSsp466VsLgWiU=;
 b=NiYFieOLgjbE8hQWTuAyy5Xsxu/tmdexGorUAx8eDeT15oA29LzWipXTvk7vO+4AIzM6dJ
 XzSgEkEWEl8wsWA136GZoIP1eu1TQ7FgpK7lWWAKDedPFZEeu1ywKBbVoSAAczttueIm5e
 +XlCUE/dDZ2sMykemHqdFaq4UgQnPFZ7gPwmUydcsyAsXH83fkS7KriCSsrrGR6bstI6Yt
 WpNJk+FBetJcxsTCBGYHuyaDOvIN40n13uXwpegptgJDz/ZWmDt5O6BiObyiT2DuDAjMD5
 +BSiFKbd34Ta/vQm6CSiHbvUXQjvtsRjHnXWTt88qXcurDW+LI1oxyqLR0OZwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NiYFieOL
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.7.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Tue, 24 Sep 2024 11:07:56 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> * add libxml2 dependency that is now mandatory
> * drop 2 local patches that have been committed.
> * add 2 patches committed upstream to fix musl build failure.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...-reexport-.c-Re-add-missing-includes.patch | 44 ----------------
>  ...de-junction.h-Define-macros-for-musl.patch | 51 +++++++++++++++++++
>  ...d_sqlite.c-Add-missing-sys-syscall.h.patch | 31 -----------
>  ...rt-junction-path.c-Fix-buld-for-musl.patch | 40 +++++++++++++++
>  package/nfs-utils/Config.in                   |  1 +
>  package/nfs-utils/nfs-utils.hash              |  4 +-
>  package/nfs-utils/nfs-utils.mk                |  6 +--
>  7 files changed, 97 insertions(+), 80 deletions(-)
>  delete mode 100644 package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch
>  create mode 100644 package/nfs-utils/0001-support-include-junction.h-Define-macros-for-musl.patch
>  delete mode 100644 package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch
>  create mode 100644 package/nfs-utils/0002-support-junction-path.c-Fix-buld-for-musl.patch

Thanks for your patch. However, as far as I can see, libxml2 is not a
mandatory dependency, you only need it when --enable-junctions (which
is now the default). But I believe we should keep it optional in
Buildroot for the target package (which a sub-option in Config.in), and
simply disable junctions for the host package.

Also, your patches have PATCH 1/2 and PATCH 2/2, so they will cause
some check-package warnings.

Could you rework/adjust?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
