Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4517DC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 22:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 032DD82026;
	Sat,  4 Nov 2023 22:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 032DD82026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PCYFK0js-Vjp; Sat,  4 Nov 2023 22:22:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 581DA8201E;
	Sat,  4 Nov 2023 22:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 581DA8201E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB4AE1BF2A3
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3FA841960
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3FA841960
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gXqipFBzBgf7 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 22:22:14 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9676F4195F
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 22:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9676F4195F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E6AD240004;
 Sat,  4 Nov 2023 22:22:12 +0000 (UTC)
Date: Sat, 4 Nov 2023 23:22:11 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231104232211.31477d25@windsurf>
In-Reply-To: <20230916141051.326427-1-fontaine.fabrice@gmail.com>
References: <20230916141051.326427-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699136532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fKHT5EoTSiZGYxn3/q6yz4btjgQWcO8a0PmM3kKRG00=;
 b=KinpIwMFqCgedx//HGD+69xnKg6VE2TJQarXMchW3ZzWtG5To6a8HjPr2fNzL9NeN8h8ln
 +bTh+IvwPDDAZCOzgniVO1RZLcshT5GDGbHGCRgBwIjyPlwfc0NwC2pwdNY61VpyCvlc05
 HBRbomOiR1VNy3oqKR2gr4d5+gLvJhv6nFBt0tvL/1vtfx/r48yYeP/799p/lH9itRhlib
 Gd6qp6z1Bf+k/EdvPFgUaMgTCS13dbRARBSHw35GvJYp3u4MIQnM6dtHkuHlnevxxfPZWI
 rqy+TVOTFwSTlKxjz58RkSAV0qzaKQ2hAuIuUvUVz1SGt4bTqr9xLblqGNSVtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KinpIwMF
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-pam: link with -latomic
 when needed
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

On Sat, 16 Sep 2023 16:10:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump to version 1.5.3 in
> commit f8147e27cdac8f998ec6644a09ce4e8d62b6433c and
> https://github.com/linux-pam/linux-pam/commit/a35e092e24ee7632346a0e1b4a203c04d4cd2c62:
> 
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/11.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: .libs/pam_keyinit.o: in function `pam_sm_open_session':
> pam_keyinit.c:(.text+0x824): undefined reference to `__atomic_fetch_add_4'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/52c51b5ad5930ed783b88fb33932297379fd4429
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/linux-pam/linux-pam.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

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
