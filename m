Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA43D24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E5CD4130A;
	Thu, 10 Oct 2024 21:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HFNOuJIPUtf; Thu, 10 Oct 2024 21:37:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D6B141616
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D6B141616;
	Thu, 10 Oct 2024 21:37:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39B691BF98E
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F26160BE9
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEbotyXczrZX for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 19E2C60BE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19E2C60BE8
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19E2C60BE8
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6390840002;
 Thu, 10 Oct 2024 21:36:36 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:35:07 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233507.54381e18@windsurf>
In-Reply-To: <20241009171925.3841884-1-james.hilliard1@gmail.com>
References: <20241009171925.3841884-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dxqWtq6MNsEZPr0BYPfPQOvg2gg2Y7Di8J/N6EyMLYc=;
 b=FXyEaNmgixh0Px2T82KkryTpJfI7PZ1HU4AXZAut4Fs99Vq++YiulHCVqf8Inyd6ZaNeqr
 IgBldTbTlkX9rZt8svB48hMtLSfkn0K49ycl7uU82zqExQQD++hI2S6PHZ/W+8b1h60EZc
 pB3u0aAUCIcPW2ykJMBb5kLg+G7A5PIXknQOkwyPObKjelqyJVnkDrNIRcrCTeU5exqNo/
 RNbaW549QrW53x9NUaa12EyyVgnwqyNBjfPIjqID2ikibGIrMMFDlPk7x4lskYILsVPLhc
 +PBo8Pm8INJ3IyOvEYMmDK0zPdoWMgSw0MQqMhpNcnJaBzyntGRH82szujp7fg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FXyEaNmg
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pypika-tortoise: bump to
 version 0.2.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  9 Oct 2024 11:19:25 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pypika-tortoise/python-pypika-tortoise.hash | 4 ++--
>  package/python-pypika-tortoise/python-pypika-tortoise.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
