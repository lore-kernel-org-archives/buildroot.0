From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Oct 2019 20:22:13 +0200
Subject: [Buildroot] [PATCH v2, 1/1] package/brltty: fix build with expat
In-Reply-To: <20191016231448.238c3348@windsurf.home>
References: <20191013124550.18413-1-fontaine.fabrice@gmail.com>
 <20191016231448.238c3348@windsurf.home>
Message-ID: <20191017182213.GI14656@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-10-16 23:14 +0200, Thomas Petazzoni spake thusly:
> +Yann, since there is some shell script sorcery involved below.

Eh... ;-)

> On Sun, 13 Oct 2019 14:45:50 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
[--SNIP--]
> > To fix this issue, add host-expat dependency as well as patch to add
> > $(EXPAT_INCLUDES_FOR_BUILD) and set CC_FOR_BUILD, LD_FOR_BUILD,
> > EXPAT_INCLUDES_FOR_BUILD and LDFLAGS_FOR_BUILD in brltty.mk
> > CFLAGS_FOR_BUILD can't be overriden as it's used to set internal paths
> > such as Headers
> 
> I am sorry, but this is still not good, and is still too much of a
> hack. I had a look at the brltty build system. Basically, the
> ./configure script that we call for the target will internally call
> another ./configure but for the host, after setting CC, CFLAGS,
> LDFLAGS, CXX and al. to their _FOR_BUILD counterparts.
> 
> This is done in the mk4build script:
> 
>    for variable in CC CFLAGS CXX CXXFLAGS LDFLAGS LDLIBS
>    do
>       unset "${variable}"
>       variableForBuild="${variable}_FOR_BUILD"
>       eval test '"${'"${variableForBuild}"'+set}"' != "set" || eval "${variable}"'="${'"${variableForBuild}"'}"'
>    done
> 
>    "${sourceRoot}/configure" \
>       --disable-api \
>       --disable-gpm \
>       --disable-iconv \
>       --disable-icu \
> 
> The issue is that for some reason the magic "eval" stuff doesn't do its
> job. Indeed, if I change the ${sourceRoot}/configure invocation to:
> 
>    CC=${CC_FOR_BUILD} \
>    CFLAGS=${CFLAGS_FOR_BUILD} \
>    CXX=${CXX_FOR_BUILD} \
>    CXXFLAGS=${CXXFLAGS_FOR_BUILD} \
>    LDFLAGS=${LDFLAGS_FOR_BUILD} \
>    LDLIBS=${LDLIBS_FOR_BUILD} \
>    "${sourceRoot}/configure" \
>       --disable-api \
>       --disable-gpm \
[--SNIP--]
> Perhaps Yann can shed some light as to why the magic eval stuff doesn't
> behave like it should.

The difference I can spot is that in the first case, the 'unset' will
cause the variables to be unset *and* unexported. Then the variables are
(maybe) properly set by the eval, but they are not exported, and so are
just not in the environment, and thus the sub-configure does not get
them.

In the second case, the variables are implicitly exported in the
environment of the sub-configure.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
