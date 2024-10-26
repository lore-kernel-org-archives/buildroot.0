Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B1AD10BF8
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 12:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58688605E5;
	Sat, 26 Oct 2024 12:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ee5jdDBw7v1f; Sat, 26 Oct 2024 12:56:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BF0F60667
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BF0F60667;
	Sat, 26 Oct 2024 12:56:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DB172318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D89C40269
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKhvwJWuKMp9 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 12:56:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1FC6240189
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FC6240189
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FC6240189
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:56:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BEE620005;
 Sat, 26 Oct 2024 12:56:38 +0000 (UTC)
Date: Sat, 26 Oct 2024 14:56:37 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <20241026145637.52c19b71@windsurf>
In-Reply-To: <Zu/WxVZUYehjdlX3@waldemar-brodkorb.de>
References: <Zu/WxVZUYehjdlX3@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729947398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7saA+N4CT3b2XjW+ENWktlOWWesR5BQv7EvLNMcqohs=;
 b=cdlOIanDt6CpIDySvQ6qXK8nbqfC6IwTi2cnZM5Lu9Iam0yUAe+8ZogSne3NRjRzFOp+Nj
 I4nqi+hoMri4v/JcDYrtu59CZORLCy+sJcHJn1G27uOui9muUkpktMgXdTyQTorvgU5Wtf
 IkpF4JK+Fy3i2Lnl/zIGLmfZK6jmLtnaa6kdfjAkbrs1810COuKjebZdAibznhbipzF7MP
 d/zY4hgyPtTjIvmKLWcr6ruUC3JF4DdVJ0WlvGgC7eaeTrrg+VFpIsZVdRZ4Bv6vQjBsEc
 wZIbhJvrsDEu2vJU/oCmPpsXBj2IL7zii+c7RP/9Cs9n0bL18kaDiwbjPdvVfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cdlOIanD
Subject: Re: [Buildroot] [PATCH] package/util-linux: update to 2.40.2
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

On Sun, 22 Sep 2024 10:35:17 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Disable lsfd for uClibc-ng until 1.0.51 is out.
> Some files now are licensed under MIT.
> README.licensing was changed, MIT was added, GPL-2.0 was
> renamed to GPL-2.0-only.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/util-linux/Config.in       |  6 ++++--
>  package/util-linux/util-linux.hash |  7 ++++---
>  package/util-linux/util-linux.mk   | 11 +++++++----
>  3 files changed, 15 insertions(+), 9 deletions(-)

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
