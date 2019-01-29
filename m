From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Jan 2019 22:54:31 +0100
Subject: [Buildroot] [PATCH v3 3/5] openjdk-bin: new package
In-Reply-To: <20190128232209.17485-4-aduskett@gmail.com>
References: <20190128232209.17485-1-aduskett@gmail.com>
 <20190128232209.17485-4-aduskett@gmail.com>
Message-ID: <20190129225431.0f69cd1a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for working on this!

On Mon, 28 Jan 2019 18:22:07 -0500
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Paradoxically, building OpenJDK requires a pre-existing JDK.
> This pre-existing JDK is called the "boot JDK."
> 
> The boot JDK for building JDK major version N should be a JDK of major
> version N-1, so for building JDK11, JDK10 would be needed. This requirement is
> an issue when building on most distributions, as the host JDK tends to be JDK8.
> 
> The AdoptOpenJDK project provides binaries that can act as the boot JDK to
> build the target JDK, which is what this package provides.
> 
> Currently, only a x86_64 host is supported, for two reasons:
> 1) A 32bit x86 binary distribution is not available from AdoptOpenJDK
> 2) I do not have access to a machine that is not x86_64 that can build

We generally try to avoid first person sentences in commit logs.
Perhaps you should mention which other host architectures are supported
by the AdoptOpenJDK project, and indicate that they are not supported
because they couldn't be tested.

> OpenJDK-bin installs to $(HOST_DIR)/openjdk/ because the RPATH of the
> provided java binaries do not have a proper RPATH, which causes a build
> failure.

How does installing to $(HOST_DIR)/openjdk/ solves this RPATH issue ? I
see the binaries have this RPATH:

  Library rpath: [$ORIGIN/../lib/jli:$ORIGIN/../lib]

why is it invalid ? It seems to fit pretty well with an installation in
$(HOST_DIR). Though maybe we don't want the mess of OpenJDK extracted
right at the root of $(HOST_DIR), but that's a separate concern from
the RPATH one.

> diff --git a/package/openjdk-bin/Config.in.host b/package/openjdk-bin/Config.in.host
> new file mode 100644
> index 0000000000..e3dd438a0f
> --- /dev/null
> +++ b/package/openjdk-bin/Config.in.host
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_HOSTARCH = "x86_64"
> +
> +config BR2_PACKAGE_HOST_OPENJDK_BIN
> +	bool "host openjdk-bin"

I don't think we need a visible Config.in.host option for this package.
It is merely a build dependency for the target openjdk.

> +HOST_OPENJDK_BIN_VERSION_MAJOR = 11.0.2
> +HOST_OPENJDK_BIN_VERSION_MINOR = 7
> +HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
> +HOST_OPENJDK_BIN_SOURCE = OpenJDK11U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
> +HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
> +HOST_OPENJDK_BIN_LICENSE = GPLv2+ with exception

GPL-2.0+

> +HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
> +
> +# If the files are installed to $(HOST_DIR)/bin and $(HOST_DIR)/lib
> +# the build will fail because the RPATH of java binaries do not have a proper
> +# RPATH
> +define HOST_OPENJDK_BIN_INSTALL_CMDS
> +	mkdir -p $(HOST_DIR)/openjdk
> +	cp -aLrf $(@D)/* $(HOST_DIR)/openjdk/
> +endef
> +
> +$(eval $(host-generic-package))

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
