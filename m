Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDF7CD1284
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C546600CD;
	Wed, 10 Apr 2024 21:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQk9aOWoklZL; Wed, 10 Apr 2024 21:48:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3393760EC7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3393760EC7;
	Wed, 10 Apr 2024 21:48:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6AAB1BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C789E60EAB
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87YcYMXav2hu for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:48:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BD35660EC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD35660EC7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD35660EC7
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:48:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 095E420002;
 Wed, 10 Apr 2024 21:48:25 +0000 (UTC)
Date: Wed, 10 Apr 2024 23:48:25 +0200
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20240410234825.1a5da587@windsurf>
In-Reply-To: <20240326121634.1248184-1-laurent@vivier.eu>
References: <20240326121634.1248184-1-laurent@vivier.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712785706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4drb8pPGbNbIkZJKyi5d8Iiuyk4c4lVBLSiWmaDg5go=;
 b=cm1XaVIJNGEKq2RmlPL2PRgv+WHlBgfqp3xGvBn1g7gFIJ7GGrj+BI+Gioac9xjv9LUMNf
 fYX7KzldkQFWyexq5776/AT+h5MGzLyCW0DspeGy5uYlM768ZmoMErzEEMkaCdavLwfgy7
 BgqwA7Nj1NzwFDa//Jvnrq+dmsBevT59DjeoICOe0gxW94eD+dUl+uCdblucR7JEhCpV96
 h6sOGGYoyBC72MMQAhVFITkJH7Q9gqePAfv1BJ7J6LI550bagiJH1gjCloTNiuuO/aLfDr
 qtQhvVniiOYSAWf+LTBLSf0LiC3WFh4FY81jCrx8WINm8doWNAFOV6JifA9UGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cm1XaVIJ
Subject: Re: [Buildroot] [PATCH] package/petitboot: bump to version 1.15
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

On Tue, 26 Mar 2024 13:16:34 +0100
Laurent Vivier <laurent@vivier.eu> wrote:

> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  package/petitboot/petitboot.hash | 2 +-
>  package/petitboot/petitboot.mk   | 2 +-
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
