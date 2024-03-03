Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68372C54E41
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 08:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11ED640339;
	Mon,  4 Mar 2024 08:51:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xdzGIdu-Xjhg; Mon,  4 Mar 2024 08:51:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DA4F40B7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DA4F40B7F;
	Mon,  4 Mar 2024 08:51:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25CD81BF580
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 08:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1302581EB6
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 08:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 43QjEfx8uV6C for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 08:51:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D99B881EB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D99B881EB4
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D99B881EB4
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 08:51:20 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a3122b70439so639062966b.3
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 00:51:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709542278; x=1710147078;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IA8dDHjNR9nr9S3R+Hjl13iY8DUs3UH2b9YgDRVgkh8=;
 b=G9eldR2U4HY7P8ufWO65zDEKcMzfv9B6tJJ6daf3Qvt/t8O8/8CHlMQh9eyw1VCImW
 VNtR9WiiOg++xmks/J4xAUJmqCbvaabwipkNDoyWTHjRWE4DUJy6zIOS1TEVF3ddPzvN
 BQfFuKJOBT/Sr1dnKDxdhyjkLp/R5x3jV+xRKsc+MNJ8SfDAGlDv8MxQW7ejUUhbWAah
 v8xZSXl6pLVXosTNI226ucFlNenVyJfEIET2pPOeI3qVwxm9djuwl49eWCfKWwsbvo54
 4L6cJdAsqatLoZ8377eaEiKAFD17Q4jzEQSzzmO/nBv7gv136XkpO4iboySwpfJ5IUKy
 g9iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwd3tx67JKDB3/YJD7MmpQlLaP7kdPpMf83Gq0+g54Euua6Gv8RM/ICJ/uBPGQ0yRsAzi6S9+AA2Q7IlxsyIpRspmYIqAfDg==
X-Gm-Message-State: AOJu0Yzw+K3Qa2aHP8ILqgFIC52igiZ8Au7FfHZzoTuQkVJs7K32atsA
 JfNJQboRhonzbaAZlii6pHK+frHyxN3l0e6mWGi7Q1+lucf1ozArHT8BXhvutw4=
X-Google-Smtp-Source: AGHT+IF0EM31GuH7WnGOTvqBi4B1cUKhwnFezOD79d88X5MDRLtP0eMQntOhyHcG7J0xWHWg7QwU+g==
X-Received: by 2002:a17:906:f10d:b0:a45:3792:fac4 with SMTP id
 gv13-20020a170906f10d00b00a453792fac4mr1494138ejb.69.1709542278400; 
 Mon, 04 Mar 2024 00:51:18 -0800 (PST)
Received: from [10.1.0.191] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 mb17-20020a170906eb1100b00a4490267ecfsm3393779ejb.221.2024.03.04.00.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 00:51:17 -0800 (PST)
Message-ID: <14463c49-2ad5-4996-b8f8-a1949ecde387@mind.be>
Date: Sun, 3 Mar 2024 21:31:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20240213094015.2203982-1-buildroot@bubu1.eu>
In-Reply-To: <20240213094015.2203982-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709542278; x=1710147078; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IA8dDHjNR9nr9S3R+Hjl13iY8DUs3UH2b9YgDRVgkh8=;
 b=WviZ9v051/u0k9WGSC+1O7nXhig5VWZniB98kg5OBSC69ABPjZLfW8K7iueVnkqGMV
 zGBqysr2dag85uhAR0dR9TNC8Acnsv6jeCKmBWS/lMExMTWKu2Aw8CwhDzphBjFsir/8
 +E2OyzP96LcRtz54DP9YWGx9bHtF5bcK0A8fXMkPNcqwq06Hrcc/2VHjoyp2ojXbgFBw
 WQ8ycxVyjj4GWZpxK2LmJqpLVGpBE0a4M5Tdpg6u/b/eAPrUYGlBr60LZpB0q0s6Ryt9
 uqc7ay7Yq9V3GTEXPR8McxbAPmbghiPTjv8gLnC5Wp/G4ofMpsqb8/y1pmUvZlS5M5Aj
 2jmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WviZ9v05
