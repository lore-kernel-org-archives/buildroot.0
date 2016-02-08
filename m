From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Feb 2016 20:01:34 +0100
Subject: [Buildroot] [PATCH v2] Don't build host-cmake if it is
 available on the build host
In-Reply-To: <1454670476-20635-1-git-send-email-luca@lucaceresoli.net>
References: <1454670476-20635-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20160208190134.GG3436@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2016-02-05 12:07 +0100, Luca Ceresoli spake thusly:
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
> We avoid building host-cmake if cmake is already available on the host
> using a technique similar to the one used for host-tar and host-xzcat.
[--SNIP--]
> Besides, among all the cmake packages currently in Buildroot, the
> highest version mentioned in cmake_minimum_required() is 3.0 (the
> grantlee package). Thus 3.0 should be enough to build all current
> packages. Of course, with the addition or bump of packages, the
> minimum required version will raise.

Would it make sense to have the cmake-package infra check for that?

> ---
> Note: there is still a pending clarification with Arnout about this
> patch.

Which is? ;-)

[--SNIP--]
> diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
> new file mode 100644
> index 0000000..fe16322
> --- /dev/null
> +++ b/support/dependencies/check-host-cmake.mk
> @@ -0,0 +1,6 @@
> +CMAKE ?= cmake

At first, I was a bit worried that we use just 'CMAKE' as the variable
name.

But in retrospect, it seems you want to allow the user to specify his
own locally-installed cmake, right? Is so, maybe you could add that to
the manual (chapter 8.6, Environment variables).

> +ifeq (,$(call suitable-host-package,cmake,$(CMAKE)))
> +BUILD_HOST_CMAKE = YES
> +CMAKE = $(HOST_DIR)/usr/bin/cmake
> +endif
> diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
> new file mode 100755
> index 0000000..08de60c
> --- /dev/null
> +++ b/support/dependencies/check-host-cmake.sh
> @@ -0,0 +1,30 @@
> +#!/bin/sh
> +
> +candidate="$1"
> +
> +cmake=`which $candidate`

For good measure, redirect stderr to /dev/null. 'which' is not supposed
to spit out anything on stderrm even when the program is not found, but
still, there might be rogue implenentations of which in the wild...

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

Damn, I would have suggested you make it a single condition:

    if [ ${major} -gt ${major_min} -o \
         ${major} -eq ${major_min} -a ${minor} -ge ${minor_min} ]; then

But since what you did is what is already done for asciidoc and tar, I
guess that's OK.

Yet, I prefer we use ${..} to expand variables, it is /cleaner/...

Regards,
Yann E. MORIN.

> +		echo $cmake
> +	else
> +		# echo nothing: no suitable cmake found
> +		exit 1
> +	fi
> +fi
> -- 
> 1.9.1
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
