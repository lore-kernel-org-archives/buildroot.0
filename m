Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C17C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 15:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 423C660892;
	Sat,  1 Jun 2024 15:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NET-9m7unmw0; Sat,  1 Jun 2024 15:51:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04735608BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04735608BB;
	Sat,  1 Jun 2024 15:51:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32AAD1BF2EA
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 15:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DEC742426
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 15:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eq-Gblj_ro-9 for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 15:51:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7550E4241C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7550E4241C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7550E4241C
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 15:51:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2757013F880;
 Sat,  1 Jun 2024 17:51:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 17:51:15 +0200
Date: Sat, 1 Jun 2024 17:51:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Perale <thomas.perale@essensium.com>
Message-ID: <ZltDc6AXn_CC83Gy@landeda>
References: <20240415162229.1357491-1-thomas.perale@mind.be>
 <20240415162229.1357491-6-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415162229.1357491-6-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717257080;
 bh=bNoaGWc/CCWj6gtTaLxCbucrv8aChL72URQfjP54nGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l0WhyUo1NY5Wd3W/dodk5dcZWqI/Cc3ZR3Ab2nPBXX97BhpRTnPmmfSZTDnQobHv4
 gP3aozLkOGDqA50wresCmHc65Ux+06HNTO+ygZ+kMYqnvPgr1Bh6pX5edHIUZv6LFp
 r/ypq8yPPxncXVjRcTTzDv6NIYoEx1RfqUL2LSinKFO1/V47WyMlo5qU4t2M9dzwkS
 Y5wCzYZ14+pHfmkAS/mnh/0KjtBiXi4+fhLdtl88cc4M3dyKsWjI5NiknuWUCzqj4c
 BCum/i+gF36/+miKl9Rlv6HFa3QgJocoGWoG2HKAkVO4dSN13TVX8UHTpPxBRVdgLX
 3bCyXgc5NLmzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l0WhyUo1
Subject: Re: [Buildroot] [PATCH v2 5/6] package/go/go-bin: new host-go
 provider
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
> This package provides a pre-built version for the host-go virtual
> package introduced in the previous commits:
> 
>  - host-go-bin installs a pre-built version of the Go compiler.
> 
> By default, host-go remains built from sources to keep the same
> behavior as the former version.
> 
> The menuconfig entry for host-go is updated to expose the host-go-bin
> provider. The dependencies are set as such as if host-go-src does not
> support the host architecture, it will automatically fall back to
> host-go-bin and vice versa.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

