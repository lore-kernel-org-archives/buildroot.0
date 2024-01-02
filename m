Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4E7C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 461B340A84;
	Tue,  2 Jan 2024 20:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 461B340A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dOKFZ4_6CpEm; Tue,  2 Jan 2024 20:20:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3807A40AAB;
	Tue,  2 Jan 2024 20:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3807A40AAB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A25BC1BF966
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16448801EA
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16448801EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X7FRf815t7OV for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:18:22 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0855081AD7
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0855081AD7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62280C0002;
 Tue,  2 Jan 2024 20:18:20 +0000 (UTC)
Date: Tue, 2 Jan 2024 21:18:19 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102211819.14b9cc13@windsurf>
In-Reply-To: <20240102163248.330408-1-fontaine.fabrice@gmail.com>
References: <20240102163248.330408-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704226700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gu8qdS0VgOtYF56KtBNLKGq1+nHzHTwpeWPmAeb7G/o=;
 b=pYE2uryZQw01exUD5tXntFHr32I30MC5kcDeQW4OAv36e+3fnWEDP6op8/I7j35lxGgNZc
 Fpc9PxEHp3v2WIL4CA4fL6EJ+kIhl3Ba6QSicVwbCAVn9vW6wfwtDwhgxMIidm4qyLmwYG
 T0tSOZfRqux648Sh2aCQndcV+vyEvOFVriCR+3Yhg9cFeP/nVHg9s4NopfFQLQuMoDhmsB
 Rdf3GH/5A0/V4OifDbLFe4o/hOs2/ZOolpvoE+fIRWRpqWM/HxCwJ9vf615AEh2IamkZHJ
 XlgRce1qLug2Px+jg+A/lWtsPitOzoHf77iB9aVgEXE6qTTA4OVDkGTEdMlIyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pYE2uryZ
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: fix s390x build
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

On Tue,  2 Jan 2024 17:32:48 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use linux64-s390x configure target to fix the following s390x build
> failure raised since bump to version 3.2.0 in commit
> 973b1eba5a4ee72f040bd471b147267e36be73ad and
> https://github.com/openssl/openssl/commit/79040cf29e011c21789563d74da626b7465a0540:
> 
> /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/13.2.0/../../../../s390x-buildroot-linux-gnu/bin/ld: libcrypto.a(libcrypto-lib-dh_key.o): in function `dh_bn_mod_exp':
> dh_key.c:(.text+0x3c8): undefined reference to `s390x_mod_exp'
> /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/13.2.0/../../../../s390x-buildroot-linux-gnu/bin/ld: libcrypto.a(libcrypto-lib-rsa_ossl.o): in function `rsa_ossl_s390x_mod_exp':
> rsa_ossl.c:(.text+0xd2c): undefined reference to `s390x_crt'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/77c5e13127de67a69782f138aa28c8b0ad951941
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libopenssl/Config.in | 1 +
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
