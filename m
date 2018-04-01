From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Apr 2018 20:13:49 +0200
Subject: [Buildroot] [v3 13/13] download: git: introduce cache feature
In-Reply-To: <c64b0f87-ce14-5825-2404-d27cfd1d423c@mind.be>
References: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
 <20180331142407.9522-13-maxime.hadjinlian@gmail.com>
 <20180401125757.GD2613@scaer>
 <c64b0f87-ce14-5825-2404-d27cfd1d423c@mind.be>
Message-ID: <20180401181349.GK2613@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-04-01 16:58 +0200, Arnout Vandecappelle spake thusly:
> On 01-04-18 14:57, Yann E. MORIN wrote:
> > On 2018-03-31 16:24 +0200, Maxime Hadjinlian spake thusly:
[--SNIP--]
> >> +# If the cache directory already exists, don't try to clone.
> >> +if [ ! -d "${git_cache}" ]; then
> >> +    # Try a shallow clone, since it is faster than a full clone - but that
> >> +    # only works if the versionis a ref (tag or branch). Before trying to do a
> >> +    # shallow clone we check if ${cset} is in the list provided by git
> >> +    # ls-remote. If not we fall back on a full clone.
> >> +    #
> >> +    # Messages for the type of clone used are provided to ease debugging in
> >> +    # case of problems
> >> +    git_done=0
> >> +    if [ -n "$(_git ls-remote "'${uri}'" "'${cset}'" 2>&1)" ]; then
> >> +        printf "Doing shallow clone\n"
> >> +        if _git clone ${verbose} "${@}" --depth 1 -b "'${cset}'" "'${uri}'" "'${git_cache}'"; then
> >> +            git_done=1
> >> +        else
> >> +            printf "Shallow clone failed, falling back to doing a full clone\n"
> >> +        fi
> >> +    fi
> >> +    if [ ${git_done} -eq 0 ]; then
> >> +        printf "Doing full clone\n"
> >> +        _git clone ${verbose} "${@}" "'${uri}'" "'${git_cache}'"
> 
>  Can't we get rid of all the code above, and instead initialize an empty repository:
> 
> _git init "'${git_cache}'"
> cd "'${git_cache}'"
> _git remote set-url origin "'${uri}'"
> 
>  then do a fetch, and make it support shallow as well:
> 
> if [ -n "$(_git ls-remote origin "'${cset}'" 2>&1)" ]; then
>   if _git fetch "${@}" --depth 1 origin "'${cset}'";
>     git_done=1
>   fi
> fi
> if [ ${git_done} -eq 0 ]; then
>  _git fetch origin -t
> fi
> 
>  Would this work?

As seen IRL, this would work with "extra tweaks left as an exercise to
the reader". ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
