Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF54EC53219
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 18:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5753240665;
	Wed, 29 Jul 2026 18:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqQJzM8KQRqb; Wed, 29 Jul 2026 18:48:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A3524066F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785350896;
	bh=b+TyQnQa3F3vrMf2vTI6s+6p9RNDXiaSqhu4MNc+wX4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sNMxT3GdDK/RtSFShNKmKJPLQOee/Vuxf2GeFtraC3sEAN4kxscd7SPCx0Xiq0scT
	 kjgfMJSAq15ya7yYegvokmCHxc7eEKFA7sB+IDHwg+B6KVOh10qQdGLm5/clAbbrZ6
	 MBCJEh1g42z56tqO83nVSFNI7u+48Lc/MtOcEzqXXH/uEgC2WNla2mhVEGC2qedyCY
	 g/+kqN5rcWKH3uG5DtJDyKJz4VMWVYwdQySZ9LCFwIx+nUyDpkQsGENlBmJF7z+M0K
	 7cERy6Cj5UzzkOjLoKMnLBcPfGU1wONcyPuDtnm1BEnVfYe3l0+3j5mneNAX/Zkyyv
	 mknXOLQf5BxRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A3524066F;
	Wed, 29 Jul 2026 18:48:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03C8128E
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDF1940166
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibTG1f3iuIpL for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 18:48:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B0C3C40149
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0C3C40149
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0C3C40149
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:48:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 40B152003AE;
 Wed, 29 Jul 2026 20:48:11 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Jul 2026 20:48:11 +0200
MIME-Version: 1.0
Date: Wed, 29 Jul 2026 20:48:11 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260728194541.507655-1-james.hilliard1@gmail.com>
References: <20260728194541.507655-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <6fd2840758594f0dc0101e52efc49024@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785350892;
 bh=kdwsD28wQ1kaGtAhHkCkgocghSvU2lGyC2Q3dyx7Wqg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vWgDWrlBacl7cet1Qs82Nc8kHr5ynJN1v6FUG/mfK4DTDv5LzI0GQbB+DU+6sClG6
 WJjJrGPiYrp3eP5VK40AA+ay/qFfpSh1o2q0ZnvEbJfbnH0hrAmDxe3N5akJWCnX9/
 EfLIfq6+6V9wqwcfxUNlwpfntDzYHka813CRDneVJIfzSc2vfsY2Vq8mhT2yur4J1e
 bwnyTzNE0ZOLxHnIF5lJT1mp+5Kjd7xX2zgJ1Z6gZlEbvGsm+YZd3OnxPSqudPyrCc
 656qtfe6IOkJ5L7Zd8qYOtPhd6ojiOAaQHFwKJMuAoAfZ+6f5D4XiX8R4iGyj+W1GE
 BYOz0NwZuExaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=vWgDWrlB
Subject: Re: [Buildroot] [PATCH v2 1/1] package/uboot-tools: fix host FIT
 signature support
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 28/07/2026 21:45, James Hilliard wrote:
> U-Boot host tools use the tools configuration namespace when code calls
> CONFIG_IS_ENABLED(). With USE_HOSTCC, CONFIG_IS_ENABLED(FIT_SIGNATURE)
> resolves to CONFIG_TOOLS_FIT_SIGNATURE, while
> CONFIG_VAL(FIT_SIGNATURE_MAX_SIZE) resolves to
> CONFIG_TOOLS_FIT_SIGNATURE_MAX_SIZE.
> 
> The host-uboot-tools package only generates the old 
> CONFIG_FIT_SIGNATURE
> define. This makes tools/Makefile include fit_check_sign, but the host 
> code
> sees FIT signature support as disabled and the OpenSSL-backed signing 
> and
> verification objects are omitted. As a result, mkimage accepts a 
> signature
> node without writing its value or injecting a required public key.
> fit_check_sign then has no required key and reports success without
> checking the configuration signature.
> 
> A FIT-support-only configuration never exercises this path, which is 
> why
> the existing hash-only runtime test still passes.
> 
> Generate the tools FIT signature options needed by the host code and 
> pass
> CONFIG_TOOLS_LIBCRYPTO=y so the OpenSSL-backed signing, verification 
> and
> cipher objects are selected. Keep CONFIG_FIT_SIGNATURE=y in the make
> options because U-Boot tools/Makefile still uses it to build
> fit_check_sign.
> 
> Extend TestHostUbootTools to create an RSA-signed FIT, require a 
> 256-byte
> configuration signature and a required public key, verify the FIT, 
> corrupt
> the signature, and require verification to fail.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

For info, I added comments in the runtime test, to explain
the test sequence. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/928cc5dc5cb82e6f2cb43f853488309eb806ef89

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
