Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB08C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A400408D8;
	Sat,  5 Nov 2022 22:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A400408D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZR5oQItVSDha; Sat,  5 Nov 2022 22:37:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 639DB408C8;
	Sat,  5 Nov 2022 22:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 639DB408C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80C591BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C44060671
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C44060671
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V-xjBAp90exD for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:37:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49AB060670
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49AB060670
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:37:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7E75B1BF209;
 Sat,  5 Nov 2022 22:37:28 +0000 (UTC)
Date: Sat, 5 Nov 2022 23:37:27 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221105233727.390030d2@windsurf>
In-Reply-To: <20221105135618.322293-1-fontaine.fabrice@gmail.com>
References: <20221105135618.322293-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667687848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OCnNbFX98uENqPqCue6nOq7BLkbfPzJNX1L2HZrucSI=;
 b=Qr00fsZfENKrQuvdyGTKSWwDJXbSVRSjyQBMyjDaE40Euvwp/8KL/XaG1Da+EoEAXAbsyA
 s5MtcwpHa24hD4JRcLkRnSkj8jkFMkoS/dfbek0/k7gKpowoD438Z5StGT0WoJHr84vAhG
 NQI+rlgNAswmJ0xGojQccaM8w+f3WCipqqZyiuugRMyUJYt1jtnQdCSl9Esv7E7Quxn8dG
 kmYJQHbFrgKX1quDLeQwOrxYLF5/BbQFPn9JIxvxEZZ1WjBsPdsLbTKBWvK5fb/xgpFyjo
 QixxXZLZTGvZM+F1N3H++LzobzDePgWPFIJP47g0u3eQezc0h5QiaG02BzK9og==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Qr00fsZf
Subject: Re: [Buildroot] [PATCH 1/1] package/libuhttpd: fix build with
 wolfssl >= 5.0
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  5 Nov 2022 14:56:18 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with wolfssl raised since bump to
> version 5.2.0 in commit 14e0c4de719a0d63192cc5de66a608f75297f37d and
> https://github.com/wolfSSL/wolfssl/commit/33cb8231481d5beb46b57511c2630aba36028256:
> 
> /home/buildroot/autobuild/instance-0/output-1/build/libuhttpd-3.14.1/src/ssl/openssl.c: In function 'handle_wolfssl_asn_error':
> /home/buildroot/autobuild/instance-0/output-1/build/libuhttpd-3.14.1/src/ssl/openssl.c:339:10: error: 'ASN_NTRU_KEY_E' undeclared (first use in this function); did you mean 'ASN_ECC_KEY_E'?
>   339 |     case ASN_NTRU_KEY_E:
>       |          ^~~~~~~~~~~~~~
>       |          ASN_ECC_KEY_E
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3261b0035c8aadd1b62538b53e03af1cd8a7b312
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-add-compatibility-for-wolfssl-5-0.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch

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
