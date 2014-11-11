From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Nov 2014 18:21:46 +0100
Subject: [Buildroot] [PATCH v2 02/15] package/pkg-rebar.mk: new
 infrastructure.
In-Reply-To: <CAJtjsKYb0HBwAoT4iiLuQWh52quJmYGvpRfx0F4+d3dMkMhVTA@mail.gmail.com>
References: <1415366931-6870-1-git-send-email-johan.oudinet@gmail.com>
 <1415366931-6870-3-git-send-email-johan.oudinet@gmail.com>
 <20141110233154.GG22119@free.fr> <54622372.7000700@mind.be>
 <20141111153516.GH4240@free.fr>
 <CAJtjsKYb0HBwAoT4iiLuQWh52quJmYGvpRfx0F4+d3dMkMhVTA@mail.gmail.com>
Message-ID: <20141111172146.GL4240@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan, All,

On 2014-11-11 17:55 +0100, Johan Oudinet spake thusly:
> On Tue, Nov 11, 2014 at 4:35 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >> >> +ifndef $(2)_BUILD_CMDS
> >> >> +define $(2)_BUILD_CMDS
> >> >> +  cd '$$(@D)' &&                                                  \
> >> >> +  if [ -f ./rebar ]; then                                         \
> >> >> +          $$($$(PKG)_ENV)                                         \
> >> >> +          $$($$(PKG)_REBAR_ENV)                                   \
> >> >> +                  ./rebar $$($$(PKG)_REBAR_FLAGS) compile;        \
> >> >> +  else                                                            \
> >> >> +          $$($$(PKG)_ENV)                                         \
> >> >> +          $$($$(PKG)_REBAR_ENV)                                   \
> >> >> +                  rebar $$($$(PKG)_REBAR_FLAGS) compile;          \
> >> >> +  fi
> >> >> +endef
> >> >> +endif
[--SNIP--]
> > Johan, care to investigate why would we use the package's rebar instead
> > of our own?
> 
> That's because packages distribute a rebar.config{,.script} file and
> its syntax may differ from the rebar version packaged in buildroot.
> Anyway, if I find out some packages' rebar break the compilation, the
> solution is probably to use our own rebar and patch the rebar
> configuration file of packages that distribute an old version.

OK, I see. Thanks for the explanations.

I think we should use our own rebar whenever possible, and revert to
using the package's rebar only when necessary, by way of a config
option, something like (name to be discussed):

    ERLANG_FOO_USE_PKG_REBAR = YES

However, I wonder how much the configuration changes are intrusive.

Surely, if it is trivial, then I'd prefer we do the patching rather than
use the package's rebar. however, if the patching turns out to be very
intrusive, then it's OK to use the package's rebar.

But in that second case, I think we should delegate to the package to
override its _CONFIGURE_CMDS and.or _BUILD_CMDS. Thoughts?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
