Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6819C52D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 20:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 993D1402B0;
	Tue,  6 Aug 2024 20:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Owf9iwhCOSeD; Tue,  6 Aug 2024 20:35:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CA9940394
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CA9940394;
	Tue,  6 Aug 2024 20:35:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78CAA1BF33D
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7205840261
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X5sAIV4oRxw4 for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 20:35:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 29DB84000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29DB84000B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29DB84000B
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 20:35:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16BFB20002;
 Tue,  6 Aug 2024 20:35:42 +0000 (UTC)
Date: Tue, 6 Aug 2024 22:35:42 +0200
To: yegorslists--- via buildroot <buildroot@buildroot.org>
Message-ID: <20240806223542.31af8fee@windsurf>
In-Reply-To: <20231011072701.1014328-1-yegorslists@googlemail.com>
References: <20231011072701.1014328-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722976543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mqRUQurZIz8XvWdj9GHWNe1xb2C8mzEPtfKjiRBRCeg=;
 b=XfkkZXgAuhVnTE0nhxi05ErSnCxV9O4C/ge4q57zUYryH5JSTz0NjzI3VkkV8Qhi4SZZBb
 CN+u23iKuR6cTH7mTyBuh+YHmhzfixWGL1Hpzsf3MiPk4lGYTqwBqaIRbBbP1yC+ohhONP
 /1rlK3dY3esHdYU4jgaoHPRd0eHViFTqv050YDqECwY2UtS2fvd88zX0wCYJycEDmVkzux
 sfJ6stj84k41VrcEeBFeQBBgDaK93IyPwW2onVkU0vpoggWOyZqYM6E/ZSJDeOFAJjkvJs
 CuVZR9bMPM7HZlbzyR8udf8nGF8tFua7SFY9YEC1vZlZ8OYu0jxPRaj3o4hTfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XfkkZXgA
Subject: Re: [Buildroot] [PATCH] python-configobj: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 11 Oct 2023 09:27:01 +0200
yegorslists--- via buildroot <buildroot@buildroot.org> wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> python-configobj package was removed in
> 8d264a96172cfa1c1f515d1160b921c013fa3bd7 because of the missing support
> for Python 3.x.
> 
> Meanwhile, this problem was fixed, hence readd the package.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  Config.in.legacy                               |  6 ------
>  package/Config.in                              |  1 +
>  package/python-configobj/Config.in             |  7 +++++++
>  package/python-configobj/python-configobj.hash |  5 +++++
>  package/python-configobj/python-configobj.mk   | 14 ++++++++++++++
>  5 files changed, 27 insertions(+), 6 deletions(-)
>  create mode 100644 package/python-configobj/Config.in
>  create mode 100644 package/python-configobj/python-configobj.hash
>  create mode 100644 package/python-configobj/python-configobj.mk

Sorry for the huge delay, but... patch applied!

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
