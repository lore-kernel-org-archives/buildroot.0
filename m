From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 4 Feb 2019 14:05:40 -0600
Subject: [Buildroot] [PATCH v4 1/3] openjdk-bin: new package
In-Reply-To: <20190204085610.66064-2-aduskett@gmail.com>
References: <20190204085610.66064-1-aduskett@gmail.com>
 <20190204085610.66064-2-aduskett@gmail.com>
Message-ID: <CANQCQpZikUiuKSocrrupDbqwQ2+pUiBfSS02M0hBSKCBG70kWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Mon, Feb 4, 2019 at 2:56 AM <aduskett@gmail.com> wrote:
>
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
> OpenJDK-bin installs to $(HOST_DIR)/openjdk/ because the RPATH of the
> provided java binaries do not have a proper RPATH, which causes a build
> failure.

That isn't cool.....

>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - No change
>
> Changes v2 -> v3:
>   - Changed the location of the installed binaries to just $(HOST_DIR)/openjdk
>
>   - Added a more in-depth commit message explaining some of the my reasoning
>     for some of the quirks in the package files.
>
> Changes v3 -> v4:
>   - Removed first person wordage. (Thomas)
>   - Changed GPLv2+ -> GPL-2.0+ (Thomas)
>   - Removed Config.in.host (Thomas)
>
>  DEVELOPERS                           |  2 ++
>  package/openjdk-bin/openjdk-bin.hash |  6 ++++++
>  package/openjdk-bin/openjdk-bin.mk   | 23 +++++++++++++++++++++++
>  3 files changed, 31 insertions(+)
>  create mode 100644 package/openjdk-bin/openjdk-bin.hash
>  create mode 100644 package/openjdk-bin/openjdk-bin.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c1950bb0f4..d2378259ee 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -50,6 +50,7 @@ F:    package/libselinux/
>  F:     package/libsemanage/
>  F:     package/libsepol/
>  F:     package/nginx-naxsi/
> +F:     package/openjdk-bin/
>  F:     package/policycoreutils/
>  F:     package/python-flask-sqlalchemy/
>  F:     package/python-mutagen/
> @@ -1468,6 +1469,7 @@ F:        package/valijson/
>  F:     package/wpa_supplicant/
>  F:     package/wireless_tools/
>  F:     package/xen/
> +F:     support/testing/tests/package/br2-external/openjdk/

If this should be included at all, suggest adding it to your 3rd patch
with the test case.  Generally, I'm unsure of how we're handling
specific runtime test DEVELOPER entries. I know Ricardo has the whole
support/testing/ folder but that's all I see in the file at the
moment.

>
>  N:     Mauro Condarelli <mc5686@mclink.it>
>  F:     package/mc/
> diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
> new file mode 100644
> index 0000000000..35d0b5c44b
> --- /dev/null
> +++ b/package/openjdk-bin/openjdk-bin.hash
> @@ -0,0 +1,6 @@
> +# From https://github.com/AdoptOpenJDK/openjdk11-binaries/releases
> +sha256 d89304a971e5186e80b6a48a9415e49583b7a5a9315ba5552d373be7782fc528        OpenJDK11U-jdk_x64_linux_hotspot_11.0.2_7.tar.gz
> +
> +# Locally calculated
> +sha256 4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726        legal/java.prefs/LICENSE
> +sha256 a44eb7b5caf5534c6ef536b21edb40b4d6babf91bf97d9d45596868618b2c6fb        legal/java.prefs/ASSEMBLY_EXCEPTION
> diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
> new file mode 100644
> index 0000000000..db01644c07
> --- /dev/null
> +++ b/package/openjdk-bin/openjdk-bin.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# host-openjdk-bin
> +#
> +################################################################################
> +
> +HOST_OPENJDK_BIN_VERSION_MAJOR = 11.0.2
> +HOST_OPENJDK_BIN_VERSION_MINOR = 7
> +HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
> +HOST_OPENJDK_BIN_SOURCE = OpenJDK11U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
> +HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
> +HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
> +HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
> +
> +# If the files are installed to $(HOST_DIR)/bin and $(HOST_DIR)/lib
> +# the build will fail because the RPATH of java binaries do not have a proper
> +# RPATH

Could we fix it?

> +define HOST_OPENJDK_BIN_INSTALL_CMDS
> +       mkdir -p $(HOST_DIR)/openjdk
> +       cp -aLrf $(@D)/* $(HOST_DIR)/openjdk/
> +endef
> +
> +$(eval $(host-generic-package))
> --
> 2.20.1
>

Thanks for sending this,
Matt
