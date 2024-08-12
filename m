Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11977C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B826D80E68;
	Mon, 12 Aug 2024 20:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58v369fth79i; Mon, 12 Aug 2024 20:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B92CE80EF1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B92CE80EF1;
	Mon, 12 Aug 2024 20:46:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A52351BF344
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91CC9400B5
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:46:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5D6QAFh9FcVq for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:46:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 41866400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41866400B8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41866400B8
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 20:46:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47040240003;
 Mon, 12 Aug 2024 20:46:24 +0000 (UTC)
Date: Mon, 12 Aug 2024 22:46:23 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240812224623.709e6a8b@windsurf>
In-Reply-To: <20240810173834.613800-1-bernd@kuhls.net>
References: <20240810173834.613800-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723495584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQ5/mBvexrSlt6SIDyNfT7Xrvd9CL0LJFuqhx6g+ccQ=;
 b=FafKeck03Fhv0w84iqlJ/AchLrueqrQK0PTUnvc6cmFheLIW+tnFUA+SefMTwlAO8JHY8S
 DNAFQ1e6IrwzOiOO9i3T49ipgfzXT1I/lqCL58u1ZGwfKAGaSWo/IlB1VC38NvgsbUYASO
 0Dl5gYPq3HmtxN7kkgDw7UQwUSKEAeLUgT4c7VqhwXUjxifY7qJgoCT9yDCQqXHcVaWrKT
 TiNff9jiyNqhE8bCsr9ipmw6QXW94BfP2jEJk9LyKTK/UzZqt/w2IUszuYi7MjfC/aFtLu
 VnfzCFXsDMEq8WSaHW2Xk8gTvY2nLPSay/DSJDWnwtLLFvTTgXhAa1buuPYfKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FafKeck0
Subject: Re: [Buildroot] [PATCH 1/1] package/iperf3: security bump to
 version 3.17.1
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

On Sat, 10 Aug 2024 19:38:34 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed patch which is included in this release, autoreconf is not needed
> anymore.
> 
> Updated license hash due to copyright year bump:
> https://github.com/esnet/iperf/commit/7b947051d5192388dfa8a18989692e7af4226c62
> 
> Fixes CVE-2024-26306.
> 
> Release notes:
> https://github.com/esnet/iperf/releases/tag/3.17.1
> https://github.com/esnet/iperf/releases/tag/3.17
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...1-Check-and-link-libatomic-if-needed.patch | 42 -------------------
>  package/iperf3/iperf3.hash                    |  6 +--
>  package/iperf3/iperf3.mk                      |  5 +--
>  3 files changed, 4 insertions(+), 49 deletions(-)
>  delete mode 100644 package/iperf3/0001-Check-and-link-libatomic-if-needed.patch

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
