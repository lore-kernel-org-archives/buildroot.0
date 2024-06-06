Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318F7C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 11:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4040845CB;
	Thu,  6 Jun 2024 11:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vP2v-8mz4PEc; Thu,  6 Jun 2024 11:53:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11BB9845C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11BB9845C5;
	Thu,  6 Jun 2024 11:53:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B0C11BF5DE
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 11:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84369419C6
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 11:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECRuDsW_T5PL for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 11:53:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2FB9A419C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FB9A419C5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FB9A419C5
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 11:53:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A21DC13F88D;
 Thu,  6 Jun 2024 13:52:58 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 13:52:58 +0200
Date: Thu, 6 Jun 2024 13:52:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <ZmGjGvRCN3GwWFhp@landeda>
References: <20240606104813.1514-1-jarkko@kernel.org>
 <20240606104813.1514-2-jarkko@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606104813.1514-2-jarkko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717674786;
 bh=p8iI1UlRQC30ol4pORQHhk82kP1BvlKCKXMW59nVEeM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pBYwWm+CkiRaRt7nSiVGCTnmVRAIMjTRWpry1/9CXcB/mfxOrVnBSKlzfRj+UOKGo
 3rQkMJksB1gLX1Md09RsBFnjnpaKePMWhdTQauJXb8iH/cheVllxmHg1rX9BW9NHSE
 oApIsASrBPfj5l/LXyqk1S1AYnCs1lKdMq/i1o2KSJBItFW3CRjEBu7o7+Uhg0RU1E
 abYC5Nt1osi79TYRbvfvj0vmUkOrABfPmQqnJLYp3tYVxCOOVHP1YyArsj08Pqpve9
 qw4sZxK1VPOiWJoke4NPGbviqfBoqcHQfrm6m3xDHzJik9tupoFlkhzKGg4c9kdfDS
 4q7Y8HmO/h4Sw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pBYwWm+C
Subject: Re: [Buildroot] [PATCH v2 1/3] package/tpm2-tools: bump version to
 5.7
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
Cc: Erik Larsson <who+buildroot@cnackers.org>,
 James Hilliard <james.hilliard1@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jarkko, All,

On 2024-06-06 13:48 +0300, Jarkko Sakkinen spake thusly:
> tpm2_encodeobject is essential for testing RSAPKCS1 and ECDSA TPM2 signing
> keys, as the key blob is loaded to the chip in DER format defined by ASN.1
> schema.
> 
> Link: https://lore.kernel.org/linux-crypto/20240528210823.28798-1-jarkko@kernel.org/
> Cc: Erik Larsson <who+buildroot@cnackers.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
>  package/tpm2-tools/tpm2-tools.hash | 2 +-
>  package/tpm2-tools/tpm2-tools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tpm2-tools/tpm2-tools.hash b/package/tpm2-tools/tpm2-tools.hash
> index f50a896363..a7b1ef559e 100644
> --- a/package/tpm2-tools/tpm2-tools.hash
> +++ b/package/tpm2-tools/tpm2-tools.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  c0b402f6a7b3456e8eb2445211e2d41c46c7e769e05fe4d8909ff64119f7a630  tpm2-tools-5.2.tar.gz
> +sha256  3810d36b5079256f4f2f7ce552e22213d43b1031c131538df8a2dbc3c570983a  tpm2-tools-5.7.tar.gz
>  sha256  f6995d52c8b8e4d2c3bace7fc9c330a77a90d808166fbad4d7ead7e8ba2fc66c  doc/LICENSE

    make tpm2-tools-legal-info
    >>> tpm2-tools 5.7 Collecting legal info
    sha256sum: /home/ymorin/dev/buildroot/O/next/build/tpm2-tools-5.7/doc/LICENSE: No such file or directory
    ERROR: while checking hashes from package/tpm2-tools/tpm2-tools.hash
    ERROR: doc/LICENSE has wrong sha256 hash:
    ERROR: expected: f6995d52c8b8e4d2c3bace7fc9c330a77a90d808166fbad4d7ead7e8ba2fc66c
    ERROR: got     :
    ERROR: Incomplete download, or man-in-the-middle (MITM) attack
    make[1]: *** [package/tpm2-tools/tpm2-tools.mk:31: tpm2-tools-legal-info] Error 1
    make: *** [Makefile:23: _all] Error 2

The doc/ directory has been renamed docs/ so I also fixed that for the
LICENSE file.

Applied to next, thanks.

Regards,
Yann E. MORIN.

> diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
> index 12f924eee5..cd9c582aa9 100644
> --- a/package/tpm2-tools/tpm2-tools.mk
> +++ b/package/tpm2-tools/tpm2-tools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TPM2_TOOLS_VERSION = 5.2
> +TPM2_TOOLS_VERSION = 5.7
>  TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
>  TPM2_TOOLS_LICENSE = BSD-3-Clause
>  TPM2_TOOLS_LICENSE_FILES = doc/LICENSE
> -- 
> 2.45.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
