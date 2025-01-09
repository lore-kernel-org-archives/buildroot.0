Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554E4E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 12:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0452180D75;
	Thu,  9 Jan 2025 12:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dfnMwroUZVvZ; Thu,  9 Jan 2025 12:03:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C44680DA7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C44680DA7;
	Thu,  9 Jan 2025 12:03:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 643D1942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 12:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 458FD80D75
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 12:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNz4RkXs_rRO for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 12:03:26 +0000 (UTC)
X-Greylist: delayed 549 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 09 Jan 2025 12:03:25 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F3C6A8056E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3C6A8056E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3C6A8056E
 for <buildroot@busybox.net>; Thu,  9 Jan 2025 12:03:25 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 1A4AA2C833BB;
 Thu, 09 Jan 2025 12:54:13 +0100 (CET)
Message-ID: <0560e329-4abe-4988-9fa3-bb4ddc733773@bubu1.eu>
Date: Thu, 9 Jan 2025 12:54:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Seiderer <ps.report@gmx.net>, buildroot@busybox.net
References: <20240626090026.31083-1-ps.report@gmx.net>
Content-Language: en-US
In-Reply-To: <20240626090026.31083-1-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1736423653; bh=hCCjzM5JBa83dPU71CtNg2Kf8j+SjGqRqqmAubZ7rRw=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=ar9gEwiUb6jl3wNxozcNHQl7Y56lOVjPCnXAW+xEcqmlhn8KT3mAkeZ1NaAJ7Ye2S
 Hq+mmuvI6QrlFH6H/t4GFnytGHK44XRQh2SHL1mYfBgvAWg1onUsWfS8FTGk5RPDtU
 bvhTGkVVgKPelxAXJNh60cMiDrqJM9dl/IPN68Wq91ZOI+SlN+zPO8clY+y9HekmkV
 dBgOv+vIKjb7TWQ8CPczt4kf0I0GAszaN7W7Vf5tc0WBa9Y7+DfgnxW9aum85ffSco
 WPPB7Lu75mzIsmY2EamN3jqXZFk5zr0UsvrXRwzCfU4o4dRWlDkEuTJeV4d0OnM5z9
 yvIHaYu1JDQUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=ar9gEwiU
Subject: Re: [Buildroot] [PATCH v1] package/pcre2: bump version to 10.44
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On 26.06.24 11:00, Peter Seiderer via buildroot wrote:
> - enable PCRE2_AUTORECONF to fix the following buildi/relink failure:
> 
>      x86_64-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used
>      in cross-compilation: '-L/usr/lib'
> 
> For details see [1].
> 
> [1] https://github.com/PCRE2Project/pcre2/blob/master/ChangeLog
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Not sure why this slipped through the cracks, but FWIW:

Tested-by: Marcus Hoffmann <buildroot@bubu1.eu>

> ---
>   package/pcre2/pcre2.hash | 4 ++--
>   package/pcre2/pcre2.mk   | 5 ++++-
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
> index f2e17df753..8b22040ba7 100644
> --- a/package/pcre2/pcre2.hash
> +++ b/package/pcre2/pcre2.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature:
> -# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.43/pcre2-10.43.tar.bz2.sig
> -sha256  e2a53984ff0b07dfdb5ae4486bbb9b21cca8e7df2434096cc9bf1b728c350bcb  pcre2-10.43.tar.bz2
> +# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.44/pcre2-10.44.tar.bz2.sig
> +sha256  d34f02e113cf7193a1ebf2770d3ac527088d485d4e047ed10e5d217c6ef5de96  pcre2-10.44.tar.bz2
>   # Locally computed
>   sha256  030087e2e8dd7c1bdd26057d25d4ded8f45bbf01ad458d68665ad04b8b0fbedf  LICENCE
> diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
> index 9641f22e81..191596181a 100644
> --- a/package/pcre2/pcre2.mk
> +++ b/package/pcre2/pcre2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PCRE2_VERSION = 10.43
> +PCRE2_VERSION = 10.44
>   PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
>   PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
>   PCRE2_LICENSE = BSD-3-Clause
> @@ -12,6 +12,9 @@ PCRE2_LICENSE_FILES = LICENCE
>   PCRE2_CPE_ID_VENDOR = pcre
>   PCRE2_INSTALL_STAGING = YES
>   PCRE2_CONFIG_SCRIPTS = pcre2-config
> +# Fixes build/relink failure ("ERROR: unsafe header/library path used in
> +# cross-compilation: '-L/usr/lib'")
> +PCRE2_AUTORECONF = YES
>   
>   PCRE2_CONF_OPTS += --enable-pcre2-8
>   PCRE2_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE2_16),--enable-pcre2-16,--disable-pcre2-16)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
