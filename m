Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E86C3DA63
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 20:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D89D240E2F;
	Wed, 24 Jul 2024 20:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k0mJvTCg3WOS; Wed, 24 Jul 2024 20:04:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69ECC40E1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69ECC40E1C;
	Wed, 24 Jul 2024 20:04:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A92B1BF2C8
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 20:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 330248083D
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 20:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqyG9dls0jCR for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 20:03:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD6B781589
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD6B781589
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD6B781589
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 20:03:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A5031BF203;
 Wed, 24 Jul 2024 20:03:49 +0000 (UTC)
Date: Wed, 24 Jul 2024 22:03:48 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240724220348.1b755d53@windsurf>
In-Reply-To: <20240724110126.2133196-1-fontaine.fabrice@gmail.com>
References: <20240724110126.2133196-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721851429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8D7AZQdZnP5UUgt5+Gg3b6OFihHZoe17Gyw7GJekwjM=;
 b=dPl3Fp65UW5BfG+zqxLts1acZBwYbxFmkRmYAcK88mG7Av6r0LZVDQ6EcMtkH7BlyeqtgJ
 sYFz5o8Hdwuxsmf2Q/imFFZaFg0Z6NPYlhtlUEaDAlw3/LQC07pSIX0DfzDjc3zl5ZSACw
 FTAidJNkMfRwivMAHznlY7Kx1r5RFzGMYV/P9xFFJpau3JF1vrlTlhEFuR+CvZ/pjQj7Wg
 dBW+PL8ol5HQHAKzsWjHgvrzTvr3p7YR4b4DUvMOPhiIT6a7mG/wzl0L5cMS2Zx9pVhwTX
 Z2VDjYmu4wbnjPDCrtoTk/bg/bjUWwqgm/o0vmhgHg6Sc/tna+wGESBDum+aqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dPl3Fp65
Subject: Re: [Buildroot] [PATCH 1/1] package/can-utils: fix build with gcc
 >= 14
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

On Wed, 24 Jul 2024 13:01:26 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc >= 14:
> 
> j1939acd.c: In function 'main':
> j1939acd.c:489:38: error: passing argument 1 of 'asprintf' from incompatible pointer type [-Wincompatible-pointer-types]
>   489 |                         if (asprintf(&program_invocation_name, "%s.%s",
>       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
>       |                                      |
>       |                                      const char **
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1e2a533a936624249cd79d34983c889c3c4c2e3b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...y-poption-prefix-to-use-when-logging.patch | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 package/can-utils/0002-j1939acd-remove-legacy-poption-prefix-to-use-when-logging.patch

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
