Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960D2E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33D64405DC;
	Sun, 21 Dec 2025 22:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ua80HZyhvm8L; Sun, 21 Dec 2025 22:11:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6369F40628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766355079;
	bh=VH21cULRC9NsvwSnFMIqI6bJ3Z+ZW3RvmMNpIMhEbtE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mVEKf9GIFnfSmRhhGiVcr8BCWOYHDdrRUdvUFSdTUol/xEki44f4uxMa5mxWjW+V4
	 ThkRbQJ7jNRh958fvssFxjLLPK5lMNAFxKzkadDGTS4ZZ+Sagl4C5xUJLlhQemCXBy
	 R68gOkRLM9ROWEsIyhOJGYwBAXrbm2dgBedbrweTPY0auCVpXnT6wM7jebcl+ZE1A3
	 2HOJij08NuLAPDTS1+P30eCCw5WBDej5HlKWfCkQhCuCBtZ+1Q66MHmU//rshUqfAy
	 UMIY3sPEPSwrLXeREGeySYx47VV+5MzrTc8/jCGG9B1hjDgnIPkeeBDa8kemutquk7
	 h0thJSEnugViQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6369F40628;
	Sun, 21 Dec 2025 22:11:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D871195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52CDF60776
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qifhipBnfmsL for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:11:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 23B5D6072F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23B5D6072F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23B5D6072F
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:11:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 022FC5FFAF;
 Sun, 21 Dec 2025 23:11:07 +0100 (CET)
Received: from 2a0d:e487:416e:93a3:8e76:a104:4b1e:c615
 via 2a0d:e487:416e:93a3:8e76:a104:4b1e:c615 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 21 Dec 2025 23:11:07 +0100
MIME-Version: 1.0
Date: Sun, 21 Dec 2025 23:11:07 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>, Grzegorz Blach <grzegorz@blach.pl>, Joris Offouga
 <offougajoris@gmail.com>, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251220214206.1089100-15-bernd@kuhls.net>
References: <20251220214206.1089100-1-bernd@kuhls.net>
 <20251220214206.1089100-15-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <c4d351c18140eb1e7d5ae539301df19a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766355073;
 bh=JAGgFeuoPjQvlfoC5PLqJBKZpfqD5W/7aRB0g23/Jv4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QfGq+g0exfE949nfNgHW92wxZnX+rgo6WwQO8zsFOuu7ogIooAkUNsBKxO29s9yiK
 A2OFNHOd+vF7B4fSLdG+0eduzLd46QkQbsPOCeQKKsOzi38LLmhPdDBStSPsTOHGo3
 8HLeqjo60fvKycn59x6OiIPBSPsvaBMSL1rSl3zTUonVKO8InY+aQ4hQNGJRKZP3xX
 BpAvyhovm1NMAeBUQZIL19z6o3fD7SmX/4gDcDSY+Y58GTHHtC3x/BHgnx5Z1pPX2C
 iklv5aDjWU44pH0Vi+SfP8vbmXepzUysmZ6RVHyBVPETvD2ZZl0V6gbOi/c4cGKvvU
 xEQDkkoZYdD3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QfGq+g0e
Subject: Re: [Buildroot] [PATCH 15/18] package/python-iwlib: bump version to
 1.7.0
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

Thanks for the patch.

On 20/12/2025 22:42, Bernd Kuhls wrote:
> https://github.com/nhoad/python-iwlib/blob/1.7.0/README.rst
> "1.6: Added support for Python 3 (via migration to CFFI)"
> 
> Switched SITE to pypi.
> 
> Added dependency to python-cffi:
> https://github.com/nhoad/python-iwlib/commit/a7c14aff76a28004afb45e08bcf83be5948cb7c1
> 
> Updated package as computed by scanpypi.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
[...]
> diff --git a/package/python-iwlib/python-iwlib.mk 
> b/package/python-iwlib/python-iwlib.mk
> index 9d0985567d..7a4fee7fc9 100644
> --- a/package/python-iwlib/python-iwlib.mk
> +++ b/package/python-iwlib/python-iwlib.mk
> @@ -4,11 +4,12 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_IWLIB_VERSION = 1.5
> -PYTHON_IWLIB_SITE = $(call 
> github,nhoad,python-iwlib,$(PYTHON_IWLIB_VERSION))
> +PYTHON_IWLIB_VERSION = 1.7.0

When compiling this new version with the commands:

cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_IWLIB=y
BR2_PACKAGE_WIRELESS_TOOLS=y
BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
EOF
make olddefconfig
make python-iwlib

I observe the following error:

cffi.VerificationError: importing 
'/buildroot/output/build/python-iwlib-1.7.0/iwlib/__pycache__/_cffi__x89ce3654xeb297b6c.cpython-313-x86_64-linux-gnu.so': 
/buildroot/output/build/python-iwlib-1.7.0/iwlib/__pycache__/_cffi__x89ce3654xeb297b6c.cpython-313-x86_64-linux-gnu.so: 
cannot open shared object file: No such file or directory

ERROR Backend subprocess exited when trying to invoke build_wheel

The compilation without this patch is working fine.
Could you have a look, please?

> +PYTHON_IWLIB_SOURCE = iwlib-$(PYTHON_IWLIB_VERSION).tar.gz
> +PYTHON_IWLIB_SITE = 
> https://files.pythonhosted.org/packages/59/44/fd72c0a7094baeb448dc9e87b3d579da98e2b8593c3fe05c5f9dd20dc6bc
>  PYTHON_IWLIB_LICENSE = GPL-2.0
>  PYTHON_IWLIB_LICENSE_FILES = COPYING
>  PYTHON_IWLIB_SETUP_TYPE = setuptools
> -PYTHON_IWLIB_DEPENDENCIES = wireless_tools
> +PYTHON_IWLIB_DEPENDENCIES = host-python-cffi wireless_tools
> 
>  $(eval $(python-package))
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
