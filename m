Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36B5C55162
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 16:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9295F40C26;
	Thu, 30 Jul 2026 16:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fh4rPQr2x_x; Thu, 30 Jul 2026 16:13:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BEF640645
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785428003;
	bh=8J/LrpXg6+MdqxsgpmDlho9/dr7FRX5x4Z+n8A3qGmo=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ODrdBfVe9/vwDb1Zb3Sv/XhBmTEcjSVZU/0DfwuysNLcIQ+RHa5jVMmK/6rmC+8Co
	 /OiGRCErTUE6bi9rbhyOkPxzGsEEZF+Ny1oqrWdE8t3TJTegNDqj3RYZXYohfpDLZW
	 hpBND/HXrdWcLAbNdbZPFSY8T5TbSixDsBLcd2CLbkWxHqi8Q/tXY6YlvkcfSemRdR
	 DdSvDOSxQG2xW86VSoeApDI1e/5VIwR5x0slfbaHxGwMsvsu8KPaL3/12enNaVmkUV
	 G65b9mZlcnHca9mA0nzeBTq023HPWI7ae1wo8Ts+N2VSYvGupLF7ov4J6b+2VcIU5o
	 06ac0zCRN87UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BEF640645;
	Thu, 30 Jul 2026 16:13:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B8C32CE
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 16:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 623EC60644
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 16:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9RvkWWw3OVoN for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 16:13:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=155.212.184.193;
 helo=mail.rulkc.org; envelope-from=viper@landau.one; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A9BA60602
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A9BA60602
Received: from mail.rulkc.org (mail.rulkc.org [155.212.184.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A9BA60602
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 16:13:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 62219100E2B
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 19:13:13 +0300 (MSK)
Message-ID: <efaaafcd-e259-4f40-8f46-3bd0aa2f02b3@landau.one>
Date: Thu, 30 Jul 2026 19:13:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20260729152659.3813837-1-viper@landau.one>
Content-Language: en-US
From: Konstantin Menyaev <viper@landau.one>
In-Reply-To: <20260729152659.3813837-1-viper@landau.one>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landau.one; s=dkim; 
 t=1785427993; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=aGXhM9MX1/dUUdJCcOwOGoMrGpWE3WrJv0XtykstwA4=;
 b=TM4NNE7n500+DoNPVi6oRUyxhDEZBS+lbarnGQ3140mZg73yvTDsF9xmpar6lYZWwF+bEa
 iBFnEz9+5jxnnFwGlYkS3KbhE7pgbtP/Ipc+FqpG4WkqpvfZd6iCjduIPec9tjMElTtfli
 Mkt0AILFKAWlmy9yWa5wr2FLN6z5WQmCWDDgB6lxCYMG5549/YbKyOS8wU+mvi1Ke0yxMz
 l8Je6h27s5NaDiVVqmySeW0hd7yk+Jrmjl2lxNdhfZY+LnuJWu9YgEC6FRVRfov2eBDC+I
 SN+YlASwTbZBZigarw+FpB8qXHa4VBEEHixJ5d4JqgMl8tJXZl2/WkGwFK928w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=landau.one
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=landau.one header.i=@landau.one header.a=rsa-sha256
 header.s=dkim header.b=TM4NNE7n
Subject: Re: [Buildroot] [PATCH 1/1] package/cpp-argparse: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 7/29/26 18:26, viper@landau.one wrote:
> From: Konstantin Menyaev <viper@landau.one>
> 
> A Modern C++ header-only library
> for parsing command-line arguments.
> 
> https: //github.com/p-ranav/argparse
> 
> Signed-off-by: Konstantin Menyaev <viper@landau.one>
> ---
>   package/Config.in                    |  1 +
>   package/cpp-argparse/Config.in       | 12 ++++++++++++
>   package/cpp-argparse/cpp-argparse.mk | 16 ++++++++++++++++
>   3 files changed, 29 insertions(+)
>   create mode 100644 package/cpp-argparse/Config.in
>   create mode 100644 package/cpp-argparse/cpp-argparse.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index fc1e57d30d..cdf996fe24 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -170,6 +170,7 @@ menu "Development tools"
>   	source "package/bustle/Config.in"
>   	source "package/check/Config.in"
>   	source "package/cmake/Config.in"
> +	source "package/cpp-argparse/Config.in"
>   	source "package/cppunit/Config.in"
>   	source "package/cukinia/Config.in"
>   	source "package/cunit/Config.in"
> diff --git a/package/cpp-argparse/Config.in b/package/cpp-argparse/Config.in
> new file mode 100644
> index 0000000000..7ad91f7bbc
> --- /dev/null
> +++ b/package/cpp-argparse/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_CPP_ARGPARSE
> +	bool "cpp-argparse"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
> +	help
> +	  Argument Parser for Modern C++. A header-only library
> +	  for parsing command-line arguments.
> +
> +	  https://github.com/p-ranav/argparse
> +
> +comment "cpp-argparse needs a toolchain w/ C++, GCC >= 7"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
> diff --git a/package/cpp-argparse/cpp-argparse.mk b/package/cpp-argparse/cpp-argparse.mk
> new file mode 100644
> index 0000000000..7978fd224c
> --- /dev/null
> +++ b/package/cpp-argparse/cpp-argparse.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# cpp-argparse
> +#
> +################################################################################
> +
> +CPP_ARGPARSE_VERSION = v3.2
> +CPP_ARGPARSE_SITE = $(call github,p-ranav,argparse,$(CPP_ARGPARSE_VERSION))
> +CPP_ARGPARSE_LICENSE = MIT
> +CPP_ARGPARSE_LICENSE_FILES = LICENSE
> +CPP_ARGPARSE_INSTALL_STAGING = YES
> +CPP_ARGPARSE_INSTALL_TARGET = NO
> +
> +CPP_ARGPARSE_CONF_OPTS = -DARGPARSE_BUILD_SAMPLES=OFF -DARGPARSE_BUILD_TESTS=OFF
> +
> +$(eval $(cmake-package))

Some notes...

This package provides a lightweight command-line argument parser for C++ 
applications. Buildroot already includes a similar package for Lua, but 
no equivalent is currently available for C++. This is useful for custom 
tools & helpers.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
