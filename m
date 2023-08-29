Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66844C71153
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 21:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE09E6080A;
	Tue, 29 Aug 2023 21:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE09E6080A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NzYY6V37l0Ix; Tue, 29 Aug 2023 21:28:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21DEA60F7B;
	Tue, 29 Aug 2023 21:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21DEA60F7B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5210F1BF25B
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19AFC60ECD
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19AFC60ECD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6xcFFwdzRPW2 for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 21:28:13 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A346860DCB
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 21:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A346860DCB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 486FC1C0002;
 Tue, 29 Aug 2023 21:28:09 +0000 (UTC)
Date: Tue, 29 Aug 2023 23:28:08 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230829232808.55bd9eaf@windsurf>
In-Reply-To: <20230829201514.208583-2-dalang@gmx.at>
References: <20230829201514.208583-2-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693344489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vkbwv9Z9hj0SPjSlWls9t2hp2ws/ucP18YAcCNdmsoY=;
 b=OSsJGTUHRsLbcBs+bVtp8KOU2l1Ct8v9v0S8DtSFKNaqzH7KB3YcGPQHYkFVw9vRH3XgMv
 GwWyogjVqYwKMlBPonYZlTcvTh8uoHMfZENrugIR1DFgTQTdSJhTmlRXCqslo32LKCe/YI
 ndm1K7uYLnWRWfhg1PKQyvqYQwCrfXqZhWNxWPNnnJZZL4SEQbiApWnv82/qxDdHQfcvSe
 jkZ04ztENqMqLAkXRX3TyRmtJZelFrZ7B3TP1Lf50rDLG95YaMf1JgrziPrHD9egrlpNxQ
 AeVBJ3ODfffqD8GjbmMXYXlxGzsxlU7MNVWdO6qe2v2vfqOt8AQSn5v1H8fgiw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OSsJGTUH
Subject: Re: [Buildroot] [PATCH] package/libxcrypt: fix build with perl >=
 5.38
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 29 Aug 2023 22:15:11 +0200
Daniel Lang <dalang@gmx.at> wrote:

> perl 5.38 deprecated smartmatch (~~ and the given/when syntax).
> Backport an upstream patch to drop uses of when.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/04c/04cf8d79fe8a58c3438e7be95ae781c9b2bef8a0/
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  ...ommon.pm-compatible-with-latest-perl.patch | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 package/libxcrypt/0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch

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
