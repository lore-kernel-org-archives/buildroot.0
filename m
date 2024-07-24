Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD55C3DA63
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 16:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2382140DE9;
	Wed, 24 Jul 2024 16:30:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5q6ouS-RyHmx; Wed, 24 Jul 2024 16:30:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D546F40DF2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D546F40DF2;
	Wed, 24 Jul 2024 16:29:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 86FA11BF29C
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73DB3401C2
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uIAO2xsK4lRw for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 16:29:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 25F3A402F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25F3A402F2
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25F3A402F2
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 16:29:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6D9960006;
 Wed, 24 Jul 2024 16:29:52 +0000 (UTC)
Date: Wed, 24 Jul 2024 18:29:52 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240724182952.0cc67c18@windsurf>
In-Reply-To: <20240724085302.1821942-1-fontaine.fabrice@gmail.com>
References: <20240724085302.1821942-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721838593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LekYJBBU5UNUbFALPt8vSm1ijVelOkJH2VHWXmF6p3U=;
 b=kCyxk472BlBr1HebfutG0JAbSLxiSJ70cmPBLdZmEdxpCxlfTnBjLMwRk35IspzsQFzgYk
 q3DYStttmbHOeLm29oBAhakvyQmG0W+KpuG8l8fDY9p3Hs1mP+XZvEhYW0MT/b9ClBC1Gm
 dn65uEByXlKO1EzDwrwR+W9xXH8A6VMsO/Yxrb5M85hTXrYa/9//ezw06ALexl3Sw1rcal
 W7QCacnmgEW/OOS4F7UIrE/QZO818GbZ7ZyabRgj3Y9QBf7f5jWXeTRxmLeZ2WAO5kh0wj
 hs4vWA1/lIcev7RhaFHwPBO5zgeEpfXF+4giBBmYDlpPY/HBmYanymytj/8X6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kCyxk472
Subject: Re: [Buildroot] [PATCH 1/1] package/btrfs-progs: don't install host
 udev files
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

On Wed, 24 Jul 2024 10:53:02 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Pass an empty value for udevdir to avoid the following host build
> failure on one of the autobuilders:
> 
> /usr/bin/install -c -m755 -d /usr/lib/udev/rules.d
> /usr/bin/install -c -m644 64-btrfs-dm.rules 64-btrfs-zoned.rules /usr/lib/udev/rules.d
> /usr/bin/install: cannot create regular file '/usr/lib/udev/rules.d/64-btrfs-dm.rules': Permission denied
> /usr/bin/install: cannot create regular file '/usr/lib/udev/rules.d/64-btrfs-zoned.rules': Permission denied
> 
> This build failure can be raised since the addition of the host variant
> in commit ed69859a7261ee86e71aa666d30a28e374769e15. udev rules were
> added by upstream in 2016 by
> https://github.com/kdave/btrfs-progs/commit/62c0666378eb70285b6a3052bf4144d2132a5891
> 
> Fixes: ed69859a7261ee86e71aa666d30a28e374769e15
>  - http://autobuild.buildroot.org/results/c46238afe8d23cf4bff4e7290a5eaebd0640eb6e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/btrfs-progs/btrfs-progs.mk | 2 ++
>  1 file changed, 2 insertions(+)

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
