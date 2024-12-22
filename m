Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1E2E77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 15:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 911DD60B33;
	Sun, 22 Dec 2024 15:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrV2_v7A0apX; Sun, 22 Dec 2024 15:20:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 819F760BBB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 819F760BBB;
	Sun, 22 Dec 2024 15:20:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 352235E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 15:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F7E841441
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 15:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qyTaj1VYywge for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 15:20:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CFB8D41430
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFB8D41430
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CFB8D41430
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 15:20:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D11EC0002;
 Sun, 22 Dec 2024 15:20:52 +0000 (UTC)
Date: Sun, 22 Dec 2024 16:20:51 +0100
To: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, =?UTF-8?B?TWlxdcOo?=
 =?UTF-8?B?bA==?= Raynal <miquel.raynal@bootlin.com>, Vicente Olivert Riera
 <Vincent.Riera@imgtec.com>, Bernd Kuhls <bernd.kuhls@t-online.de>, Peter
 Seiderer <ps.report@gmx.net>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20241222162051.0a5b0956@windsurf>
In-Reply-To: <20241222-bump_elfutils-v1-1-970cdcc0669a@bootlin.com>
References: <20241222-bump_elfutils-v1-1-970cdcc0669a@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1734880852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hhxRVTSzqTbT+aCApQ/sObCxBF3+gXM03d4qioxHLBk=;
 b=HJIGdsv4mW8FFFLHbGFkApfzk8m68mhqV4ie7yztiyBt0MepMGK/IKMfyQ3Qndve7gORMZ
 Nil/4hzrH35E8lgmokgMmn2omNAROccBw+xFRP3f4s41jFJ0DcOlXgIOTEphvTb0ReScWo
 c/Y9aIkhpdWUqQ+ZocYI1XrXVQWw7fGUjBlUVbt9w7BAc3ezxCKx1YS/JNzUaUNTsZ+oe+
 9lDMb9OYdMZtI+/VWui3TgBBnjn0IZcv/FE2FFH/FOfKwuZxV0b5WsuOM1aAoOQSVhXjqC
 jSTlvfn1sCU1U58NVGNeflyWMHeU0L/zpOiC+eRW6WoJFVlx/92uN8dE+uK24w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HJIGdsv4
Subject: Re: [Buildroot] [PATCH] package/elfutils: bump to version 0.192
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

Hello Thomas,

On Sun, 22 Dec 2024 15:57:23 +0100
Thomas Bonnefille via buildroot <buildroot@buildroot.org> wrote:

> Fixes:
>     https://autobuild.buildroot.org/results/29502fe97a15e4926de7cf129b641505697de9cd/
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Thanks for the fix. However, we need to understand since when this
problem started occurring so we can understand whether the fix needs to
be backported to our stable 2024.02.x branch.

Also, a 0.189 -> 0.192 bump brings quite a lot of other changes. Can we
have a more minimal fix to backport? (And then do the version bump).

When fixing build issues, we're not only concerned about fixing the
build issue, but also about understanding whether it needs to be fixed
in 2024.02.x, which requires providing more details in the commit log
*and* figuring out whether a more minimal solution than a bump is
possible (sometimes the answer is "no", or "yes, but very complicated",
and that's fine).

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
