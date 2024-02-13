Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EFFC48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 23:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40FA340549;
	Tue, 13 Feb 2024 23:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dlin95LIKAPI; Tue, 13 Feb 2024 23:14:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C3874056B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C3874056B;
	Tue, 13 Feb 2024 23:14:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E71C1BF2C0
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 23:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEEA681380
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 23:14:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dW2i3BKz2Esg for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 23:14:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 097208136D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 097208136D
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 097208136D
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 23:14:02 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 89FA62C80C0F;
 Wed, 14 Feb 2024 00:13:58 +0100 (CET)
Message-ID: <7384cb6e-1b5b-4fca-ba0c-2c4d0fcd05a3@bubu1.eu>
Date: Wed, 14 Feb 2024 00:13:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
 <20240213211512.3918044-4-james.hilliard1@gmail.com>
Content-Language: en-US
In-Reply-To: <20240213211512.3918044-4-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707866039; bh=ehqKcrPIalrZlDgd6cozBYFlcGE7zLq+vgtaI0pBSL4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=b7V7hdpCyV7Z9d9z1HZRohZ27SG4T8MnRxCx/dtiUStmq1B5Cu8jKN5rik73wvnHf
 E/6PiUw4SKrj9e7tdv1HdWKMlTfxu3K+yz1JCY7GZV36hjFjzRpzOEVftW/UvrPq2A
 KZLZN5ZG0Qrghcjhz93MuhzQsUy5rkfW2rblQFhWG4AHy2XAkPwQCF86wND+i33iFm
 dbou1LGH3M8WglDGi+EY2uA34weyHgO44g65Ja6uqxhc4gXT4ibob7yC6Ny+z/FIwN
 t6PNnq0/MDLwgBUcB6IXpV1NK7DhkRUJtgZuk8zHzE8ZHd+aU6/SbA7TuztvQqMwcQ
 o9/NvoZt/Ys1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=b7V7hdpC
Subject: Re: [Buildroot] [PATCH v8 04/26] package/python-setuptools: revert
 to last version with functional --build-option
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Louis Aussedat <aussedat.louis@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On 13.02.24 22:14, James Hilliard wrote:
> A recent change in setuptools accidentially broke the ability to
> pass build_ext args via the --build-option config setting.
> 
> Lets downgrade to the last working version for now.

Do you have a link to a issue here? Is thing acknowledged by upstream, 
is this planned to be fixed?

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-setuptools/python-setuptools.hash | 4 ++--
>   package/python-setuptools/python-setuptools.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
> index 7f13ac3896..9c971eec11 100644
> --- a/package/python-setuptools/python-setuptools.hash
> +++ b/package/python-setuptools/python-setuptools.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/setuptools/json
> -md5  b82de45aaa6b9bb911226660212ebb83  setuptools-69.0.3.tar.gz
> -sha256  be1af57fc409f93647f2e8e4573a142ed38724b8cdd389706a867bb4efcf1e78  setuptools-69.0.3.tar.gz
> +md5  d967ca2ba7f46db887daee2d5c9bd6a2  setuptools-68.2.2.tar.gz
> +sha256  4ac1475276d2f1c48684874089fefcd83bd7162ddaafb81fac866ba0db282a87  setuptools-68.2.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
> diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
> index 0aea3c6cfa..f26f427ccc 100644
> --- a/package/python-setuptools/python-setuptools.mk
> +++ b/package/python-setuptools/python-setuptools.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SETUPTOOLS_VERSION = 69.0.3
> +PYTHON_SETUPTOOLS_VERSION = 68.2.2
>   PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
> -PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/fc/c9/b146ca195403e0182a374e0ea4dbc69136bad3cd55bc293df496d625d0f7
> +PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ef/cc/93f7213b2ab5ed383f98ce8020e632ef256b406b8569606c3f160ed8e1c9
>   PYTHON_SETUPTOOLS_LICENSE = MIT
>   PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
>   PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
