Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B0EC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42ED780E67;
	Wed,  7 Feb 2024 16:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJMJgPQZVHSi; Wed,  7 Feb 2024 16:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF14C80E90
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF14C80E90;
	Wed,  7 Feb 2024 16:24:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2E981BF59A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD7EB61436
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nID-ABze5brv for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:24:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AEC8A61431
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEC8A61431
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEC8A61431
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:24:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0525F13F8B8;
 Wed,  7 Feb 2024 17:24:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 17:24:18 +0100
Date: Wed, 7 Feb 2024 17:24:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZcOushzhRC8_tN6i@landeda>
References: <20240205165353.515894-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240205165353.515894-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707323062;
 bh=zqEvtbYX+ZWOLPxBeI74oA0JNPiZGdoEg4zHoyELr68=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n6yDJGxOQzy8cMO7P0wXgB7v8PC2Qva5+/05+hhYrRxGssOJjotLth56R+AlqXJ97
 ECXEI9/gJe4AHjSoU0hTwqoGPPdApyB4SDwhLQZUpafcTHP7BpCBy8TIObtHB/+Bo1
 J2AEIx470hdk6m/M2hLGcbkXspKXR5I8mqsmWq8QY9N56Lv0lLGTdNbxDiHiIltj6t
 wWW3buBk7cvG1eoEUw3tWGa2zp0PIudiwYyIhzUpw4UcrDdH84PQrYuxsAsZPiZGXL
 Fk4M3C+mKEeqmG9t8JH3ZOW/TpqljrN4TfOSvUbLaC9RzgXi0EXhSUBbFs6/8A30DW
 d3oIIDEaZooMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=n6yDJGxO
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rpds-py: bump to version
 0.17.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-02-05 09:53 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-rpds-py/python-rpds-py.hash | 2 +-
>  package/python-rpds-py/python-rpds-py.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
> index b04aa210d3..4650d9c385 100644
> --- a/package/python-rpds-py/python-rpds-py.hash
> +++ b/package/python-rpds-py/python-rpds-py.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after vendoring
> -sha256  87361601241744fff6235e35050addfe34d00508172d2bd4f178193a28727287  rpds_py-0.12.0.tar.gz
> +sha256  760b05720269195d86071ac7cf627b3a4ab9366680d8d449a6a63b84d96a5bc0  rpds_py-0.17.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
> diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
> index 6f71d02047..80670f2e4f 100644
> --- a/package/python-rpds-py/python-rpds-py.mk
> +++ b/package/python-rpds-py/python-rpds-py.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_RPDS_PY_VERSION = 0.12.0
> +PYTHON_RPDS_PY_VERSION = 0.17.1

Your previous patch bumping to 0.16.2 was still in patchwork and not
marked superseded, so that's what Arnout was looking at yet=sterday; we
missed your newer version bump. Be sure to mark your superseded patches
as such in patchwork, it will help reduce the load.

Applied to master, after fixing the conflicts, thanks.

Also, as discussed previously with Antoine, rpds-py is currently 64-bit
only and breaks on 32-bit architectures. Could you look into fixing that
by making it "depends on BR2_ARCH_IS_64" (and propagate that dependency)
until it eventually gets fixed upstream (and maybe work with them)?

Regards,
Yann E. MORIN.

>  PYTHON_RPDS_PY_SOURCE = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
> -PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/75/be/e3f366aa4cd1e3a814f136773e506fc5423eff903ef0372a251df34e6e45
> +PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/b7/0a/e3bdcc977e6db3bf32a3f42172f583adfa7c3604091a03d512333e0161fe
>  PYTHON_RPDS_PY_SETUP_TYPE = maturin
>  PYTHON_RPDS_PY_LICENSE = MIT
>  PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
