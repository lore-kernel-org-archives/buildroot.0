Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F76C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 18:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B1F2412E3;
	Mon,  3 Feb 2025 18:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfoR1nV9nrkJ; Mon,  3 Feb 2025 18:09:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85D444129F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85D444129F;
	Mon,  3 Feb 2025 18:09:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AA89185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E2AE409B1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BDAbPBkeIb4 for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 18:09:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A943F40002
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A943F40002
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A943F40002
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:09:30 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43635796b48so29239625e9.0
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 10:09:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738606168; x=1739210968;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O5sev0q1VTvfdz3YoJvPSjsg6m2z8G8HMlxGsxBhj68=;
 b=TvzbaQCM49DqECMDD2Whx99ArS1c7sFS7GXE98Mldh8Mw3zIODtXt5W2pImhyXDlVi
 rz52UfX5UAmMHM7oLnnNl3Xz9JM3JPXXsGEzoH82kgOUtM9XYKWIQT37JZlNbhfnoO7n
 n7Zx2s1drFTqvxAzCcDenthAVFvDISF/YPoZ/OETQ2XLUC7lgO8BLaYKbB6TE+14GqbB
 Z3/hNFabflDMpE+qN4qv/ecmimjG0Pdr2qn/kToCLxG39kIWLKZ6L9Rm/ywLyyP7C/31
 1rRIM9OZxRVWn818TFugLCzSJ1cEeu1u2+1IUgmqIEpqbW8S7Un9cQMkFuvvZ16fWeJR
 v19A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9qdQfSlIBfNTieEpeublfms/KJD8z5U+A7M6pXeYR0Pm5HaWFwtlniilBOTxKFqbb+sQumVKUiEw=@buildroot.org
X-Gm-Message-State: AOJu0YzYoTwiyz8HlMSfPQQXFdJ03cR6Uaoh9jIickjJH5AS6vGBv+IR
 tk5FxfFuM9lwcezt9DIxRWQST+HPJadmY27Cmj4hR3dLmj5/EXycf69VtzhStQdA+/Iq4f1RDvT
 e
X-Gm-Gg: ASbGncvDAf2X499psPI8OfU4NKsJWmcC1ADP6M2K2AtlLyj0l2jqPfSuOZBEerDrPeb
 yJ2bb0d9r/miIS2Sd2w4c8Jc6hKcICd7K0hUJmZkpzxl/A8+YXR0S8rqk4owGiZNFnx860qmq+G
 VOOjig/X0Kcy27EflpN5NnbzenYJraFBPwxHRm244fbtgbFAWGYQEVPzInbwtF09+J+WBHh3ETX
 4L24ZRK94kM1FAoOWbX/RU0JQNwgZqolx+3i/V1VWQznN8ydd0gomwHZl6eEjySq7b9QX6BOYCL
 1lvw3ZM2EGHtXDRhPVB2WDeU7yy7oiKrtNn112LJqRnh3nhPQlZHbql+kw==
X-Google-Smtp-Source: AGHT+IGccGbiOXoSIOrvgOf22d9GVi/neruWmChjG7q9ITQe8nkUELCTcNwy5IF3lMyYoc6IcdP9Ew==
X-Received: by 2002:a05:600c:1514:b0:434:ea1a:e30c with SMTP id
 5b1f17b1804b1-43905f99315mr1909245e9.13.1738606167981; 
 Mon, 03 Feb 2025 10:09:27 -0800 (PST)
