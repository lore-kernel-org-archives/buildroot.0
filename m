Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C440C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 21:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62DA0605E1;
	Wed,  7 Aug 2024 21:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYuHZD4zfumQ; Wed,  7 Aug 2024 21:20:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FF826061D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FF826061D;
	Wed,  7 Aug 2024 21:20:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFC3E1BF2CA
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 21:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD774401A1
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 21:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4IaHKIFnIov for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 21:20:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 51A2240BAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51A2240BAE
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51A2240BAE
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 21:20:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C1B6240005;
 Wed,  7 Aug 2024 21:20:17 +0000 (UTC)
Date: Wed, 7 Aug 2024 23:20:16 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240807232016.6ea6cd1e@windsurf>
In-Reply-To: <e238dc68395d1c1cf415d9f133dae262@free.fr>
References: <20240615091612.9579-1-ju.o@free.fr> <Zm3Y7Fd-Zpga_LAv@landeda>
 <bad5f692bff295e22fdebc46c043a661@free.fr>
 <20240807213558.4abc7e85@windsurf>
 <e238dc68395d1c1cf415d9f133dae262@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723065617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6qSe7z4QnPpudXjVn3fgSxp1HRahaQ/NjFuSwtg9k5A=;
 b=XSKQEeHQ3cOc7yDORDKotkKv6Vsm6Una+2AlIiG5x+cteRIG2Ui82zwJL/46W1NmeVTHwe
 l2nHjssNQapfwTCHvgc8r2LZkMEC0T0JPgJgxcGkzP4zV1fcY3f9OhdIhYv1Bhl9FWLr7Z
 3lWgr2S5bO5bnl6VQl5o12iIH34dWF35x9MS/2A9gIJQSECCGKQaxTEzmriJDqqPAw68Mi
 MsXgqfXw/j2XrNRVKxUqIb+M4G4AWOwWZCQKE790XVFENGh5bQdw1DsgByGP2D/KKvM8A4
 UsMvB2JSmv687iNSjKk8iKqTJ7t5FMO5QZMBQb17H2KlGVqV5gv3c/fSz8Dq6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XSKQEeHQ
Subject: Re: [Buildroot] [PATCH 1/2] support/testing:
 test_audio_codec_base.py: new helper class
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 07 Aug 2024 23:09:00 +0200
Julien Olivain <ju.o@free.fr> wrote:

> I think the reason the test gets registered many times is because the
> "abstract" class contains a test_run() function. The way nose2 scans
> for test will search in all the class hierarchy. The only way to
> prevent that for now is the __test__ = False.
> 
> We can see the selection of test if we add debug in nose2 discovery:
> 
>      nose2.discover(argv=[script_path,
>                           "-s", test_dir,
>                           "-v",
>                           "--collect-only",
>                           "--log-level", "debug"],
>                     plugins=["nose2.plugins.collect"])
> 
> in support/testing/run-tests, and invoking with "run-tests -l".
> 
> The reason I've put a test_run() function in the abstract class is 
> because
> I would like to keep the same test sequence for all those audio tests.

Right, and I think it makes sense.

> Maybe nose2 discovery should not recurse in the class hierarchy? The 
> only
> way I to prevent that would be to modify the loader at:
> https://github.com/nose-devs/nose2/blob/main/nose2/plugins/loader/discovery.py
> 
> Would you like me to propose a change of this nose2 behavior?

No strong opinion. I'm not particularly attached to nose2. I think
someone mentioned pytest as an alternative?

I don't know if nose2 is still actively developed, if it makes sense to
"invest" in this compared to some other solutions.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
