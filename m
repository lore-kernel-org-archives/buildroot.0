From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Apr 2014 07:12:06 +0200
Subject: [Buildroot] [PATCH 3/3] package/wget: use the new gettextize
 infra
In-Reply-To: <20140410033422.GR4096@tarshish>
References: <cover.1397081821.git.yann.morin.1998@free.fr>
 <f318a05b46d762c07c435c133b0a6e836600c6d6.1397081821.git.yann.morin.1998@free.fr>
 <20140410033422.GR4096@tarshish>
Message-ID: <20140410051206.GA3191@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2014-04-10 06:34 +0300, Baruch Siach spake thusly:
> On Thu, Apr 10, 2014 at 12:20:05AM +0200, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > Currently, the gettextization of wget works by chance:
> >   - host-gettext is added as a dependency to wget;
> >   - gettextize is run as a post-patch hook.
> > 
> > But the dependencies are only guaranteed to be built and installed
> > for the configure step, not the patch step. Becasue post-patch hooks
> > are part of the patch step, we have no guarantee that the dependency
> > to host-gettext is done by the time we gettextize wget.
> > 
> > This happens to work by chance, since wget sorts alphabetically after
> > gettext, so we indeed have host-gettext built and installed by the
> > time we need to gettextize wget.
> > 
> > This is prone to fail in the parallel build case, sicne we can no
> > longer rely on alphabetical order in that case.
> 
> Fixing this only requires using PRE_CONFIGURE_HOOK instead of POST_PATCH_HOOK, 
> isn't it? Is there anything else this series attempts to fix?

Yes, switching it to a pre-configure hook would fix it.
But that would be a one-off solution.

Providing it in the autotools-infra will allow us to have consistency
across packages and would allow us to fix it in a single place in the
future, rather than having to hunt down allow the offenders.

But as I said, this is an RFC, so we can discuss it further.

First, we have to agree we want it in the autotools infra or not.

Then, we'll have to check whether a boolean + an _OPT is enough, or if
we need something a bit more involved (e.g. let packages define the
complete hook, and just have the infra call it at the proper moment.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
