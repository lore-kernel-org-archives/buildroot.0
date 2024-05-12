Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C38C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 07:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98FCD4010C;
	Sun, 12 May 2024 07:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YkDgIGpdxwUl; Sun, 12 May 2024 07:04:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A78EF401CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A78EF401CC;
	Sun, 12 May 2024 07:04:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A40DF1BF473
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D5E183E2B
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:04:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9lhw41ilBRNl for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 07:04:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8A06283E29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A06283E29
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A06283E29
 for <buildroot@buildroot.org>; Sun, 12 May 2024 07:04:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E695C40002;
 Sun, 12 May 2024 07:04:46 +0000 (UTC)
Date: Sun, 12 May 2024 09:04:45 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240512090445.3dbec308@windsurf>
In-Reply-To: <20240511161133.2625893-1-peter@korsgaard.com>
References: <20240511161133.2625893-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715497487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bcsGUuWVum6Ovd5XcuMlbY7wod+0mBBZH4nhy4oyxzg=;
 b=WiQsi+0vgriRcmhWWlWL8Oim53hszt5PKK+9BdbIwTa9WrH81Zr+oNnXsMeI/6RwOWmL34
 DL4UHE0cqayiIayJm510StgqdiJdP9TGNrXJyKDns6vA87YIEs0vLB4sYemWxjkzyL+CrD
 +nLilMGYMEVD/tpzjGtuoqYnjKu0b2w6Fb29mQuKvLFJWKxJ3IcbSyUhopD8PB/F3xqkiF
 W3G0G80zJXrpSlHpz4MCjnRXoUIVnley9nfHdEY1uRTXQ8UkxCDMnrKTOf4B9s4TVI9dxp
 LO8FFtOOrg7Xu+CPOqDbGtI5I6ibJNr7R/R28kcmMAUs+thSUK7l3je6gdTQ5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WiQsi+0v
Subject: Re: [Buildroot] [PATCH]
 support/testing/tests/package/test_python_hid.py: drop unneeded explicit
 hidapi package
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

On Sat, 11 May 2024 18:11:33 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> The python-hid package got tweaked when applied in commit 4432b087902
> (package/python-hid: new package) so it now select BR2_PACKAGE_HIDAPI, and
> we therefore do not need to explicitly enably hidapi in the test.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  support/testing/tests/package/test_python_hid.py | 1 -
>  1 file changed, 1 deletion(-)

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