Received: from [10.11.2.38] (220.211-78-194.adsl-static.isp.belgacom.be.
 [194.78.211.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38da1ca14bcsm2289087f8f.95.2025.02.03.10.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 10:09:27 -0800 (PST)
Message-ID: <56a657e8-4fef-4039-836e-846d243fb715@mind.be>
Date: Mon, 3 Feb 2025 19:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250111171050.2905238-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20250111171050.2905238-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738606168; x=1739210968; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=O5sev0q1VTvfdz3YoJvPSjsg6m2z8G8HMlxGsxBhj68=;
 b=c1O15IdTWA/sS/Grky8f1R6H1TDPIkc7MlslkNYq7suLvDqpzEHv6d6JLdF4WUKJ67
 YCIYbPpdV3xM3QFd7Q51U2WmZuvrjN4zwT7bUm930PPv2tdRT1iXeLlNFYrxHrLbLghu
 2ArNeEW/UbYeNbsYmYIAIBtKkjYTY6kQAiNXCgb014y6mh2XQC52n9rQ/7dWLxyxwKZh
 oJ7yrs1l3YSemw7RGbN3CuZmJElVN7XZHloAuAPRvGkksOW5+MzuaqF4jy2p1WrURtmS
 vjxIljg2SHRK0gCKr5PLXsrFOQIPv4cVl5/vT0Qt7kSyGyqrHHEAraXnvYmA+BY3SrJ4
 TdOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=c1O15IdT
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to
 version 75.8.0
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi James,

On 11/01/2025 18:10, James Hilliard wrote:
> Rebase add executable patch.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  After this update, I get errors like this:

* Getting build dependencies for wheel...
/home/arnout/src/buildroot/output/per-package/host-python-six/host/lib/python3.12/site-packages/setuptools/_distutils/dist.py:270: 
UserWarning: Unknown distribution option: 'tests_require'
   warnings.warn(msg)
/home/arnout/src/buildroot/output/per-package/host-python-six/host/lib/python3.12/site-packages/setuptools/_distutils/dist.py:270: 
UserWarning: Unknown distribution option: 'python_requires'
   warnings.warn(msg)
usage: setup.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]
    or: setup.py --help [cmd1 cmd2 ...]
    or: setup.py --help-commands
    or: setup.py cmd --help

error: invalid command 'egg_info'

ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
make: *** [package/pkg-generic.mk:289: 
/home/arnout/src/buildroot/output/build/host-python-six-1.17.0/.stamp_built] Error 1

  I also got it for host-python-httplib2.

  Of course, this only happens natively (Fedora 40), not in our docker image... 
I looked a bit at what is different - I think the main difference is that my 
Fedora host has python 3.12 installed while the Ubuntue container doesn't.

  Regards,
  Arnout

> ---
>   package/python-setuptools/0001-add-executable.patch | 12 ++++++------
>   package/python-setuptools/python-setuptools.hash    |  4 ++--
>   package/python-setuptools/python-setuptools.mk      |  4 ++--
>   3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/package/python-setuptools/0001-add-executable.patch b/package/python-setuptools/0001-add-executable.patch
> index cd3cb66a5b..9e12c4b628 100644
> --- a/package/python-setuptools/0001-add-executable.patch
> +++ b/package/python-setuptools/0001-add-executable.patch
> @@ -1,4 +1,4 @@
> -From aa232855cf717835a5d16954f1fd8ead315a5fa6 Mon Sep 17 00:00:00 2001
> +From 995cf87c0dfc420908847a06661cbae21d16a8f6 Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
>   Date: Mon, 7 Dec 2015 01:14:33 +0100
>   Subject: [PATCH] add executable
> @@ -22,10 +22,10 @@ Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>    2 files changed, 11 insertions(+)
>   
>   diff --git a/setuptools/command/install.py b/setuptools/command/install.py
> -index e2ec1abdd..e78ace3d4 100644
> +index 741b140c7..5a281237a 100644
>   --- a/setuptools/command/install.py
>   +++ b/setuptools/command/install.py
> -@@ -26,6 +26,7 @@ class install(orig.install):
> +@@ -39,6 +39,7 @@ class install(orig.install):
>        distribution: Distribution  # override distutils.dist.Distribution with setuptools.dist.Distribution
>    
>        user_options = orig.install.user_options + [
> @@ -33,7 +33,7 @@ index e2ec1abdd..e78ace3d4 100644
>            ('old-and-unmanageable', None, "Try not to use this!"),
>            (
>                'single-version-externally-managed',
> -@@ -60,6 +61,7 @@ class install(orig.install):
> +@@ -73,6 +74,7 @@ class install(orig.install):
>            )
>    
>            super().initialize_options()
> @@ -42,11 +42,11 @@ index e2ec1abdd..e78ace3d4 100644
>            self.single_version_externally_managed = None
>    
>   diff --git a/setuptools/command/install_scripts.py b/setuptools/command/install_scripts.py
> -index 7b90611d1..216cadf80 100644
> +index 4401cf693..38f5d5092 100644
>   --- a/setuptools/command/install_scripts.py
>   +++ b/setuptools/command/install_scripts.py
>   @@ -18,6 +18,13 @@ class install_scripts(orig.install_scripts):
> -     def initialize_options(self):
> +     def initialize_options(self) -> None:
>            orig.install_scripts.initialize_options(self)
>            self.no_ep = False
>   +        self.executable = None
> diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
> index e99fc7d9b2..87a4d877ea 100644
> --- a/package/python-setuptools/python-setuptools.hash
> +++ b/package/python-setuptools/python-setuptools.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/setuptools/json
> -md5  ca5ea2d5e9622d6a7b9f6c6664821853  setuptools-75.3.0.tar.gz
> -sha256  fba5dd4d766e97be1b1681d98712680ae8f2f26d7881245f2ce9e40714f1a686  setuptools-75.3.0.tar.gz
> +md5  a42b075e3e18e724580f4caf7944354a  setuptools-75.8.0.tar.gz
> +sha256  c5afc8f407c626b8313a86e10311dd3f661c6cd9c09d4bf8c15c0e11f9f2b0e6  setuptools-75.8.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
> diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
> index d6b65a2b9e..af59e54d11 100644
> --- a/package/python-setuptools/python-setuptools.mk
> +++ b/package/python-setuptools/python-setuptools.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SETUPTOOLS_VERSION = 75.3.0
> +PYTHON_SETUPTOOLS_VERSION = 75.8.0
>   PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
> -PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ed/22/a438e0caa4576f8c383fa4d35f1cc01655a46c75be358960d815bfbb12bd
> +PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/92/ec/089608b791d210aec4e7f97488e67ab0d33add3efccb83a056cbafe3a2a6
>   PYTHON_SETUPTOOLS_LICENSE = MIT
>   PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
>   PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
