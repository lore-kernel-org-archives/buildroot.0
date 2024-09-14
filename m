Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3253C02186
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEF1784589;
	Sat, 14 Sep 2024 09:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FvPyYqoUdVgm; Sat, 14 Sep 2024 09:09:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF9FD846FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF9FD846FD;
	Sat, 14 Sep 2024 09:09:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BCFF81BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7D504042B
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-EiCSaStvvG for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:09:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D56E403C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D56E403C9
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D56E403C9
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:09:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B297C240002;
 Sat, 14 Sep 2024 09:09:49 +0000 (UTC)
Date: Sat, 14 Sep 2024 11:09:48 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240914110948.55ecb8c3@windsurf>
In-Reply-To: <ZuEdgLLG+xLSZz20@waldemar-brodkorb.de>
References: <ZuEdgLLG+xLSZz20@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726304990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TkypFy88lMsSHfHp6mt3kYfb6vcFjIhDuM/47FlzKJo=;
 b=LY2WpAdRH72zWLA6yqrhcu4iSbne7xdPskTf3hSKh5KN65WENPZgkAAnMPJaJ4OrRIhEBF
 UNK1f8b9P8694e5T8Z+deR04mBLE06PmhCSMIMK6ptOldpWh8ehUjcCAIkpJNmCzP5R7gZ
 KWOxH0FEDUZVgn65SN93KBuDq7Iuy+WL5bniUqk+NjU+xcLB8VdqOXVbS/wN+aNa3Wwc4M
 vIgeKwh9i+p3eLwPzenQC4OZPRiG0v7dXKhK5I9A0eX6y2VxZgPBSiuRfNdL4JegSbvTti
 +vXe92Svi/qSzFtczoWDRDGLS+2A6AhfTSHLa5kz2++PvW/lG0U8aBHtHYvtvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LY2WpAdR
Subject: Re: [Buildroot] [PATCH] package/asterisk: security update to 20.9.3
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

On Wed, 11 Sep 2024 06:33:04 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See here for the Changelog:
> https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-20.9.3.md
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/asterisk/asterisk.hash | 2 +-
>  package/asterisk/asterisk.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
