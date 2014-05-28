From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 08:30:24 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-22
In-Reply-To: <53857DE2.6040509@mind.be>
References: <20140523063008.8A64410106F@stock.ovh.net>
 <CAHkwnC-hvNQMqCJ3iqL=EVEb8FvGNA9+ZU56OngtCe=1pAmf5w@mail.gmail.com>
 <20140523190819.45a80027@free-electrons.com>
 <53857DE2.6040509@mind.be>
Message-ID: <20140528063024.GA3510@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-05-28 08:10 +0200, Arnout Vandecappelle spake thusly:
> On 23/05/14 19:08, Thomas Petazzoni wrote:
> > Dear Fabio Porcedda,
> > 
> > On Fri, 23 May 2014 11:32:28 +0200, Fabio Porcedda wrote:
> > 
> >>>    powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/520606ec674f6c8efad6ebbb840099ec89d03130/
> >>>     x86_64 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/cc21623fbc3d4e94f09b2cb0be36ce05cf75a2e6/
> >>
> >> It's related to BR2_PREFER_STATIC_LIB=y, I'm trying to fix it.
> > 
> > Please note that Gustavo has already done a lot of investigation on
> > this one. It boils done to the fact that we pass --static instead of
> > -static when building statically. But we switched from -static to
> > --static a while ago, for some reason that the commit doesn't make
> > really clear.
> 
>  I remember that: libtool will parse the -static option and act accordingly.
> Only, it interprets it differently than gcc: it will only link statically
> against local libraries, not against installed libraries. If we don't have any
> .so files in $(STAGING_DIR), that wouldn't be a problem because it would still
> link statically (no other option).

Ah, yes, *that* libtool magic... :-/

> But unfortunately there are still quite a few
> packages that do install .so files in $(STAGING_DIR) - e.g. toolchain-external.
> So without the --static, you end up with a lot of dynamically linked programs.

So, what about a post-staging-install hook that would remove all .so
files with BR2_STATIC_ONLY?  (He!, a new name!)

>  For reference, the commit is 0a4bd19f4.
> 
>  As that commit mentions, we would actually like to pass -all-static to libtool.
> But of course, that option is not known by gcc, so it won't work if libtool is
> not used...

What about passing both -static and --static?

>  A proper solution would be to adapt our libtool patches to interpret -static as
> -all-static. Or alternatively, to patch the compiler wrapper to interpret
> -all-static as -static (and then of course we'd have to generalize the compiler
> wrapper to also use it for internal toolchains).

Yes, I think this is a good idea. But we can't use the wrapper to build
the toolchain itself, of course.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
