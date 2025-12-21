Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91A7E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 12:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55548813D0;
	Sun, 21 Dec 2025 12:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7FnqqzSYu3O4; Sun, 21 Dec 2025 12:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DDB5817FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766321366;
	bh=JbSAmx8Lvsh4oAIlKh1BtuLqw2hIDLYS1sSqxhKvip8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lTkLerX828M4DImMP0UxOz+LgGcdLk3w3YZ5ORJ2889hRGtIsJNx5aqy5/JbcenD4
	 s69GNMB0OiA3kD0T32KhkAxpBR0Qoc6yMMbtjl+Fik94MBBjvlmRTyxjdswzqQ5uLM
	 j5sAzseyV3stOKPqRhQPn9w9CXrmQOQkaLuU444KI/Lu83jt4v2iDb5nMUSBfswnaK
	 x7WTFuMgsqnFibOsmfUjJ+e0CgFCcxBfnc4Pcj7d4WMf2i/VeVmIMmR744xMBzj0Ch
	 cUApOsJMBNA6xRw2qBzB/WYFL1qe5il65uVGx6zHrXG/GAfxLteDyPevKsly88iK3G
	 ucnMTi4MoB5hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DDB5817FD;
	Sun, 21 Dec 2025 12:49:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93127195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BDC2817FD
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZnKKm6ftJmV for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 12:49:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 81D97813D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81D97813D0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81D97813D0
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:49:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BDFF42003CA;
 Sun, 21 Dec 2025 13:49:17 +0100 (CET)
Received: from 37-167-60-49.coucou-networks.fr ([37.167.60.49:29625])
 via 37-167-60-49.coucou-networks.fr ([37.167.60.49])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 21 Dec 2025 13:49:17 +0100
MIME-Version: 1.0
Date: Sun, 21 Dec 2025 13:49:17 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Antoine Tenart <atenart@kernel.org>, Marcus
 Folkesson <marcus.folkesson@gmail.com>
In-Reply-To: <20251217184822.3765937-1-bernd@kuhls.net>
References: <20251217184822.3765937-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <2ff86f9df830a5675f399f2cfe828760@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766321361;
 bh=qt4Zl5s0Nt6UUpYHfMKXc2/vsbWy/O4eUmPEs1SxcYU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hqe5qmTRLAtHn92ZHz4Rsq7EVej6+8fHl2eoeaorIR9NU0nJjq/Rdn5RE196mtqww
 Sf7Cv6Qu6/S5RiS+cGvapkuSw494PNMLghQhvWL35tWI+8arast1TMfAtCUWy91sgE
 Jy5/9o+lakr0ZN6yBqjQFPxvPaedodT4L+mvGZbaF8u4UL2F/xBqUOOxSVFwhjRQiQ
 CYQqDnjf5uXNZ/OXynXK25J53QZUUTBOlcEqmYPC6Bra06emNcq1KkSkdxQ26jFakK
 Gx2Z7RCNMwvj5kr7TdYd4sHUjGejg1OG2S1inAleCfCNwZ4pOraNdokZMTjiiS9ayN
 AqC2sEhkS1nkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hqe5qmTR
Subject: Re: [Buildroot] [PATCH 1/1] package/libselinux: host-python3 needs
 SSL support
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On 17/12/2025 19:48, Bernd Kuhls wrote:
> Buildroot commit 285097051d4a7dd821f01d15c705867f7e26c635 bumped
> python-pip to version 25.3, causing build errors when host-python3 was
> built without SSL support:
> 
>   WARNING: pip is configured with locations that require TLS/SSL,
>    however the ssl module in Python is not available.
> [...]
>   Could not fetch URL https://pypi.org/simple/setuptools/:
>    There was a problem confirming the ssl certificate:
>    HTTPSConnectionPool(host='pypi.org', port=443): Max retries exceeded
>    with url: /simple/setuptools/ (Caused by SSLError("Can't connect to
>    HTTPS URL because the SSL module is not available.")) - skipping
>   ERROR: Could not find a version that satisfies the requirement 
> setuptools>=40.8.0 (from versions: none)
> 
> Reverting the python-pip bump reveals the true cause of the build error
> by showing these messages:
> 
>   WARNING: pip is configured with locations that require TLS/SSL,
>    however the ssl module in Python is not available.
> [...]
>   DEPRECATION: Building 'selinux' using the legacy setup.py bdist_wheel
>   mechanism, which will be removed in a future version. pip 25.3 will
>   enforce this behaviour change. A possible replacement is to use the
>   standardized build interface by setting the `--use-pep517` option,
>   (possibly combined with `--no-build-isolation`), or adding a
>   `pyproject.toml` file to the source tree of 'selinux'.
>   Discussion can be found at https://github.com/pypa/pip/issues/6334
> 
> Selecting BR2_PACKAGE_HOST_PYTHON3_SSL fixes the problem.
> 
> Criu, the only other buildroot package using host-python-pip as
> dependency, already selects BR2_PACKAGE_HOST_PYTHON3_SSL.
> 
> Fixes:
> https://autobuild.buildroot.net/results/fd6/fd6d3edd5f74d094621ac9fdb93db24520b7a6e3/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Hi Bernd,

While testing this patch, I observed two new new kind of build
errors. Those were reported in autobuilder. See for example:

https://autobuild.buildroot.org/results/953/953b8c6d7da0f150ec56760c4a3191e630c01381/build-end.log
https://autobuild.buildroot.org/results/a9b/a9bc288de3abefaa11f10d8ea93f425eff26ac71/build-end.log

It is possible those are related to the recent python
package updates.

The libselinux package might have a missing dependency
on host-python-setuptools.

Also I've seen that in libselinux.mk, $(PKG_PYTHON_SETUPTOOLS_ENV)
is passed to _MAKE_OPTS rather than _MAKE_ENV. Changing that worked
around those issues while testing.

You can reproduce those issues with the commands:

cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_LIBSELINUX=y
EOF
make olddefconfig
make libselinux

Since this SSL support in host-python3 is needed anyway, I applied
this patch to master, thanks.

Could you have a look the other issues, please? At the moment, 
libselinux is
the biggest source of build failures:
https://lore.kernel.org/buildroot/694774fb.050a0220.99314.d33b@mx.google.com/T/#u

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
