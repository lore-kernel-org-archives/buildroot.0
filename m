Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227F7CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 15:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6BEB42EBC;
	Sat, 30 May 2026 15:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WAtkrOMhVAYc; Sat, 30 May 2026 15:38:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1452442E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780155489;
	bh=8b9J9rVUnqi1kd3978zV+R7li3Cwydp0YOYbfYgbxFo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l4RK2vvMrms8zRLyT++/MhmcEHFcyvZpw2uhnjQb1iDbHDu55sFWZ1lO34M0t+lqP
	 azfuTl/LXyuFr4s5jGu3BwSB5ANtO/jj8X7cXa/BA89rGjFitIKMF9HrG9DmQKR2rD
	 OuojJCslMapo7XS213Tg3EXKC4iULavpZyFm300nb7DHQpkEj+EZo0f3P8WqF+pTph
	 yxqFhFBn06Vz5Vqn4sPcaJYAElzZPFWGOoMohjnUPvNV9v7pzoXYGcAJKnktHQNNq+
	 4BLmp0xpakdH2K/1OCFTmcQTqLEzQQHDLAayDGgz20efGedorVWDQ6waFMQJrLJnHo
	 60qR/0MKGoPvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1452442E65;
	Sat, 30 May 2026 15:38:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A29BF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38DB08539B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tv-yM-JcIU3V for <buildroot@buildroot.org>;
 Sat, 30 May 2026 15:38:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 05C9A8528C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05C9A8528C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05C9A8528C
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:38:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E1024B97C712; Sat, 30 May 2026 17:38:02 +0200 (CEST)
Message-ID: <268e3447-f15c-4ede-9c8d-445b9ca03c9d@rnout.be>
Date: Sat, 30 May 2026 17:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>, Martin Bark <martin@barkynet.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Quentin Schulz <quentin.schulz@cherry.de>
References: <20260407-generate-cyclonedx-br-v1-0-03c45ccba2ed@cherry.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260407-generate-cyclonedx-br-v1-0-03c45ccba2ed@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780155483; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=NiMrLrwfznqo0S29im2xGndwsv6/b5M8/5rievb8m0M=;
 b=FAcIl62WxrSyv5eoqxXxLCi4lE9EFHG76l5Gprb5n6zcV58VrVuq3Gz6fQJcnOjBfv6lpR
 GIxlIMMl13OLKybkmc6Wv7xtK+jmyD5N6p2ryPWkiu0SOsvVCp3gpQrHWUe+3Qfikf85FN
 3K870lPIUoRiylbszmZxDY3CpmCdwGZQuPhvFfI9o7WC1/mklZO5yBKxx+ffxlGPl0RvB0
 lvHOKAaKZsyQaeGq2fIW28laKs8yBLEjMbdYXTXcJR3CCQH261CiiYbi0u+1yLBRluTEYQ
 zVeEZhZnn9VcsGTxgk4sytgSTbAK/ubqPDXw4qqhuBAYGfzwTm5qoi8HSnGTow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=FAcIl62W
Subject: Re: [Buildroot] [PATCH 0/4] make utils/generate-cyclonedx runnable
 with Buildroot host packages
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2026 19:37, Quentin Schulz via buildroot wrote:
> It may be beneficial to be able to run the script from Buildroot host
> packages to avoid external dependencies. I for example build Buildroot
> within some ancient container where I don't have a recent-enough Python
> to run generate-cyclonedx with. I already build host Python as part of
> my build, so it seems like a good opportunity to reuse it for running
> generate-cyclonedx with it instead of going for a separate container
> just for running that script.
> 
> This however required a few changes. First, I needed to enable
> BR2_PACKAGE_HOST_PYTHON3_BZIP2 otherwise importing the bz2 module would
> fail.
> However after looking at the code deeper, there isn't a way right now
> for this script to actually receive a compressed patch to parse,
> therefore instead of requiring that option to be selected, the
> compression "support" is removed from the script entirely.
> 
> Then, I got hit by Python telling me it does not know what HTTPS is. The
> issue was that the ssl (well, technically _ssl) module wasn't built
> unless BR2_PACKAGE_HOST_PYTHON3_SSL is enabled and without that, no
> HTTPS support.
> 
> Going further, Python would then complain that it cannot verify the
> certificates. The answer was to build a host variant of ca-certificates
> for host Python to use. Another option is to go for host-python-certifi
> instead, with the following diff:
> 
>    diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
>    index fad0671166..461743692e 100755
>    --- a/utils/generate-cyclonedx
>    +++ b/utils/generate-cyclonedx
>    @@ -51,7 +51,13 @@ if not SPDX_SCHEMA_PATH.exists():
>         # Download the CycloneDX SPDX schema JSON, and cache it locally
>         cyclonedxpath.mkdir(parents=True, exist_ok=True)
>         try:
>    -        urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
>    +        import ssl
>    +        import certifi
>    +
>    +        context = ssl.create_default_context(cafile=certifi.where())
>    +        with urllib.request.urlopen(SPDX_SCHEMA_URL, context=context) as response, \
>    +                open(SPDX_SCHEMA_PATH, "wb") as f:
>    +            f.write(response.read())
>         except urllib.error.URLError as e:
>             if "CERTIFICATE_VERIFY_FAILED" in str(e.reason):
>                 raise Exception("Couldn't verify certificate. Try enabling BR2_PACKAGE_HOST_CA_CERTIFICATES.")
> 
> The downside is that users running this script externally from Buildroot
> will need to install certifi Python module to run the script. I guess
> we could run urlretrieve first and if it fails, then fallback to
> certifi. What do you think?
> 
> So, this adds a couple of messages hinting at the user what may be
> missing for generate-cyclonedx to run. Note that
> BR2_PACKAGE_HOST_PYTHON3_SSL and BR2_PACKAGE_HOST_CA_CERTIFICATES are
> optional, they only are needed if the SPDX schema isn't available yet.
> One can also decide to download it externally with wget/curl in the
> appropriate location and avoid having to build host ca-certificates
> and/or host Python with ssl support (it does bring host-libopenssl
> after all!).
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

  As predicted, I applied the series to master, thanks.

  Regards,
  Arnout

> ---
> Quentin Schulz (4):
>        utils/generate-cyclonedx: remove "support" for bz2 and gzip compressed patches
>        utils/generate-cyclonedx: better error message when host Python is built without ssl
>        package/ca-certificates: enable host package variant
>        utils/generate-cyclonedx: hint at missing Buildroot host package on a specific error
> 
>   package/Config.in.host                     |  1 +
>   package/ca-certificates/Config.in.host     | 12 ++++++++++++
>   package/ca-certificates/ca-certificates.mk | 30 ++++++++++++++++++++++++++++++
>   utils/generate-cyclonedx                   | 29 +++++++++++++++--------------
>   4 files changed, 58 insertions(+), 14 deletions(-)
> ---
> base-commit: ac4c32f6f839d1b813125e64f0e23a98922ac602
> change-id: 20260407-generate-cyclonedx-br-2b2d2561072c
> 
> Best regards,
> --
> Quentin Schulz <quentin.schulz@cherry.de>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
