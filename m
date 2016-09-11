From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Sep 2016 23:47:09 +0200
Subject: [Buildroot] [PATCH 1/2 v7] core: don't build host-cmake if it
 is available on the build host
In-Reply-To: <976b98e17ad6ffd7e4db1d99fef8908c17a15916.1473609425.git.yann.morin.1998@free.fr>
References: <cover.1473609425.git.yann.morin.1998@free.fr>
 <976b98e17ad6ffd7e4db1d99fef8908c17a15916.1473609425.git.yann.morin.1998@free.fr>
Message-ID: <23cb0d5e-8261-44c4-fbb8-0a0b7d3ca437@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-09-16 17:58, Yann E. MORIN wrote:
[snip]
> +# Set this to either 3.0 or higher, depending on the highest minimum
> +# version required by any of the packages bundled in Buildroot. If a
> +# package is bumped or a new one added, and it requires a higher
> +# version, our cmake infra will catch it and whine.

 Without patch 2, this last sentence isn't true anymore. But let's assume that
patch 2 will be committed quickly :-).

> +#
> +BR2_CMAKE_VERSION_MIN = 3.1
> +
> +BR2_CMAKE ?= cmake
> +ifeq ($(call suitable-host-package,cmake,\
> +	$(BR2_CMAKE) $(BR2_CMAKE_VERSION_MIN)),)
> +BR2_CMAKE = $(HOST_DIR)/usr/bin/cmake
> +BR2_CMAKE_HOST_DEPENDENCY = host-cmake
> +endif
> diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
> new file mode 100755
> index 0000000..ec918c7
> --- /dev/null
> +++ b/support/dependencies/check-host-cmake.sh
> @@ -0,0 +1,28 @@
> +#!/bin/sh
> +
> +candidate="${1}"
> +version_min="${2}"
> +
> +major_min="${version_min%.*}"
> +minor_min="${version_min#*.}"
> +
> +cmake=`which ${candidate}`
> +if [ ! -x "${cmake}" ]; then
> +    # echo nothing: no suitable cmake found
> +    exit 1
> +fi
> +
> +version="$(${cmake} --version | head -n1 | cut -d' ' -f3)"
> +major="${version%.*}"
> +minor="${version#*.}"

 I have cmake version 3.6.1 which puts major at 3.6 and minor at 1....

 How about:

version="$(${cmake} --version | head -n1 | cut -d' ' -f3 | cut -d. -f1,2)"

(tested).


 Otherwise, looks good to me.

 Regards,
 Arnout

> +
> +if [ ${major} -gt ${major_min} ]; then
> +    echo "${cmake}"
> +else
> +    if [ ${major} -eq ${major_min} -a ${minor} -ge ${minor_min} ]; then
> +        echo "${cmake}"
> +    else
> +        # echo nothing: no suitable cmake found
> +        exit 1
> +    fi
> +fi
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
