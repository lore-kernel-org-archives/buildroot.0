Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABA5EE4996
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E91841583;
	Sun, 20 Aug 2023 21:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E91841583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ohY92lvrnXnc; Sun, 20 Aug 2023 21:45:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57A0041591;
	Sun, 20 Aug 2023 21:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57A0041591
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 199CC1BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF05760BB3
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF05760BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3fjy912JZUPQ for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:45:26 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 195F160A6A
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 195F160A6A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E3CBC0003;
 Sun, 20 Aug 2023 21:45:22 +0000 (UTC)
Date: Sun, 20 Aug 2023 23:45:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230820234521.008e25e8@windsurf>
In-Reply-To: <20230820154041.3984862-1-bernd@kuhls.net>
References: <20230820154041.3984862-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692567923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=25pvA/dsoOwVsM/dqJbsa6XuVe48iSqO3PVFbf2sOGs=;
 b=Y/9zeZn4v13fU5BH7RtBnKuxic2swSAMoBOUfpOHx26yjlaQA/pFaxDA+EczxZ4iFjnk+J
 uEBYx/eMNV4ZjE87avIDYElZHQpklhk9lhrNsMMXUCon3Zb/kyKUrARMJYNcOOowC+SOns
 78EI9oWJR0NrCICFWxqD7z7QINJqsyO79ob2bWbtkwc5PctU33pl39sJq4dxQQg2RsFdz+
 VuGArp02kYymMJKsME28stazoUZQo/Vdwzx9FWtexJcMLVbcIw5UtTdKweakjo6L5DS6Zt
 MYj61MDBSjc81QikfmDO5tacMV5cmPGjNQtqRG9VcRWiNTrFcqIkO4yJhszhmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y/9zeZn4
Subject: Re: [Buildroot] [PATCH 1/1] package/shared-mime-info: link with
 -latomic if needed
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

On Sun, 20 Aug 2023 17:40:41 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Buildroot commit 3f9622fe3d85b4d9f734b879abc1d485afea19b2 added an
> optional dependency to libatomic for libglib2 which caused the build
> error fixed with this patch since glib-2.0.pc does not contain any
> information about libatomic.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d25/d2563ce649188cec2025e4fc6e58c4bbd98ff939/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/shared-mime-info/shared-mime-info.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
> index 9932bd2db0..a9713ee639 100644
> --- a/package/shared-mime-info/shared-mime-info.mk
> +++ b/package/shared-mime-info/shared-mime-info.mk
> @@ -25,6 +25,11 @@ SHARED_MIME_INFO_LICENSE_FILES = COPYING
>  HOST_SHARED_MIME_INFO_DEPENDENCIES = \
>  	host-pkgconf host-intltool host-libxml2 host-libglib2
>  
> +# Uses __atomic_compare_exchange_4 from libglib2
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +SHARED_MIME_INFO_CONF_ENV += LIBS=-latomic
> +endif

Thanks, but I continue to think that this is not the proper way of
fixing this. The proper way is for glib-2.0.pc to list -latomic in its
Libs.private, so that it gets picked-up by shared-mime-info when
statically linking.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
