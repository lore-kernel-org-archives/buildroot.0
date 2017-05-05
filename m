From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 May 2017 23:07:03 +0200
Subject: [Buildroot] [PATCH 1/3] core: allow check-host-cmake.sh to
 check several candidates
In-Reply-To: <1494016231-50639-2-git-send-email-casantos@datacom.ind.br>
References: <1494016231-50639-1-git-send-email-casantos@datacom.ind.br>
 <1494016231-50639-2-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170505210703.GA3001@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2017-05-05 17:30 -0300, Carlos Santos spake thusly:
> On CentOS 7 the "cmake" package installs cmake 2.8.12, which is too old
> for us but the "cmake3" package (from EPEL) provides cmake 3.6.3, which
> is good enough.
> 
> This change allows passing a list of candidates and the minimal version
> to check-host-cmake.sh. Examples (on CentOS 7):
> 
>     $ sh support/dependencies/check-host-cmake.sh cmake cmake3 2.8
>     /usr/bin/cmake
> 
>     $ sh support/dependencies/check-host-cmake.sh cmake cmake3 3.1
>     /usr/bin/cmake3
> 
>     $ sh support/dependencies/check-host-cmake.sh cmake cmake3 3.8
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  support/dependencies/check-host-cmake.sh | 66 ++++++++++++++++----------------
>  1 file changed, 34 insertions(+), 32 deletions(-)
> 
> diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
> index 9b63b06..09ae8cc 100755
> --- a/support/dependencies/check-host-cmake.sh
> +++ b/support/dependencies/check-host-cmake.sh
> @@ -1,39 +1,41 @@
>  #!/bin/sh
>  
> -candidate="${1}"
> -version_min="${2}"
> +eval 'version_min="${'${#}'}"'

It took me a moment to understand what this was doing (and I am known
for being a shell fanboy!).

Just revert the order options are passed: version first, then
candidates. This will allow you to get rid of this weird construct.

    version_min="${1}"
    shift # Keep only candidates

So that you can do...

>  major_min="${version_min%.*}"
>  minor_min="${version_min#*.}"
[--SNIP--]  
> +while [ $# -gt 1 ]; do
> +    cmake=`which "${1}" 2>/dev/null`

    for cmake; do
        cmake=`which "${cmake}" 2>/dev/null`

> +
> +    if [ -x "${cmake}" ]; then

Please use an early cut:

        [ -x "${cmake}" ] || continue

which allows you to gain a indentation level below.

> +        # Extract version X.Y from versions in the form X.Y or X.Y.Z
> +        # with X, Y and Z numbers with one or more digits each, e.g.
> +        #   3.2     -> 3.2
> +        #   3.2.3   -> 3.2
> +        #   3.2.42  -> 3.2
> +        #   3.10    -> 3.10
> +        #   3.10.4  -> 3.10
> +        #   3.10.42 -> 3.10
> +        version="$(${cmake} --version \
> +                   |sed -r -e '/.* ([[:digit:]]+\.[[:digit:]]+).*$/!d;' \
> +                           -e 's//\1/'
> +                  )"
> +        major="${version%.*}"
> +        minor="${version#*.}"
> +
> +        if [ ${major} -gt ${major_min} ]; then
> +            echo "${cmake}"
> +            exit
> +        elif [ ${major} -eq ${major_min} -a ${minor} -ge ${minor_min} ]; then
> +            echo "${cmake}"
> +            exit
> +        fi
>      fi
> -fi
> +
> +    shift
> +done
> +
> +# echo nothing: no suitable cmake found
> +exit 1

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
