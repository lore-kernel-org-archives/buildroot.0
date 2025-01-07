Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C96E77198
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 17:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A91C88053C;
	Tue,  7 Jan 2025 17:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OO5P_MkAjwCd; Tue,  7 Jan 2025 17:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D1D0801CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D1D0801CE;
	Tue,  7 Jan 2025 17:17:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FFDADB4
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E584400EC
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffAmKjsr4KW9 for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 17:17:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9D1B140401
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D1B140401
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D1B140401
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:17:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F0DEFF808;
 Tue,  7 Jan 2025 17:17:10 +0000 (UTC)
Date: Tue, 7 Jan 2025 18:17:09 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250107181709.13aef4d2@booty>
In-Reply-To: <20250107063136.787314-1-neal.frager@amd.com>
References: <20250107063136.787314-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736270231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kt08R2A1OUxTpXspsGMZohSDkNdzFt5FjfFuLa24tdc=;
 b=cy4JvS5OV3q+2U+aqObGoaZS0ygtxsnja3+4EXR82ShYn6Vmp0x/wwZeGUthKea+vPFfmT
 0KPfiher6LqGiU11vLiDcvKfqmIEB/sTJjuL6pNCaagCB71lDvWH/iqd4BALKWzWmrpnyx
 VInob0DZr4x/lf9n2VrIoXpMSThNvRYjIMNC1QitVCB9aGvjD8Y2HZxZA6uMelnfeTisxh
 NiWOnGCqYbcQh3+hT32yvQxDeBF1fgH2hD9bpjnsrEmR5kUgiWz3L3TyE3iCAbVYVPPzlh
 sPS7GyN2zqtpO07Fxvyg0jVs+W2pX8vyamat9ws6K3UpHDwxg5mkoXxjj07LBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cy4JvS5O
Subject: Re: [Buildroot] [PATCH v4 1/6] boot/uboot: binman generates
 u-boot.itb
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 7 Jan 2025 06:31:31 +0000
Neal Frager <neal.frager@amd.com> wrote:

> When using binman to generate u-boot images, there will no longer be a make
> rule for generating files produced by binman.  However, these files will still
> need to be installed to the output/images directory.
> 
> One such file is the u-boot.itb.  If the u-boot.itb is generated by binman,
> then the file still needs to be copied, but without the make rule.
> 
> Here is an example of how binman generates the u-boot.itb:
> https://source.denx.de/u-boot/u-boot/-/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

[Tested on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>


-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
