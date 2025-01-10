Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60718E77188
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 10:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1059183626;
	Fri, 10 Jan 2025 10:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_IP-Me65VRa; Fri, 10 Jan 2025 10:37:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3037835EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3037835EF;
	Fri, 10 Jan 2025 10:37:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2B24940
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 10:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C38EE835EF
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 10:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SAUILqXEnfHk for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 10:37:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5FC3835E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5FC3835E0
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5FC3835E0
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 10:37:00 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 50E822C86EDD;
 Fri, 10 Jan 2025 11:36:58 +0100 (CET)
Message-ID: <11ccf477-c020-4d14-9c1e-a1c2d493805e@bubu1.eu>
Date: Fri, 10 Jan 2025 11:36:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Marcus Hoffmann <bubu@bubu1.eu>
References: <20250109214158.2413259-1-james.hilliard1@gmail.com>
Content-Language: en-US
In-Reply-To: <20250109214158.2413259-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1736505418; bh=4lsB0mEkETM4CoVjHLo2K0Ye/8o6IPL2uNtASZGnVAw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=D5z5N7d6CWP7j76hMYzXy8b8P74EGNED2uKkWRz305uWpbTNKXo1ef22iqD23nRWC
 TqFrE66t1MZXNRl/h1KVipec1JDHrZbcPrw5mxKopjrDmj5m4ykPjZrAI6scEjF0k/
 q2sQr6X8BexOMLqivTM5Vr7a8LwVLymH9187XTm4PJTX/YoV3EqspeNmCxRN1ntS7D
 pW29ROsrxltXKkMIrsjd+c4JIt2TY7qS9cV+MreY/SctHI+oJLTn7SA5BKU440/AVe
 5wUYMuyuqKycXIAdUlzWVZwH7g7khwI7CKU7eiFjvcZJwhiQqYlxAG5oyC5QiKeZoM
 6plusNiBE6dcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=D5z5N7d6
Subject: Re: [Buildroot] [PATCH 1/1] package/python-jc: bump to version
 1.25.4
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

Hi James,

On 09.01.25 22:41, James Hilliard wrote:
> Add new python-pygments runtime dependency.
> 
> Add new python-ruamel-yaml runtime dependency.
> 
> Add new python-xmltodict runtime dependency.

All of these are considered optional dependencies.[1][2] It's supported 
to use this package without these dependencies, some functionality will 
not be supported then. We also have a buildroot test that verifies that 
this works.

[1] https://github.com/kellyjonbrazil/jc/releases/tag/v1.25.1
[2] https://github.com/kellyjonbrazil/jc/issues/537

Marcus

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-jc/Config.in      | 3 +++
>   package/python-jc/python-jc.hash | 4 ++--
>   package/python-jc/python-jc.mk   | 4 ++--
>   3 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-jc/Config.in b/package/python-jc/Config.in
> index b88150e069..1933db253b 100644
> --- a/package/python-jc/Config.in
> +++ b/package/python-jc/Config.in
> @@ -1,5 +1,8 @@
>   config BR2_PACKAGE_PYTHON_JC
>   	bool "python-jc"
> +	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
> +	select BR2_PACKAGE_PYTHON_RUAMEL_YAML # runtime
> +	select BR2_PACKAGE_PYTHON_XMLTODICT # runtime
>   	help
>   	  Converts the output of popular command-line tools and file-
>   	  types to JSON.
> diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
> index 75d64da7bf..d8ee918ac7 100644
> --- a/package/python-jc/python-jc.hash
> +++ b/package/python-jc/python-jc.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/jc/json
> -md5  7e9454e01eafa7c8c6e415fddc7d2638  jc-1.25.3.tar.gz
> -sha256  fa3140ceda6cba1210d1362f363cd79a0514741e8a1dd6167db2b2e2d5f24f7b  jc-1.25.3.tar.gz
> +md5  77e798f2c3fbe89c0dbf7b31dc35fc69  jc-1.25.4.tar.gz
> +sha256  a32eaf029c56b582dadae48895f20784d0f84f2fa28a8e2b32f377a8bffa8b39  jc-1.25.4.tar.gz
>   # Locally computed sha256 checksums
>   sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
> diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
> index 202884f3dc..9a3754a0fa 100644
> --- a/package/python-jc/python-jc.mk
> +++ b/package/python-jc/python-jc.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_JC_VERSION = 1.25.3
> +PYTHON_JC_VERSION = 1.25.4
>   PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
> -PYTHON_JC_SITE = https://files.pythonhosted.org/packages/a5/82/bfb1ec7d9667bc2f922254bc62e12fd460a5de3b711518f5089df0a17180
> +PYTHON_JC_SITE = https://files.pythonhosted.org/packages/5b/82/146ef4c94297ef87c6a732c92dd57761bea2c2179e1b8ca8a6b9b8dd6ff7
>   PYTHON_JC_SETUP_TYPE = setuptools
>   PYTHON_JC_LICENSE = MIT, BSD-3-Clause (bundled pbPlist)
>   PYTHON_JC_LICENSE_FILES = LICENSE.md

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
