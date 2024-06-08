Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486D2C27C6E
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 07:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 069EA40889;
	Sat,  8 Jun 2024 07:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 263Zvy1N5CVH; Sat,  8 Jun 2024 07:09:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABD2F40915
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABD2F40915;
	Sat,  8 Jun 2024 07:09:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 81CDE1BF422
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F4D860662
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmEg7_SUpmm0 for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 07:09:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B77F60747
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B77F60747
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B77F60747
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 07:09:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C80A60004;
 Sat,  8 Jun 2024 07:09:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFqCT-00GEK8-2Y;
 Sat, 08 Jun 2024 09:09:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
References: <20240310104807.10227-1-kilian.zinnecker@mail.de>
Date: Sat, 08 Jun 2024 09:09:17 +0200
In-Reply-To: <20240310104807.10227-1-kilian.zinnecker@mail.de> (Kilian
 Zinnecker via buildroot's message of "Sun, 10 Mar 2024 11:48:07
 +0100")
Message-ID: <878qzfc3mq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] configs/rock5b: Remove futile unsetting of
 rock5b_defconfig param
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Kilian" == Kilian Zinnecker via buildroot <buildroot@buildroot.org> writes:

 > The rock5b_defconfig contained a
 > "# BR2BR2_LINUX_KERNEL_INTREE_DTS_NAME is not set" line. This
 > caused check-dotconfig.py to throw a warning in the buildroot CI,
 > because the explicit unsetting of the parameter is not taken on in
 > the actual dotconfig, but instead the dotconfig will contain the
 > line 'BR2BR2_LINUX_KERNEL_INTREE_DTS_NAME=""'.

 > This patch removes the parameter from the rock5b_defconfig. The
 > resulting dotconfig from the original rock5b_defconfig and the
 > rock5b_defconfig without the parameter is identical, but the
 > check-dotconfig.py does not throw a warning anymore.

 > Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
