Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BA6D3C90C
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 18:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DD9880F93;
	Sat, 19 Oct 2024 18:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LorOwB6lCokn; Sat, 19 Oct 2024 18:10:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C25B80FB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C25B80FB2;
	Sat, 19 Oct 2024 18:10:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D8C43A23
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B9054094C
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPjR9yS1gW_E for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 18:10:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A4A240949
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A4A240949
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A4A240949
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:10:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5F3AC0002;
 Sat, 19 Oct 2024 18:10:47 +0000 (UTC)
Date: Sat, 19 Oct 2024 20:10:46 +0200
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20241019201046.3f654d7b@windsurf>
In-Reply-To: <20241014011729.48018-1-fancp2007@gmail.com>
References: <20241014011729.48018-1-fancp2007@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729361448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b1VOSDgjtgE+2c9XSfvDmWslipDe0u0tdZQTn3Zv8Lw=;
 b=RGZaebWoJsotNpyyAgS6+ruUtZNSAuYDOmMCrSfYGl0QIZ4hZCZp1FW8JeiJFFr6PacKTl
 Nd3JOZ2T6BhyEcO6FvLi5zpxwOHD69XRIhq+xPm4QL2P6X1KHiHsS3ca2POIZHv7zQiaDY
 vPnAG4uLBRh6NLakDCE6raK8E29KuOkw6+YTsSSC+5TQ79Iv7r4/eG0xryN8aHH7m46W2U
 Nldl+//u1pPjd96+ehhyZ993PO6PDm7H/xgwkwuuFXUMPLb+kDIurwxxGUT9j1TTjAM+MO
 xmx7QqMvN92zjKhc/kCUxW8Q+rr9mv7rLMFzh5dNoDox+SG8RYAfBWARaOxe1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RGZaebWo
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.17.0
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

On Mon, 14 Oct 2024 09:17:21 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> Release notes: https://github.com/timescale/timescaledb/blob/2.17.0/CHANGELOG.md
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> ---
>  package/timescaledb/timescaledb.hash | 2 +-
>  package/timescaledb/timescaledb.mk   | 2 +-
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
