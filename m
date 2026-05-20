Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B23CD4F3D
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 19:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D674983EB3;
	Wed, 20 May 2026 19:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VG8yVbApeLf0; Wed, 20 May 2026 19:28:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E4E183EAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779305336;
	bh=65CepBSbr8X7vs2oUCk2eQCXBJGbCBZsYboUawysWiI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ptyYaOXjzs4Lg1aIcYTPvVuoDHEzqG//GQlySjVivGp9ihzlztlt86lt0Ns2KdSDQ
	 LAE9FWFvVum7XjkRMFeH+CKZLo0ssHcAcf4NbEmYhetJWUs1LpH8xQWpxBeAz+5ymZ
	 wC8oO0oLWw0EJHuPCFrDFQzi8ohJd4bMXjoiZchwHDwhWdrt6sBJzkExqdvX6a5RLd
	 3dQUubr3aQL8zI1xptgdGLqN2Zht36p3jXkiP+QfOAUji/vHdYc72T6WVnXE5+iBIw
	 0D5+TGKYY7JGUNuMo5QRlL182FKZ4KRTVYzz5u+PRDmlRsuXgQITdWVwSkNYwqnWmJ
	 xcmHmvHevKYAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E4E183EAD;
	Wed, 20 May 2026 19:28:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A20EE1B2
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9165A61391
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:28:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3pbYDixzraR for <buildroot@buildroot.org>;
 Wed, 20 May 2026 19:28:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8CE1561389
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CE1561389
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CE1561389
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:28:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1CED8B97C37D; Wed, 20 May 2026 21:28:51 +0200 (CEST)
Message-ID: <5d85ab44-cef2-44c2-bef0-94037ddc2674@rnout.be>
Date: Wed, 20 May 2026 21:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andreas Mohr <and@gmx.li>, buildroot@buildroot.org
Cc: Pascal de Bruijn <p.debruijn@unilogic.nl>
References: <20260518220229.17936-1-and@gmx.li>
 <20260518220229.17936-2-and@gmx.li>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260518220229.17936-2-and@gmx.li>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779305331; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=b/4K3NCi2M46NJkHhyvLMS5t0fAs2IkqejrWxP2Esjg=;
 b=Y86qoRo8Vi2yA0eD13fOz0E8tcUolSOIatadl23jGJpohp5iGs/rWVrugD5d7vK7oG+YW7
 zL8WgX2P3J4u+5QodmXzj9g8bi7zVQsJ7bgU2JVlDrGfxEVGjmux7fFO1Tm/omGY6NIZPr
 /gUpO8Z8mW8c0CtGGHHf4HMYw+PU5/TU9kG5qTcU4wMEX1OI82hnIr9vTmAtFPINNZ6YM3
 HH7btyCmx+/RfDrmbRGhpmQ0D82kmhSD12Zqae6VCIfmxh8tu0IYjs2PSH5auBhzcmKNHM
 BHkZk3c0kX1MYoYFS1P9KP96/04qNw/HXvT5E+F/tOQnDt1IVzQprwgtYMgv4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Y86qoRo8
Subject: Re: [Buildroot] [PATCH v4 2/2] package/libargon2: fix pkgconfig
 version string
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/05/2026 00:02, Andreas Mohr via buildroot wrote:
> Current build generated pkgconfig/libargon2.pc has wrong version string.
>      Version: ZERO
> 
> Signed-off-by: Andreas Mohr <and@gmx.li>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libargon2/libargon2.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/libargon2/libargon2.mk b/package/libargon2/libargon2.mk
> index 8ca0071a..e968aa08 100644
> --- a/package/libargon2/libargon2.mk
> +++ b/package/libargon2/libargon2.mk
> @@ -11,6 +11,7 @@ LIBARGON2_LICENSE_FILES = LICENSE
>   LIBARGON2_INSTALL_STAGING = YES
>   
>   LIBARGON2_OPTS = LIBRARY_REL=lib
> +LIBARGON2_OPTS += ARGON2_VERSION=$(LIBARGON2_VERSION)
>   
>   # GCC_TARGET_ARCH is not defined for all architectures, but libargon2
>   # only uses it to detect if some x86 optimizations can be used, and

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
