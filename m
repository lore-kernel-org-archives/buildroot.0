Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCE3C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 14:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E52A415BC;
	Wed, 22 Feb 2023 14:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E52A415BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S0KPuQ-YHuFp; Wed, 22 Feb 2023 14:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6848F415BD;
	Wed, 22 Feb 2023 14:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6848F415BD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 146261BF589
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED97C41970
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED97C41970
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLSDueIKkQBT for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 14:56:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 639F74197C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 639F74197C
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:56:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5DA51C0006;
 Wed, 22 Feb 2023 14:56:02 +0000 (UTC)
Date: Wed, 22 Feb 2023 15:56:01 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230222155601.279070c4@windsurf>
In-Reply-To: <20230222094441.439014-1-fontaine.fabrice@gmail.com>
References: <20230222094441.439014-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677077762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PK1SpBgxpnZN/z7dNDP5JL0trg+h3voTIp5+/CdKqSQ=;
 b=FHBf7DiVNDVyPhFj3B0wNR2K6zl/7W1vwLtUhSyHU0jxFrRWY+Mho0m8qdqGsHGedBSoTm
 aRIQVSQA/Egg7SS4FSD7sSksfIK/IO30rruoMb7xqR8aSNF6F86NqzE51of26+BSrGzsNN
 1U8Z/Tk1pTGQhbU/B6rXEu9IrC4uN86v2TNMpjyfRdV7za/2pqEHYepXYcdV+pCiZoshI4
 kgW/W0zHwDrY5gR7zULY4Mo6dHGphju0xyqA5Uomk1cD7fR1Yvr2Kx9NIiQ79MWsryMTNd
 qPMvHUYhGxNsTaakCeVzZJlRPo2fuU4F/6Pk/XLm0MqpD1HBVHHJLGPBvsCruw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FHBf7DiV
Subject: Re: [Buildroot] [PATCH 1/1] package/sudo: fix openssl static build
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

On Wed, 22 Feb 2023 10:44:41 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with sparc raised since bump to version
> 1.9.11p2 in commit 9b7f8da96be549a52630cd87b30851d600f163a4 and
> https://github.com/sudo-project/sudo/commit/9fbbca7b7a4cc60a8aa27d73de54278004a704c0:
> 
> hecking for X509_STORE_CTX_get0_cert
> configure:21215: /home/thomas/autobuild/instance-3/output-1/host/bin/sparc-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DZLIB_CONST  -static conftest.c   -L/home/thomas/autobuild/instance-3/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib -lssl -lz -pthread -latomic -lcrypto >&5
> /home/thomas/autobuild/instance-3/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/thomas/autobuild/instance-3/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(x509cset.o): in function `X509_CRL_up_ref':
> x509cset.c:(.text+0x108): undefined reference to `__atomic_fetch_add_4'
> 
> [...]
> 
> In file included from ./hostcheck.c:38:
> ../../include/sudo_compat.h:342:41: error: conflicting types for 'ASN1_STRING_data'
>   342 | #  define ASN1_STRING_get0_data(x)      ASN1_STRING_data(x)
>       |                                         ^~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8be59dd94e4916f9457cb435104e36e62a28373b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...onfigure.ac-fix-openssl-static-build.patch | 49 +++++++++++++++++++
>  package/sudo/sudo.mk                          |  2 +
>  2 files changed, 51 insertions(+)
>  create mode 100644 package/sudo/0001-configure.ac-fix-openssl-static-build.patch

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
