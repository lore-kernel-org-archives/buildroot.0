From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 5 Sep 2016 12:00:23 +0200
Subject: [Buildroot] [PATCH v4] Don't build host-cmake if it is
 available on the build host
In-Reply-To: <1468702571-23265-1-git-send-email-luca@lucaceresoli.net>
References: <1468702571-23265-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20160905100023.GE5553@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-07-16 22:56 +0200, Luca Ceresoli spake thusly:
> Currently all cmake packages depend on host-cmake. Unfortunately
> host-cmake takes a long time to configure and build: almost 7 minutes
> on a dual-core i5 with SSD. The time does not change even with ccache
> enabled.
> 
> Indeed, building host-cmake is avoidable if it is already installed on
> the build host: CMake is supposed to be quite portable, and the only
> patch in Buildroot for the CMake package seems to only affect
> target-cmake.
> 
> Thus we automatically skip building host-cmake and use the one on the
> system if:
>  - cmake is available on the system and
>  - it is recent enough.
[--SNIP--]
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
[--SNIP--]
> diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
> new file mode 100644
> index 000000000000..3005cfe68365
> --- /dev/null
> +++ b/support/dependencies/check-host-cmake.mk
> @@ -0,0 +1,7 @@
> +BR2_CMAKE ?= cmake
> +
> +ifneq (,$(call suitable-host-package,cmake,$(BR2_CMAKE)))
> +USE_SYSTEM_CMAKE = YES
> +else
> +BR2_CMAKE = $(HOST_DIR)/usr/bin/cmake
> +endif

I would simplify the test a little bit:

    BR2_CMAKE ?= cmake
    ifeq ($(call suitable-host-package,cmake,$(BR2_CMAKE)),)
    BR2_CMAKE = $(HOST_DIR)/usr/bin/cmake
    BR2_CMAKE_HOST_DEPENDENCY = host-cmake
    endif

and then in package/pkg-cmake.mk:

    $(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)

Regards,
Yann E. MORIN.

> diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
> new file mode 100755
> index 000000000000..08de60c974e8
> --- /dev/null
> +++ b/support/dependencies/check-host-cmake.sh
> @@ -0,0 +1,30 @@
> +#!/bin/sh
> +
> +candidate="$1"
> +
> +cmake=`which $candidate`
> +if [ ! -x "$cmake" ]; then
> +	# echo nothing: no suitable cmake found
> +	exit 1
> +fi
> +
> +version=`$cmake --version | head -n1 | cut -d\  -f3`
> +major=`echo "$version" | cut -d. -f1`
> +minor=`echo "$version" | cut -d. -f2`
> +
> +# Versions before 3.0 are affected by the bug described in
> +# https://git.busybox.net/buildroot/commit/?id=ef2c1970e4bff3be3992014070392b0e6bc28bd2
> +# and fixed in upstream CMake in version 3.0:
> +# https://cmake.org/gitweb?p=cmake.git;h=e8b8b37ef6fef094940d3384df5a1d421b9fa568
> +major_min=3
> +minor_min=0
> +if [ $major -gt $major_min ]; then
> +	echo $cmake
> +else
> +	if [ $major -eq $major_min -a $minor -ge $minor_min ]; then
> +		echo $cmake
> +	else
> +		# echo nothing: no suitable cmake found
> +		exit 1
> +	fi
> +fi
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
