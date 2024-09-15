Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE99C35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 08:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A5F981C40;
	Sun, 15 Sep 2024 08:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBmB0rEe7kfX; Sun, 15 Sep 2024 08:08:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3091C81DED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3091C81DED;
	Sun, 15 Sep 2024 08:08:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6DBA1BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B59FC4028E
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hnJIUk4g2RQe for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 08:08:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5D86740136
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D86740136
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D86740136
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 08:08:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E58DA20002;
 Sun, 15 Sep 2024 08:08:53 +0000 (UTC)
Date: Sun, 15 Sep 2024 10:08:52 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240915100852.6cfe5116@windsurf>
In-Reply-To: <20240915044131.1398816-1-james.hilliard1@gmail.com>
References: <20240915044131.1398816-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726387734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DcTKBB5EEfAl98FCgpYpE4S5Dq6UPKMj4SBzN/K2eHo=;
 b=fLRownDtL/ikqd0IwcJTOg7ejmimWXbvbDRtzIhYKHHUAYrPgMmi0de0EtvDUrL0twWzKn
 N1CzHYDs2gAbYr3OSsmWHCxT5Q1sn8u2zXiUgEnzrO6GeTPdnkfdYtglLa6vh5eRGzNK9d
 RD3j2+rviV3NkYWKDbj0CnTahuxl5eoCPEbqzz43z52CalQv6TTGqdY2QqWpvXqrBv5uZS
 wvQSyHp5IWsIVtycU0WlbLYztqcgXB8iUoZJTCwM5V3ZGDEBW85qTZdyL87mxNw+OIjKFq
 +fbObvxmP2T5p/40I+rCUxkjDQMJfiITFpdhD+tQnubss/tF6a2SQ0gEWmfvGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fLRownDt
Subject: Re: [Buildroot] [PATCH 1/1] package/python-daphne: bump to version
 4.1.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Sep 2024 22:41:31 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop remove pytest runner patch and instead pass
> --skip-dependency-check build option.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...001-remove-pytest-runner-requirement.patch | 27 -------------------
>  package/python-daphne/python-daphne.hash      |  4 +--
>  package/python-daphne/python-daphne.mk        |  5 ++--
>  3 files changed, 5 insertions(+), 31 deletions(-)
>  delete mode 100644 package/python-daphne/0001-remove-pytest-runner-requirement.patch

On this one you had forgotten to update .checkpackageignore to drop the
reference to the patch being removed. Suggestion: use
https://paste.ack.tf/bbebd2 as your .git/hooks/post-commit to catch
this kind of minor thing.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
