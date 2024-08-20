Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92FCC3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 08:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50C7B60590;
	Tue, 20 Aug 2024 08:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFMAvS4QG_5c; Tue, 20 Aug 2024 08:58:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63EBA60595
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63EBA60595;
	Tue, 20 Aug 2024 08:58:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 491741BF341
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 08:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34DEB810FB
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 08:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOa_aIEjh9Qb for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 08:58:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE17B810D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE17B810D7
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE17B810D7
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 08:58:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2766FE0002;
 Tue, 20 Aug 2024 08:58:35 +0000 (UTC)
Date: Tue, 20 Aug 2024 10:58:34 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240820105834.01fe6286@windsurf>
In-Reply-To: <ZsO1UYTTOIY7UuJn@landeda>
References: <ZsOw2IzdkaSTp+Ot@waldemar-brodkorb.de> <ZsO1UYTTOIY7UuJn@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724144315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sjhRkTXNBS8mMSNAfEGHD3a9TurbJc8/4nkKLT9ljzQ=;
 b=M9psy7Gus1vCovW5r6A/RMp1K3U9gkqcJVfpcEB+SYX2NjR7/EJSg4c7PQ9wcamll0ZmtX
 leSm5p45cEompNnMxnGkNPm4WPBzOLgA+1eZpN4Q2mBRoHM5SDYzJBkofOcfozwgHFjGmP
 BOgpz4eXZZEf8s2E9sTBpcn+dytNMrJoVpfnJ9t8EVzs8dWBTL/LUNOMnH77CNGxEHNYia
 kDTadjNWE2mpW/FCgFDWdVolQYhDszp5fzMLwddNVP5YvpYA7MdOzhlc04Vb6Sco9HYnwp
 DkxSo8ccPQ+FEZvFAkNSQoeLKN1WBs1lp0zSLi7epghGA0J8HH7PK8y3KTaviw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M9psy7Gu
Subject: Re: [Buildroot] [PATCH] package/botan: avoid compile error with gcc
 10.x
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

Hello Waldemar, Hello Yann,

On Mon, 19 Aug 2024 23:12:49 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > Compile successfully tested with internal Buildroot toolchain for
> > sparc with gcc 12.x as gcc 11.x is not available anymore.
> > 
> > The autobuild failure will be avoided now and fixed with newer external
> > bootlin toolchains.
> > 
> > Fixes:
> >  - http://autobuild.buildroot.org/results/ab8/ab83b920156f5a1e51ef960e4007769b5c27d0a1
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>  
> 
> Applied to master, thanks.

If I may chime in, one critical thing that is missing from this commit
message is since when this problem is occurring. Is it since the update
of the package in 3ba9ac62052c99d7557adf2bbad1bab0c5577a81 ? Or since
2fcc74594c457bed7f0f2a4826ada265861be6bf ?

Indeed 11a577c19e23d0b774f357b2d62ac3c41b7f201f already added a
dependency on gcc 10, so I guess it's something after that?

Again, this is important to understand if the patch needs to be
backported to LTS or not, as usual.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
