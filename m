From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 May 2017 18:11:32 +0200
Subject: [Buildroot] [PATCH v2 2/4] core: allow check-host-cmake.sh to
 try several candidates
In-Reply-To: <401111742.21785804.1494170896679.JavaMail.zimbra@datacom.ind.br>
References: <1494131541-2960-1-git-send-email-casantos@datacom.ind.br>
 <1494131541-2960-2-git-send-email-casantos@datacom.ind.br>
 <20170507094706.GB2949@scaer>
 <401111742.21785804.1494170896679.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20170507161132.GC2949@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2017-05-07 12:28 -0300, Carlos Santos spake thusly:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > To: "Carlos Santos" <casantos@datacom.ind.br>
> > Cc: buildroot at buildroot.org
> > Sent: Sunday, May 7, 2017 6:47:06 AM
> > Subject: Re: [PATCH v2 2/4] core: allow check-host-cmake.sh to try several candidates
> 
> > Carlos, All,
> ---8<---
> >> +    # Discard the candidate if no version can be obtained
> >> +    version="$(${cmake} --version \
> >> +               |sed -r -e '/.* ([[:digit:]]+\.[[:digit:]]+).*$/!d;' \
> >> +                       -e 's//\1/'
> >> +              )"
> >> +    [ -n "${version}" ] || continue
> > 
> > ... here: the check that version is not empty is new, and semantically
> > it looks like it should have been in a spearate patch (prossibly before
> > that one).
> > 
> > Unless it is the act of testing multiple candidates that introduces a
> > case where the version is empty, but I fil to see how that would be.
> 
> The problem here is that if $version is empty both $major and $minor
> become empty too and the test below emits an annoying error message.
> Example (commenting the '[ -n "${version}" ] || continue' line):
> 
>     $ sh check-host-cmake.sh 3.1 python
>     Python 2.7.12
>     check-host-cmake.sh: 35: [: -gt: unexpected operator
>     check-host-cmake.sh: 38: [: -eq: unexpected operator

Well, this can only happen in one condition: the 'cmake' (or 'cmake3')
executable is in fact not CMake, which would be an excessively stupid
situation...

> Raising even more the paranoia level, the script is also fragile in
> other aspects, e.g
> 
>     $ bash --version
>     GNU bash, version 4.3.46(1)-release (x86_64-pc-linux-gnu)
>     ---8<---
>     $  sh check-host-cmake.sh 3.1 bash
>     /bin/bash
>     $ cat --version
>     cat (GNU coreutils) 8.25
>     ---8<---
>     $ sh check-host-cmake.sh 3.1 cat
>     /bin/cat

YUes, if you call the script manually, which it is not intended to be.
Remeber that the script is only called if the user did not explicitly
pass BR2_CMAKE, and its arguments are always the minimum version and the
candidates, which are always 'cmake' and 'cmake3'.

> It is so fragile that I'm tempted to replace the regex by a
> stricter one. Example:
> 
>     $ cmake --version | sed -n -r -e 's/^cmake version ([[:digit:]]+\.[[:digit:]]+).*$/\1/p'
>     2.8
>     $ cmake3 --version | sed -n -r -e 's/^cmake version ([[:digit:]]+\.[[:digit:]]+).*$/\1/p'
>     3.6

I'm not against having a stricter regex, but remember what you are
trying to protect against... And I personally don't think the cases you
point at would ever happen, unless one of the candidates is in fact not
CMake.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
