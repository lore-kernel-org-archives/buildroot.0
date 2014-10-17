From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Oct 2014 22:18:25 +0200
Subject: [Buildroot] [PATCH v3] ejabberd: new package
In-Reply-To: <CAJtjsKZC=Fi4ND7HX+YEEyGrNivu+6RduYnQ08FmVWU+NAiYqA@mail.gmail.com>
References: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
 <20141011162152.GA4254@free.fr>
 <CAJtjsKZC=Fi4ND7HX+YEEyGrNivu+6RduYnQ08FmVWU+NAiYqA@mail.gmail.com>
Message-ID: <20141017201824.GC3971@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan, All,

On 2014-10-16 14:38 +0200, Johan Oudinet spake thusly:
> On Sat, Oct 11, 2014 at 6:21 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > We've been discussing this ejabberd patch during the current Developpers
> > Day in D?sseldorf.
> >
> > Given the current issues that ewre noticed with building ejabberd, we
> > decided to mark the patch as Rejected in patchwork.
> >
> > This means that we rejected that very specific patch, *not* that we
> > decided not to have ejabberd. But before it gets included, all the
> > issues must be fixed first, especially the build-time downloading of
> > dependencies, as well as all the remarks that were made by Thomas and I.
> 
> Sure, it makes sense to me as well. As I said in a previous mail, I
> did fix my patch to include your remarks, but two:
> 1. Fix ejabberd build system to not download dependencies at build time.
> 2. Avoid to use a fix UID and GID for ejabberd user.
> 
> I don't know if I should republish the patch before fixing these two issues.
> I'd like your help on both of them.
> 
> ** Fix ejabberd build system
> ** ===================
> The only solution i see is to create a buildroot package for every
> ejabberd dependency, listed in rebar.config.script :
> esip, goldrush, lager, p1_cache_tab, p1_iconv, p1_stringprep, p1_stun,
> p1_tls, p1_utils, p1_xml, p1_yaml, p1_zlib, xmlrpc
> Then, modify ejabberd package to not use rebar at all, or at least to
> not call rebar get-deps. Thus, if I remove deps from the `all'
> makefile rule and deps/.build from the `src' rule dependency, it might
> work.
> 
> Do you have a better idea?

No, I have no better idea. I don't know how rebar works, but we indeed
need to have one package for each dependency. Having ejabberd (rebar, in
fact) do the download at configure/build time is not acceptable.

Howeever, I can see where that brings us:

  - there are so far 14 identified such dependencies;

  - maybe (probably?) each of those dependencies mya in turn have more
    dependencies, which add up to the list;

  - I have absolutely no idea how rebar (or the whole erlang ecosystem)
    behaves for corss-compilation (hint: probably badly), which would
    make for very tricky package recipes;

  - thus, we'd highly benefit from a specialised package infrastructure,
    like we have for perl, python or lua packages, though I'm afraid
    that would not be a piece of cake to add such an infra.

So, I really don;t know where to go from there... :-(

If you were inclined into looking into this, then I think the best
course of actions for you would be somelthing along those lines:

  (1) create a new package for the simplest, leaf-most dependency; this
      will allow you to assess how complex it is to cross-build a single,
      simple erlang package;

  (2) add a new package that depends directly on, and only on the one
      above; this will allow you to assess how complex it is to express
      erlang dependencies in cross-compilation;

  (3) progress with a few more packages (say, up to 3-5 packages); this
      will allow you to have a global understanding about the
      comonalities and specifities of erlang packages;

  (4) see how to turn that into a specific package infrastructure;

  (5) post your results to the list, so we can all agree on that new
      infra; this will allow all of us to get to solve issues in a clean
      and sane way;

  (6) introduce that new infra, and convert the existing packages over
      to that new infra;

  (7) add every missing ejabberd dependencies one after the other,
      adapting the new infra in case it is needed, until you eventually
      reach to packaging ejabberd;

  (8) rejoice! ;-)

Note that this will probably be a lot of work, and I do not expect it to
be easy at all. I'm willing to participate in this effort, if you want.

> ** Avoid to use a fix UID and GID for ejabberd user
> ** ===================================
> 
> I still don't know how I could set the correct permissions to ejabberd
> files [...]

A quick solution to that would be to have all of ejabberd's files in a
specific directory, like /var/ejabberd (find a better location1), add
the necessary symlinks to point to that location, and use that location
in EJABBERD_USERS:

    ejabberd -1 ejabberd -1 * /var/ejabberd - - ejabberd daemon

> [...] in <PKG>_PERMISSIONS if I set -1 for UID and GID in <PKG>_USERS

Indeed, there is no provision for using UIDs/GIDs from the _USERS variable,
from the _PERMISSIONS.

I'll look into that...

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
