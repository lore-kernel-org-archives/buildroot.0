Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CD6CE7A9D
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 20:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9598A400E4;
	Thu,  5 Sep 2024 20:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKDy26LVbr0Q; Thu,  5 Sep 2024 20:44:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CE7640391
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CE7640391;
	Thu,  5 Sep 2024 20:44:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E66E31BF41B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D30C240391
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t-_d2Yl0GoU7 for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 20:44:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9684B400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9684B400E4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9684B400E4
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 20:44:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FF4140002;
 Thu,  5 Sep 2024 20:44:18 +0000 (UTC)
Date: Thu, 5 Sep 2024 22:44:17 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240905224417.2a324773@windsurf>
In-Reply-To: <87a5gmk52y.fsf@dell.be.48ers.dk>
References: <20240904053701.53995-1-bernd@kuhls.net>
 <87a5gmk52y.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725569058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/VHefP7vlEuhu1z9yLUXa38UYI8UX1dS++zDyRPVig=;
 b=o6Zn/Tqxajt2frjOKGVvkDvOZcp72UodKkUh2lGF1+c0+BqiSVYPCipUvf5sliVLkzMFlb
 /biC9kTCHekT2fx/vKEebjMsuNFjIuN29E7bvlYfKiHRxQ0vmEzWuSQyv1v7XH9QfeOP7B
 n/XKfi/xyaF2RSHMeXg+AMp9Fx/OuuNURIDpO0Z9T5PgKWicUcTQGGYcPLf8QjZOgF7msE
 02hQQy6P0fKko4bAf/ZgYV1/qz+eIA46f9LvzK3lzfGczpZe8dbU/Y4n8ScUvjcia1/Mjd
 u75em5/55WEZadDAkknid3KOjWrwi/QjKOWz+6ObL8MTOUJtzrLOeR5m0ojatg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o6Zn/Tqx
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump
 version to 3.3.2
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 05 Sep 2024 08:05:57 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> I sent a similar patch Tuesday, but it apparently hasn't made it to the
> list yet.

It was on the list and in patchwork. So I marked your older patch as
not applicable.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
