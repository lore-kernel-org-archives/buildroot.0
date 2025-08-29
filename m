Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2042CA0FFD
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84D9361682;
	Fri, 29 Aug 2025 15:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwF71jWArFo4; Fri, 29 Aug 2025 15:32:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AC1961675
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AC1961675;
	Fri, 29 Aug 2025 15:32:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DE7969
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 649F66166E
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWhopXpZbILK for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:32:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF98E614B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF98E614B3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF98E614B3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:32:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 693EEB9782D8; Fri, 29 Aug 2025 17:32:14 +0200 (CEST)
Message-ID: <786e31e5-784e-4d4a-bb6c-5e5139fa54ee@rnout.be>
Date: Fri, 29 Aug 2025 17:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Matthew Maron <matthewm@tekvox.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jim Reinhart <jimr@tekvox.com>
References: <20240701193420.2119084-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20240701193420.2119084-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756481535; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=78IBWZpoFWLlAgQaG07jJ8sHTlUR9VhesTh98D4m/lg=;
 b=fTb3pIWLX3f0GdSjU4Vy23jnYAshD9h9h9Hh5Ob+XqZUiRJp4OpZ6LIpYPqNgd5gU6D9BW
 /rPNwrzIltASV8O0kSjAkdBYIzD4RnAvosqMFADOn3fwx4zPkAZ+GsyzO0lgvER/BqYBfu
 Z6I2Gh++8oC1qJ4QshXzMN2wOzyuEKyMir8NWv+suoWJBct3dZpDd6dasq1eQuolQHoqbB
 lORlW9+HR2h8aAaHmmrFTSQLZE8Pooewc1uQYmcK9hzXMUD+JqjWPiFVWFSqr4sQM+DaHH
 dJdpFy57l/9MB+p+48RCbH7aKmR6AS2BDXrY77/XQYwavuVqkxMKlf/Cnen7oA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=fTb3pIWL
Subject: Re: [Buildroot] [PATCH v3] package/dotnet-runtime-prebuilt: new
 package
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Guilio,

  I'm going to make a number of comments here that also apply to the 
built-from-source variant. In practice, however, I think it's easiest to first 
merge this one, and later add the built-from-source variant. So the comments 
about "this should be refactored with dotnet-runtime" only apply when the source 
variant is added.

On 01/07/2024 21:34, Giulio Benetti wrote:
> From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> 
> Add pre-built .NET Core Runtime Prebuilt 8.0.6 binaries to execute .NET
> executables on Linux. Version 8.0.6 is the latest LTS version. Let's simply
> download and extract specific tarball for aarch64, arm(eabihf) and x64
> architectures and glibc/musl libc. Let's also:
> * add /etc/dotnet/install_location file to point where dotnet runtime is
> * add a script to export 'dotnet' to PATH and native libraries to
>    LD_LIBRARY_PATH to avoid missing dependencies on runtime
> 
> Cc: Jim Reinhart <jimr@tekvox.com>
> Cc: James Autry <jautry@tekvox.com>
> Cc: Matthew Maron <matthewm@tekvox.com>
> Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> ---
> V1->V2:
> * add depends on BR2_INSTALL_LIBSTDCPP and drop select BR2_PACKAGE_LTTNG_LIBUST

  It's not just for that, I see that some things are linked against libstdc++.so 
as well.

> V2->V3:
> * drop DOTNET_RUNTIME_PREBUILT_IDENTIFIER check since it breaks entire Buildroot
> building when architecture is supported but package is not selected. Basically
> it's a testing leftover
> ---
>   DEVELOPERS                                    |  1 +
>   package/Config.in                             |  1 +
>   package/dotnet-runtime-prebuilt/Config.in     | 29 ++++++++++
>   .../dotnet-runtime-prebuilt.hash              |  8 +++
>   .../dotnet-runtime-prebuilt.mk                | 58 +++++++++++++++++++
>   .../dotnet-runtime-prebuilt.sh                |  2 +
>   6 files changed, 99 insertions(+)
>   create mode 100644 package/dotnet-runtime-prebuilt/Config.in
>   create mode 100644 package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.hash
>   create mode 100644 package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.mk
>   create mode 100644 package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.sh
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 551ff2dd0d..291a7e004e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1243,6 +1243,7 @@ F:	configs/rockpro64_defconfig
>   F:	package/at/
>   F:	package/binutils/
>   F:	package/cryptsetup/
> +F:	package/dotnet-runtime-prebuilt/
>   F:	package/dotnet6-runtime/

  I guess you didn't rebase on mainline before sending :-)

