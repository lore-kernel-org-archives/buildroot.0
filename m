Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0954D767F2
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 18:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DF29403B8;
	Thu, 31 Oct 2024 18:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1nhImPlf8AcI; Thu, 31 Oct 2024 18:04:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80D16402DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80D16402DC;
	Thu, 31 Oct 2024 18:04:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 70FB15E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5278660AEB
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_xTVmRt9XHE for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 18:04:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5084860AE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5084860AE6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5084860AE6
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:04:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 920BDE0003;
 Thu, 31 Oct 2024 18:04:47 +0000 (UTC)
Date: Thu, 31 Oct 2024 19:04:46 +0100
To: Jean-Christophe Bauduin via buildroot <buildroot@buildroot.org>
Cc: Jean-Christophe Bauduin <jean-christophe.bauduin@mind.be>, Fabio Estevam
 <festevam@gmail.com>
Message-ID: <20241031190446.149963ec@windsurf>
In-Reply-To: <20241030141811.1372499-1-jean-christophe.bauduin@mind.be>
References: <20241030141811.1372499-1-jean-christophe.bauduin@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730397887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sCiBTNtILgt6zJKqgFGkLluywFx0ywEF5Zulw5xbdMg=;
 b=kWDL1dkagAanvC889KBWpcqO+Iva9I/dP68TMKwTNlyOPTvxlRWDJUdeM7XPPFLtiHJi9H
 pMSUQqIeDI9qLUUBHM0u/GVUgvRRBReTzX7lPoYMi78WZ1oPZ69CJZ5wSS9HN5BocERYaz
 7VgMPd19WYtLWgS3AxzkJUhbATzfOJklM71E5D8JZ91vHF/8rDxzQPaAtt/InMU1TOA7Ec
 Sh0ZITiWTEsdUiWRt6bM3f7lMRxaeJVdKUcPaSFkU1FyFpllPQP3Zw7TAmzRi/GKGYrDD6
 LfIg2/J06CE6cKCeYqYsFh3qPt3V5LIRgrst8JqQwkR6aBlIfbNGgBqFIb//mw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kWDL1dka
Subject: Re: [Buildroot] [PATCH 1/1] board/imx7d-sdb: bump linux to 6.6.58
 and uboot to 2024.10
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

Hello Jean-Christophe,

On Wed, 30 Oct 2024 15:18:11 +0100
Jean-Christophe Bauduin via buildroot <buildroot@buildroot.org> wrote:

> Bump the linux version from 6.6.21 to 6.6.58 and uboot from 2021.07 to 2024.10
> Signed-off-by: Jean-Christophe Bauduin <jean-christophe.bauduin@mind.be>

Thanks a lot for your patch!

A minor nit: there needs to be an empty line before your Signed-off-by
line.

But also, there is no need to repeat the commit title in the commit
message itself.

However, the bigger comment is that we are asking people who bump our
defconfigs to enable BR2_DOWNLOAD_FORCE_CHECK_HASHES=y. Could you have
a look at doing this? ./utils/add-custom-hashes will help you in
generating the hash files.

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
