Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B70C38150
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 08:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E82DE81F34;
	Wed, 10 Jul 2024 08:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yh7dw-xltLnt; Wed, 10 Jul 2024 08:30:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03E2D81F50
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03E2D81F50;
	Wed, 10 Jul 2024 08:30:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BAE41BF5AD
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 08:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2775540429
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 08:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TbCDb3EcxLSC for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 08:30:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9303340025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9303340025
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9303340025
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 08:30:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1867E0005;
 Wed, 10 Jul 2024 08:30:14 +0000 (UTC)
Date: Wed, 10 Jul 2024 10:30:13 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240710103013.74e85903@windsurf>
In-Reply-To: <20240709220307.3598238-1-bernd@kuhls.net>
References: <20240709220307.3598238-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720600214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39vVa4+OYbSr3WPgtaIGuDUWX8kFrcCSQ9gRf81he9U=;
 b=XP+eFZigCP+aC7V8m1+4mS5q9EtRqCBiD+u6y744GFtxjDUeg2sdFHzLEWGCpoa5unqqzM
 qPjoHXGUalTogv4yyMduW2Q7v0wDFVamiusvIyJaiNFYYArN+AAQKTwDx7S2cwMUM2TGsH
 76ogsE88WU8MN/RoGY8E3lAbpLv8F17F9vwM/lt/QSM4ebUkeg+5TXf8bgovo/2tx3MW+g
 cKPBurdxNhEO5oBU4eBELh47RimGQqJR6/vcjNc+DGhinQFhJNovhVCLf1GPoYqknGb+UO
 vfMfqEvONfZLEVuBArJk1i14xx9q7CN55YaJx1M6cqD+n3I6YJUqZ6iPf4vQfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XP+eFZig
Subject: Re: [Buildroot] [PATCH 1/3] package/kodi-pvr-waipu: bump version to
 21.8.4-Omega
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

On Wed, 10 Jul 2024 00:03:05 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
>  package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
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
