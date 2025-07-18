Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BB7C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 18 Jul 2025 08:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1191260F11;
	Fri, 18 Jul 2025 08:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LlFKTsxdr5cd; Fri, 18 Jul 2025 08:49:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A6EE60F12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A6EE60F12;
	Fri, 18 Jul 2025 08:49:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3346D1A6
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 08:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18C90816FD
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 08:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvphTdBViMJp for <buildroot@buildroot.org>;
 Fri, 18 Jul 2025 08:49:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1CA288100C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CA288100C
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CA288100C
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 08:49:25 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 0E1DE4407F0;
 Fri, 18 Jul 2025 11:47:39 +0300 (IDT)
To: Federico Pellegrin <fede@evolware.org>
Cc: buildroot@buildroot.org,  joris.lijssens@gmail.com
In-Reply-To: <20250718050954.18325-1-fede@evolware.org> (Federico Pellegrin's
 message of "Fri, 18 Jul 2025 07:09:54 +0200")
References: <20250718050954.18325-1-fede@evolware.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 18 Jul 2025 11:49:21 +0300
Message-ID: <87fretlw8e.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1752828459;
 bh=FdxWuQ68R+hJ7BN/wLE9SOFYmzhT3RIQDV/ONyDrIbY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hY9Scn5T2dI73n2GxxgpwWiuAkNzcQGLoYJ24Se/V97BMS+Iuc8tan7EFKsdkAG34
 k5l/KFl34ryjOw9v2WoD1oNRFYOrt05Wla7+RTDaICh3wA0YgkOC4LTmgcddk3Dz0B
 Cba8AQ0gb4ooJKDlUwVUfmS0FfddUV7hJsw6s4/TT9f3L75nyoP8FlqY4U6MvEPnR0
 +gJKtxcDq9gR7kGzgbrUiqw4k3QqTM3pdCN3M2k9rXB1mYUBGueqG1uN+VnoXD+KHw
 8Jvqvg+763BTGRIgSwPbkJSdAVz6dsRf8gN1jEpXPHBDIO/rXbrVYo8wTFwdbZStXU
 V69gA6qJmTQNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=hY9Scn5T
Subject: Re: [Buildroot] [PATCH 1/1] package/netsniff-ng: bump to 0.6.9
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Federico,

On Fri, Jul 18 2025, Federico Pellegrin wrote:
> Changes: https://github.com/netsniff-ng/netsniff-ng/releases/tag/v0.6.9
>
> Remove now upstreamed patch 0001-Detect-libpcap-dependencies-using-pkg-config.patch.
> Fixes also: https://patchwork-proxy.ozlabs.org/project/buildroot/patch/20240829075015.39164-1-fede@evolware.org/

With this patch removed, .checkpackageignore should also be updated.

baruch

> Signed-off-by: Federico Pellegrin <fede@evolware.org>
> ---
>  ...ibpcap-dependencies-using-pkg-config.patch | 51 -------------------
>  package/netsniff-ng/netsniff-ng.hash          |  2 +-
>  package/netsniff-ng/netsniff-ng.mk            |  2 +-
>  3 files changed, 2 insertions(+), 53 deletions(-)
>  delete mode 100644 package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch
>
> diff --git
> a/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch
> b/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch
> deleted file mode 100644
> index bbcbd2bfc3..0000000000
> --- a/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From 194ec61843b9598ce90873c812b817c4b96e2e0d Mon Sep 17 00:00:00 2001
> -From: Baruch Siach <baruch@tkos.co.il>
> -Date: Thu, 2 Sep 2021 12:56:00 +0300
> -Subject: [PATCH] Detect libpcap dependencies using pkg-config
> -
> -When building statically the link command line must include all
> -dependencies of all libraries. libpcap can optionally depend on libnl.
> -mausezahn can't build statically in this case.
> -
> -Use pkg-config in configure and in the link command to construct the
> -library flags we need to link with libpcap.
> -
> -Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> -Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ----
> -Upstream status: commit 194ec61843b9598ce90873c812b817c4b96e2e0d
> -
> - configure          | 4 +++-
> - mausezahn/Makefile | 2 +-
> - 2 files changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure b/configure
> -index 510826a798f5..598ae2433a7a 100755
> ---- a/configure
> -+++ b/configure
> -@@ -588,7 +588,9 @@ int main(void)
> - }
> - EOF
> - 
> --	$CC -o $TMPDIR/pcaptest $TMPDIR/pcaptest.c -lpcap >> config.log 2>&1
> -+	$CC -o $TMPDIR/pcaptest $TMPDIR/pcaptest.c \
> -+		$($PKG_CONFIG --libs libpcap 2>> config.log) \
> -+		>> config.log 2>&1
> - 	if [ ! -x $TMPDIR/pcaptest ] ; then
> - 		echo "[NO]"
> - 		echo "CONFIG_LIBPCAP=0" >> Config
> -diff --git a/mausezahn/Makefile b/mausezahn/Makefile
> -index ca16b6579583..9544565355cc 100644
> ---- a/mausezahn/Makefile
> -+++ b/mausezahn/Makefile
> -@@ -1,6 +1,6 @@
> - mausezahn-libs =	-lcli \
> - 			-lnet \
> --			-lpcap \
> -+			$(shell PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) $(PKG_CONFIG) --libs libpcap 2> /dev/null ) \
> - 			-lrt \
> - 			-lpthread \
> - 			-lm
> --- 
> -2.33.0
> -
> diff --git a/package/netsniff-ng/netsniff-ng.hash b/package/netsniff-ng/netsniff-ng.hash
> index 40b015cb0d..e63963c6d7 100644
> --- a/package/netsniff-ng/netsniff-ng.hash
> +++ b/package/netsniff-ng/netsniff-ng.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking signature
> -sha256  77d17d4158faf1d93c7d922a1bd7f093a8b437bd658292c830708540e10894ba  netsniff-ng-0.6.8.tar.xz
> +sha256  027840fa3c4e11abfe4fd0fffe9909c5c4ed1428d4b9397fb6d2f5ea69325918  netsniff-ng-0.6.9.tar.xz
>  # Locally computed
>  sha256  b353349ba51e0d4b59cf2f188f0c285296e154ce8c58954bc5e0dc0282a4db2d  README
>  sha256  8f6d85366f3763557d6ddd0637988b9ba11edef354e3c9302fff4262a235c387  COPYING
> diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
> index 2b5b19b27f..5e779f1cfb 100644
> --- a/package/netsniff-ng/netsniff-ng.mk
> +++ b/package/netsniff-ng/netsniff-ng.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NETSNIFF_NG_VERSION = 0.6.8
> +NETSNIFF_NG_VERSION = 0.6.9
>  NETSNIFF_NG_SITE = http://pub.netsniff-ng.org/netsniff-ng
>  NETSNIFF_NG_SOURCE = netsniff-ng-$(NETSNIFF_NG_VERSION).tar.xz
>  NETSNIFF_NG_LICENSE = GPL-2.0

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
