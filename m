Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855B2CD13D9
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 21:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EC5760632;
	Sat, 31 Aug 2024 21:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSYk-A75EVvr; Sat, 31 Aug 2024 21:48:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6358360639
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6358360639;
	Sat, 31 Aug 2024 21:48:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92A6A1BF588
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 21:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6947340D67
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 21:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fZi8VnD66Ha for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 21:48:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 706CC4199F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 706CC4199F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 706CC4199F
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 21:48:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C667FC0002;
 Sat, 31 Aug 2024 21:48:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1skVwx-00GofY-0M;
 Sat, 31 Aug 2024 23:48:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Martin Wetterwald <martin@wetterwald.eu>
References: <20240725173709.1087549-1-martin@wetterwald.eu>
Date: Sat, 31 Aug 2024 23:48:03 +0200
In-Reply-To: <20240725173709.1087549-1-martin@wetterwald.eu> (Martin
 Wetterwald's message of "Thu, 25 Jul 2024 19:37:09 +0200")
Message-ID: <87msksuzxo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/tinysshd: Fix static-only build
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
Cc: Vadim Kochan <vadim4j@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Martin" == Martin Wetterwald <martin@wetterwald.eu> writes:

 > When using BR2_STATIC_LIBS=y, tinysshd's build was successful, but the
 > binary didn't work on the final target: this is because a dynamically
 > linked ELF was produced, on a target having no dynamic loader at all.

 > Using $(TARGET_CONFIGURE_OPTS) propagates all the options and not only
 > "CC", resulting in a correct static binary able to run on the target.

 > Without the patch:

 >> tinysshd: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV),
 >> dynamically linked, interpreter /lib/ld-musl-armhf.so.1, stripped

 > With the patch:

 >> tinysshd: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV),
 >> statically linked, stripped

 > Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
