Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8CAC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37911408CA;
	Mon, 22 Jul 2024 12:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id epnXJcAIN4z1; Mon, 22 Jul 2024 12:16:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CBC5408E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CBC5408E2;
	Mon, 22 Jul 2024 12:16:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86CDD1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 739D440117
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1J3UT9clArWn for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:16:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2DE6A4010B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DE6A4010B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DE6A4010B
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:16:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E7C42000B;
 Mon, 22 Jul 2024 12:16:38 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:16:37 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240722141637.01d1c18a@windsurf>
In-Reply-To: <20240721172843.2342941-1-fontaine.fabrice@gmail.com>
References: <20240721172843.2342941-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721650598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OdkqaIJdYTorJpXkszWqAgILq+ogM2cljUKszDg+TH8=;
 b=iRcSsXs/gonf6E7SRp+jAInzvhXP4qRClrEXSWpVdiofz7NE/dVY9A90mE7F7Vef/g7CrY
 F9jG/MFFPhxpVZ+/loV86VCB9faXze3A/nfInq/G5VT1x/Jr1QTUttDDi5zZsrEZoiOm7W
 /qy/hegGhlUj0gj0eAUxFIXuGQS1SbR0h8zOqvSjp7RaXLJ9Vvd/Q6HDiWNmrbMtKhrrcx
 lzdxvRwc80gbmO1KwD3ehnD9gIgrLP2H021D36QkYotGKSmQJolMBiBt2W9RTn5NN+eGbB
 bwVgm8msqlb7XfaMJ3LzUOuyuGDEjGuTjYLMBaw+vvUywMZDlrpZmYpQUoFq0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iRcSsXs/
Subject: Re: [Buildroot] [PATCH 1/1] package/libfreefare: bump to latest git
 commit
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Jul 2024 19:28:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This bump will fix the following build failure with gcc >= 14 thanks to
> https://github.com/nfc-tools/libfreefare/commit/494233d33b3a9d21da1bb0f1c59606820afe4691
> 
> mifare_desfire_crypto.c: In function 'cmac':
> mifare_desfire_crypto.c:139:23: error: implicit declaration of function 'malloc' [-Wimplicit-function-declaration]
>   139 |     uint8_t *buffer = malloc (padded_data_length (len, kbs));
>       |                       ^~~~~~
> mifare_desfire_crypto.c:69:1: note: include '<stdlib.h>' or provide a declaration of 'malloc'
>    68 | #include "freefare_internal.h"
>   +++ |+#include <stdlib.h>
>    69 |
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/778be216f62b8c2e05aba1b3e297dab0c6c6ccd0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libfreefare/libfreefare.hash | 4 ++--
>  package/libfreefare/libfreefare.mk   | 9 ++++-----
>  2 files changed, 6 insertions(+), 7 deletions(-)

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
