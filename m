Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A22C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 11:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 756DC80B64;
	Wed,  7 Feb 2024 11:39:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 382Kd-7CYsaT; Wed,  7 Feb 2024 11:39:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA1F080C2A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA1F080C2A;
	Wed,  7 Feb 2024 11:39:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E6B31BF2C4
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57C89400D0
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:39:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qpfiK-CaIYto for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 11:39:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 685C340025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 685C340025
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 685C340025
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 11:39:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7DE0913F861;
 Wed,  7 Feb 2024 12:39:11 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 12:39:11 +0100
Date: Wed, 7 Feb 2024 12:39:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: ~bubu <buildroot@bubu1.eu>
Message-ID: <ZcNr316V-O80kkss@landeda>
References: <170717110256.12359.16509380444438086733-0@git.sr.ht>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <170717110256.12359.16509380444438086733-0@git.sr.ht>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707305953;
 bh=Qx418+NDoNjXetxRnjpnxyV5omQ0m1GZhhqnXI9KZnQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lZ0Zgwy/lQuPu4p18UG3TFI4eQPSCk3+DkO6F1gJQAIuBlBhCMAystARV9a9DdJum
 lHzWDZiw/9BaKZXVVE7qsr6AfgQ67nICyW/Dx/i3lMo3DdJU9dV8qExVS/nA36yNXV
 Kq6Dl9z4hMr64rJkX8FhzcJqK7ZueaBT6ATlXnAIpA7zgWpbvHpyJCppCxurHzrNLf
 uYpPOesODTtYKBhaSyUehVo5532Uj1km9My8eRTkowyvvR+o3iH8Rtz54E54Y+b3iX
 C/n9pw7bpCdI98jmrHFuqDkipcOT/b6pc03fZYVkqxGAcX4xqCCdrqW03VwFY5C37r
 sbUh4fNFVluFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lZ0Zgwy/
Subject: Re: [Buildroot] [PATCH buildroot] support/testing: add
 python-uvloop runtime test
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, All,

On 2024-02-05 22:47 +0100, ~bubu spake thusly:
> From: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, with your SoB added, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../tests/package/sample_python_uvloop.py     |  6 +++++
>  .../tests/package/test_python_uvloop.py       | 22 +++++++++++++++++++
>  2 files changed, 28 insertions(+)
>  create mode 100644 support/testing/tests/package/sample_python_uvloop.py
>  create mode 100644 support/testing/tests/package/test_python_uvloop.py
> 
> diff --git a/support/testing/tests/package/sample_python_uvloop.py b/support/testing/tests/package/sample_python_uvloop.py
> new file mode 100644
> index 0000000000..dc85d3e04e
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_uvloop.py
> @@ -0,0 +1,6 @@
> +import uvloop
> +
> +async def main():
> +    print("Hello world!")
> +
> +uvloop.run(main())
> diff --git a/support/testing/tests/package/test_python_uvloop.py b/support/testing/tests/package/test_python_uvloop.py
> new file mode 100644
> index 0000000000..c5079ba59c
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_uvloop.py
> @@ -0,0 +1,22 @@
> +import os
> +
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPy3Uvloop(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_UVLOOP=y
> +        """
> +    sample_scripts = ["tests/package/sample_python_uvloop.py"]
> +
> +    def test_run(self):
> +        self.login()
> +        self.check_sample_scripts_exist()
> +
> +        cmd = "%s %s" % (self.interpreter, os.path.basename(self.sample_scripts[0]))
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(output[0], "Hello world!")
> -- 
> 2.38.5
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