Subject: Re: [Buildroot] [PATCH v2] package/python-jc: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2024 10:40, Marcus Hoffmann via buildroot wrote:
> All dependencies are optional, and thus only mentioned in the package help text.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

  Applied to next, thanks, with two modifications:

      - add to DEVELOPERS;
      - add BSD-3-Clause license for vendored pbPlist.


  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - update to 1.25.1
>    - xmltodict and python xml module are now optional dependencies
>    - rename test class to conform to naming scheme
> ---
>   package/Config.in                             |  1 +
>   package/python-jc/Config.in                   | 12 ++++++++++
>   package/python-jc/python-jc.hash              |  5 +++++
>   package/python-jc/python-jc.mk                | 14 ++++++++++++
>   .../testing/tests/package/test_python_jc.py   | 22 +++++++++++++++++++
>   5 files changed, 54 insertions(+)
>   create mode 100644 package/python-jc/Config.in
>   create mode 100644 package/python-jc/python-jc.hash
>   create mode 100644 package/python-jc/python-jc.mk
>   create mode 100644 support/testing/tests/package/test_python_jc.py
> 
> diff --git a/package/Config.in b/package/Config.in
> index 91a6f1de00..7f4d0740ac 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1151,6 +1151,7 @@ menu "External python modules"
>   	source "package/python-janus/Config.in"
>   	source "package/python-jaraco-classes/Config.in"
>   	source "package/python-jaraco-functools/Config.in"
> +	source "package/python-jc/Config.in"
>   	source "package/python-jedi/Config.in"
>   	source "package/python-jeepney/Config.in"
>   	source "package/python-jinja2/Config.in"
> diff --git a/package/python-jc/Config.in b/package/python-jc/Config.in
> new file mode 100644
> index 0000000000..b88150e069
> --- /dev/null
> +++ b/package/python-jc/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_PYTHON_JC
> +	bool "python-jc"
> +	help
> +	  Converts the output of popular command-line tools and file-
> +	  types to JSON.
> +
> +	  Optionally requires python-pygments for syntax highlighting,
> +	  python-ruamel-yaml for yaml parsing and output and
> +	  python-xmltodict for xml parsing. PYTHON3_PYEXPAT is required
> +	  for xml and plist parsers.
> +
> +	  https://github.com/kellyjonbrazil/jc
> diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
> new file mode 100644
> index 0000000000..f54e69eaeb
> --- /dev/null
> +++ b/package/python-jc/python-jc.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/jc/json
> +md5  80e4c7d46ec856255577c6b364e7f931  jc-1.25.1.tar.gz
> +sha256  683352e903ece9a86eae0c3232188e40178139e710c740a466ef91ed87c4cc7e  jc-1.25.1.tar.gz
> +# Locally computed sha256 checksums
> +sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
> diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
> new file mode 100644
> index 0000000000..bb5bd426ec
> --- /dev/null
> +++ b/package/python-jc/python-jc.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-jc
> +#
> +################################################################################
> +
> +PYTHON_JC_VERSION = 1.25.1
> +PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
> +PYTHON_JC_SITE = https://files.pythonhosted.org/packages/53/a6/065f0796a0a21bc040bc88c8a33410c12729a2a6f4c269d0349f685796da
> +PYTHON_JC_SETUP_TYPE = setuptools
> +PYTHON_JC_LICENSE = MIT
> +PYTHON_JC_LICENSE_FILES = LICENSE.md
> +
> +$(eval $(python-package))
> diff --git a/support/testing/tests/package/test_python_jc.py b/support/testing/tests/package/test_python_jc.py
> new file mode 100644
> index 0000000000..974ce0c4b0
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_jc.py
> @@ -0,0 +1,22 @@
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPy3Jc(TestPythonPackageBase):
> +    __test__ = True
> +    # We deliberately run the test without the optional dependencies,
> +    # as this configuration is less tested upstream.
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_JC=y
> +        """
> +    timeout = 60
> +
> +    def test_run(self):
> +        self.login()
> +        cmd = "jc -h > /dev/null 2>&1"
> +        self.assertRunOk(cmd, timeout=self.timeout)
> +        cmd = "jc id | grep -q root"
> +        self.assertRunOk(cmd, timeout=self.timeout)
> +        cmd = "jc env | grep -q PATH"
> +        self.assertRunOk(cmd, self.timeout)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
