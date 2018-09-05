From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 4 Sep 2018 20:39:52 -0500
Subject: [Buildroot] [PATCH v2 2/3] dependencies: host-make version check
In-Reply-To: <20180903191933.26080-2-romain.naour@gmail.com>
References: <20180903191933.26080-1-romain.naour@gmail.com>
 <20180903191933.26080-2-romain.naour@gmail.com>
Message-ID: <CANQCQpZE2pCpc+CuvTXWGcAFXcf3kmpMCoMMPzYrOC_4XabwGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Mon, Sep 3, 2018 at 2:19 PM Romain Naour <romain.naour@gmail.com> wrote:
>
> The host make program is already checked by dependencies.sh but we
> want to check the version number even if Buildroot is able to use
> GNU make >= 3.81 but some packages may require a more recent version.
>
> For example, since version 2.28 [1], glibc requires GNU Make >= 4.0.
>
> For packages requiring make >= 4.0, the package makefile must use:
> <PKG>_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY) ...
> <PKG>_MAKE = $(BR2_MAKE)
>
> BR2_MAKE1 is also available if needed.
>
> [1] https://www.sourceware.org/ml/libc-alpha/2018-08/msg00003.html
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>

> ---
>  support/dependencies/check-host-make.mk | 21 +++++++++++++++++
>  support/dependencies/check-host-make.sh | 42 +++++++++++++++++++++++++++++++++
>  2 files changed, 63 insertions(+)
>  create mode 100644 support/dependencies/check-host-make.mk
>  create mode 100755 support/dependencies/check-host-make.sh
>
> diff --git a/support/dependencies/check-host-make.mk b/support/dependencies/check-host-make.mk
> new file mode 100644
> index 0000000000..4235a393fd
> --- /dev/null
> +++ b/support/dependencies/check-host-make.mk
> @@ -0,0 +1,21 @@
> +# Since version 2.28, glibc requires GNU Make >= 4.0
> +# https://www.sourceware.org/ml/libc-alpha/2018-08/msg00003.html
> +#
> +# Set this to either 4.0 or higher, depending on the highest minimum
> +# version required by any of the packages bundled in Buildroot. If a
> +# package is bumped or a new one added, and it requires a higher
> +# version, our package infra will catch it and whine.
> +#
> +BR2_MAKE_VERSION_MIN = 4.0
> +
> +BR2_MAKE ?= $(call suitable-host-package,make,\
> +       $(BR2_MAKE_VERSION_MIN) $(MAKE))
> +
> +ifeq ($(BR2_MAKE),)
> +BR2_MAKE = $(HOST_DIR)/bin/make -j$(PARALLEL_JOBS)
> +BR2_MAKE1 = $(HOST_DIR)/bin/make -j1
> +BR2_MAKE_HOST_DEPENDENCY = host-make
> +else
> +BR2_MAKE = $(MAKE)
> +BR2_MAKE1 = $(MAKE1)
> +endif
> diff --git a/support/dependencies/check-host-make.sh b/support/dependencies/check-host-make.sh
> new file mode 100755
> index 0000000000..9c31f4a415
> --- /dev/null
> +++ b/support/dependencies/check-host-make.sh
> @@ -0,0 +1,42 @@
> +#!/bin/sh
> +
> +# prevent shift error
> +[ $# -lt 2 ] && exit 1
> +
> +major_min="${1%.*}"
> +minor_min="${1#*.}"
> +
> +shift
> +
> +# The host make program is already checked by dependencies.sh but we
> +# want to check the version number even if Buildroot is able to use
> +# GNU make >= 3.81 but some packages may require a more recent version.
> +make="$1"
> +
> +# Output of 'make --version' examples:
> +# GNU Make 4.2.1
> +# GNU Make 4.0
> +# GNU Make 3.81
> +version=`$make --version 2>&1 | sed -e 's/^.* \([0-9\.]\)/\1/g' -e 's/[-\
> +].*//g' -e '1q'`
> +
> +major=`echo "$version" | cut -d. -f1`
> +minor=`echo "$version" | cut -d. -f2`
> +bugfix=`echo "$version" | cut -d. -f3`
> +
> +if [ -z "${bugfix}" ] ; then
> +       bugfix=0
> +fi
> +
> +if [ $major -lt $major_min ]; then
> +       # echo nothing: no suitable make found
> +       exit 1
> +fi
> +
> +if [ $major -eq $major_min -a $minor -lt $minor_min ]; then
> +       # echo nothing: no suitable make found
> +       exit 1
> +fi
> +
> +# valid
> +echo $make
> --
> 2.14.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / RC Linux Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
