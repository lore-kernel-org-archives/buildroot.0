Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF876D13579
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C9E381411;
	Sun, 27 Oct 2024 18:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIwkAdrABwfF; Sun, 27 Oct 2024 18:45:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1233814B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1233814B1;
	Sun, 27 Oct 2024 18:45:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7805B971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 662CC405D9
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQaPtXuS42Wa for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:44:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 24E9C4053A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24E9C4053A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24E9C4053A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C107FF803;
 Sun, 27 Oct 2024 18:44:35 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:42:42 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241027194242.7f583279@windsurf>
In-Reply-To: <20241026205755.2664552-1-bernd@kuhls.net>
References: <20241026205755.2664552-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fOg2A6gEs7vRo0rJtSaJtKeCqBIKwq1R3oVoRonoxhU=;
 b=ewTK8Gso0/OtBBLu51lTC0JHMTkEoqmS+KTqUO5iHfTaTF2XbQTsxns0R5haSQpQr/C+sy
 ey2OK3um88H81IoQB8Gp2Ug7CeDCIWyjwEuAeCX/44YxQwfz+7A/FUimuYSgSdeYUNDUIz
 Xx8LnkJqn4EB/SdknxQ55N3gzaM4mtxSPPafSkwzi4d2/wmbO8Y2oyZdeIs9vyk8NUjAof
 KyOW0trGNqt5MeUw/hXbRdEIEkfbFuRAl9K9AQL1uC+TS21YPRWeHTMNZZo4MXFcfaxj8v
 aBM6xJG2etk8SRDmtFkxTXtHcwu7HXe6Tm14yVesu/vfmeurNvkOv0QQvWq9pA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ewTK8Gso
Subject: Re: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 24.3
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

On Sat, 26 Oct 2024 22:57:55 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> http://stellarium.org/release/2024/09/22/stellarium-24.3.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/stellarium/stellarium.hash | 2 +-
>  package/stellarium/stellarium.mk   | 2 +-
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
