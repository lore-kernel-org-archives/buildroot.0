From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Jul 2014 22:15:37 +0200
Subject: [Buildroot] Silencing the build
In-Reply-To: <CAHkwnC_eQxDKH=V+2U+pOMZj50y4oE2B_p_G+CAk8ZFG3jSsOw@mail.gmail.com>
References: <1404906414-15197-1-git-send-email-fabio.porcedda@gmail.com>
 <20140715212814.1dfcce43@free-electrons.com>
 <CAHkwnC_1+=SR88eS3hHDOFMvzFFF_dE5LuRdKhKfi9pFm1RL4Q@mail.gmail.com>
 <20140717203152.2e18fb9b@free-electrons.com>
 <20140717202941.GE3737@free.fr>
 <CAHkwnC_eQxDKH=V+2U+pOMZj50y4oE2B_p_G+CAk8ZFG3jSsOw@mail.gmail.com>
Message-ID: <20140718201537.GC3630@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2014-07-18 10:18 +0200, Fabio Porcedda spake thusly:
> On Thu, Jul 17, 2014 at 10:29 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Thomas, All,
> >
> > On 2014-07-17 20:31 +0200, Thomas Petazzoni spake thusly:
> >> On Thu, 17 Jul 2014 19:40:46 +0200, Fabio Porcedda wrote:
> >>
> >> > > Hum, yes, but why? The entire build process is anyway very noisy, so is
> >> > > there really a point in silencing specifically this part? What is the
> >> > > ultimate goal you're trying to achieve here?
> >> >
> >> > My ultimate goal is to be able using the "-s" flags to silence all
> >> > parts, because sometimes i just want to build and view only ">>> *"
> >> > messages, errors, warning without anything else.
> >> >
> >> > As example the "toolchain-external" target already do that when the
> >> > "-s" option is used.
> >> >
> >> > I've silenced only this part because it was easy and it's anyway an improvement.
> >> >
> >> > Maybe i can work on silencing other parts too if the feature is desired.
> >>
> >> Ok, thanks for the explanation.
> >>
> >> I guess we need to decide whether having a fully silent build in "make
> >> -s" is a goal we should aim at. It seems like a good idea to me, but I
> >> don't have a really strong opinion about this.
> >>
> >> What do others think about this?
> >
> > Here's what I use for a silent build:
> >
> >     brmake() {
> >         make "${@}" \
> >         |sed -r -e '/^.{4}>>>[[:space:]]+(.*).{5}$/!d; s//\1/;'
> >     }
> >
> > Then calling 'brmake' instead of 'make', will get you only the >>> lines.
> 
> Nice, so i'm not the only one who likes a silent build ;-)

Well, I still believe the build should be verbose by default, otherwise
we would miss a lot of important information on bug reports. The problem
is where to store the build.log in case of a silent build, so the user
can provide it.

I think the best we can do is document a simple solution (like my little
function above, for example).

> I think that a downside of this method is that even the stderr is
> filtered as well so messages like warning or errors are filtered as
> well.

No, because only stdout is filtered, there's no redirection of stderr.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
