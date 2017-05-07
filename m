From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 May 2017 11:47:06 +0200
Subject: [Buildroot] [PATCH v2 2/4] core: allow check-host-cmake.sh to
 try several candidates
In-Reply-To: <1494131541-2960-2-git-send-email-casantos@datacom.ind.br>
References: <1494131541-2960-1-git-send-email-casantos@datacom.ind.br>
 <1494131541-2960-2-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170507094706.GB2949@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2017-05-07 01:32 -0300, Carlos Santos spake thusly:
> This is useful on CentOS 7 whose "cmake" package provides cmake 2.8.12,
> which is too old, but the "cmake3" package (from EPEL) provides version
> 3.6.3, which is satisfactory. Examples:
> 
>     $ sh support/dependencies/check-host-cmake.sh 2.8 cmake cmake3
>     /usr/bin/cmake
> 
>     $ sh support/dependencies/check-host-cmake.sh 3.1 cmake cmake3
>     /usr/bin/cmake3
> 
>     $ sh support/dependencies/check-host-cmake.sh 3.8 cmake cmake3
>     (nothing)
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, there is a small nit-pick I'd like to point out...

[--SNIP--]
> +for candidate; do
> +
> +    # Try to locate the candidate. Discard it if not located.
> +    cmake=`which "${candidate}" 2>/dev/null`
> +    [ -n "${cmake}" ] || continue
> +
> +    # Extract version X.Y from versions in the form X.Y or X.Y.Z
> +    # with X, Y and Z numbers with one or more digits each, e.g.
> +    #   3.2     -> 3.2
> +    #   3.2.3   -> 3.2
> +    #   3.2.42  -> 3.2
> +    #   3.10    -> 3.10
> +    #   3.10.4  -> 3.10
> +    #   3.10.42 -> 3.10
> +    # Discard the candidate if no version can be obtained
> +    version="$(${cmake} --version \
> +               |sed -r -e '/.* ([[:digit:]]+\.[[:digit:]]+).*$/!d;' \
> +                       -e 's//\1/'
> +              )"
> +    [ -n "${version}" ] || continue

... here: the check that version is not empty is new, and semantically
it looks like it should have been in a spearate patch (prossibly before
that one).

Unless it is the act of testing multiple candidates that introduces a
case where the version is empty, but I fil to see how that would be.

In any case, don't re-spin just for that.

Regards,
Yann E. MORIN.

> +    major="${version%.*}"
> +    minor="${version#*.}"
> +
> +    if [ ${major} -gt ${major_min} ]; then
>          echo "${cmake}"
> -    else
> -        # echo nothing: no suitable cmake found
> -        exit 1
> +        exit
> +    elif [ ${major} -eq ${major_min} -a ${minor} -ge ${minor_min} ]; then
> +        echo "${cmake}"
> +        exit
>      fi
> -fi
> +done
> +
> +# echo nothing: no suitable cmake found
> +exit 1
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
