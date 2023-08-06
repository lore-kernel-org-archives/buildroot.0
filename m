Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B77C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 900EF4021B;
	Sun,  6 Aug 2023 14:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 900EF4021B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OnLpgicbYRy2; Sun,  6 Aug 2023 14:26:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0ABA40220;
	Sun,  6 Aug 2023 14:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0ABA40220
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13BA31BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E14CA401D8
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:26:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E14CA401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eXoPfn9lbbWZ for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:26:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4EB84035D
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4EB84035D
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDCFDFF803;
 Sun,  6 Aug 2023 14:26:24 +0000 (UTC)
Date: Sun, 6 Aug 2023 16:26:24 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230806162624.2861d2db@windsurf>
In-Reply-To: <20230802120150.564860-3-thomas@devoogdt.com>
References: <20230802120150.564860-1-thomas@devoogdt.com>
 <20230802120150.564860-3-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691331985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sT3FCe/4FwK3hNoClE1+UzrBha3zlf9QhO+nzqTLc7s=;
 b=alHH5jqhLtc7hvQLdS/A6el7YNL3gF4Pgjm8FzuAsTJCL9msjIUzn3fy0G4075zaqhYqsB
 74QwqiWR7puk1tsRyRauUrkOuH2BfKKW2hYRPLEqaVYakQ0HPewJn8GgbssxdUM3dl7qia
 77TgxvJtqJn011XsV+ZJyKUOoIrvYOwGdlSD88XPX7/RN0brJzEOtVjP79TskjxV+zUzOd
 qZe4pvw2w2HD2226BChpwiGZU1saS6+sI8wxRLkvC8hEDEbyCZhZKULcVJ1QDYyC0lvq8o
 u6AAD753p0TLPR9X2Yg1lfN32RNAxioSECnzHL7sfBXWBQe17RFNVExJxM0BaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=alHH5jqh
Subject: Re: [Buildroot] [PATCH v2 3/3] package/wpewebkit: add http/2
 support by using libsoup3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  2 Aug 2023 14:01:50 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> Support added in 2.33.2:
>   https://wpewebkit.org/release/wpewebkit-2.33.2.html
>   "HTTP/2 support when building with libsoup3."
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
> v2: fix git message typo
> ---
>  package/wpewebkit/Config.in    | 6 +++---
>  package/wpewebkit/wpewebkit.mk | 5 ++---
>  2 files changed, 5 insertions(+), 6 deletions(-)

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