>   F:	package/erlang-jiffy/
>   F:	package/esp-hosted/
> diff --git a/package/Config.in b/package/Config.in
> index 59a4512b52..ec7b5ef1f5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -662,6 +662,7 @@ menu "Interpreter languages and scripting"
>   	source "package/4th/Config.in"
>   	source "package/dotnet6-runtime/Config.in"
>   	source "package/dotnet8-runtime/Config.in"
> +	source "package/dotnet-runtime-prebuilt/Config.in"
>   	source "package/enscript/Config.in"
>   	source "package/erlang/Config.in"
>   if BR2_PACKAGE_ERLANG
> diff --git a/package/dotnet-runtime-prebuilt/Config.in b/package/dotnet-runtime-prebuilt/Config.in
> new file mode 100644
> index 0000000000..2e2b54d0ac
> --- /dev/null
> +++ b/package/dotnet-runtime-prebuilt/Config.in
> @@ -0,0 +1,29 @@
> +config BR2_PACKAGE_DOTNET_RUNTIME_PREBUILT_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64
> +	default y if (BR2_arm && BR2_ARM_EABIHF)
> +	default y if BR2_x86_64
> +	depends on BR2_USE_MMU # fork()
> +
> +config BR2_PACKAGE_DOTNET_RUNTIME_PREBUILT
> +	bool "dotnet-runtime-prebuilt"

  A general remark: in order to support both the prebuilt and built-from-source 
versions, we should use an approach like for go and rust, i.e. 
dotnet-runtime-bin and dotnet-runtime-src packages, and a dotnet-runtime virtual 
package that has a choice between them. It's OK to first merge 
dotnet-runtime-bin, but it's nice to already have the dotnet-runtime virtual 
package at least, and to call it -bin instead of -prebuilt.

> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL

  Maybe it's simpler to depend on !UCLIBC instead?

> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_PACKAGE_DOTNET_RUNTIME_PREBUILT_ARCH_SUPPORTS
> +	select BR2_PACKAGE_HOST_CMAKE
> +	select BR2_PACKAGE_ICU
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBKRB5
> +	select BR2_PACKAGE_LIBZLIB

  You can't select libzlib because it's part of a choice, instead you have to 
select BR2_PACKAGE_ZLIB and BR2_PACKAGE_ZLIB_FORCE_LIBZLIB.

> +	select BR2_PACKAGE_OPENSSL

  Why all these selects? I checked the shared libraries and I get these:

ld-linux-armhf.so.3
libc.so.6
libdl.so.2
libgcc_s.so.1
liblttng-ust.so.0
libm.so.6
libmscordaccore.so
libpthread.so.0
librt.so.1
libstdc++.so.6
libz.so.1

libmscordaccore.so is part of the bundle, BR2_PACKAGE_LIBZLIB you indeed need, 
but the rest comes with the toolchain. I hope it's all ABI-compatible...

liblttng-ust.so is only used by libcoreclrtraceptprovider.so which I guess is 
not normally needed, so OK.

  If there really were so many dependencies, it would be a problem because it's 
unlikely that those libraries stay ABI-compatible. In particular OpenSSL I'm 
sure wouldn't work.


> +	help
> +	  .NET Core 8 Runtime Prebuilt
> +
> +	  https://dotnet.microsoft.com/download/dotnet-core/8.0

  The URL should not be the download page, but the upstream homepage. In this 
case https://docs.microsoft.com/dotnet/core/ would be a good choice (it's what's 
mentioned in the github repo).

> +
> +comment "dotnet-runtime needs a toolchain w/ glibc or musl and threads"

  You forgot the "dynamic libs" part.

> +	depends on BR2_PACKAGE_DOTNET8_RUNTIME_PREBUILT_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS

  This is not correct, you need an OR between the libc and the other conditions.

> diff --git a/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.hash b/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.hash
> new file mode 100644
> index 0000000000..6ff15ed121
> --- /dev/null
> +++ b/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.hash
> @@ -0,0 +1,8 @@
> +# Locally calculated
> +sha256  811b3d6d052e0d37c5cb2f6746cb950ae7c87a1c5082897a27bcd9258c94de66  dotnet-runtime-8.0.6-linux-arm.tar.gz
> +sha256  0c1355dfba7b0e354294fd202274e4fa1838b93afcc180ecf667e25e5d1b7df6  dotnet-runtime-8.0.6-linux-arm64.tar.gz
> +sha256  cfecba75d6497e14a06f04096c0be6bb57938ef23abd3c5ff6639bd999dbb9a1  dotnet-runtime-8.0.6-linux-musl-arm64.tar.gz
> +sha256  566c219fb59864c23333a254092c5b9644717164ad047050ccad06b79f710700  dotnet-runtime-8.0.6-linux-musl-arm.tar.gz
> +sha256  15c7219c2630d81131c0b47a7c6577f0f76f56ea0ed8dd337748d0b5929834d9  dotnet-runtime-8.0.6-linux-musl-x64.tar.gz
> +sha256  b29b4e02b622cf0ff4581b0a96824b74a6690e97b95158a2e3d8fb43342dadfd  dotnet-runtime-8.0.6-linux-x64.tar.gz
> +sha256  cfc21f5e8bd655ae997eec916138b707b1d290b83272c02a95c9f821b8c87310  LICENSE.txt
> diff --git a/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.mk b/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.mk
> new file mode 100644
> index 0000000000..13aa9a1741
> --- /dev/null
> +++ b/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.mk
> @@ -0,0 +1,58 @@
> +################################################################################
> +#
> +# dotnet-runtime-prebuilt
> +#
> +################################################################################
> +
> +DOTNET_RUNTIME_PREBUILT_VERSION = 8.0.6
> +DOTNET_RUNTIME_PREBUILT_LICENSE = MIT
> +DOTNET_RUNTIME_PREBUILT_LICENSE_FILES = LICENSE.txt

  You also need ThirdPartyNotices.txt (because some of that stuff is statically 
linked). You should probably also include those licenses in _LICENSE.

