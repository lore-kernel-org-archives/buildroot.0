Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AB9C41513
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 15:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 342B5400B6;
	Wed, 15 May 2024 15:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSkiMxkfjClv; Wed, 15 May 2024 15:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1274A4012F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1274A4012F;
	Wed, 15 May 2024 15:28:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC1881BF841
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 15:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8FF96069E
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 15:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hrs3sDbjQ6Pb for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 15:28:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6535E6062B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6535E6062B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6535E6062B
 for <buildroot@buildroot.org>; Wed, 15 May 2024 15:28:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40E3A1C0006;
 Wed, 15 May 2024 15:28:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s7GYG-001ZFi-25;
 Wed, 15 May 2024 17:28:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
References: <20240330212200.794927-1-aladyshev22@gmail.com>
Date: Wed, 15 May 2024 17:28:20 +0200
In-Reply-To: <20240330212200.794927-1-aladyshev22@gmail.com> (Konstantin
 Aladyshev's message of "Sun, 31 Mar 2024 00:22:00 +0300")
Message-ID: <878r0bqeln.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] configs/pc_x86_64_{bios,
 efi}_defconfig: add wireless regdb
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Konstantin" == Konstantin Aladyshev <aladyshev22@gmail.com> writes:

 > Wireless regulatory database lists the allowed radio frequencies for
 > each local jurisdiction. Since linux-4.15 the kernel supports loading
 > the files regulatory.db/regulatory.db.p7s directly from the
 > /lib/firmware directory. Currently this package is not enabled and
 > kernel complains with the following message on every boot:
 > """
 > platform regulatory.0: Direct firmware load for regulatory.db failed
 > with error -2
 > cfg80211: failed to load regulatory.db
 > """
 > Add wireless regulatory database package to fix the issue.

 > Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
