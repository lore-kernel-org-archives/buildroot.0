Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A07DC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 10:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5916680573;
	Mon, 19 Aug 2024 10:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17kYgBNLsf75; Mon, 19 Aug 2024 10:48:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D78080EC0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D78080EC0;
	Mon, 19 Aug 2024 10:48:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6123C1BF39D
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 10:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D3D0404F9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 10:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iEpHOHgxgMWV for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 10:48:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B4ED40444
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B4ED40444
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B4ED40444
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 10:48:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06B971C0007;
 Mon, 19 Aug 2024 10:48:51 +0000 (UTC)
Date: Mon, 19 Aug 2024 12:48:51 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240819124851.0462e835@windsurf>
In-Reply-To: <ZsMUGMbnR2mwtwj6@waldemar-brodkorb.de>
References: <ZsMUGMbnR2mwtwj6@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724064532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xyZ1ShzF3jD2AwSKnwWZc9rk3sklkHR3bO/WBEXkNmQ=;
 b=IPZ7q4mj+RZu013W3O16p6rIvATFUgxc6Yr8afDhcPKS8dufpL32rQe+QINYfk/Ql6CxHk
 E1GuJi7wEZR21iS+/K+J24wQNnkAt5uRcaE3/AHz4aIh0FdIpGUHJkhl286EdY6Y/iGERg
 3KcUH/53Nwo9PKF0AgPH1vAm39Rnp7wZa+todKnBILkvfVOCw7F6MGdHuTgoHZUrSYRNQs
 HY/mXfLdIoR11dqMYV6qD1rbwRXrZuaPkLSHxnXHxbyEoym+2W9/KX4pRTg63noM+NaXWk
 ivTWbK6sTpHiUsz6HjiFk56Jl15POLVZGHJ0903CmHyQWAlQdYvURcDpzi1+8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IPZ7q4mj
Subject: Re: [Buildroot] [PATCH] package/botan: needs thread support
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

On Mon, 19 Aug 2024 11:44:56 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Botan commit 313e439c786d68bcf374b2cb0edfe3ffd891db94 added a
> dependency to pthread.h. Add a dependency to thread support.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/205/205d7505803990508bbd545393902789063ababd
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/botan/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

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
