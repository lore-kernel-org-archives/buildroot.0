Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FDBC32771
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 21:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E52A041751;
	Wed, 28 Sep 2022 21:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E52A041751
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8FXC-2SXDNYf; Wed, 28 Sep 2022 21:34:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81A88416C4;
	Wed, 28 Sep 2022 21:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81A88416C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A27441BF3DB
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5240440C9D
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5240440C9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FilrR5FOHkeq for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 21:34:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FEF840154
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FEF840154
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 21:34:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 50DAC60002;
 Wed, 28 Sep 2022 21:33:59 +0000 (UTC)
Date: Wed, 28 Sep 2022 23:33:57 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220928233357.394a6011@windsurf>
In-Reply-To: <20220928192802.437811-1-giulio.benetti@benettiengineering.com>
References: <20220928192802.437811-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664400839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=liqPzHV8+55v93/yK7dT2Tqp73q6wZz9ZioTcV2gRTg=;
 b=VcLwL7a/yrY5vrOYuCN52CZxJxktl27iMLmjP3RKh6/m/tr8b1QoH8jIcIZ4yJLUbUkTpG
 DEY0Njk5JuDIjqIEeZT19iCSbAqX9Rx5JzIBiu/DGs1Vhww1/DN/cv0IqHGVaErwaMFyRP
 O/QuPDyOPRD59nrpFFxS5XUHi7z24RiTqJVwZ37Ucm2YtvTD/h5qwz9byWIj1/WhSx0saG
 REjCLCJAAMg28VRRjMinCOIMxzW7ubenBBZ3oxWE4Alm5xaLdjJTgCfKMKDeJMuokNR609
 +AWN0Sx3LPeSe22hnrZdwAjg0/x1Ao4Q3N4uO//MN6M3j3hxLG9kxFIVcAy7Sg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VcLwL7a/
Subject: Re: [Buildroot] [PATCH] package/rtl8189es: fix build failure due to
 wrong endianness
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 28 Sep 2022 21:28:02 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> At the moment rtl8189es module has -DCONFIG_LITTLE_ENDIAN hardcoded and
> there is no way to override it. So to do this let's add a patch that is
> pending upstream[1] to allow to override CFLAGS and then let's undefine
> CONFIG_LITTLE_ENDIAN and define the correct endianness in rtl8189es.mk
> 
> Fixes:
> http://autobuild.buildroot.net/results/3bcad5e88876c86a2a3338961ed20f28b5953779/
> 
> [1]: https://github.com/jwrdegoede/rtl8189ES_linux/pull/83
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...TRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 40 +++++++++++++++++++
>  package/rtl8189es/rtl8189es.mk                |  8 +++-
>  2 files changed, 47 insertions(+), 1 deletion(-)
>  create mode 100644 package/rtl8189es/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch

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
