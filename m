Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25036C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E474740AA9;
	Sun, 11 Feb 2024 15:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qWpW3imP0nfu; Sun, 11 Feb 2024 15:33:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4A4C4059F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4A4C4059F;
	Sun, 11 Feb 2024 15:33:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41D641BF39A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BE824059F
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:33:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3fsOS7WxZueg for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:33:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D296A403A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D296A403A4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D296A403A4
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:33:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF1D320004;
 Sun, 11 Feb 2024 15:32:56 +0000 (UTC)
Date: Sun, 11 Feb 2024 16:32:56 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240211163256.0471a81d@windsurf>
In-Reply-To: <20240209195021.341782-1-fontaine.fabrice@gmail.com>
References: <20240209195021.341782-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707665577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ryv04L8eimL6WNGc7a3IvcoBmZltrd1RD4HA7DU80sY=;
 b=WStKJEqXZGwJQCC/UmwbPRiUguhE0XkLNlV3xA/Ttv3t/XXiIIXNxzk86SasvhX58/yQ0+
 eLHwbTSAwh5k/dOmzVKCBhR3M3VvoCZmIcy200z/NDXYumCfRDLLcX879MThPXASd1KKrF
 thCKsYRKMtErPuS9AYcPBDRuY7QcEbp3N0xnZfqrzRx7/WgSwZGaQSxfDKnC4guWabPvLF
 k4aAkBo6LDvoaCMYM28aZJme8If7daA0yv+8y0cwGqU3yTA3iUT04NYhR0I8EhY8426qGa
 9uFPyY5VPOuDgkakgxpLitX+6H1cVqWgpVMyEo+9ruMapLlTqRn/hCFS28lT1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WStKJEqX
Subject: Re: [Buildroot] [PATCH 1/1] package/rlwrap: needs MMU
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
Cc: Matt Silva <dev@matt-silva.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  9 Feb 2024 20:50:21 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since the addition of the package
> in commit 0a1f2fce0494388080af0a4130e62522c26fe4a9:
> 
> /home/autobuild/autobuild/instance-0/output-1/host/riscv64-buildroot-linux-uclibc/bin/ld.real: pty.o: in function `my_pty_fork':
> pty.c:(.text+0x68): undefined reference to `fork'
> /home/autobuild/autobuild/instance-0/output-1/host/riscv64-buildroot-linux-uclibc/bin/ld.real: filter.o: in function `.L0 ':
> filter.c:(.text+0x134): undefined reference to `fork'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0a3a68cfb181bc67a7dbf1d44f64b0a29df75987
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rlwrap/Config.in | 1 +
>  1 file changed, 1 insertion(+)

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
