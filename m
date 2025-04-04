Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5E4C36010
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 18:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61A106100F;
	Fri,  4 Apr 2025 18:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RnqnixFT9Dhx; Fri,  4 Apr 2025 18:37:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F95860E96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F95860E96;
	Fri,  4 Apr 2025 18:37:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AA73117
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 18:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CD5E40190
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 18:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DS1-JGLGRBJS for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 18:37:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 38BEB404F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38BEB404F1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38BEB404F1
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 18:37:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D5C7113F899;
 Fri,  4 Apr 2025 20:37:42 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:39188])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 04 Apr 2025 20:37:42 +0200
MIME-Version: 1.0
Date: Fri, 04 Apr 2025 20:37:42 +0200
From: Julien Olivain <ju.o@free.fr>
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Vadim Kochan <vadim4j@gmail.com>
In-Reply-To: <20250403190705.14994-1-maxime@leroys.fr>
References: <20250403190705.14994-1-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <2a4f30c9de15544d9a72ebddb2839224@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743791865;
 bh=izwgKtqzoGX9DHqJ1uniT3hEie8ncjE3OSBVcLE8+NA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Do65wqDx4fO2OItYqCdopQYgSYlq/BgXVRkUTrz5CaE3IZDpfLU+vFo/9Ce1rbQh6
 ebbST2nVWXd9tvdAV9O6d1poVTUH/OFXXRC79V6oqDggvdVWSexze+j5MoK3aUn4lm
 TxbwmXSJpksKbmi7y/E3aPC3RP8hJ3qDOvbxuUEdpAORy4YD7l0IV2F9bADRRO6dvn
 Kjs6nU157Wus4Mto/lApKU/5eE1K9l8jgpaQX2XGTPg47W4FoEoUUEg8KzYuK5fKtE
 Ka18C79W0Ug76YRmiMqP81iIBjwyi/71oIHhUGSWaUH+1mFuJi4BMC50Avwj81v16g
 qCIQuXPoNfzFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Do65wqDx
Subject: Re: [Buildroot] [PATCH] package/frr: bump to version 10.3
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

Hi Maxime,

Thank you for the patch.

In the release note at:
https://frrouting.org/release/10.3/

There is a mention about a "Fixed CVE-2024-55553". Could you
update the patch title to:
"package/frr: security bump to version 10.3"
please?

On 03/04/2025 21:07, Maxime Leroy wrote:
> Update FRR to the latest stable version (10.3).

To make review easier, could you add the link of the release
announce in the commit log? For example:

Release announce:
https://frrouting.org/release/10.3/
https://frrouting.org/release/

> The configure options have been updated accordingly:
> - Versions of FRR before 9.2 used `sysconfdir` and `localstatedir` 
> as-is,
>   without appending `/frr`. The `/frr` suffix had to be passed 
> explicitly
>   to `./configure`, which did not align with standard conventions.
>   This behavior has since been fixed upstream [1]. As `sysconfdir` and
>   `localstatedir` are already set by `pkg-autotools.mk`, they can now
>   be removed from `frr.mk`.
> - The `--enable-shell-access` option has been removed as of FRR 10 [2].

When there is a CVE fixed, it is also good to add a link to it. Could 
you
add here in the commit log:

Fixes:
- https://www.cve.org/CVERecord?id=CVE-2024-55553

> [1] https://github.com/FRRouting/frr/commit/ff62df2e4484
> [2] https://github.com/FRRouting/frr/commit/afb034b0bb42
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>
> ---
>  package/frr/frr.hash | 2 +-
>  package/frr/frr.mk   | 5 +----
>  2 files changed, 2 insertions(+), 5 deletions(-)
[...]
> diff --git a/package/frr/frr.mk b/package/frr/frr.mk
> index 5391bcb265..82a4673ab7 100644
> --- a/package/frr/frr.mk
> +++ b/package/frr/frr.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -FRR_VERSION = 9.1.3
> +FRR_VERSION = 10.3

This new 10.3 version seems to introduce new build failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/1751371370

For reference, the previous 9.1.3 version builds is:
https://gitlab.com/jolivain/buildroot/-/pipelines/1751537318

There is possibly new toolchain or kernel header requirements. Could
you have a look to those build failures, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