I eventually did not apply this one, because the runtime test you
intorduced in the following commit does not work:

    $ ./support/testing/run-tests -o $(pwd)/run-tests -d ~/src/ -k -t 2 -j22 tests.package.test_go
    17:30:47 TestGoSource                             Starting
    17:30:47 TestGoBin                                Starting
    17:30:48 TestGoSource                             Building
    17:30:48 TestGoBin                                Building
    17:32:34 TestGoBin                                Building done
    17:32:40 TestGoBin                                Cleaning up
    F17:35:38 TestGoSource                             Building done
    17:35:44 TestGoSource                             Cleaning up
    .
    ======================================================================
    FAIL: test_run (tests.package.test_go.TestGoBin.test_run)
    ----------------------------------------------------------------------
    Traceback (most recent call last):
      File "/home/ymorin/dev/buildroot/buildroot/next/support/testing/tests/package/test_go.py", line 27, in test_run
        self.assertRunOk("tinifier -h")
      File "/home/ymorin/dev/buildroot/buildroot/next/support/testing/infra/basetest.py", line 89, in assertRunOk
        self.assertEqual(
    AssertionError: 132 != 0 :
    Failed to run: tinifier -h
    output was:
      Illegal instruction

    ----------------------------------------------------------------------
    Ran 2 tests in 296.303s

    FAILED (failures=1)

I had however did a few changes, that you can probably carry on your
next iteration, see below...

> ---
[--SNIP--]
> diff --git a/package/go/go-bin/Config.in.host b/package/go/go-bin/Config.in.host
> new file mode 100644
> index 0000000000..b259afa197
> --- /dev/null
> +++ b/package/go/go-bin/Config.in.host
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH
> +	string "Translate the HOSTARCH into the architecture name used by the Go compiler"
> +	default armv6l   if BR2_HOSTARCH = "arm"
> +	default arm64    if BR2_HOSTARCH = "aarch64"
> +	default ppc64le  if BR2_HOSTARCH = "powerpc64le"
> +	default s390x    if BR2_HOSTARCH = "s390x"
> +	default 386      if BR2_HOSTARCH = "x86"
> +	default amd64    if BR2_HOSTARCH = "x86_64"
> +	default ""

'default' for strings must be strings, e.g.:
    default "armv6l" if BR2_HOSTARCH = "arm"

Also, no need for an empty default, i.e. no need for:
    default ""

[--SNIP--]
> diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
> new file mode 100644
> index 0000000000..298503c156
> --- /dev/null
> +++ b/package/go/go-bin/go-bin.hash
> @@ -0,0 +1,8 @@
> +# sha256 checksum from https://go.dev/dl/
> +sha256  586d9eb7fe0489ab297ad80dd06414997df487c5cf536c490ffeaa8d8f1807a7  go1.22.2.linux-386.tar.gz
> +sha256  5901c52b7a78002aeff14a21f93e0f064f74ce1360fce51c6ee68cd471216a17  go1.22.2.linux-amd64.tar.gz
> +sha256  36e720b2d564980c162a48c7e97da2e407dfcc4239e1e58d98082dfa2486a0c1  go1.22.2.linux-arm64.tar.gz
> +sha256  9243dfafde06e1efe24d59df6701818e6786b4adfdf1191098050d6d023c5369  go1.22.2.linux-armv6l.tar.gz
> +sha256  32ea3dfef75d6a4d42a28a315148ba54c4f6f9a8dc93a522d421d13df0e6c3b7  go1.22.2.linux-ppc64le.tar.gz
> +sha256  2b39019481c28c560d65e9811a478ae10e3ef765e0f59af362031d386a71bfef  go1.22.2.linux-s390x.tar.gz

I had to update all those hashes:

    sha256 fefba30bb0d3dd1909823ee38c9f1930c3dc5337a2ac4701c2277a329a386b57 go1.22.3.linux-386.tar.gz
    sha256 8920ea521bad8f6b7bc377b4824982e011c19af27df88a815e3586ea895f1b36 go1.22.3.linux-amd64.tar.gz
    sha256 6c33e52a5b26e7aa021b94475587fce80043a727a54ceb0eee2f9fc160646434 go1.22.3.linux-arm64.tar.gz
    sha256 f2bacad20cd2b96f23a86d4826525d42b229fd431cc6d0dec61ff3bc448ef46e go1.22.3.linux-armv6l.tar.gz
    sha256 04b7b05283de30dd2da20bf3114b2e22cc727938aed3148babaf35cc951051ac go1.22.3.linux-ppc64le.tar.gz
    sha256 2aba796417a69be5f3ed489076bac79c1c02b36e29422712f9f3bf51da9cf2d4 go1.22.3.linux-s390x.tar.gz

> +sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
> diff --git a/package/go/go-bin/go-bin.mk b/package/go/go-bin/go-bin.mk
> new file mode 100644
> index 0000000000..6c5c1b6485
> --- /dev/null
> +++ b/package/go/go-bin/go-bin.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# go-bin
> +#
> +################################################################################
> +
> +GO_BIN_SITE = https://go.dev/dl

Note that we do not always use the same _SITE for all the various go
packages, but as far as I could see, https://go.dev/dl has all the
source archives, so maybe we should use that for all the go packages?

> +GO_BIN_LICENSE = BSD-3-Clause
> +GO_BIN_LICENSE_FILES = LICENSE

I also added:

    HOST_GO_BIN_ACTUAL_SOURCE_TARBALL = go$(GO_VERSION).src.tar.gz

and the corresonding hash:

    sha256 80648ef34f903193d72a59c0dff019f5f98ae0c9aa13ade0b0ecbff991a76f68 go1.22.3.src.tar.gz

Note that, as https://go.dev/dl does have the source tarball, I did not
need to specify HOST_GO_BIN_ACTUAL_SOURCE_SITE

Regards,
Yann E. MORIN.

> +HOST_GO_BIN_PROVIDES = host-go
> +
> +HOST_GO_BIN_SOURCE = go$(GO_VERSION).linux-$(call qstrip, $(BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH)).tar.gz
> +
> +define HOST_GO_BIN_INSTALL_CMDS
> +	$(GO_BINARIES_INSTALL)
> +endef
> +
> +$(eval $(host-generic-package))
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
