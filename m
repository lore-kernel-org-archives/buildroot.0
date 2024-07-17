Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBAEC3DA5D
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 21:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54FDC40EB0;
	Wed, 17 Jul 2024 21:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikOzmTPdJM1a; Wed, 17 Jul 2024 21:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32A0F40EB8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32A0F40EB8;
	Wed, 17 Jul 2024 21:36:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F8F91BF385
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AAB640EAF
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3uAfV-BqAmh for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 21:36:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F1DD40E80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F1DD40E80
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F1DD40E80
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 21:36:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 727DF1BF203;
 Wed, 17 Jul 2024 21:36:09 +0000 (UTC)
Date: Wed, 17 Jul 2024 23:36:08 +0200
To: Romain Naour via buildroot <buildroot@buildroot.org>
Message-ID: <20240717233608.0402adb5@windsurf>
In-Reply-To: <20240627075441.4116645-2-romain.naour@smile.fr>
References: <20240627075441.4116645-1-romain.naour@smile.fr>
 <20240627075441.4116645-2-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721252169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pUWZ4GNqVXOTpYFSsedslne6zNzgmbmkNzOn4Y/oAKc=;
 b=A2TMeRYBfNNHDB1J/yJnaMr8AeeD6cuv27qXB36PajbpTGFe7nfxQsm+DE1VKfg5UH5LTq
 5lrEezmF2EWPt0aMUeXL9iYde6xag4M/RibAB5C+XJZ28oZQXOseEoRUOA4WBAq2coxVmp
 Y7DVxBs9mwNhQIMI5O3+Wgt1F776xno84oqkeEb+lQ030DmNq1jVm77C0DTZX2fiIcLe0y
 BH4SJGOvKVzPsBDHMfmhB1cdyCnQXHhoW26mEhmqtth/MIq8cvVsFfz45TdUltaNcxq1xs
 XLh/vskGaES9QA+jGK5ULtKm4gBbyy0XAq6dAp+0QNHy6V6NFAqWP6T6DLIrIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A2TMeRYB
Subject: Re: [Buildroot] [PATCH 1/6] package/ima-evm-utils: update url to
 github
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 27 Jun 2024 09:54:36 +0200
Romain Naour via buildroot <buildroot@buildroot.org> wrote:

> The project moved from Mimi Zohar personal github account to
> https://github.com/linux-integrity/ima-evm-utils.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/ima-evm-utils/ima-evm-utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks a lot, but as part of the bump to v1.6, Petr Vorel had also
proposed to change the github URL, and Petr's patch has already been
applied. Therefore, I marked this patch as "Not Applicable".

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
