Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D65C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 09:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64F81605AE;
	Mon, 16 Sep 2024 09:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 49RLnYI0KOj0; Mon, 16 Sep 2024 09:53:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BA82605C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BA82605C7;
	Mon, 16 Sep 2024 09:53:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C04181BF397
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 09:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEE86605C7
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 09:53:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhQrM6_pVVa7 for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 09:53:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8D093605AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D093605AE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D093605AE
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 09:53:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.117.145])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A928EB00593;
 Mon, 16 Sep 2024 11:53:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Sep 2024 11:53:27 +0200
Date: Mon, 16 Sep 2024 11:53:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZugAF8bXay4VDOfS@landeda>
References: <20240915214456.1650491-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240915214456.1650491-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726480413;
 bh=fxZyOD0oU0/mnvsB8j3UxTr8ChyZ4CmYhzx8ZL4pvB0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IlNowScdy6vpAA/pe+U+PEZ5e7brNVVxRqCSxMmSuot4RW3rqTIW9epcvGOj7zk+7
 gM5Y1tVnR7o9jiv0z41WAFZ9XwpLxl/mI95xI+SUj3xCAn7XTlufos89C5h0iHUr2S
 IcxBwzIYlsYipLS/IKQ7sY93fGh8N3Zcu6fjkVUjNRL9fFtQq3HTetmDZM4vGJCUxC
 qmQ/+FY8lYz9IgeLjtBzxhhnOXipy2cf1jmaFqkKKAZ5Cc6VxArc1rhJSoB0lxbSFo
 SjtKOshXTU1RouGDxuBZTTcLg+vv2pzMxwBD/BZzUsv6MzoSq3kLI55ZaDGRhemeg4
 4TJY7Mf27Ic1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IlNowScd
Subject: Re: [Buildroot] [PATCH 1/1]
 package/python-magic-wormhole-transit-relay: bump to version 0.3.1
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
Cc: Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jame, All,

On 2024-09-15 15:44 -0600, James Hilliard spake thusly:
> Drop patch which is now upstream.
> 
> Add new python-autobahn runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[--SNIP--]
> diff --git a/package/python-magic-wormhole-transit-relay/Config.in b/package/python-magic-wormhole-transit-relay/Config.in
> index 1a743c10fe..b956a35a92 100644
> --- a/package/python-magic-wormhole-transit-relay/Config.in
> +++ b/package/python-magic-wormhole-transit-relay/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY
>  	bool "python-magic-wormhole-transit-relay"
> +	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime

You forgot to propagate the phython-autobahn dependency.

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_PYTHON_TWISTED # runtime
>  	help
>  	  Transit Relay server for Magic-Wormhole.
> diff --git a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
> index f131477a40..a72907222a 100644
> --- a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
> +++ b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/magic-wormhole-transit-relay/json
> -md5  aa575a4e22b3d5099674ba88b136a9a2  magic-wormhole-transit-relay-0.2.1.tar.gz
> -sha256  cb4801b46890eaff97286e0e3fec62d1d52ffe317d140083b6336a1fb4e8fa5e  magic-wormhole-transit-relay-0.2.1.tar.gz
> +md5  99d1a7d2ff78e7de4a2f91698bc061cd  magic-wormhole-transit-relay-0.3.1.tar.gz
> +sha256  2ef2efbe4d34f0e624870f842259fd733ba77152ed310af4349774a62884900e  magic-wormhole-transit-relay-0.3.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  d70f6469bb210c2aa4c0dfd74f498ef5f0467a137d8296479088e7243c5884eb  LICENSE
> diff --git a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
> index e4ffe6e7a6..e557b456ed 100644
> --- a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
> +++ b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION = 0.2.1
> +PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION = 0.3.1
>  PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SOURCE = magic-wormhole-transit-relay-$(PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION).tar.gz
> -PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SITE = https://files.pythonhosted.org/packages/21/c9/be25bb30e327037e009657960fc594d089b118c0d81cc6a200cad1bb3852
> +PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SITE = https://files.pythonhosted.org/packages/be/81/c5c19ea32d1d770f2513503fef4589c6958ae9b44c03ea121e9fbc74c704
>  PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SETUP_TYPE = setuptools
>  PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_LICENSE = MIT
>  PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_LICENSE_FILES = LICENSE
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
