From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 14:43:48 +0100
Subject: [Buildroot] [PATCH v5 1/3] openjdk-bin: new package
In-Reply-To: <20190205143126.13857-1-aduskett@gmail.com>
References: <20190205143126.13857-1-aduskett@gmail.com>
Message-ID: <20190210144348.09780c93@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Feb 2019 15:31:24 +0100
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
> 2) Access to a machine that is not x86_64 that can build Buildroot is not
>    avaliable.
> 
> The provided unpack200 has an invalid RPATH and relies on libzlib.
> When host-libzlib runs the install step, the following error is generated:
> 
> *** ERROR: package host-libzlib installs executables without proper RPATH:
> ***   $(HOST_DIR)/bin/unpack200
> 
> Because unpack200 is a deprecated tool, removing it after installation
> is safe and fixes the issue.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

I've applied to next.

> +# If the files are installed to $(HOST_DIR)/bin and $(HOST_DIR)/lib
> +# the build will fail because the RPATH of java binaries do not have a proper
> +# RPATH

This comment was no longer true.

> +define HOST_OPENJDK_BIN_INSTALL_CMDS
> +	cp -aLrf $(@D)/bin/* $(HOST_DIR)/bin/
> +	cp -aLrf $(@D)/lib/* $(HOST_DIR)/lib/

I used "cp -dpfr" instead, which we use more commonly in other packages.

> +	# unpack200 has an invalid RPATH and relies on libzlib. When host-libzlib
> +	# is installed on the system, the error
> +	# "ERROR: package host-libzlib installs executables without proper RPATH:
> +	# /home/buildroot/bropenjdk/output/host/bin/unpack200" will occure.
> +	# Because unpack200 is a deprecated tool, removing it to fix this issue is
> +	# safe.

I moved the comment above the INSTALL_CMDS variable definition, so that
the comment doesn't appear in the build log when building.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
