Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E06C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AAE18430A;
	Sun, 11 Feb 2024 21:39:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L3oDjJVAOPem; Sun, 11 Feb 2024 21:39:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52CB784706
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52CB784706;
	Sun, 11 Feb 2024 21:39:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 329961BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C7634012F
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:39:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PudOSpccZBKJ for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:39:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B90A94011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B90A94011D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B90A94011D
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:39:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21C1E60003;
 Sun, 11 Feb 2024 21:38:59 +0000 (UTC)
Date: Sun, 11 Feb 2024 22:38:58 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240211223858.559fe171@windsurf>
In-Reply-To: <20240211211022.2003157-1-fontaine.fabrice@gmail.com>
References: <20240211211022.2003157-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707687539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gc8iFb42Jpc5rvdhfcsx9hq2eCaCnkRQR081osdVwCE=;
 b=ZZ5zt1epueZDvu9xDaCrxhTUL/BeqJtkXhbVcClj/nLjc9uhTRSTB0Rd9CxE2pwOAqeeE4
 tlrJqfoJ2GkRIK3Q/FkVzHmXyUWzU90UcHoVZJyiP/W42dLs67aLsi4pr1kXLdv43qBOwJ
 3pJRWthRCYetXgNzIo/lA6EFungGVQ3UsM59zxU4e73yZ23PCB2dc0v8fIHQZmkiBYhqAm
 BXvOMsUQDJe1z0NAlMF29GJXbXcNcVcAUDANfFIbS/7jsDbQwe5Wzwr6ePk64zKj9D4Ez8
 vQ2Ydwv2snR+U6EGWhRldUazRZfOvHRrunDuGMtT8Aa9hN20dZ5pjxk/6Zz5QQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZZ5zt1ep
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: fix libressl build
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Feb 2024 22:10:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following libressl build failure raised since bump to version
> 4.97 in commit faec3ca30e358575f70a036879029f63f7da9b29 and
> https://git.exim.org/exim.git/commit/6bf0021993572586f031ac7d973ca33358c2dac8:
> 
> In file included from tls.c:473:
> tls-openssl.c: In function 'tls_client_stapling_cb':
> tls-openssl.c:2652:11: error: invalid use of incomplete typedef 'OCSP_BASICRESP' {aka 'struct ocsp_basic_response_st'}
>  2652 |         bs->certs
>       |           ^~
> 
> Fixes: faec3ca30e358575f70a036879029f63f7da9b29
>  - http://autobuild.buildroot.org/results/869fde62128d7b0c65e0ac596a3a3f69b332583d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/exim/0007-typoes.patch                | 58 +++++++++++++++++++
>  ...nssl.c-fix-build-with-libressl-3.5.0.patch | 43 ++++++++++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644 package/exim/0007-typoes.patch
>  create mode 100644 package/exim/0008-src-src-tls-openssl.c-fix-build-with-libressl-3.5.0.patch

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
