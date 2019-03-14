From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Mar 2019 22:41:35 +0100
Subject: [Buildroot] [PATCHv2 1/2] support/dependencies: add a check for
 python3
In-Reply-To: <20190312223525.17360-1-romain.naour@gmail.com>
References: <20190312223525.17360-1-romain.naour@gmail.com>
Message-ID: <20190314214135.GA6876@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2019-03-12 23:35 +0100, Romain Naour spake thusly:
> Since version 2.29, glibc requires python 3.4 or later to build the GNU C Library [1].
> 
> We add a new check to verify the version of python3 interpreter installed on the host.
> If no suitable python3 interpreter is found, define BR2_PYTHON3_HOST_DEPENDENCY to add
> host-python3 in package dependencies when needed.
> 
> [1] https://www.sourceware.org/ml/libc-alpha/2019-01/msg00723.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, I have a nit-pick, see below...

> ---
> v2: fix the third argument handling in the check-host-python3.sh (Yann)
>     rework the python version handling to simplify the check (Adam)
> ---
>  support/dependencies/check-host-python3.mk | 13 +++++++++++++
>  support/dependencies/check-host-python3.sh | 31 ++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644 support/dependencies/check-host-python3.mk
>  create mode 100755 support/dependencies/check-host-python3.sh
> 
> diff --git a/support/dependencies/check-host-python3.mk b/support/dependencies/check-host-python3.mk
> new file mode 100644
> index 0000000000..ceb48c969e
> --- /dev/null
> +++ b/support/dependencies/check-host-python3.mk
> @@ -0,0 +1,13 @@
> +# Since version 2.29, glibc requires python 3.4 or later to build the GNU C Library.
> +# https://www.sourceware.org/ml/libc-alpha/2019-01/msg00723.html
> +
> +# Set this to either 3.4 or higher, depending on the highest minimum
> +# version required by any of the packages bundled in Buildroot. If a
> +# package is bumped or a new one added, and it requires a higher
> +# version, our package infra will catch it and whine.

So, I know that you just mimicked the existing blurb from another check,
but I find the wording pretty confusing: it seems to imply that if a new
package (or package version) is added, and it has a requirement on a
newer python, then the infra would cnotice and whine.

This is wrong. The infra can't detect such new requirement.

This is inherited from the 'make' test, which has the same wording, that
it in turn inherited from the 'cmake' test, which has a similar, but not
equivalent, wording:

    If a package is bumped or a new one added, and it requires a higher
    version, our cmake infra will catch it and build its own.

This again is wrong: we can't detect that a package has a requirement on
another cmake version.

However, in the cmake case, what happens is that cmake will actually
whine and break at build time, because cmake itself does that check.

Similarly, it's glibc's ./configure script that would whine and fail
when it notices that make's version is too old.

And similarly as well, it's again glibc's ./configure that will whine
and break if python3's version is too old.

It's never the infra that automatically detects that a package has a
requirement on a newer version of a tool. If that were so, then we would
not have to write the version string in the test-script to begin with...

So, I'd suggest we just drop that last sentence in the whole three
test-scripts.

Regards,
Yann E. MORIN.

> +BR2_PYTHON3_VERSION_MIN = 3.4
> +
> +ifeq (,$(call suitable-host-package,python3,$(BR2_PYTHON3_VERSION_MIN) python3 python))
> +BR2_PYTHON3_HOST_DEPENDENCY = host-python3
> +endif
> diff --git a/support/dependencies/check-host-python3.sh b/support/dependencies/check-host-python3.sh
> new file mode 100755
> index 0000000000..17cafd2883
> --- /dev/null
> +++ b/support/dependencies/check-host-python3.sh
> @@ -0,0 +1,31 @@
> +#!/bin/sh
> +
> +# prevent shift error
> +[ $# -lt 2 ] && exit 1
> +
> +version_min="$(echo ${1} | awk '{ split($1, v, "."); print v[1] v[2] }')"
> +
> +shift
> +
> +# The host python interpreter is already checked by dependencies.sh but
> +# it only check if the version is at least 2.7.
> +# We want to check the version number of the python3 interpreter even
> +# if Buildroot is able to use any version but some packages may require
> +# a more recent version.
> +
> +for candidate in "${@}" ; do
> +	python3=`which $candidate 2>/dev/null`
> +	if [ ! -x "$python3" ]; then
> +		continue
> +	fi
> +	version=`$python3 -V 2>&1 | awk '{ split($2, v, "."); print v[1] v[2] }'`
> +
> +	if [ $version -lt $version_min ]; then
> +		# no suitable python3 found
> +		continue
> +	fi
> +
> +	# suitable python3 found
> +	echo $python3
> +	break
> +done
> -- 
> 2.14.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
