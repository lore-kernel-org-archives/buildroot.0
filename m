Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35215CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 15:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E010942E51;
	Sat, 30 May 2026 15:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vaO8gv7WgPhT; Sat, 30 May 2026 15:03:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04E4E42E57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780153418;
	bh=Jc46ZE2LDmnJcqZ1inKUqvdN3pHWYXvod04XwLt/V0Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZMjOf2lHgs//XYY9u2KaDw/hjhkxlWY/bIfXQt13t5Ft0hnR5FrQYL77Jss9BOjCD
	 TEiDeDHBiv6C6kSqjr/ySK8PzoPdDoxttN3gx8dOnZaachNIAc8rD0hAlWl1KudMdS
	 t76xDahVcggv3HhX7H4rZDQk86T3v2XnbWpHfUZw6C72bIFKcvPTjQIbuDyneN+fxC
	 g6pkjULSCvLoG/R3Q215r4MGQOUJh9DXxd9BHiT3rr/sleYezdwh8QqNs+SY+fEooJ
	 HuXR4jn3Q6vZTIiItUe3nNUEWF6Pk6bMY7Ev401Xmx1EXxWP167nB3DdCwD856G2X4
	 SoHZXVjRDy4Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04E4E42E57;
	Sat, 30 May 2026 15:03:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BEBAF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 811E442E57
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ef1K4O2Wq92N for <buildroot@buildroot.org>;
 Sat, 30 May 2026 15:03:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AABB742E51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AABB742E51
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AABB742E51
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:03:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A132BB97C710; Sat, 30 May 2026 17:03:31 +0200 (CEST)
Message-ID: <101f9238-6773-4221-9981-80c8f11eb968@rnout.be>
Date: Sat, 30 May 2026 17:03:29 +0200
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
 t=1780153412; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=wH9n0b+8zrhT3F1IHAo0T0V+NQeDreli/4dseNk1Mn8=;
 b=i1/KgQgeYv/H9HgNr5wiZFF6Gz7eV8I8GcHZYvPa6bzzXRrMEuhl2d1SuLqasn1VUFCwVx
 8rw5B7xnMciwV5uY7TzwxUU6r6vU/b2eZgP+BJ2kdEFHZCo/zcwix51aHBhbBwkBrO09r/
 C9PQQLNG9lxW4zZaQ2JZACPn2mt8+l/K5tVawzdDrKI/KidlKbHwJmPIRoczGG8lpC3noF
 6KR+vSRBPYoYLBy2spgEzsoUgf34me7XKsWf2BtwKemXkEnPuONjU/JlXwf9cjWjXJlTyN
 PL+5p/scnV8ZzTVXE4ERKbOQKZhxGYMp919u3L1ue9AwJBArvkfn5mG9nwMsMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=i1/KgQge
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

On 07/04/2026 19:37, Quentin Schulz via buildroot wrote:
> It may be beneficial to be able to run the script from Buildroot host
> packages to avoid external dependencies.

  Actually, the idea was that you only needed to run `make show-info` in your 
build and store that as an artifact, and that generate-cyclonedx is just a 
conversion tool that can be run from any environment. That's also why it's not 
`make cyclonedx`.

  That turns out to not really work though, because generate-cyclonedx still 
needs to be able to read patches, hash files, etc. And we don't actually want 
that logic in show-info.

  So perhaps moving it inside the Makefile structure (like pkg-stats) makes 
sense. However, that would mean that you _have_ to enable host-python and the 
various packages it uses...

  Note also that it was the intention to be able to get an SBoM without doing a 
build. I'm not sure if that is even possible now, but if we're going to rely on 
Buildroot-built host tools it's certainly not going to work.

  That said, this series only makes it _possible_ to do so, it doesn't force you 
to do it, so it looks like a good balance.

> I for example build Buildroot
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

  Another option would be to use BR2_WGET to download it instead of python 
modules. wget is guaranteed to be available on the build machine. It's 
unfortunately a bit difficult to get access to BR2_WGET the way it's structured 
now, but if we just use "wget" it will work in all cases when it already works 
with urlretrieve, I think.

  Regards,
  Arnout

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
