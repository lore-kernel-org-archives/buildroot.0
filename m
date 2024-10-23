Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B85CFA47E
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 21:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6573260826;
	Wed, 23 Oct 2024 21:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WMpdGY1uvA1; Wed, 23 Oct 2024 21:26:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 613D360847
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 613D360847;
	Wed, 23 Oct 2024 21:26:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C02B972
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A83D81114
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfEdVnTmCj27 for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 21:26:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7718481111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7718481111
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7718481111
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:26:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 182A060002;
 Wed, 23 Oct 2024 21:26:34 +0000 (UTC)
Date: Wed, 23 Oct 2024 23:26:33 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241023232633.511f45ac@windsurf>
In-Reply-To: <20241008174822.3625910-1-bernd@kuhls.net>
References: <20241008174822.3625910-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729718797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gRPTSr1Gy84n/BIU+Z3oPRCE3fomdCpxrqf2CdpOgug=;
 b=P5KohdApW99khON+QU3UYnbG1kQdMjAi8lFeEWgHHtXGkR2MchtUIJJDa0jAeCjssO40Ma
 +simYWBNoaSimE7V2JwJ/1xae+g+DGioj6zwrmSyKbBY/pkKlm/uPw0hfvPhT8mXZ1pLec
 lvst3XKCbPaGQ3WheqIJCTehZj/fGbMY7tGZ61ArF9dOJQWLWOTvUmIOAKMjWvjZslzJ2v
 qhMW7xE9x/XV3xu8L056bj7LnNTCO+UdHKK9Q47AHbyyFaneWKfPVUZ5+M4tKbkGIRRfkl
 AFFg8TUYpXQjofrXY+EbzfpmaPW4B2ABWF4Jm6cJdntm1NFSleiTU/NKHJZAmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P5KohdAp
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20240910
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

On Tue,  8 Oct 2024 19:48:22 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20240813
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20240910
> 
> 20240813 fixes
> CVE-2024-24853: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01083.html
> CVE-2024-25939: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01118.html
> CVE-2024-24980: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01100.html
> CVE-2023-42667: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01038.html
> CVE-2023-49141: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01046.html
> 
> 20240910 fixes
> CVE-2024-23984: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01103.html
> CVE-2024-24968: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01097.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/intel-microcode/intel-microcode.hash | 2 +-
>  package/intel-microcode/intel-microcode.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
