From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Sep 2012 23:28:38 +0200
Subject: [Buildroot] [PATCH 10/11] toolchain/common: introduce blind
	options BR2_NEEDS_GETTEXT{, _IF_LOCALE}
In-Reply-To: <20120918195518.163c409d@skate>
References: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
 <1347836276-24262-11-git-send-email-yann.morin.1998@free.fr>
 <20120918195518.163c409d@skate>
Message-ID: <201209182328.38581.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 18 September 2012 19:55:18 Thomas Petazzoni wrote:
> On Mon, 17 Sep 2012 00:57:55 +0200, Yann E. MORIN wrote:
> > Also, introduce four new Makefile variables:
> >   - $(gettext)
> >         contains the needed dependencies for pacakges that need gettext
> >         functioanlity: 'gettext' if the gettext pacakge is needed, empty
> >         otherwise
> >   - $(gettext-if-locale)
> >         ditto, but only if locales are enabled
> >   - $(gettext-LDFLAGS)
> >         contains the required LDFLAGS ("-lintl") if gettext is provided by
> >         the gettext package, empty otherwise
> >   - $(gettext-LDFLAGS-if-locale)
> >         ditto, but only if locales are enabled
> > 
> > Packages can then add either variable to their own LDFLAGS.
> 
> I am happy about the entire patch set, except those $(gettext),
> $(gettext-if-locale), $(gettext-LDFLAGS) and
> $(gettext-LDFLAGS-if-locale) variables. Even though they admittedly
> make the code a bit shorter, I think they needlessly hide what is
> really happening. I very much prefer an explicit:
> 
> FOO_DEPENDENCIES += $(if $(BR2_NEEDS_GETTEXT),gettext)
> 
> (which doesn't use any special construct)
> 
> rather than the more strange:
> 
> FOO_DEPENDENCIES += $(gettext)

My reasoning behind this was to keep the similar constructs in the
Config.in and the package.mk.

In Config.in, a package declares its dependency on gettext, and buildroot
does what is needed "behind the hood":
  select BR2_NEEDS_GETTEXT

Then buildroot will or will not effectively select the gettext package,
depending on the toolchain features.

(To be noted, in this case we are already /hidding/ stuff behind the
 scenes, which could well be considered "crossing the line", too.)

I wanted to introduce a similar behavior in the .mk, hence the $(gettext*)
variables, without the package to even have to deal with the depedencies by
itself. A package would just have to declare a build-time dependency on the
gettext _feature_, and buildroot would decide to build or not to build the
gettext _package_ depending on the toolchain features.

> I know I'm annoying by rejecting many new additional constructs, but I
> think such constructs are crossing the boundary of shortness vs.
> readability.

(No, you are not annoying; I do expect such discussions on such impacting
changes. Yes, it's a bit frustrating, but this is absolutely needed. :-) )

I agree that this is somewhat crossing the line. But I also believe this
change would make it easier to maintain packages, with a single, right way
of expressing the dependency, and a single place we'd have to change if
we'd have to, rather than scouting the tree for packages that needs gettext
feature (although a trivial grep would probably do the trick, granted).

Also, leaving packages do the conditional test opens the door to packages
doing it in their own way, eg:

  if BR2_NEEDS_GETTEXT
  FOO_DEPS += gettext
  endif

vs.

  FOO_DEPS += $(if $(BR2_NEEDS_GETTEXT),gettext)

This is source for confusion, and thus should be avoided.

I know that semantically, this would not change much, but what if we were
to rename those variables, so they are more in-line with the Config.in ones
such as:
  $(needs-gettext)
  $(needs-gettext-if-locale)
  $(needs-gettext_LDFLAGS)
  $(needs-gettext-if-locale_LDFLAGS)

( Yes, I'm pushing for this change as much as I can! ;-)  )

> Of course, this is only my opinion, and if others are strongly in
> favor of this approach, then I'll learn to live with it, but I think
> it's a dangerous direction for the readability of .mk files. If you
> respin your patch set without those constructs, you'll have my Acked-by
> on the whole thing.

OK, so here's what I suggest:
  - fix the 4 gettext mis-constructs in packages, as you pointed out in
    another mail,
  - split the gettext abstraction in two parts: one for the Config.in stuff,
    and a second for the .mk stuff.

This way, at least the part of the series that we all agree on can be merged,
and the litiguous parts can be refined/dropped.

Does that sound OK?

Thanks for the comments! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
