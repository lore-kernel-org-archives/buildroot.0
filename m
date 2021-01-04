From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jan 2021 08:58:58 +0100
Subject: [Buildroot] package/dotnet: add host-dotnet-sdk
In-Reply-To: <CABWPoFG8k9WccFXRKC6ufRLKDHzdwCyeN3Q1PJZzqpg83fwc1w@mail.gmail.com>
References: <CABWPoFG8k9WccFXRKC6ufRLKDHzdwCyeN3Q1PJZzqpg83fwc1w@mail.gmail.com>
Message-ID: <20210104085858.68f57652@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Raul,

On Sat, 12 Dec 2020 17:26:32 +0100
Raul Hidalgo Caballero <deinok@deinok.com> wrote:

> This adds host-dotnet-sdk , for now it only works on x86_64 but it could
> also work for armv5 and aarch64 (Will be done in the future).
> 
> Notice that to build  dotnet, you need a working dotnet. This is the reason
> for host is just downloading and extracting a precompiled one

Thanks for your contribution!

The first comment is that your patch only adds host-dotnet-sdk, and we
separately had a patch in September 2020 from Andrey Nechypurenko
adding the dotnet-runtime. My understanding is that in fact both are
needed to have complete .NET support in Buildroot: host-dotnet-sdk to
get the compiler on the host machine, and dotnet-runtime to have the
runtime on the target. Is this correct ? If that's the case, then it
would be good to have both patches together in the same series, as well
as a simple test case in support/testing/ that shows it working (we can
provide some help and hints on how to achieve that).

Andrey said he would come up within a new iteration, but I don't think
he has posted any new version in the last few months.

Another comment is that when sending a patch, you should use "git
send-email" so that the patch appears inline, and we can review it
properly. See https://git-send-email.io/. I'm going to copy/paste your
patch below to give some comments. Overall it looks very good, so only
a few small comments here and there.

> From 438c148bbd052a72c39a0e8345ed0e98f00b5044 Mon Sep 17 00:00:00 2001
> From: Raul Hidalgo Caballero <deinok@deinok.com>
> Date: Sat, 12 Dec 2020 17:04:36 +0100
> Subject: [PATCH 1/1] package/dotnet: add host-dotnet-sdk

The commit title should be:

	package/dotnet-sdk: new package

> 
> Signed-off-by: Raul Hidalgo Caballero <deinok@deinok.com>
> ---
>  package/Config.in.host             |  1 +
>  package/dotnet-sdk/dotnet-sdk.hash |  3 +++
>  package/dotnet-sdk/dotnet-sdk.mk   | 19 +++++++++++++++++++
>  package/dotnet/Config.in.host      | 15 +++++++++++++++
>  4 files changed, 38 insertions(+)

You should add an entry in the DEVELOPERS file for this package.

> index 0000000000..714b36c518
> --- /dev/null
> +++ b/package/dotnet-sdk/dotnet-sdk.hash
> @@ -0,0 +1,3 @@
> +sha256	cfc21f5e8bd655ae997eec916138b707b1d290b83272c02a95c9f821b8c87310	LICENSE.txt
> +sha256	01564961f8ca9744d0ecc5d3e72d7c1659df95898f3a077fd9140fd4023f3579	ThirdPartyNotices.txt
> +sha256	23df1eca7eb1302dfb10f4edce7edf7150e57698576f61b2dcb777c833cbd80c	dotnet-sdk-5.0.101-linux-x64.tar.gz

Fields in the hash file should be separated with just two spaces.

> +define HOST_DOTNET_SDK_INSTALL_CMDS
> +	(mkdir -p $(HOST_DIR)/usr/share/dotnet/)
> +	(cp -R $(@D)/* $(HOST_DIR)/usr/share/dotnet/)
> +	(ln -s $(HOST_DIR)/usr/share/dotnet/dotnet $(HOST_DIR)/usr/bin/dotnet)
> +endef

You don't need spaces around those commands. Also, instead of cp -R, we
normally use "cp -dpfr". Also $(HOST_DIR)/usr doesn't really exist,
it's a symlink to $(HOST_DIR). And also perhaps make the link a
relative symlink ?

So:

	mkdir -p $(HOST_DIR)/share/dotnet
	cp -dpfr $(@D)/* $(HOST_DIR)/share/dotnet
	(cd $(HOST_DIR)/bin; ln -s ../share/donet/dotnet)

Do you think you could rework your patch, and perhaps adopt the
dotnet-runtime patch in the same series so that we have a complete
solution ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
