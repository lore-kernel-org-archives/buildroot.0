Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD23AC52D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 20:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 733DE40222;
	Tue,  6 Aug 2024 20:20:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YEkinD36j7X2; Tue,  6 Aug 2024 20:20:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37244402B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37244402B0;
	Tue,  6 Aug 2024 20:20:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7694D1BF33D
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6382D402B0
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zaPWDw9x-eCV for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 20:20:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 204B740222
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 204B740222
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 204B740222
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 20:20:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FBDFFF806;
 Tue,  6 Aug 2024 20:20:05 +0000 (UTC)
Date: Tue, 6 Aug 2024 22:20:04 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240806222004.263622fe@windsurf>
In-Reply-To: <01746f497e80b9a6b6efd1f50276a8cc@free.fr>
References: <20240207225100.1320837-1-ju.o@free.fr>
 <20240806194340.2e542192@windsurf>
 <01746f497e80b9a6b6efd1f50276a8cc@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722975605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4rJwBiePUrg4cF3x/vcJXCbJIbowoWCElx4xO2E27Bs=;
 b=MhSvDi500CRJ6/Ec0OHXNZ0jjv9TwCqv+gqzT86tnSen0wqsQN9YHJ0uM1BLFp46fUOZgI
 JVITKLs/qTweK3ckCZtiNI5JQfej/e2ghiyfR2aoDJoy5aERAw+xJDc8dhlSh0qQZxTZrK
 xPbxNA7qvXo+0r5QKI6mlMP/LcPUiBcJzt+2MdFM1mqGJcgHsXEkwZobSANieIgqWxK2h1
 DKLibROVPcxopJdmCNp2UnjmmA59ZswQ+griKAcfEjRk0NIJ65gRQ/DfnIlPrcM4uBsQSd
 3BZm0GQwFJhk/eOBNn+u3D5xkTe9QDoW7nPeApjFMlxbylHUNANoUZ9AqaObcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MhSvDi50
Subject: Re: [Buildroot] [PATCH v2 1/1] package/swipl: new package
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

Hello,

On Tue, 06 Aug 2024 21:33:00 +0200
Julien Olivain <ju.o@free.fr> wrote:

> The test files from my original submission at:
> https://patchwork.ozlabs.org/project/buildroot/patch/20240207225100.1320837-1-ju.o@free.fr/
> were not applied.
> 
> Running: utils/get-developers -v
> outputs:
> 
>      WARNING: 'support/testing/tests/package/test_swipl.py' doesn't match 
> any file, line 1966
>      WARNING: 'support/testing/tests/package/test_swipl/' doesn't match 
> any file, line 1967
> 
> Do you want me to resend those?

Sorry, the patch didn't apply, so I applied it manually, and forgot to
git add those files. I just did a separate commit with the test files.
Sorry about that.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
