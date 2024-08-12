Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E65EC52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 19:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06EA3606DC;
	Mon, 12 Aug 2024 19:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iujCq9KY607N; Mon, 12 Aug 2024 19:27:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E03E60703
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E03E60703;
	Mon, 12 Aug 2024 19:27:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 88BED1BF59A
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 19:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7627B60703
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 19:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ywIE_o0_yBW7 for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 19:27:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 362AA606DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 362AA606DC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 362AA606DC
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 19:27:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D3B7E0005;
 Mon, 12 Aug 2024 19:27:12 +0000 (UTC)
Date: Mon, 12 Aug 2024 21:27:12 +0200
To: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Message-ID: <20240812212712.43bdd20a@windsurf>
In-Reply-To: <20240728115817.743185-1-dm.chestnykh@gmail.com>
References: <20240728115817.743185-1-dm.chestnykh@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723490833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=svd/7N7stc7N542LqPSAlPz3WWYbEDQ9rwKrYp6BYfo=;
 b=Higklb7m8U65oG3hdlFD9i9p3aItAKMi2dyiW1pZmHKQFJxKG8HJ/eqBkiYHBpEFrtx16T
 OjCKgZN93m4gqCvhfOxY05A0yLCFeKFQlUfne7FtC45we4a9ar/DFTtOiqH/mrg1iF6BNZ
 97SeA50SKNhm8PI/WsTD7StZQFfjMYr/c7SQSpMHFwvV4x9nmhu3KcTwro0igST8gslMsN
 id3BlGonAeIRiRWpXElIM8yIcGduCp6c2g+lFR0qUNPi7p/XtuGxRHT9gqP5c/G3SpAc3u
 VQN4YjzJFMsvhPBLZZB8nyBlDJCFLk5isPYzRPSFVhogfgf98HGnk16GjhiMLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Higklb7m
Subject: Re: [Buildroot] [PATCH] package/uclibc: Fix ARC build with 4.x
 kernel headers
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

Hello Dmitry,

On Sun, 28 Jul 2024 14:58:17 +0300
Dmitry Chestnykh <dm.chestnykh@gmail.com> wrote:

> Provide correct grouping for preprocessor
> conditions to avoid building ld.so with
> undefined macroses which are in use
> 
> Fixes
>   package/uclibc/0003-Fix-arc-build-with-4.x-kernel-headers.patch

This patch is 0002, not 0003.

> Upstream:
>   https://patchwork.ozlabs.org/project/uclibc-ng/patch/20240728115224.725666-1-dm.chestnykh@gmail.com/

This upstream link had to go within the patch itself.

I fixed both minor issues, and applied to master. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
