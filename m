Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003FEC0218D
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 22:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6CB260641;
	Sun, 26 Jan 2025 22:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrh7h6DhUzDJ; Sun, 26 Jan 2025 22:07:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DE3F6064D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DE3F6064D;
	Sun, 26 Jan 2025 22:07:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E38094A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 22:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D03540180
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 22:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r8KDcZApc8rV for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 22:07:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1DD0240477
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DD0240477
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DD0240477
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 22:07:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3BE0B780375;
 Sun, 26 Jan 2025 23:06:56 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47686])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Jan 2025 23:06:56 +0100
MIME-Version: 1.0
Date: Sun, 26 Jan 2025 23:06:56 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250126154732.405055-10-james.hilliard1@gmail.com>
References: <20250126154732.405055-1-james.hilliard1@gmail.com>
 <20250126154732.405055-10-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <046d7a6caec3bf5b4f12a99598af1c24@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737929219;
 bh=0sK6+K3HjiKEvC2zeomCfWE5mvagb3rcPvviLF/EnQY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=albpPnfKeR52DxaIeyZSHd7zoh39DVLChKXFRMJ3uOC+Pvs5no1N+NsCmVehlXbs4
 BMka3hyRY07g+rw/H38781uWCpWFvSTlpbthbIX7Xa868CsWJ5s11SZDl3ECN6Ufft
 Qxg42ukEBntar6QgCGlxRZ0MwlmHwcUJv5kN/KMxpasbB6z1I46dn86jQDKoP063jd
 Nd6/FvL3oF7r2uENnq8sEalDuBEIHy4Lk7LsI7zwQZXJpliPchuW+5uTcJTA+tesv7
 8sqjzdDA0OZAXGhqvkpSORJ3cxvPXe55rOhPlPUjC0L9Kj31D4bGSbOsFn4NmhuwFU
 gc5f+eyZ5rgKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=albpPnfK
Subject: Re: [Buildroot] [PATCH v7 10/10] package/tensorflow-lite: new
 package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James, all,

Thank you for the patches!

On 26/01/2025 16:47, James Hilliard wrote:
> From: Stefan Hager <stefan.hager@ginzinger.com>
> 
> This package adds the tensorflow lite runtime to buildroot.
> 
> Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
> Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

[...]

> diff --git a/package/tensorflow-lite/Config.in 
> b/package/tensorflow-lite/Config.in
> new file mode 100644
> index 0000000000..8685ec0c71
> --- /dev/null
> +++ b/package/tensorflow-lite/Config.in
> @@ -0,0 +1,36 @@
> +config BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64
> +	default y if BR2_arm
> +	default y if BR2_i386
> +	default y if BR2_x86_64
> +	depends on BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
> +
> +config BR2_PACKAGE_TENSORFLOW_LITE
> +	bool "tensorflow-lite"
> +	depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17

Buildroot commit aea79039 [1] raised the libabseil-cpp minimal gcc
version requirement to version 8. I believe this version requirement
should be propagated here.

> +	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_SHARED_LIBS
> +	select BR2_PACKAGE_CPUINFO
> +	select BR2_PACKAGE_EIGEN
> +	select BR2_PACKAGE_FARMHASH
> +	select BR2_PACKAGE_FFT2D
> +	select BR2_PACKAGE_FLATBUFFERS
> +	select BR2_PACKAGE_GEMMLOWP
> +	select BR2_PACKAGE_LIBABSEIL_CPP

For info, libabseil-cpp is selected here.

Could you update this dependency?

Best regards,

Julien.

[1] 
https://gitlab.com/buildroot.org/buildroot/-/commit/aea790392af5358568a4f1c5d2dd9f1adfb29109
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
