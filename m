Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1885BEE49A5
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 20:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 898C34167B;
	Tue, 22 Aug 2023 20:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 898C34167B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKNC5FhbhSR5; Tue, 22 Aug 2023 20:35:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81371414D6;
	Tue, 22 Aug 2023 20:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81371414D6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E5421BF33D
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1961414D6
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1961414D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S5rYy-49kojg for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 20:35:50 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F58B40855
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 20:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F58B40855
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9A79E0004;
 Tue, 22 Aug 2023 20:35:47 +0000 (UTC)
Date: Tue, 22 Aug 2023 22:35:46 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230822223546.46d9ba7e@windsurf>
In-Reply-To: <f2414860dfc205f44efba3d43cdddedb@free.fr>
References: <20230822192315.8180-1-ju.o@free.fr>
 <20230822213539.331878ec@windsurf>
 <f2414860dfc205f44efba3d43cdddedb@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692736547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g7P5fggUOdlReY9saLYXNlSObYjHBJtA9dnJRs7eepw=;
 b=Ai0OaLdmNBSPyoniZ/5Cg3f/GgdKF+0w99sSvMBkHssTADOW2ZHisXqRpghp/Km51qTF2+
 XimUvbF/nSzNW+HBQWSMNU6x7zudXxl+afWr4RnO+opcbyh6UQ//vog+fh5fqcoJkyQQjA
 quymA3VOAx7I1aUH5iLmcJ5QJTN2FLeAuGmrEaXCriUZqrOPnMpGg0HFjW6MqCcZptoDJq
 Li4Gzke09sApQqit88W3lXhghW6u3XYJQCq69mc75ukhG4esEVEY+3xHERyx+spTQ1J2Qu
 F/lZZ0ArNkdlcE9RX2lSYWqy78PpjmHfYDPLnVYPoumc0CVrHluY+0hLkqVw/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ai0OaLdm
Subject: Re: [Buildroot] [PATCH next 1/1] package/kexec: fix link error when
 BR2_OPTIMIZE_0=y
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

On Tue, 22 Aug 2023 22:08:32 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This could indeed go into the master branch. Since 2023.08-rc2 was
> already tagged, I imagined only major fixes would go into master.
> This one has been longstanding issue (so apparently not so important).
> 
> In fact, reading the Buildroot documentation release engineering at [1]
> does really allow me to decide what kind of commits (security, bugfixes,
> new features, minor improvements like typos) should go to master/next.
> 
> Recently, I had the same interpretation in [2] that a minor improvement
> (in which nothing was actually broken) should go to next. Yann preferred
> master.
> 
> If you summarize those situations, I would be happy to propose a doc
> improvement.

Essentially, the idea after -rc1 is to stop applying version bumps and
major changes in master so that master progressively converges to
something "stable" that we can release. So, we can still merge
improvements and fixes to master. As such, the build fix for kexec
definitely qualifies. The license file improvement for lsof that you
pointed also qualifies: it's an improvement, very low risk. Of course,
there's always a grey area, even for version bumps: sometimes we take a
version bump in master because it fixes security issues. Sometimes we
prefer to backport the patch fixing the security issue rather than
bumping when the number of other changes that take place with the
version bump is too large.

Does that help? :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