> +
> +# Set download URL and runtime identifier
> +# See https://docs.microsoft.com/en-us/dotnet/core/rid-catalog
> +# for the list of supported runtimes
> +# download_link="$azure_feed/Runtime/$specific_version/dotnet-runtime-$specific_version-$osname-$normalized_architecture.tar.gz"

  Is this a copy-paste leftover?

> +
> +AZURE_FEED = https://dotnetcli.azureedge.net/dotnet

  Not sure if a separate AZURE_FEED is very useful, but OK. If you keep it, it 
needs the DOTNET_RUNTIME_BIN_ prefix.

> +DOTNET_RUNTIME_PREBUILT_SITE = $(AZURE_FEED)/Runtime/$(DOTNET_RUNTIME_PREBUILT_VERSION)
> +
> +ifeq ($(BR2_aarch64),y)
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +DOTNET_RUNTIME_PREBUILT_IDENTIFIER = linux-musl-arm64
> +else
> +DOTNET_RUNTIME_PREBUILT_IDENTIFIER = linux-arm64
> +endif
> +else ifeq ($(BR2_arm),y)
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +DOTNET_RUNTIME_PREBUILT_IDENTIFIER = linux-musl-arm
> +else
> +DOTNET_RUNTIME_PREBUILT_IDENTIFIER = linux-arm
> +endif
> +else ifeq ($(BR2_x86_64),y)
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +DOTNET_RUNTIME_PREBUILT_IDENTIFIER = linux-musl-x64
> +else
> +DOTNET_RUNTIME_PREBUILT_IDENTIFIER = linux-x64
> +endif
> +endif

  The above could be simplified a bit as:

ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
DOTNET_RUNTIME_BIN_LIBC = musl-
endif
ifeq ($(BR2_aarch64),y)
DOTNET_RUNTIME_BIN_ARCH = arm64
else
...
endif

... 
dotnet-runtime-$(DOTNET_RUNTIME_BIN_VERSION)-linux-$(DOTNET_RUNTIME_BIN_LIBC)$(DOTNET_RUNTIME_BIN_ARCH).tar.gz

> +
> +DOTNET_RUNTIME_PREBUILT_SOURCE = dotnet-runtime-$(DOTNET_RUNTIME_PREBUILT_VERSION)-$(DOTNET_RUNTIME_PREBUILT_IDENTIFIER).tar.gz
> +
> +# Runtime could be installed in the global location [/usr/share/dotnet] and
> +# will be picked up automatically.

  That's where it is installed, so why is it not picked up automatically? I.e. 
why is /etc/dotnet/install_location created?

> +# As alternative, it is possible to use the DOTNET_ROOT environment variable
> +# to specify the runtime location or register the runtime location in
> +# [/etc/dotnet/install_location]
> +# This script will install runtime to
> +# /usr/share/dotnet
> +define DOTNET_RUNTIME_PREBUILT_INSTALL_TARGET_CMDS
> +	cp -Rf $(@D)/. $(TARGET_DIR)/usr/share/dotnet
> +	mkdir -p $(TARGET_DIR)/etc/dotnet
> +	echo "/usr/share/dotnet" > $(TARGET_DIR)/etc/dotnet/install_location
> +
> +	# Export dotnet to PATH and libraries to LD_LIBRARY_PATH
> +	$(INSTALL) -m 0755 -D $(DOTNET_RUNTIME_PREBUILT_PKGDIR)/dotnet-runtime-prebuilt.sh \
> +		$(TARGET_DIR)/etc/profile.d/dotnet-runtime-prebuilt.sh

  This is not nice. Wouldn't it be better to simply copy or symlink the .so 
files to /usr/lib? I assume the runtime doesn't look at LD_LIBRARY_PATH for 
finding the dlls, so symlinking the .so files should be enough.

  Similarly, copy or symlink the binaries (just createdump I think?) to /usr/bin.

  Note that a problem with the profile.d approach is that it is only used by an 
interactive shell, not by e.g. an init script or systemd unit.

> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.sh b/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.sh
> new file mode 100644
> index 0000000000..b059a9c593
> --- /dev/null
> +++ b/package/dotnet-runtime-prebuilt/dotnet-runtime-prebuilt.sh
> @@ -0,0 +1,2 @@
> +export PATH=$PATH:/usr/share/dotnet
> +export LD_LIBRARY_PATH=/usr/share/dotnet/shared/Microsoft.NETCore.App/8.0.6

  If this does stay (I hope it's not) it should be generated so taht the 8.0.6 
version doesn't need to be hardcoded in it.

  I've marked as Changes Requested.

  Regards,
  Arnout


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
