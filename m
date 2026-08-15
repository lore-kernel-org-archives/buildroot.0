Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B48C5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 19:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B55AB80E8D;
	Sat, 15 Aug 2026 19:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rF5dsliUgH44; Sat, 15 Aug 2026 19:45:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E43DF80E41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786823149;
	bh=whIzrc+Gnd6TStsVUP/dOaK1q/yJp+R4xH28vPDsCNw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jouhRpBMVcyGOPiVu4r0Rky5wVoAOLz1cZaeiv16TAx0HgS3r3njgXF43hpy0Axms
	 PVodkNOOyl6VqOhkGnlbSQ29Q0th+75Bdl9H7vPZDDaW2viG/kiLVqMcdh0zcTbFvi
	 B5K3V77OydYDFH80L+JJZ3cUQVQ04oc2oJuTglAdnQuKs1HWDEDNy2JmlUIN5yz5cN
	 VUWgm8utknnC+qTTnfPi/DHm+KXZPYUicUvWhUqH5GmU7KarwuyV/XK9m1PZMVE8Sy
	 /MY2BO6oP4YfDCCqVbOnjubdzBxdYiS1ZO1N9TJt2YmcXsuCI7pRfVhS1MaLypusKZ
	 ZYZcfe4GnF5AQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E43DF80E41;
	Sat, 15 Aug 2026 19:45:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30E1D2BB
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 173E680E3E
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXQHaDBBIWL4 for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 19:45:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C290080E41
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C290080E41
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C290080E41
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:45:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 76BF54E41253
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:45:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 36097604AA;
 Sat, 15 Aug 2026 19:45:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5435911C4F661; 
 Sat, 15 Aug 2026 21:45:39 +0200 (CEST)
Date: Sat, 15 Aug 2026 21:45:38 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <aoDBcJCg-X6TM7v1@windsurf>
References: <aoAXmAflyCHEGz7V@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aoAXmAflyCHEGz7V@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] FENV support in uClibc-ng
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Waldemar,

On Sat, Aug 15, 2026 at 09:39:04AM +0200, Waldemar Brodkorb wrote:
> Dear Buildroot maintainers and developers,
> 
> I am planning to submit a new package for chawan, a 
> nice TUI browser. It has JS support and needs FENV support in
> the C library. Can we globally enable FENV support in 
> uClibc-ng? I measured the size for a default aarch64 
> build with and without FENV support enabled.
> 
> With FENV support enabled:
> 608992 Aug 15 09:07 libuClibc-1.0.59.so
> 
> Without FENV support enabled:
> 584416 Aug 15 09:24 libuClibc-1.0.59.so
> 
> Should we add another option for 24kb?

No, just enable it unconditionally.

There's a number of packages that are currently disabled on uClibc
because it lacked fenv support.

> uClibc-ng also gained support for uchar functions a while back.
> tpm2-tools needs it. It adds approx. 5kb to the C library.
> What should we do here? Enable uchar automatically, when wchar is enabled?

Yes, enable uchar when wchar is enabled seems like a good idea.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
