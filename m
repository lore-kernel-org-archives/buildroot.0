Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F63C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 15:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37750403A9;
	Fri, 12 Apr 2024 15:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pEXjwUkvJK8H; Fri, 12 Apr 2024 15:48:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21586405DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21586405DD;
	Fri, 12 Apr 2024 15:48:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39FA61BF42E
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 15:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3429B405DD
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 15:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLmryhgeVdSH for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 15:48:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E0B88403A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0B88403A9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0B88403A9
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 15:48:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B8F5513F89C;
 Fri, 12 Apr 2024 17:48:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Apr 2024 17:48:27 +0200
Date: Fri, 12 Apr 2024 17:48:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <ZhlXyynG6M5vb_iD@landeda>
References: <20240412054421.1346030-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412054421.1346030-1-heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712936914;
 bh=LwHVdlo6OlE2GnGWQr/mGpQ3r+H1aWrth+6ktTQMVBE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qxWY7P1HohK96ImF2QDKVwBhvBl0+CCQPXUBY5Z6dihpcPhKrtdTENbEG+BkeXl+/
 3/aLW+ChUs6zsqWwbMjNDgoMFvEa/Xy1R75a6jr6hMsKE2QM+RHFifm1AJF9ay9Z7E
 3RgaGCnAsTn4LrFvFh5Pe0HkTc4Gazmp9BlFuQdlXiNAyDZ765wnbVzk2RkgpBX5j9
 G7LcT4rmbjmM4ZCHVjaKesmJD5uOPu4oZiIVBNf5bk+ssv+YL/q1YoD6OC2mlGrzRR
 DD24Uan13CPXJKz7wlKqp2GIAh/yaQZh2sSnhDsNppkmIFUwiLCKB4qtJwjx0GE7im
 6MlMtsv7WLhlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qxWY7P1H
Subject: Re: [Buildroot] [PATCH] package/python-pathspec: enable target
 variant
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Heiko, All,

On 2024-04-12 07:44 +0200, Heiko Thiery spake thusly:
> Also a runtime testcase is added.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/python-pathspec/Config.in b/package/python-pathspec/Config.in
> new file mode 100644
> index 0000000000..4ecf76d456
> --- /dev/null
> +++ b/package/python-pathspec/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_PATHSPEC
> +	bool "python-pathspec"
> +	help
> +	  pathspec is a utility library for pattern matching of file paths.

    $ ./utils/docker-run make check-package
    package/python-pathspec/Config.in:4: help text: <tab><2 spaces><62 chars> (https://nightly.buildroot.org/#writing-rules-config-in)

[--SNIP--]
> diff --git a/support/testing/tests/package/sample_python_pathspec.py b/support/testing/tests/package/sample_python_pathspec.py
> new file mode 100644
> index 0000000000..6205126e21
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_pathspec.py
> @@ -0,0 +1,35 @@
> +# example from https://pypi.org/project/pathspec/
> +
> +import pathspec

I've added an empty line after the import, it's... cleaner. I guess?

Applied to master, with the above two fixed, thanks.

Regards,
Yann E. MORIN.

> +# The gitignore-style patterns for files to select, but we're including
> +# instead of ignoring.
> +spec_text = """
> +
> +# This is a comment because the line begins with a hash: "#"
> +
> +# Include several project directories (and all descendants) relative to
> +# the current directory. To reference a directory you must end with a
> +# slash: "/"
> +/project-a/
> +/project-b/
> +/project-c/
> +
> +# Patterns can be negated by prefixing with exclamation mark: "!"
> +
> +# Ignore temporary files beginning or ending with "~" and ending with
> +# ".swp".
> +!~*
> +!*~
> +!*.swp
> +
> +# These are python projects so ignore compiled python files from
> +# testing.
> +!*.pyc
> +
> +# Ignore the build directories but only directly under the project
> +# directories.
> +!/*/build/
> +
> +"""
> +
> +spec = pathspec.PathSpec.from_lines('gitwildmatch', spec_text.splitlines())
> diff --git a/support/testing/tests/package/test_python_pathspec.py b/support/testing/tests/package/test_python_pathspec.py
> new file mode 100644
> index 0000000000..4e4a992bb3
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_pathspec.py
> @@ -0,0 +1,11 @@
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPathSpec(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_PATHSPEC=y
> +        """
> +    sample_scripts = ["tests/package/sample_python_pathspec.py"]
> -- 
> 2.39.2
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
