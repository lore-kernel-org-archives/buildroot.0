Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8DEC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDFAB40541;
	Sun, 11 Feb 2024 15:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id frMxb3aK6FO6; Sun, 11 Feb 2024 15:31:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 979CC405C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 979CC405C4;
	Sun, 11 Feb 2024 15:31:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B90771BF39A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2BC640541
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U8Dlp9SzdFa8 for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:31:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5D11D403CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D11D403CA
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D11D403CA
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:31:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5081DFF803;
 Sun, 11 Feb 2024 15:31:36 +0000 (UTC)
Date: Sun, 11 Feb 2024 16:31:35 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240211163135.04c16bc4@windsurf>
In-Reply-To: <cover.1707600292.git.yann.morin.1998@free.fr>
References: <cover.1707600292.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707665496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t/KyHGFnk00Z8z60ihkMtZMGIRd38diosY/RlzkfLtI=;
 b=bhATCrqaB/z11vZryifcDz3kMnRf7Z+b51N4mta+iMNv0fQx17aoNnidnvmiXbvc/RmeI4
 o6telmLD0hw6GRAHsCFCkYra4UzQGLlOIFYaEWFUIYNYXqBD696CKylnWiKnQpeB21s2br
 D3rpZGb4BiEopQIQDgNzE11oCRLoI/XC+fn3K2YKDJc6Bqm3o69FlCaCEeVZL/0wV3j7uQ
 iA9jn/mLtHIPytEstnIV0IcJp9Rt3Q0kRUNt60Po6ohTnONW4Do16otXS2u7iJXbi9d7Bo
 4Io5Acx8c0h3VpI4qyMJBvYLap5jtD+0kp/V9rAE4rfgbluFxiqmH8vxIBDwTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bhATCrqa
Subject: Re: [Buildroot] [PATCH 0/6 v2] utils/checkpackagelib: check CPE
 variables (branch yem/checkpkg-cpe)
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 10 Feb 2024 22:24:56 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Yann E. MORIN (6):
>       utils/check-package: use https for the manual URL
>       doc/manual: fixup ordered lists
>       doc/manual: indent the CVE example the same as the CVE list item
>       doc/manual: document _CPE_ID_VALID
>       package: switch to _CPE_ID_VALID
>       utils/checkpackagelib: add check for CPE variables set to default values

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
