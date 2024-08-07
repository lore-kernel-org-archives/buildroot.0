Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186C8C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 09:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAEB4405D5;
	Wed,  7 Aug 2024 09:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqCiMl8pwd1D; Wed,  7 Aug 2024 09:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7321A405EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7321A405EF;
	Wed,  7 Aug 2024 09:55:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2CF11BF2CE
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0DA280CE4
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SuzUNXiDDlET for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 09:55:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9733B80CE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9733B80CE0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9733B80CE0
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 09:55:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9A71FF804;
 Wed,  7 Aug 2024 09:55:05 +0000 (UTC)
Date: Wed, 7 Aug 2024 11:55:04 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240807115504.4042b701@windsurf>
In-Reply-To: <ZrL7Ovbl+xTX+KX/@waldemar-brodkorb.de>
References: <ZrL7Ovbl+xTX+KX/@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723024505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jp0Dy9Tw/xbEHFFMCOwuzIhzT+ZYagmT3PBEbUL1Cok=;
 b=SZna7pbUsbQTqyHY97cXM+Wmj1BdkJpB4ULJ1sOKZm5p9maH+f+Hh6WI4y5K0SWdclfH7y
 /jr6GtqTyEeOc0ldz/lG0EBg9esC7JT3ByeJNproXKx8/9pb61is445TQFtm0Ss346cTje
 S2I0bmjMQpwmJKwn17dNVMlCaVPtyMoelKEpeDN0O55vwyKifo+1zKxr9yicu0tuPcpjK9
 Xp1auLudbcBj5MIz9EtxRGQTiJA3CEtTCQcxGENVEYHOM5SGknTrwbpfITKG99O8w1Yzw+
 ugW06Ql1Efy8eIIXkn8wnhmvw9J0fOtN+4SZnFNcLhTidYbFI1RlBv9EWaIviA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SZna7pbU
Subject: Re: [Buildroot] [PATCH] package/libjcat: fix linking,
 add missing intl library
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

Hello Waldemar,

On Wed, 7 Aug 2024 06:42:34 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> +ifneq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
> +LIBJCAT_LDFLAGS += -lintl
> +endif

Thanks, but this is not the correct way to deal with libintl issues.
See the Buildroot manual
at https://buildroot.org/downloads/manual/manual.html#_gettext_integration_and_interaction_with_packages.
You need to use $(TARGET_NLS_DEPENDENCIES) and $(TARGET_NLS_LIBS) to
have a correct behavior in all situations.

You can grep for TARGET_NLS_DEPENDENCIES and TARGET_NLS_LIBS in other
packages to see how they are being used.

Could you look into this and send a v2?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
