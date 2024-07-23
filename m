Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1577CC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 08:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3E4D400F5;
	Tue, 23 Jul 2024 08:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3WHxaMxBFKA4; Tue, 23 Jul 2024 08:47:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F1E240108
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F1E240108;
	Tue, 23 Jul 2024 08:47:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 369051BF29D
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F63C40108
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Al0vlCK_7XbX for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 08:47:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 68E68400F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68E68400F5
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68E68400F5
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:47:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FD2E240005;
 Tue, 23 Jul 2024 08:47:31 +0000 (UTC)
Date: Tue, 23 Jul 2024 10:47:30 +0200
To: Lance Fredrickson <lancethepants@gmail.com>
Message-ID: <20240723104730.30a3c866@windsurf>
In-Reply-To: <20240722212305.692404-1-lancethepants@gmail.com>
References: <20240722212305.692404-1-lancethepants@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721724451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nYON00+mEgYULFsLE3JYFSrkcCsqcaCYrr3CjxyIg2k=;
 b=LPc4wxiDaVaH+C5idCCQBN82E9InaB7HdKWUak0zlhLQYfHuJKFZr5ApBHyxUGkuDc0bYn
 atyEWRZ6fgdBsW5HGvlD6ir5ZRjG7mxUolZpB7yqlI2OjDM+4hEypS8Hgq0wPv/ouUIeSo
 pXOll7ETPIbf1u61GBp4/aTQvyjyaJpznge6HKOahbORVspf/UyFZqSJcTT7K25v8/i0Yc
 Wi4l+yXm5AI/YlsCV3TP0RkBTorqJ0/rbK51KXdrv3LcJ+IBXhVs3JOUS8Irc6gNoHVIMd
 jWDFnC49c2oAQRf9v7gXIt+3NRqrT3CQpY6fIuYw0GnCZpiqXKyq5sGyQFGXUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LPc4wxiD
Subject: Re: [Buildroot] [PATCH 1/1] package/hostapd: bump version to 2.11
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Jul 2024 15:23:05 -0600
Lance Fredrickson <lancethepants@gmail.com> wrote:

> From: Lance Fredrickson <lancethepants@gmail.com>
> 
> Update hostapd to the latest release v2.11.
> Enable 802.11be support.
> Drop patch as it has been upstreamed.
> 
> README's copyright year was updated.
> 
> Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
> ---
>  ...ic-name-for-IEEE802.11-CRC-32-routin.patch | 102 ------------------
>  package/hostapd/hostapd.hash                  |   4 +-
>  package/hostapd/hostapd.mk                    |   3 +-
>  3 files changed, 4 insertions(+), 105 deletions(-)
>  delete mode 100644 package/hostapd/0001-use-a-less-generic-name-for-IEEE802.11-CRC-32-routin.patch

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
