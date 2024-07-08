Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E1BC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 21:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B519D40211;
	Mon,  8 Jul 2024 21:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HmiBALr9gsnX; Mon,  8 Jul 2024 21:56:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51781405AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51781405AB;
	Mon,  8 Jul 2024 21:56:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6D41BF3BD
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66F22405AB
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id saDoRxyY-NA6 for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 21:56:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 026F940211
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 026F940211
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 026F940211
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 21:56:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A2A3240004;
 Mon,  8 Jul 2024 21:56:40 +0000 (UTC)
Date: Mon, 8 Jul 2024 23:56:39 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240708235639.7a9cc07c@windsurf>
In-Reply-To: <20240704121352.1915154-4-fiona.klute@gmx.de>
References: <20240704121352.1915154-1-fiona.klute@gmx.de>
 <20240704121352.1915154-4-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720475800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zxJPq3UgMNt+0weNWSmuxq+6iL3QL4XqAPdi1LChDi8=;
 b=I7TTohKVt1z3F1Inv2Dp2vID4cuShoEHzJra2GOHU2UVzy2XhtmqmW+qjStOqUNN//zW9k
 NFm82NtKVhQA/WyjtoXrEAWb6KobH8WzF6q9n1zgAlp8t4ZO5Sdub5SwZJyIDc2AMZIvzN
 msgXj5lbW0sikXcOmkeJA86Gl8CUQpqVhfnUN/YhpACx4gROo+e+aWRJA8SuRn6YGyqLSM
 hENevwzZSCZeDMFaxbdSmKzYIWJnUr/arlXOncNHUx2aH1pzoq3EwxRHJKw8d2PYX614Rg
 BNiSLlXtoM1qjTkWXYUdBLcbYRXeqgD6GaceEs42eeSPdQ/tjn7jcg7YAVEz8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I7TTohKV
Subject: Re: [Buildroot] [PATCH v2 3/4] package/fail2ban: bump version to
 1.1.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Thu,  4 Jul 2024 14:13:51 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Fail2ban 1.1.0 brings Python 3.12 compatibility, and removes support
> for 2.x. This means 2to3 handling can be dropped.
> 
> Unfortunately fail2ban 1.1.0 still relies on asynchat and asyncore,
> which have been removed from the Python standard library in
> 3.12. Depend on the compatibility package python-pyasynchat (which
> pulls in python-pyasyncore) and remove copies bundled in upstream
> code.

Thanks for the detailed commit log. One question below, though.

> -FAIL2BAN_VERSION = 1.0.2
> +FAIL2BAN_VERSION = 1.1.0
>  FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
>  FAIL2BAN_LICENSE = GPL-2.0+
>  FAIL2BAN_LICENSE_FILES = COPYING
>  FAIL2BAN_CPE_ID_VENDOR = fail2ban
>  FAIL2BAN_SELINUX_MODULES = fail2ban
>  FAIL2BAN_SETUP_TYPE = setuptools
> +FAIL2BAN_DEPENDENCIES = host-python3 python-pyasynchat

Why are you adding host-python3 in the dependencies here?

Also, are you sure python-pyasynchat is a build time dependency, and
not just a runtime dependency? If that's the case, then you need to
kept the select in the Config.in file (with a comment # runtime), but
not have it as a build-time dependency in fail2ban.mk.

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
