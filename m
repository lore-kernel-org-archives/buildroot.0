Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A391BC48BF8
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 13:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5672741D61;
	Thu, 22 Feb 2024 13:07:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SLuLp8AvHk9W; Thu, 22 Feb 2024 13:07:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FA7E41D62
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA7E41D62;
	Thu, 22 Feb 2024 13:07:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C696F1BF40B
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 13:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B44CA60F0E
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 13:07:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ubEFVKMCxA9s for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 13:07:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 29AF460E6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29AF460E6B
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29AF460E6B
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 13:07:27 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 4254C2C80CD4;
 Thu, 22 Feb 2024 14:07:24 +0100 (CET)
Message-ID: <2b8930e5-63af-452a-89f2-a19f28d21c99@bubu1.eu>
Date: Thu, 22 Feb 2024 14:07:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240221220343.1228278-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
In-Reply-To: <20240221220343.1228278-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1708607244; bh=Z41jSJZ6nxohUzvUWnwsqqMUFvEXq+2b5Xndtiu87hQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=MdBQOr+W1o2/zJI8hL2UaaTYb6L1BmWwuUlz0mPkhpMnAYqC+DvC9Ti8bdrIO46/s
 qY1w/DufGsPi2lYJG3nqNS6vkNh7Z2UMjnThKhAzDkSA++XyLWwHcG9fcp3SxmrIUP
 fzbqwx673NR17CrVUOUPEQDbHfPaXAW08kXZOyM8V7djKQSGQ8R3BRxAqVSkANZ7zY
 omEK5TPVGqnDIKBbNe6T1HBCtRvkwYdj/181CI9B16KWOr72KQfT/EW8nDOw7TeeWl
 iTfKrUy0kOevCPuH4nwpv0SJYijhA151/E0c9+DAGsZuQHybYLZfNzVY+n2P3wMk3k
 QdSPlzreUViOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=MdBQOr+W
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: security bump to
 version 20.11.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21.02.24 23:03, Fabrice Fontaine wrote:
> - Fix CVE-2024-21892, CVE-2024-22019, CVE-2024-21896, CVE-2024-22017,
>    CVE-2023-46809, CVE-2024-21891, CVE-2024-21890 and CVE-2024-22025
> 
> - LICENSE hash changed due to two things:
>    * c-ares vendored dependency license got updated [1]. This is unused
>      by buildroot though anyway
>    * base64 vendored library license updated copyright years and sorted
>      contributor names [2], [3]
> 
> - This bump will fix the following build failure raised since bump of
>    python to version 3.12.1 in commit 36e635d2d5c0166476858aa239ccbe78e8f2af14
>    thanks to
>    https://github.com/nodejs/node/commit/95534ad82f4e33f53fd50efe633d43f8da70cba6
>    https://github.com/nodejs/node/commit/6557c1c9b1206a85bb7d8e7450e8c3a4cff7c84b:
> 
> Traceback (most recent call last):
>    File "/home/autobuild/autobuild/instance-2/output-1/build/host-nodejs-src-20.9.0/configure.py", line 17, in <module>
>      from distutils.version import StrictVersion
> ModuleNotFoundError: No module named 'distutils'
> 
> https://github.com/nodejs/node/blob/v20.11.1/CHANGELOG.md
> 
> [1] https://github.com/c-ares/c-ares/pull/556
> [2] https://github.com/aklomp/base64/commit/2e8ad2aec2065f258dc1aec9402aedd3604cfbcd
> [3] https://github.com/aklomp/base64/commit/d7bca2bb2928de6c4fe496e6defe8b3affa35d1b
> 
> Fixes: 36e635d2d5c0166476858aa239ccbe78e8f2af14
>   - http://autobuild.buildroot.org/results/8b38bc4b7879a0349c1305e2fcb458a0cfd04a93
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks!

Reviewed-By: Marcus Hoffmann <buildroot@bubu1.eu>


> ---
>   package/nodejs/nodejs.hash | 14 +++++++-------
>   package/nodejs/nodejs.mk   |  2 +-
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index 2d60437a7c..ddab345e0a 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -1,8 +1,8 @@
> -# From https://nodejs.org/dist/v20.9.0/SHASUMS256.txt.asc
> -sha256  ced3ecece4b7c3a664bca3d9e34a0e3b9a31078525283a6fdb7ea2de8ca5683b  node-v20.9.0-linux-arm64.tar.xz
> -sha256  64099d7e62bdbb8efd52c216a6759b3cdd77c38aa993096fdee9f875d95b2d8e  node-v20.9.0-linux-armv7l.tar.xz
> -sha256  3c6cea5d614cfbb95d92de43fbc2f8ecd66e431502fe5efc4f3c02637897bd45  node-v20.9.0-linux-ppc64le.tar.xz
> -sha256  9033989810bf86220ae46b1381bdcdc6c83a0294869ba2ad39e1061f1e69217a  node-v20.9.0-linux-x64.tar.xz
> -sha256  a23d96810abf0455426b349d47ce5310f33095b7bc0571b9cc510f481c3a4519  node-v20.9.0.tar.xz
> +# From https://nodejs.org/dist/v20.11.1/SHASUMS256.txt.asc
> +sha256  c957f29eb4e341903520caf362534f0acd1db7be79c502ae8e283994eed07fe1  node-v20.11.1-linux-arm64.tar.xz
> +sha256  28e0120d2d150a8f41717899d33167b8b32053778665583d49ff971bfd188d1b  node-v20.11.1-linux-armv7l.tar.xz
> +sha256  51343cacf5cdf5c4b5e93e919d19dd373d6ef43d5f2c666eae299f26e31d08b5  node-v20.11.1-linux-ppc64le.tar.xz
> +sha256  d8dab549b09672b03356aa2257699f3de3b58c96e74eb26a8b495fbdc9cf6fbe  node-v20.11.1-linux-x64.tar.xz
> +sha256  77813edbf3f7f16d2d35d3353443dee4e61d5ee84d9e3138c7538a3c0ca5209e  node-v20.11.1.tar.xz
>   # Locally calculated
> -sha256  93ac846282ce6c5255e00fada2fd2e7e292255239fe58d5502b0a554859e6a3e  LICENSE
> +sha256  7b0bbdca72f925bd78b764914651244a4432a753c7325d061a565cd7eac1193d  LICENSE
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 9806a64d38..858c6a86f5 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
> -NODEJS_COMMON_VERSION = 20.9.0
> +NODEJS_COMMON_VERSION = 20.11.1
>   NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
>   NODEJS_COMMON_SITE = http://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
