Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCA7FF5136
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 19:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11BB5403C5;
	Tue,  7 Apr 2026 19:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRIZrmoAqK_v; Tue,  7 Apr 2026 19:25:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAE0B403B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775589913;
	bh=bS1dy7vtsc3BrBHUKjimZjyUHXsdA7ZOuDQFZMyibcw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kSJ8KHYKjF8NTuLUqq5GZDhdpHQzIcAUf/6hdJBkQ7dkalQhp7IbZhsA0OuKNyKzd
	 JFwBfrRtxsGnCAvYGhqLSd6FLo+lcFgFwnqmiSzuS2GhVvI/0OY876+yTIGVuaS16v
	 I7EEQG53mpioZdqeCgl8VrbX031+0O4m56UP74H9dUwSlnPCmpDlzk6BJ6DOAApuka
	 sIG7+rjgLQBfHFVd5fZjbXfms3Vl67WsZkryEB8nZ4T0wg4GNYjmjdSiEv2ED5c25B
	 2vM/6RtpPEGZ0QKgbUajFahhzRlB1N8fulZ+5bWttcsrMzS5A6I2rDG3yUIDjO5h0R
	 Sb0Da4mngQy5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAE0B403B1;
	Tue,  7 Apr 2026 19:25:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B73D9237
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A880E606F4
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7MJeR_izqCJp for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 19:25:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 74FBE6063F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74FBE6063F
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74FBE6063F
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:25:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1031EB97BBAD; Tue,  7 Apr 2026 21:25:05 +0200 (CEST)
Message-ID: <3deeef5d-fe26-4935-b127-f1ac64ad3e93@rnout.be>
Date: Tue, 7 Apr 2026 21:25:03 +0200
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
 t=1775589907; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=qEYf7J8rMa7timwKBnq/UHG33bmtFDHXDEZq5TXrevg=;
 b=X5K5I+T4APpw0/CWuFSIXUSv50GOk28kkxLYbqzCMNqz/4pIGD4G49lPsyInll7kKFSJ7Y
 WGxNKiXwUyd3HzGGqcxcBID5Ec3nqs9vCAV1tux9zTdPyo+mB2PdnC4nDkY19InwrKVORS
 7O6HKj3VfWJRCUdb35/MlpvwzuBrd2ERJmpgR+qlgnEtKmtKVDEkKmfAaMhUihftxhQ/AR
 zox2TzcUJ/WLieyrhSRK9EixLiM9FUvCLP8BMPlnJJ9BFHNMSoqkg1Nw3umRiXY2lNqtoJ
 z+WiNO6AztEw087JpKhEVYBFh9VEYxDJnCYCauV1u2D3GPz7+v9Ig84JsOGwvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=X5K5I+T4
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

  Hi Quentin,

  I didn't look at your series in any detail, but one thing jumped out at me.

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
> for host Python to use.

  In other words, host-python's _ssl doesn't use the system-installed 
certificates? I think that's pretty bad. We generally want host tools to be 
rather hermetic, but specifically ca-certificates need to be up to date. If 
you're using an unmodified Buildroot 2026.05 ten years from now, then it's 
likely that some of the certificates in current ca-certificates bundle have 
expired, and you again get download failures... And if the system's 
ca-certificates is not up to date, there will be stuff that you won't be able to 
download anyway - maybe you can't even download ca-certificates itself, so we 
_have_ to assume the system ca-certificates is up-to-date.

  In other words - I think the better option is to make sure that _ssl uses the 
system certificates.

  (Of course, I may have completely misunderstood the issue.)

  Oh, I actually see what the problem is: host-openssl sets
--openssldir=$(HOST_DIR)/etc/ssl - and it has to, because it installs a bunch of 
files in there. So perhaps the solution is to symlink /etc/ssl/certs to 
$(HOST_DIR)/etc/ssl?

  Regards,
  Arnout

> Another option is to go for host-python-certifi
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
