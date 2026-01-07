Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C519DD0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E4CD80891;
	Wed,  7 Jan 2026 17:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uINicUDimVp1; Wed,  7 Jan 2026 17:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8D8D8083C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808253;
	bh=WvIzVrU2aMbkTxpKZLx1qmaSt9vg63VdqRMFNODoF8c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EhwBORgYEK9Llm8k7rFa581ReFft9hqKbKcGRmrrKScAAOPKloKg/+jkyN2Y0dZHF
	 ge8XkalxROmLgzJnhrmjaMQiZHv71wrS4NxEri6pYbWjiV4pYPffmGrgU/CTv5VZDV
	 EhH5s3ujU6B/un1rHn/9fwfHq4AVGKiwpiX+0+epWsg1HRtO3f1zU1/eL8BHNm5KVH
	 mCwLbQ1zhCJBRk1t0qA7t4k1KhC0BswARJpssMcXsip/GmJsA0BEE1TkAHQia8bF22
	 XNxWOS/tdlEEgKGCey9wsz+LDR7uEv8hlfJcFfCGEtZUOl6b2J/UitK+PgIFWp11Io
	 Pr92tRR99PCOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8D8D8083C;
	Wed,  7 Jan 2026 17:50:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C0559ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12E5240263
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qlm8fTWI9Azd for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F1AE740160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1AE740160
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1AE740160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F138DB97A596; Wed,  7 Jan 2026 18:50:47 +0100 (CET)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:46 +0100
Message-ID: <20260107175046.226912-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222172638.839720-1-buildroot@bubu1.eu>
References: <20251222172638.839720-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808248; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=oCSnpR0kcw1MBjAUoUoHOmX4bZ9KqtCH9nfjyVJ+Ur4=;
 b=NHzM7lEjuh9iRJuZtUYSGpUaHORPxVJA4kD9RlwP7NeWsq5zygwjmhKangpleODYsQSB9r
 F18hypgNWoWbgvfAnvcr46trWvrn1DzHf/fq1vsAztjyC01g556fMJkpEFMpUORxOY26D9
 kcIDlTqzq+NGYCDoCufz1gE6BjrHqzq9PCHqc1hdho0Evd+9+rE7IzaghZJWY3j+Np8EPG
 etYbGIjUvYfLE3kcywvbODdbWu8upJzM0xdpoCe4BjQg1N/jWL5juqizfxLxgJZyJEaUcX
 HgxRdscecDaCFSfx25id/JrRmB2h0SactIFhwotUTyKDQYUb3FAFtNqHrbChRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=NHzM7lEj
Subject: Re: [Buildroot] [PATCH 1/2] package/libiio: fix python bindings
 without glibc utils
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Libiio python bindings use ctypes and specifically the find_library()
> function from there to load the libiio.so shared library. This is not
> working unless glibc utils (specifically ldconfig) is installed to the
> target (alternatively the target would need gcc or binutils, for objdump
> or ld).
> 
> The easy fix here is to just bypass the find_library() machinery
> altogether as it's not needed on a buildroot system.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  ...-bindings-python-fix-library-loading.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/libiio/0001-bindings-python-fix-library-loading.patch
> 
> diff --git a/package/libiio/0001-bindings-python-fix-library-loading.patch b/package/libiio/0001-bindings-python-fix-library-loading.patch
> new file mode 100644
> index 0000000000..f8715b4c5b
> --- /dev/null
> +++ b/package/libiio/0001-bindings-python-fix-library-loading.patch
> @@ -0,0 +1,41 @@
> +From 4d4d17e2810f793b9f7fd8acad2a3c551dbff2b5 Mon Sep 17 00:00:00 2001
> +From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
> +Date: Fri, 31 Mar 2023 20:13:07 +0200
> +Subject: [PATCH] bindings: python: fix library loading
> +
> +On Linux the find_library() function requires ld, gcc, objdump
> +or ldconfig on the target, which might not be present on a
> +buildroot system. [1]
> +We do not actually need this function at all, as we know the iio library
> +will be referencable in the system under the name "libiio.so".
> +So instead of kicking of this complicated cross-platform/cross-distro
> +compatible machinery, we just pass in the name of the library we already
> +know.
> +
> +[1] https://docs.python.org/3/library/ctypes.html#finding-shared-libraries
> +
> +Upstream: N/A, buildroot doesn't have to care about different OS's and
> +distro setups, so we can just hardcode the lib name, but we cannot
> +submit that upstream.
> +
> +Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> +---
> + bindings/python/iio.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/bindings/python/iio.py b/bindings/python/iio.py
> +index b91260cc..bde17694 100644
> +--- a/bindings/python/iio.py
> ++++ b/bindings/python/iio.py
> +@@ -224,7 +224,7 @@ else:
> +     # Non-windows, possibly Posix system
> +     _iiolib = "iio"
> + 
> +-_lib = _cdll(find_library(_iiolib), use_errno=True, use_last_error=True)
> ++_lib = _cdll("libiio.so", use_errno=True, use_last_error=True)
> + 
> + _get_backends_count = _lib.iio_get_backends_count
> + _get_backends_count.restype = c_uint
> +-- 
> +2.25.1
> +
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
