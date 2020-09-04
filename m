From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 4 Sep 2020 09:34:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/dotnet-runtime: add dotnet core
 runtime package
In-Reply-To: <20200819130612.46440-1-andreynech@gmail.com>
References: <20200819130612.46440-1-andreynech@gmail.com>
Message-ID: <CAEyMn7Zb1G7niRkSzokNs+WUBvfCFYiJ9o_0=bew_TPpPivGBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andrey,

Thank you for the contribution. See some comments below.

Am Mi., 19. Aug. 2020 um 15:06 Uhr schrieb Andrey Nechypurenko
<andreynech@gmail.com>:
>
> Signed-off-by: Andrey Nechypurenko <andreynech@gmail.com>
> ---
>  package/Config.in                          |  1 +
>  package/dotnet-runtime/Config.in           | 15 ++++++
>  package/dotnet-runtime/dotnet-runtime.hash |  5 ++
>  package/dotnet-runtime/dotnet-runtime.mk   | 53 ++++++++++++++++++++++
>  4 files changed, 74 insertions(+)
>  create mode 100644 package/dotnet-runtime/Config.in
>  create mode 100644 package/dotnet-runtime/dotnet-runtime.hash
>  create mode 100644 package/dotnet-runtime/dotnet-runtime.mk
>

For a new package it is good to add yourself to the DEVELOPERS file
(https://buildroot.org/downloads/manual/manual.html#DEVELOPERS).

> diff --git a/package/Config.in b/package/Config.in
> index d7e79f4795..9c7dc71fd2 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -580,6 +580,7 @@ endmenu
>
>  menu "Interpreter languages and scripting"
>         source "package/4th/Config.in"
> +       source "package/dotnet-runtime/Config.in"
>         source "package/enscript/Config.in"
>         source "package/erlang/Config.in"
>  if BR2_PACKAGE_ERLANG
> diff --git a/package/dotnet-runtime/Config.in b/package/dotnet-runtime/Config.in
> new file mode 100644
> index 0000000000..deb3289c94
> --- /dev/null
> +++ b/package/dotnet-runtime/Config.in
> @@ -0,0 +1,15 @@
> +comment "dotnet-runtime needs a toolchain w/ glibc or musl and threads"
> +       depends on !BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
> +
> +config BR2_PACKAGE_DOTNET_RUNTIME
> +       bool "dotnet-runtime"
> +       depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_PACKAGE_LIBZLIB
> +       depends on BR2_PACKAGE_OPENSSL
> +       depends on BR2_PACKAGE_LIBCURL
> +       depends on BR2_PACKAGE_ICU

Not clear for me if we should select the dependent packages?

> +       help
> +         .NET Core 3.1 Runtime (v3.1.7) - Linux ARM32 binaries

Isn't it also x86 and arm64?

> +
> +         https://dotnet.microsoft.com/download/dotnet-core/3.1
> diff --git a/package/dotnet-runtime/dotnet-runtime.hash b/package/dotnet-runtime/dotnet-runtime.hash
> new file mode 100644
> index 0000000000..9c8b9c2b3a
> --- /dev/null
> +++ b/package/dotnet-runtime/dotnet-runtime.hash
> @@ -0,0 +1,5 @@
> +sha512 a586ed88cebbef298cda04c94e1809017800abea50668e18bcf27c3aa1ca114bb16963bcdcc4fd535288838120cba52966d594ef395bb8fac11693f64c97ccc1 dotnet-runtime-3.1.7-linux-arm.tar.gz
> +sha512 d5e97a7c3e495ffe03f62415802a5a6f8fc57e9ee86f7730e6752b016747514507fbf79c0e65a815b9d09fb35af05026ca8ea99626535b31703a217559909309 dotnet-runtime-3.1.7-linux-arm64.tar.gz
> +sha512 6919e87b0e8e2c42349acb1042dba81eaf2fdadd8967f9b78e192676efd883962e3b928c423055cef010bdf1923527817553cd24036303ee2741485fc44fb116 dotnet-runtime-3.1.7-linux-x64.tar.gz
> +sha512 b982c3f397f40a79b2bbe852083b648dc0c2ee530307127a1b6f5020d32322bd9eecaab9440d729dcaa5c1ce408bf37450411f5a0d83061b2ddc84e4dc043d3c dotnet-runtime-3.1.7-linux-musl-x64.tar.gz
> +sha512 7ea8b5b953528c35745aa3c53b1fb47f7b19a1c9967d8e00ca73e03a025cbab158fad8eaac917a13e60caa4a1e9fa50c681379d7d8ba52173b0165242d26cc4f dotnet-runtime-3.1.7-linux-musl-arm64.tar.gz

If the hash is manually calculated there should be a small comment
like: "# Locally calculated" or if it comes from an external source
like published by upstream, please add the url here.

From the documentation
(https://buildroot.org/downloads/manual/manual.html#adding-packages-hash):
"The format of this file is one line for each file for which to check
the hash, each line with the following three fields separated by two
spaces:"

>
> diff --git a/package/dotnet-runtime/dotnet-runtime.mk b/package/dotnet-runtime/dotnet-runtime.mk
> new file mode 100644
> index 0000000000..ea47e64b9e
> --- /dev/null
> +++ b/package/dotnet-runtime/dotnet-runtime.mk
> @@ -0,0 +1,53 @@
> +################################################################################
> +#
> +# dotnet-runtime
> +#
> +################################################################################
> +
> +DOTNET_RUNTIME_VERSION = 3.1.7
> +
> +# Set download URL and runtime identifier
> +# See https://docs.microsoft.com/en-us/dotnet/core/rid-catalog
> +# for the list of supported runtimes
> +# download_link="$azure_feed/Runtime/$specific_version/dotnet-runtime-$specific_version-$osname-$normalized_architecture.tar.gz"
> +
> +AZURE_FEED = https://dotnetcli.azureedge.net/dotnet

This variable causes the checker to throw a warning:
-- 
utils/check-package package/dotnet-runtime/*
package/dotnet-runtime/dotnet-runtime.mk:14: possible typo: AZURE_FEED
-> *DOTNET_RUNTIME*
73 lines processed
1 warnings generated
-- 

Do we really need this variable? You can set the DOTNET_RUNTIME_SITE
with that value.

> +DOTNET_RUNTIME_SITE = $(AZURE_FEED)/Runtime/$(DOTNET_RUNTIME_VERSION)
> +
> +ifeq ($(BR2_x86_64),y)
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +DOTNET_RUNTIME_IDENTIFIER = linux-musl-x64
> +else
> +DOTNET_RUNTIME_IDENTIFIER = linux-x64
> +endif
> +else ifeq ($(BR2_arm),y)
> +DOTNET_RUNTIME_IDENTIFIER = linux-arm
> +else ifeq ($(BR2_aarch64),y)
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +DOTNET_RUNTIME_IDENTIFIER = linux-musl-arm64
> +else
> +DOTNET_RUNTIME_IDENTIFIER = linux-arm64
> +endif
> +endif
> +
> +ifeq ($(DOTNET_RUNTIME_IDENTIFIER),)
> +$(error "Target platform is not supported by dotnet")
> +endif
> +
> +DOTNET_RUNTIME_SOURCE = dotnet-runtime-$(DOTNET_RUNTIME_VERSION)-$(DOTNET_RUNTIME_IDENTIFIER).tar.gz
> +
> +DOTNET_RUNTIME_LICENSE = MIT
> +DOTNET_RUNTIME_LICENSE_FILES = LICENSE.txt

Please add an entry for that file in the hash file. With this a
license change can be detected.

> +
> +# Runtime could be installed in the global location [/usr/share/dotnet] and
> +# will be picked up automatically.
> +# As alternative, it is possible to use the DOTNET_ROOT environment variable
> +# to specify the runtime location or register the runtime location in
> +# [/etc/dotnet/install_location]
> +# This script will install runtime to
> +# /usr/share/dotnet-runtime-$(DOTNET_RUNTIME_VERSION)
> +define DOTNET_RUNTIME_INSTALL_TARGET_CMDS
> +       cp -R $(@D) $(TARGET_DIR)/usr/share/
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.20.1

Thank you

-- 
Heiko
