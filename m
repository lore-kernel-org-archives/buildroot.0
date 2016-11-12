From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 12 Nov 2016 23:53:23 +0100
Subject: [Buildroot] [PATCH 1/2] core: find an UFT8 locale on the host
In-Reply-To: <bebab08246b4a3603ba41a3c8113d003a80be1f2.1478463815.git.yann.morin.1998@free.fr>
References: <cover.1478463815.git.yann.morin.1998@free.fr>
 <bebab08246b4a3603ba41a3c8113d003a80be1f2.1478463815.git.yann.morin.1998@free.fr>
Message-ID: <553af062-1c09-067c-828a-bed79a100a28@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

Le 06/11/2016 ? 21:23, Yann E. MORIN a ?crit :
> Some packages need an UTF8 locale to build sucessfully, so find one for

s/sucessfully/successfully/

> them.
> 
> We try hard to have a locale as close as possible to the one currently
> used by the user, so as to output messages in his language. We first try
> any of the current locale settings to see if they are fit, then we look
> if said settigns have an UTF8 variant, then look for the same language

s/settigns/settings/

> for other countries, and finally fallback to some well-known locales.

Tested with:
LC_ALL=fr_FR.utf8

Tested-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Romain Naour <romain.naour@openwide.fr>
> ---
>  Makefile                         |  3 +++
>  support/scripts/find-utf8-locale | 48 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100755 support/scripts/find-utf8-locale
> 
> diff --git a/Makefile b/Makefile
> index 4ea64b3..4832160 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -244,6 +244,9 @@ export LANG=C
>  export LC_ALL=C
>  endif
>  
> +# Some packages want an UTF8 locale, so find one.
> +UTF8_LOCALE := $(shell support/scripts/find-utf8-locale)
> +
>  # To put more focus on warnings, be less verbose as default
>  # Use 'make V=1' to see the full commands
>  ifeq ("$(origin V)", "command line")
> diff --git a/support/scripts/find-utf8-locale b/support/scripts/find-utf8-locale
> new file mode 100755
> index 0000000..278247c
> --- /dev/null
> +++ b/support/scripts/find-utf8-locale
> @@ -0,0 +1,48 @@
> +#!/bin/bash
> +
> +# Try to find an UTF8 locale.
> +#
> +# We try to find a locale that is as close as possible to the one that
> +# the user currently uses. For that, we look at the same environment
> +# variables that glibc uses: $LANGUAGE, then $LC_ALL, then $LC_XXX and
> +# finally $LANG. $LANGUAGE can be a colon-separated list.
> +# https://www.gnu.org/software/libc/manual/html_node/Using-gettextized-software.html#Using-gettextized-software
> +
> +# First, see if any of those variables is already an UTF8 locale.
> +for l in ${LANGUAGE//:/ } ${LC_ALL} ${LC_MESSAGES} ${LANG}; do
> +    case "${l,,}" in
> +    (*.utf8|*.utf-8)    printf "%s" "${l}"; exit 0;;
> +    esac
> +done
> +
> +# No luck. Try to see if any of those have an UTF8 variant.
> +for l in ${LANGUAGE//:/ } ${LC_ALL} ${LC_MESSAGES} ${LANG}; do
> +    l="$(locale -a |grep -i -E "^${l}\.utf.?8" |head -n 1)"
> +    if [ -n "${l}" ]; then
> +        printf "%s" "${l}"
> +        exit 0
> +    fi
> +done
> +
> +# Still no luck. Try to see if we have a locale for the same language,
> +# but for another country.
> +for l in ${LANGUAGE//:/ } ${LC_ALL} ${LC_MESSAGES} ${LANG}; do
> +    l="$(locale -a |grep -i -E "^${l%_*}_.+\.utf.?8" |head -n 1)"
> +    if [ -n "${l}" ]; then
> +        printf "%s" "${l}"
> +        exit 0
> +    fi
> +done
> +
> +# We're really out of luck. Try well-known UTF8 locales.
> +for l in en_US.utf8 en_GB.utf8 C.UTF-8; do
> +    l="$(locale -a |grep -i -E "^${l}" |head -n 1)"
> +    if [ -n "${l}" ]; then
> +        printf "%s" "${l}"
> +        exit 0
> +    fi
> +done
> +
> +# We don't have an easy life, no we don't. And we don't have an
> +# UTF8 locale either... :-(
> +exit 1
> 
