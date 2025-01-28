Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAAFC0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 22:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5E0780B2F;
	Tue, 28 Jan 2025 22:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XjI95vjqovh; Tue, 28 Jan 2025 22:40:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C0E981FDB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C0E981FDB;
	Tue, 28 Jan 2025 22:40:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3946C20
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 22:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17F6F81FDB
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 22:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HtZKvUmjZ8rP for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 22:40:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C649280B2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C649280B2F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C649280B2F
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 22:40:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 83D9813F879;
 Tue, 28 Jan 2025 23:40:12 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:55326])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Jan 2025 23:40:12 +0100
MIME-Version: 1.0
Date: Tue, 28 Jan 2025 23:40:12 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250128170153.2298242-10-james.hilliard1@gmail.com>
References: <20250128170153.2298242-1-james.hilliard1@gmail.com>
 <20250128170153.2298242-10-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <42a394596365512b8bf4d523042534ae@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738104015;
 bh=yz0N12woZ0U/UOJvRDCTszgZV4sDmhDWyjbgmXZQDao=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i2uOav7RDlXFmYH8EELGCe+zZJnMpPns85nXtTOwBxJCAzcHu0wRVXqm+J9+HwuTu
 9jkz33DI1DE3I5A/s/lxD+f+JbNQf+F1Zh5f2H0G6WKXGUt7rYh/1m9zGf8B8eHtbg
 h7TVKyc7f4e4yerLTkGXsVkD8wE/PMyP7rPZvxV7apURds9kAByb4r6x9bMJv7PLio
 FhUVHF+qIdTOmCtvpyEztd/fYh8TSBCYnFj9iauSbUaMM+2ThMjeO9yVLLRc9L4+Vq
 KIiXcHMDOD5hfCeWWjy9jbtEeDHFYLZixD3srzI0DK9B18DaDC1RHwMDcfPGANzTeC
 2G1nHc63QABfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i2uOav7R
Subject: Re: [Buildroot] [PATCH v8 10/10] package/tensorflow-lite: new
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

Hi James, Stefan,

On 28/01/2025 18:01, James Hilliard wrote:
> From: Stefan Hager <stefan.hager@ginzinger.com>
> 
> This package adds the tensorflow lite runtime to buildroot.
> 
> Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
> Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

[...]

> diff --git a/package/tensorflow-lite/tensorflow-lite.mk 
> b/package/tensorflow-lite/tensorflow-lite.mk
> new file mode 100644
> index 0000000000..433eff3242
> --- /dev/null
> +++ b/package/tensorflow-lite/tensorflow-lite.mk
> @@ -0,0 +1,59 @@
> +################################################################################
> +#
> +# tensorflow-lite
> +#
> +################################################################################
> +
> +TENSORFLOW_LITE_VERSION = 2.11.0

So I finally merged this longstanding tensorflow-lite series.
Thanks again!

The version merged here is a bit outdated already. See:
https://github.com/tensorflow/tensorflow/releases/tag/v2.11.0
from November 2022.

For reference, the latest version, as of today is v2.18.0:
https://github.com/tensorflow/tensorflow/releases/tag/v2.18.0
from October 2024.

So it would be really nice to see updates towards this newer version.
This will probably bring new dependencies too.

Also, for information, tensorflow-lite is in a process to be
renamed to LiteRT. See:
https://developers.googleblog.com/en/tensorflow-lite-is-now-litert/
https://github.com/google-ai-edge/litert

It seems this process will take some time, so I merged this
package with its "old" name anyway.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
