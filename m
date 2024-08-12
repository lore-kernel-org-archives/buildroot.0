Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC26EC52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9C0F8136A;
	Mon, 12 Aug 2024 20:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0zx_GyKgCSsX; Mon, 12 Aug 2024 20:23:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBC4B81373
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBC4B81373;
	Mon, 12 Aug 2024 20:23:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A2441BF344
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 845C06081D
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3gTuYC5C4JB for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:23:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6EBE2605AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EBE2605AC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EBE2605AC
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 20:23:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9802720003;
 Mon, 12 Aug 2024 20:23:14 +0000 (UTC)
Date: Mon, 12 Aug 2024 22:23:13 +0200
To: Max Filippov <jcmvbkbc@gmail.com>
Message-ID: <20240812222313.0d04d3cb@windsurf>
In-Reply-To: <20240811000029.1956409-1-jcmvbkbc@gmail.com>
References: <20240811000029.1956409-1-jcmvbkbc@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723494194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qt5625b8gseUW+ikeLD0EfFqjwkdhk5FcvtXOd7ygys=;
 b=HbIkUBrfX3PmHM3JYR85LE+nzZFcpPVQWL4aRbWH8icIUUzD5UycKypo5BhFCJO3KpODdj
 ReyUSU26OMu39GXzfz0k0D64T/tpeDvlGH2IZtX8cXOzgOX9ktEpwnVTddtjLLcKOe1pUv
 T8PGVimKHyIBkJBnT6iDpTvXqovEJzko6itTzoLhNoqf+ynRr0wYD+r4UHj5GWE/A2fPxb
 rWR1MeUeq5LFiISxQmYAFejM3OXcNSyPvvZg9cUcP2l0J3ywGFw0xfysjBDn4N2eTgapyR
 makkgZR01UysnkL8oMPVZiegqbdNUrNzgzId18fGv8lIXxI0bfGec9quo2vWsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HbIkUBrf
Subject: Re: [Buildroot] [PATCH 0/2] package/chicken: pass TARGET_CFLAGS to
 the build system
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 10 Aug 2024 17:00:27 -0700
Max Filippov <jcmvbkbc@gmail.com> wrote:

> Max Filippov (2):
>   Revert "package/chicken: move literals into text section for xtensa
>     architecture"
>   package/chicken: pass TARGET_CFLAGS to the build system

Thanks, both applied to master!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
