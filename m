Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DF6C83F10
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 11:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A4328226E;
	Thu, 31 Aug 2023 11:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A4328226E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UFpjVyO99u58; Thu, 31 Aug 2023 11:05:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9973181F9A;
	Thu, 31 Aug 2023 11:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9973181F9A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EED61BF3AE
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 11:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04A4640936
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 11:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04A4640936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WCKM5UkOb4Bw for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 11:05:07 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8645740897
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 11:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8645740897
Received: by mail.gandi.net (Postfix) with ESMTPSA id 183F41BF20A;
 Thu, 31 Aug 2023 11:05:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qbfTz-000gJL-1D; Thu, 31 Aug 2023 13:05:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@aperture.us>
References: <20230801204830.175727-1-christian@aperture.us>
Date: Thu, 31 Aug 2023 13:05:02 +0200
In-Reply-To: <20230801204830.175727-1-christian@aperture.us> (Christian
 Stewart's message of "Tue, 1 Aug 2023 13:48:30 -0700")
Message-ID: <87r0njmq01.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump to v1.20.7
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Christian" == Christian Stewart <christian@aperture.us> writes:

 > go1.20.7 (released 2023-08-01) includes a security fix to the crypto/tls
 > package, as well as bug fixes to the assembler and the compiler.

 > Fixes CVE-2023-29409: restrict RSA keys in certificates to <= 8192 bits

 > Extremely large RSA keys in certificate chains can cause a client/server to
 > expend significant CPU time verifying signatures. Limit this by restricting the
 > size of RSA keys transmitted during handshakes to <= 8192 bits.

 > Based on a survey of publicly trusted RSA keys, there are currently only three
 > certificates in circulation with keys larger than this, and all three appear to
 > be test certificates that are not actively deployed. It is possible there are
 > larger keys in use in private PKIs, but we target the web PKI, so causing
 > breakage here in the interests of increasing the default safety of users of
 > crypto/tls seems reasonable.

 > https://go.dev/doc/devel/release#go1.20.7

 > Signed-off-by: Christian Stewart <christian@aperture.us>

For 2023.02.x and 2023.05.x I have instead bumped to 1.19.12, which
contains the same fix.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
