Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974AAE74904
	for <buildroot@archiver.kernel.org>; Wed, 24 Dec 2025 01:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8485740A15;
	Wed, 24 Dec 2025 01:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Okgpog4arJl; Wed, 24 Dec 2025 01:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0129A40A10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766540357;
	bh=sXPzsoQvQz4bRLYz90zYTMmeqVWrI8iNTsd/l+ssVu4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pMN1FR+j925pzAAiimkjeMc9yQ47QhGzD4IEfmOJHKrpeTekSrvgW3YV0KaFelKd+
	 YoJNx3NYSxDQmhvfHxnyaIssCWqkF5k6K5J0FvhBlVq/qMMgVJY6WJpPRSs1VOB71p
	 k9WR0tsgu6RJUNRiO3n0L47MMJ5DdSWL8pKZAcOkAUWxKOswGTWLp15Pq21dOn0ukv
	 tGD2QfehJs7wWT+S82ewbAJBc/b8QJIM4Peh4f5DGTzQKIwBMC2LlxsROP7Xb3S+6D
	 5ELSew2wefeLoyHLkGgm0tAyl+pgzu/QdS+ARelGJ28ceCoA/3XcB6+qE+osE9SvP3
	 OZoJvWAjQFjtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0129A40A10;
	Wed, 24 Dec 2025 01:39:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0428A119
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 01:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA7B6402BB
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 01:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id knDtRnPVr0Jh for <buildroot@buildroot.org>;
 Wed, 24 Dec 2025 01:39:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 49C34400C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49C34400C8
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49C34400C8
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 01:39:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.31.254]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvbG2-1vqRFT42Fy-00vejr; Wed, 24
 Dec 2025 02:39:10 +0100
Message-ID: <5bf3b08b-f99d-47a5-8f5d-5da9769ed2d2@gmx.de>
Date: Wed, 24 Dec 2025 02:39:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: Paul Cercueil <paul@crapouillou.net>
References: <20251222172638.839720-1-buildroot@bubu1.eu>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20251222172638.839720-1-buildroot@bubu1.eu>
X-Provags-ID: V03:K1:TOOQGYY83gyS5sxT29K1NfCcb4VUdYUhmh6tn2eDIRUALOsML8u
 FIkxhTLl2lSzJYZGdopEojXbb3WfXXiRqzY6ooewKkycwWbSfVFTEozRHy3BozKIjAnedCw
 u70SfYcQMwzAl41o8g3etXap85uil+hY2KhmZFXMsvGxfy/qaLp94JTD5UG23WxHxO9gdko
 g6CHpD/vtDl6LUpQyn4aw==
UI-OutboundReport: notjunk:1;M01:P0:vNt7dTMAYuw=;AMk40bns1mmmDGR+OoiskjAPxMO
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1766540350; x=1767145150; i=fiona.klute@gmx.de;
 bh=1tdsPmmgZutkt45RXI9CExaYj54a6pmDxaIZJoSnXJE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=G9wW7we/HxCOzdckvi39Pur2A12JTSNjSsaWLzQmJvhBJAgn9lAZnRnPPRWIF8WC
 zr/kOpF9u2mSYoq4PMqK+QjPtmQncH6dtHKshDxMYB0c8u5yBmVHq8nwCzBDGZaL4
 hVuNUi+cXqaSQI4LwqUX1JvoSzHKk09B5E0VtdGlTRzO2SVJ/g9bRT1SRvB1yGpXy
 TIYoVLKpeIbfPPo1o/H0CX5GqFE0mE/dV4b5id08sVOz1PWF+vUOMl1JGPgvzAW4v
 G2ygLq9daJmqOofh9mLWNJQ0S8GWF+9vN0xqbf8LhLtkmqN//2h1Rvb81WsH1LEm8
 BX/IAogbufWdg99n8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=G9wW7we/
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 22.12.25 um 18:26 schrieb Marcus Hoffmann via buildroot:
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

Tested-by: Fiona Klute <fiona.klute@gmx.de>

The issue also affects musl, where ldconfig simply doesn't exist. It's 
clearly a bug in Python (where an open PR exists for years [1], and 
Alpine has been carrying a musl-specific patch for >10 years by now), 
but I think it's good to apply a workaround that's so simple.

Thank you,
Fiona

[1] https://github.com/python/cpython/pull/18380

> ---
>   ...-bindings-python-fix-library-loading.patch | 41 +++++++++++++++++++
>   1 file changed, 41 insertions(+)
>   create mode 100644 package/libiio/0001-bindings-python-fix-library-loading.patch
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

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
