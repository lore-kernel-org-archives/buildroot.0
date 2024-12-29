Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A4AE7718F
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 22:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF6B4804CB;
	Sun, 29 Dec 2024 22:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpzTyvJjuDDC; Sun, 29 Dec 2024 22:47:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19CEC80439
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19CEC80439;
	Sun, 29 Dec 2024 22:47:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DF2672
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E66A4064E
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKzhiCJZfQi9 for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 22:47:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D6C4E40248
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6C4E40248
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6C4E40248
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:47:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA52F40004;
 Sun, 29 Dec 2024 22:47:16 +0000 (UTC)
Date: Sun, 29 Dec 2024 23:47:16 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241229234716.76078dec@windsurf>
In-Reply-To: <20241229202232.1678307-1-bernd@kuhls.net>
References: <20241229202232.1678307-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735512436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dnMhAHdFHOn4ltO4dq6r0VmymsnNQAZ2YXSFPV0YLKI=;
 b=Qe29gXvf0D8cj/4ki/6qoE4VUwva3AoBU1fuDjh3fxFqk/kdZ0EH/CeTVnPtgylNkcWpq2
 nSstXWVCvqwvtvs9ADIq4R2M7pDEmxYjOEs/nrNVOlzijQUFdFWNyZ0fK+QxZUd+QCYSUr
 +GBmArcuFQNJcYzfMHu598cqw0YuMClm29tiW44JFfbEfalZj/nUy7FALBI9wA5pM5qZ7o
 CSKMcsYK01vUuweUB8Sq+/1vWuPsZvLEoivTAs5A2DLQqZy4UxTATpD+Wp7iJjBR8gPVBA
 GJKk4LPILcRdVnTW482ZJepu35iNao4l1vl3ONUlr5ScQ/VGQBU3wwaxBY36wQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Qe29gXvf
Subject: Re: [Buildroot] [PATCH 1/2] package/libvpl: bump version to 2.14.0
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

On Sun, 29 Dec 2024 21:22:31 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libvpl/libvpl.hash | 2 +-
>  package/libvpl/libvpl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Series applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
