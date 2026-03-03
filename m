Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2555EDEBE2
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 18:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 583C840BAB;
	Tue,  3 Mar 2026 18:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCdxh9mBXtIC; Tue,  3 Mar 2026 18:08:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79D2C40BB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772561328;
	bh=tcSmE1VPFwrtEr6atiSgisR2jnQUJT7dMffayfaDkpM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ljZsmcnmmSoZLwi8pTNyHJSf+iH7dbawLoGHkVMm5un4ViDexJGRR17+RO68p6Myz
	 IcbQgRpW860dgU4Jbp91LBmJdT4RQjV+z/UvYObV/1l6Egx61hR864k2PaH//zvbEK
	 XFsl+mL9XpX1DrlG6C+lCzxYrQRFKLxN7jTHRj4F4mrM09WvI1/ged1kLo1KEgDEzW
	 uq9kp8wDs5qVBWfF5rGAgGiBCMhfEq/5uqc57aN4zDBOPkkFYot1JMTmI9Hpdjtxrd
	 bfcT/WygfO0eLFbLWwn0jyqgHBydu7B35PHO8WnCRD6PQudIZSSITkaF12EUD7B8nm
	 VoRlfUjcrW/OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79D2C40BB6;
	Tue,  3 Mar 2026 18:08:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 767851EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 18:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CBA740BAB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 18:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C1m1iK6OCIKb for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 18:08:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57F9F40BAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57F9F40BAE
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57F9F40BAE
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 18:08:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2E0DB60134;
 Tue,  3 Mar 2026 19:08:41 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Mar 2026 19:08:41 +0100
MIME-Version: 1.0
Date: Tue, 03 Mar 2026 19:08:41 +0100
To: cp0613@linux.alibaba.com
Cc: buildroot@buildroot.org
In-Reply-To: <20260303095028.9946-1-cp0613@linux.alibaba.com>
References: <20260303095028.9946-1-cp0613@linux.alibaba.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <b02a221e1a4914633565797b5f211029@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772561323;
 bh=Nccr17yT1P5AWN5TS4weuIlz2ngMHyNhhKyCXEyvUvE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y7NoTjRuPOmSU/dQPLZPi0Y0PEhs8ceto5yylTiABdPjJpueHMqoNS6W+wUpqXI1u
 i+H31BJnLBScTqFP5UcUvq+doCNtMj7BzfZV2yeKpxTqjKV2+1isS5J87/IbEv8ysu
 ScZ3cM+HUtvk5ybjPGmXwB+NXlo3tgV4ta3hIVzf3XD/PX5S8orZumKiQ6CyYlKr5k
 y+vNtM+R67/Nd9WRpLZThHDRa6mEX4MTPCVARs8p44m75yljCJx2ztIHYn5n1JnUEY
 e4Nj1R/z/vF7DtScaATdFLVMEq7PRf4fS4hjQkkw/RfQzo2lQelJ2HhWPx6ckm0yvS
 etqAzubq8OUIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Y7NoTjRu
Subject: Re: [Buildroot] [PATCH] package/iniparser: new package
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

Hi Chen,

Thanks for the patch. I have two minor comments, see below.

On 03/03/2026 10:50, cp0613@linux.alibaba.com wrote:
> From: Chen Pei <cp0613@linux.alibaba.com>
> 
> The iniparser is a simple C library offering ini file parsing services.
> 
> ndctl[1] requires it.
> 
> [1] https://github.com/pmem/ndctl
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
[...]
> diff --git a/package/iniparser/iniparser.mk 
> b/package/iniparser/iniparser.mk
> new file mode 100644
> index 0000000000..9034a1cb78
> --- /dev/null
> +++ b/package/iniparser/iniparser.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# iniparser
> +#
> +################################################################################
> +
> +INIPARSER_VERSION = v4.2.6
> +INIPARSER_SITE = 
> https://gitlab.com/iniparser/iniparser/-/archive/$(INIPARSER_VERSION)
> +INIPARSER_SOURCE = iniparser-$(INIPARSER_VERSION).tar.gz

Could you move the "v" from the _VERSION to _SITE and update _SOURCE,
please? This will allow our version monitoring scripts to work better.
We should preferably have:

INIPARSER_VERSION = 4.2.6
INIPARSER_SITE = 
https://gitlab.com/iniparser/iniparser/-/archive/v$(INIPARSER_VERSION)
INIPARSER_SOURCE = iniparser-v$(INIPARSER_VERSION).tar.gz

Note: your initial submission was also reporting an error, which
should be fixed indirectly with the change I propose. Please make
sure to run the command "utils/docker-run make check-package" before
sending patches. See:
https://nightly.buildroot.org/manual.html#_preparing_a_patch_series

> +INIPARSER_INSTALL_STAGING = YES
> +INIPARSER_LICENSE = MIT
> +INIPARSER_LICENSE_FILES = LICENSE
> +
> +$(eval $(cmake-package))
> --
> 2.50.1

Also, quoting the Buildroot documentation at:
https://nightly.buildroot.org/manual.html#DEVELOPERS
"""
We ask developers adding new packages, new boards, or generally new 
functionality in Buildroot, to register themselves in the DEVELOPERS 
file. As an example, we expect a developer contributing a new package to 
include in his patch the appropriate modification to the DEVELOPERS 
file.
"""

Note that will received emails from the autobuilders in
case of build failures, and from other developers using
the get-developers script.

Could you add a new entry in the DEVELOPERS file registering
yourself to this new package?

Could you send an updated v2 patch with those changes, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
