Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42547C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 11:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EA1680D5C;
	Mon, 19 Aug 2024 11:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JRkkhRKochHp; Mon, 19 Aug 2024 11:08:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2647F80E0B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2647F80E0B;
	Mon, 19 Aug 2024 11:08:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2506F1BF3DF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2168F60684
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7EUZ-lJxUULp for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 11:08:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CE5216066E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE5216066E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE5216066E
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 11:08:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25EA660005;
 Mon, 19 Aug 2024 11:08:25 +0000 (UTC)
Date: Mon, 19 Aug 2024 13:08:24 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240819130824.57c4c10a@windsurf>
In-Reply-To: <ZsIK7ZE/nzzxu4ab@waldemar-brodkorb.de>
References: <ZsIK7ZE/nzzxu4ab@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724065705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2d8O+w8vR68A1wPjLatu76gtbHcHcbUgMCPUejZkMQ=;
 b=eKBAr2cJOOC4JB1JwGb/WDmr1WX6jzv9XbICfNvGpmSsOaFgVuA8NhyqAeHLc1ll0oQ1GN
 /7rcgBfbxcOvMKvos/iJdo8PGwS1YWoAeT5XLIAQP38qhcdQ+G2AcRjmVEcaVBUO2q7pA/
 G/dzTzNyzaK5bb9jAcCJq0CbVk8fjzg8Tl+p3sW2wnAfwhtQi5021Al5TwDE7zmEgFahGC
 MjNuWoMtYQ3iqhoRlrH9GzZ5nFVqqj3/qD57FXhqD+Vm82EChdL2wpBYTum1mvAV6IJUNC
 YXyjrgLITqbgeAwgzMdEvlVb68xyxskitvrzoPDJD5YmOeWY3B1hsKrwb1g8rQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eKBAr2cJ
Subject: Re: [Buildroot] [PATCH next] package/libssh: update to 0.11.0
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

On Sun, 18 Aug 2024 16:53:33 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> For a changelog see here:
> https://www.libssh.org/2024/08/08/libssh-0-11-0-release/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/libssh/libssh.hash | 6 +++---
>  package/libssh/libssh.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
