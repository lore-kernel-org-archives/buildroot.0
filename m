Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B4CE7718F
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 21:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28ABD80834;
	Mon, 30 Dec 2024 21:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ju8FMAUtw4GS; Mon, 30 Dec 2024 21:44:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C89581150
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C89581150;
	Mon, 30 Dec 2024 21:44:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10770968
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 21:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E64CE60683
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 21:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id omcaWIucm935 for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 21:44:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E41176067B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E41176067B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E41176067B
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 21:44:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9E0660006;
 Mon, 30 Dec 2024 21:44:11 +0000 (UTC)
Date: Mon, 30 Dec 2024 22:44:11 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241230224411.19f2bdca@windsurf>
In-Reply-To: <20241230201103.203055-1-ju.o@free.fr>
References: <20241230201103.203055-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735595052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ej/rS3XBjTnSRv7LkSiXZ+fL5h8wSk4k5dUPkeqRrPs=;
 b=cbuxnLq7qYdUMg4FRW6yOIv/RbeFs8JyvkfNw0nz45CNCvQ+bWvzOnTt4Tf/wjz38uTaQ0
 Mk99H6ghio/MArw8eRikk6s/oF2xHK4cx2dWyTAeEPpUGT5uFeWP71ZZanvTo1gTUIGkYy
 1pugDlhW20Q+KdpZ99q2kKfMsF6FPds6IknLB1oCtZJCMUvUPy1bO+YtqlorwjKPyL1QRB
 6fHcAsh3ee2f6E5BMVWUH7RGkgzxHh3g4i0xb1ce4hWQv4VX9LSF1RuuhjTZE5y4+cc2XU
 SYV1nimGu8IfcRZ9jXFmYcsxyEnpGahJmloniDXc3HQMT9n7LaC/sR6Vi4b3iQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cbuxnLq7
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new xxhash runtime test
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

On Mon, 30 Dec 2024 21:11:03 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8743934301
> ---
>  DEVELOPERS                                   |  1 +
>  support/testing/tests/package/test_xxhash.py | 35 ++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 support/testing/tests/package/test_xxhash.py

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
