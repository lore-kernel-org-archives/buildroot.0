Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3561AC25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 15:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F367D60808;
	Sat,  1 Jun 2024 15:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDCM5IoumS29; Sat,  1 Jun 2024 15:52:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 015F560810
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 015F560810;
	Sat,  1 Jun 2024 15:52:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E2D61BF2EA
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 15:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7848040201
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 15:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vufEtGme8ZJN for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 15:51:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 82DEC40139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82DEC40139
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82DEC40139
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 15:51:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B118313F8A2;
 Sat,  1 Jun 2024 17:51:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 17:51:53 +0200
Date: Sat, 1 Jun 2024 17:51:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Perale <thomas.perale@essensium.com>
Message-ID: <ZltDmW4DqNu9sI5Y@landeda>
References: <20240415162229.1357491-1-thomas.perale@mind.be>
 <20240415162229.1357491-7-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415162229.1357491-7-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717257117;
 bh=tufIXQ4XTyWFtJB2UFFEyAbkwhn+6Bw3YWQxreI5es8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pd4fYVfe1SVo4KaMPirwHRxTSwgGTHO5K1k3ceiDgjKbR1lRAA7RzdSCf/T9NFuxE
 eeYEqhk1Xteb3MrDoadus4zyg3uX7M++FuMgxx7q6YuF93rPbrgfdAcwlD2MZMnaTi
 Ij8pmZ7t5kzS6yIFFpZ5Xu/7wKr2pYOih2wAwaVqdajtIArNS/04HrKs5GrXuuBU5p
 1ukpMRr4sSQ7P6WQqI2dozrJIOjeYaiYpDbjGtiE/OulqfjIc1PhfS9yhm2U3HUsrh
 0P0OV/RjAE0M9Wc+9LGTod1vw3EkM++IjcIO8uOtaYArsjfRLSzHoNdPhA8nYcsDIX
 IW+TN7/AqU64A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Pd4fYVfe
Subject: Re: [Buildroot] [PATCH v2 6/6] support/testing: add tests for Go
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
Cc: Christian Stewart <christian@paral.in>,
 Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-04-15 18:22 +0200, Thomas Perale via buildroot spake thusly:
> Test the two providers of host-go to build a Go package.
> 
> - TestGoBin tests host-go-bin
> - TestGoSource tests host-go-src

Since I did not apply the go-bin package, I dropped the corresponding
test.

> The tests consist of building and installing a Go package in the root
> file system of an ARM vexpress QEMU system.
> The tests pass if the program runs on the target.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/package/test_go.py | 41 ++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 support/testing/tests/package/test_go.py
> 
> diff --git a/support/testing/tests/package/test_go.py b/support/testing/tests/package/test_go.py
> new file mode 100644
> index 0000000000..305f8aeb3b
> --- /dev/null
> +++ b/support/testing/tests/package/test_go.py
> @@ -0,0 +1,41 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestGoBase(infra.basetest.BRTest):
> +
> +    def login(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +
> +class TestGoBin(TestGoBase):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_PACKAGE_HOST_GO=y
> +        BR2_PACKAGE_HOST_GO_BIN=y
> +        BR2_PACKAGE_TINIFIER=y
> +        """
> +
> +    def test_run(self):
> +        self.login()
> +        self.assertRunOk("tinifier -h")
> +
> +
> +class TestGoSource(TestGoBase):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_PACKAGE_HOST_GO=y
> +        BR2_PACKAGE_HOST_GO_SRC=y
> +        BR2_PACKAGE_TINIFIER=y
> +        """
> +
> +    def test_run(self):
> +        self.login()
> +        self.assertRunOk("tinifier -h")
> --
> 2.44.0
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
