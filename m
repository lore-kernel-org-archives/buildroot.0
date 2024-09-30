Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1708CF649D
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 09:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79B3F80F42;
	Mon, 30 Sep 2024 09:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ixfqvJ-e6Ne; Mon, 30 Sep 2024 09:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CD7780F45
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CD7780F45;
	Mon, 30 Sep 2024 09:32:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 404A71BF40E
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 09:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C76780C48
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 09:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HK6tW3jX2Q8a for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 09:32:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B7CA180C29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7CA180C29
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7CA180C29
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 09:32:21 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7412C2C801B0
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 11:32:18 +0200 (CEST)
Message-ID: <f1394abb-fd3e-4dd7-9ee1-1a245a505804@bubu1.eu>
Date: Mon, 30 Sep 2024 11:32:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240927230848.1853667-1-james.hilliard1@gmail.com>
Content-Language: en-US
In-Reply-To: <20240927230848.1853667-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1727688738; bh=1Ic1MvERma0Qf7pJ5xoQlyBYUaukk5UKFcwLgweJb1w=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=TOf3P3U6DPi3p3HT4Bjrq8pTe1pWnM61rBA8ovwY9OdpU47awQ5tvVWUNLEftKIy/
 nX2FDYGb4nWsCH0g9oa4O00M3usXrwm4iTuG/JMSzuEG/J8tLIUypfygPgeb3mNR2x
 S6GuUJ1s8OVz/vkdg7RKoG76a8EguUb4MMk5HJDv6aejZ84zTXKn6ttYpWIp8hXWNh
 dS8/jk6mDuQ7pREQ0+o4vvuVuvmP5ioN6VbZ1u9TXJLa0M5AZteKDWmk5ugGd4XVnz
 fwlEksnLOl7wleuGhKSH5igAeKZY58JXe8SvEgpvGnAxGh2Et0qtMVdwxav4mhjdgB
 P7adlXjW93J2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=TOf3P3U6
Subject: Re: [Buildroot] [PATCH 1/2] package/python-dotenv: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On 28.09.24 01:08, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I submitted this package in a similar patch a while ago as well:

https://patchwork.ozlabs.org/project/buildroot/patch/20240822123936.726609-1-buildroot@bubu1.eu/

So, I guess:

Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>

> ---
>   package/Config.in                        |  1 +
>   package/python-dotenv/Config.in          |  7 +++++++
>   package/python-dotenv/python-dotenv.hash |  5 +++++
>   package/python-dotenv/python-dotenv.mk   | 13 +++++++++++++
>   4 files changed, 26 insertions(+)
>   create mode 100644 package/python-dotenv/Config.in
>   create mode 100644 package/python-dotenv/python-dotenv.hash
>   create mode 100644 package/python-dotenv/python-dotenv.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index e1ceb81dc0..77216dc70b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1092,6 +1092,7 @@ menu "External python modules"
>   	source "package/python-docopt/Config.in"
>   	source "package/python-docutils/Config.in"
>   	source "package/python-dominate/Config.in"
> +	source "package/python-dotenv/Config.in"
>   	source "package/python-dpkt/Config.in"
>   	source "package/python-dtschema/Config.in"
>   	source "package/python-ecdsa/Config.in"
> diff --git a/package/python-dotenv/Config.in b/package/python-dotenv/Config.in
> new file mode 100644
> index 0000000000..f9b42bd28e
> --- /dev/null
> +++ b/package/python-dotenv/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_DOTENV
> +	bool "python-dotenv"
> +	help
> +	  Read key-value pairs from a .env file and set them as
> +	  environment variables.
> +
> +	  https://github.com/theskumar/python-dotenv
> diff --git a/package/python-dotenv/python-dotenv.hash b/package/python-dotenv/python-dotenv.hash
> new file mode 100644
> index 0000000000..710922fba3
> --- /dev/null
> +++ b/package/python-dotenv/python-dotenv.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/python-dotenv/json
> +md5  68abb78e05460ce558ca255de550e1ea  python-dotenv-1.0.1.tar.gz
> +sha256  e324ee90a023d808f1959c46bcbc04446a10ced277783dc6ee09987c37ec10ca  python-dotenv-1.0.1.tar.gz
> +# Locally computed sha256 checksums
> +sha256  80619b7049f08c81683ad0e01f08f257a840652dd71ee83146d36658c7d2c2b9  LICENSE
> diff --git a/package/python-dotenv/python-dotenv.mk b/package/python-dotenv/python-dotenv.mk
> new file mode 100644
> index 0000000000..324eea239e
> --- /dev/null
> +++ b/package/python-dotenv/python-dotenv.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# python-dotenv
> +#
> +################################################################################
> +
> +PYTHON_DOTENV_VERSION = 1.0.1
> +PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/bc/57/e84d88dfe0aec03b7a2d4327012c1627ab5f03652216c63d49846d7a6c58
> +PYTHON_DOTENV_SETUP_TYPE = setuptools
> +PYTHON_DOTENV_LICENSE = BSD-3-Clause
> +PYTHON_DOTENV_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
