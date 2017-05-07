From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 7 May 2017 12:28:16 -0300 (BRT)
Subject: [Buildroot] [PATCH v2 2/4] core: allow check-host-cmake.sh to
 try several candidates
In-Reply-To: <20170507094706.GB2949@scaer>
References: <1494131541-2960-1-git-send-email-casantos@datacom.ind.br>
 <1494131541-2960-2-git-send-email-casantos@datacom.ind.br>
 <20170507094706.GB2949@scaer>
Message-ID: <401111742.21785804.1494170896679.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org
> Sent: Sunday, May 7, 2017 6:47:06 AM
> Subject: Re: [PATCH v2 2/4] core: allow check-host-cmake.sh to try several candidates

> Carlos, All,
---8<---
>> +    # Discard the candidate if no version can be obtained
>> +    version="$(${cmake} --version \
>> +               |sed -r -e '/.* ([[:digit:]]+\.[[:digit:]]+).*$/!d;' \
>> +                       -e 's//\1/'
>> +              )"
>> +    [ -n "${version}" ] || continue
> 
> ... here: the check that version is not empty is new, and semantically
> it looks like it should have been in a spearate patch (prossibly before
> that one).
> 
> Unless it is the act of testing multiple candidates that introduces a
> case where the version is empty, but I fil to see how that would be.

The problem here is that if $version is empty both $major and $minor
become empty too and the test below emits an annoying error message.
Example (commenting the '[ -n "${version}" ] || continue' line):

    $ sh check-host-cmake.sh 3.1 python
    Python 2.7.12
    check-host-cmake.sh: 35: [: -gt: unexpected operator
    check-host-cmake.sh: 38: [: -eq: unexpected operator

Raising even more the paranoia level, the script is also fragile in
other aspects, e.g

    $ bash --version
    GNU bash, version 4.3.46(1)-release (x86_64-pc-linux-gnu)
    ---8<---
    $  sh check-host-cmake.sh 3.1 bash
    /bin/bash
    $ cat --version
    cat (GNU coreutils) 8.25
    ---8<---
    $ sh check-host-cmake.sh 3.1 cat
    /bin/cat

It is so fragile that I'm tempted to replace the regex by a
stricter one. Example:

    $ cmake --version | sed -n -r -e 's/^cmake version ([[:digit:]]+\.[[:digit:]]+).*$/\1/p'
    2.8
    $ cmake3 --version | sed -n -r -e 's/^cmake version ([[:digit:]]+\.[[:digit:]]+).*$/\1/p'
    3.6

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
