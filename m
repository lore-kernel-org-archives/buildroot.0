Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8649D3A67C
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 18:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69335605AD;
	Tue, 29 Oct 2024 18:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IofrEjaKP8TU; Tue, 29 Oct 2024 18:51:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77D4860674
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77D4860674;
	Tue, 29 Oct 2024 18:51:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 605074969
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F2DA60648
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H0M5MLEVyhji for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 18:51:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2FB69605AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FB69605AD
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FB69605AD
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:51:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6348320004;
 Tue, 29 Oct 2024 18:51:13 +0000 (UTC)
Date: Tue, 29 Oct 2024 19:51:12 +0100
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241029195112.5467c6b9@windsurf>
In-Reply-To: <20241029094613.29356-1-nicolas.cavallari@green-communications.fr>
References: <20241029094613.29356-1-nicolas.cavallari@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730227873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=22GOd9Mn409Nxqwx5paH8rSQVsccWakSLrgijyneTo0=;
 b=WlbL8cDQ1qerAcVYGMqe2L5MOnWuikuhncpdv0P+kW1e9TQwGGS/MdHYNggs2MkFIeMmRI
 9p2kFSf/wH6WtJ0abiedLUy86iBtkTtPc5PLgEZzT9JeybVHVnprJOwvqF6TRxJwAXdvA3
 vYCgl2Sl4whRlbkl81NSh9OJCUg12PEXMvH+fDgnH4vDVVfwZeH7Ywu7TAQ8P0BEi6sqm1
 OUi0+uFhrTCtWcmiXy5Iwfsa2YGv2cEZzr2KlE5YG4FTG7zq7oZa+dGku8P8oX14hTxA9y
 0PItaSYe+j/Ycp3fCM7XddS8bX8LfmmBsweQnd9WY9VGFbwqrtdTWHwFTQITVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WlbL8cDQ
Subject: Re: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.8.3
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

On Tue, 29 Oct 2024 10:45:09 +0100
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> Fixes a crash when using the libhttp-parser dependency, which is the
> configuration that we use in buildroot.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>  package/libgit2/libgit2.hash | 2 +-
>  package/libgit2/libgit2.mk   | 2 +-
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
