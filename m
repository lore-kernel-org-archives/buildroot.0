Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83774C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 14:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35D2B40012;
	Sun, 15 Sep 2024 14:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DcEcNPG0Mdph; Sun, 15 Sep 2024 14:16:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E60404063E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E60404063E;
	Sun, 15 Sep 2024 14:16:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E86281BF365
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 14:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4C52607DE
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 14:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SWxfE2OmfxRc for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 14:16:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 00125607C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00125607C5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00125607C5
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 14:16:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.92])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0415A2003CA;
 Sun, 15 Sep 2024 16:16:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 15 Sep 2024 16:16:07 +0200
Date: Sun, 15 Sep 2024 16:16:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Perale <thomas.perale@essensium.com>
Message-ID: <ZubsJ_Ehb4XTzhAC@landeda>
References: <20240914152323.2630539-1-thomas.perale@mind.be>
 <20240914152323.2630539-3-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240914152323.2630539-3-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726409775;
 bh=0FWoAv1Tym6lzGR5arSJtaPglOAZ1JVmCb+8p4j20VI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wiwi9j3SRK4Q97KD+DKXPyrK0cppLA7xNIzACPlsUrrM57BT2rZXqdGQ3xGiEyQUE
 zuvLnJJj2Et8MVn0bipXsjRRd3MPt8arrs3pc9PFMWrQB92ZjXgxy3oPCrX/UXYvRk
 UODNOHyAt7C9QcERxrMfaiPU/TT0iuYKF0qn2DOvWprXVKg4aj9YahM2RsmzfPA6AF
 QtbbOH3Co1C0+aLiICtBvgIlLQS/FUKPJrT7vcpDQ8GruEXQLOuXKRark1yMhp0+MZ
 pzh4e4vPy9ZXb+j6psOh+0k6jdDYWzIdfqN8qjt0s2yUbqAPtden990NpYJwrObpRU
 PKE9HDH98o3qA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Wiwi9j3S
Subject: Re: [Buildroot] [PATCH 2/2] support/testing: add tests for Go
 providers
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>, Anisse Astier <anisse@astier.eu>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-09-14 17:23 +0200, Thomas Perale via buildroot spake thusly:
> Test the go-bin provider of host-go to build a Go package.
> 
> The tests consist of building and installing a Go package in the root
> file system of an ARM vexpress QEMU system.
> The tests pass if the program runs on the target.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>  support/testing/tests/package/test_go.py | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/support/testing/tests/package/test_go.py b/support/testing/tests/package/test_go.py
> index 0b25fbc26d..305f8aeb3b 100644
> --- a/support/testing/tests/package/test_go.py
> +++ b/support/testing/tests/package/test_go.py
> @@ -13,6 +13,20 @@ class TestGoBase(infra.basetest.BRTest):
>          self.emulator.login()
>  
>  
> +class TestGoBin(TestGoBase):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_PACKAGE_HOST_GO=y
> +        BR2_PACKAGE_HOST_GO_BIN=y
> +        BR2_PACKAGE_TINIFIER=y

tinifier can't be vendored today, so I could not test jhost-go-bin, so I
switched to use another package that could not be vendroed either
(sigh), so I switched to flannel, and that worked.

So, I oushed to master, with the test using flannel imstead of tinifier.
And I also changed the GoSource test similarly.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +        """
> +
> +    def test_run(self):
> +        self.login()
> +        self.assertRunOk("tinifier -h")
> +
> +
>  class TestGoSource(TestGoBase):
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
>          """
> -- 
> 2.46.0
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
