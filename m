Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DC6C52D6D
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 13:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD49140232;
	Mon,  5 Aug 2024 13:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jaGxwb3mGx2D; Mon,  5 Aug 2024 13:55:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CA7B4023F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CA7B4023F;
	Mon,  5 Aug 2024 13:55:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D6A21BF334
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 13:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4760940167
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 13:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aDfEVdupDmOZ for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 13:55:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D1B0E40010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1B0E40010
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1B0E40010
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 13:55:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 179D8E0002;
 Mon,  5 Aug 2024 13:55:21 +0000 (UTC)
Date: Mon, 5 Aug 2024 15:55:19 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240805155519.2f15b386@windsurf>
In-Reply-To: <ZrDNQvSIPQNosVmQ@waldemar-brodkorb.de>
References: <ZrDNQvSIPQNosVmQ@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722866121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cBZShvWybv76L6Y0zsX0pWC8bcoWoXw0c0AG7M41iNc=;
 b=S41aEyt+dFlOpqMvbcSJHamahq+O/cgnWQCEA+bKO0PxABUl5ZXXixpNLoBmDhqmA3H5Fh
 gDy7FPpyCOnGw1YeTSbt3jPwRAxRjBRB60eZrtQ4OrPrMBCd0f7U3gdukaLRkTLUeImBe1
 W/PpeMrmS5Cl/tjyQRWk5J+92wZDMV2hfeQCd2wsWccqbQ/XE1nnMwY9J9+zu6wggM4U3/
 JD2ETUNuVSa3Cyf0nZfBZR3Xt6/qYvHb3rRDjPeFQ12jCiiPQFBGoCGsBaXlxENXVjnROE
 jYLD3Jr4OotScNz1QXpeyzXCAyB0pK+ePfGbNU38ee3/b7F03Nam3onsXC4aig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S41aEyt+
Subject: Re: [Buildroot] [PATCH] package/nginx: security update to 1.26.1
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

Hello Waldemar,

On Mon, 5 Aug 2024 15:01:54 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See here for a Changelog and CVE's:
> http://nginx.org/en/CHANGES-1.26
> 
> Patch 0006 is no longer required as the openssl library is found without
> this patch, which does not apply anymore.
> 
> Patch 0009 is no longer required as it was fixed in another way upstream:
> https://hg.nginx.org/nginx/rev/fb989e24c60a
> 
> Patch 0011 is upstream:
> https://hg.nginx.org/nginx/rev/f58b6f636238
> 
> Reorder the remaining patches and update .checkpackageignore accordingly.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .checkpackageignore                           |   8 +-
>  ...-auto-lib-libgd-conf-use-pkg-config.patch} |   0
>  ...auto-lib-openssl-conf-use-pkg-config.patch | 251 ------------------
>  ...inux_config.h-only-include-dlfcn.h-.patch} |   0
>  ...of-endianness-for-cross-compilation.patch} |   0
>  ...to-os-linux-fix-build-with-libxcrypt.patch |  38 ---
>  ...ix-compile-error-in-configure-script.patch |  33 ---
>  package/nginx/nginx.hash                      |   2 +-
>  package/nginx/nginx.mk                        |   2 +-
>  9 files changed, 5 insertions(+), 329 deletions(-)
>  rename package/nginx/{0007-auto-lib-libgd-conf-use-pkg-config.patch => 0006-auto-lib-libgd-conf-use-pkg-config.patch} (100%)
>  delete mode 100644 package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
>  rename package/nginx/{0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch => 0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch} (100%)
>  rename package/nginx/{0010-Allow-forcing-of-endianness-for-cross-compilation.patch => 0008-Allow-forcing-of-endianness-for-cross-compilation.patch} (100%)
>  delete mode 100644 package/nginx/0009-auto-os-linux-fix-build-with-libxcrypt.patch
>  delete mode 100644 package/nginx/0011-Fix-compile-error-in-configure-script.patch

This update breaks legal-info:

ERROR: while checking hashes from package/nginx/nginx.hash
ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: ececed0b0e7243a4766cbc62b26df4bd3513b41de3a07425da1679c836d06320
ERROR: got     : f19c4caea60247490199c5a6d0134281e3fb20b3d7577e6873c628597f5381d9
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

(the change of the license file hash must be explained in the commit
message)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
