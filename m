From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 May 2018 21:32:01 +0200
Subject: [Buildroot] [PATCH 4/7] core/package: postpone evaluation of
 dependency conditions
In-Reply-To: <1677c229-612d-2f3e-1975-214e1980c76b@mind.be>
References: <cover.1524301847.git.yann.morin.1998@free.fr>
 <f274c0996622abccd5c65255b936010f37a22d66.1524301847.git.yann.morin.1998@free.fr>
 <1677c229-612d-2f3e-1975-214e1980c76b@mind.be>
Message-ID: <20180503193201.GA2453@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-05-03 00:58 +0200, Arnout Vandecappelle spake thusly:
> On 21-04-18 11:10, Yann E. MORIN wrote:
> > In the pkg-inner macro, all variables, but he positional arguments,
> > must be $$-prefixed, so that they are expanded only when the macro
> > is evaluated in each package, not when the macro is parsed.
> > 
> > It is to be noted, though, that the current code, even though incorrect
> > by the above rules, seemed to work. However, the upcoming addition of
> > download dependencies, mimicking that code, would not work unless it
> > was $$-prefixed.
> > 
> > So, for consistency sake, and for correctness sake, let's always use
> > the $$-prefix in the inner macro.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > 
> > ---
> > Arnout: you the make expert, any idea why on Earth the single-expansion
> > was working in thefirst place?
> 
> [You put me in Cc of too many patches, so I don't notice when you *really* want
> my response :-]

Well, you were previously part of the discussions that lead to those
patches about the git backend, and you even partiually reviewed and
commented on an earlier revision of that git series, so it was only
natural that I added you in Cc of those patches...

>  In most cases, single-$ will work as well. In this particular case, after first
> expansion you will get:
> 
> ifeq (,)
> FOO_EXTRACT_DEPENDENCIES += host-tar
> endif
> 
> which in the $(eval ...) will get evaluated to nothing.

Well, I might be totally numb here, but an empty string does equal
another empty string, and thus I'd expect that host-tar be added
as a dependency...

Which is now weird, because then host-tar would be its own dependency,
which clearly isn't the case:

    $ make -s printvars VARS=HOST_TAR_FINAL_ALL_DEPENDENCIES
    HOST_TAR_FINAL_ALL_DEPENDENCIES=host-skeleton

So, an empty string is not the same as another empty string... I'm
totally clueless now... :-/

>  After this patch, after first expansion you get
> 
> ifeq ($(filter host-tar host-skeleton host-xz host-lzip host-fakedate,foo),)
> FOO_EXTRACT_DEPENDENCIES += host-tar
> endif
> 
> which the $(eval ...) still evaluates to nothing.

There, I do agree...

>  The cases where $$ is really needed are fairly rare. The most obvious ones are
> when you have an ifeq() using a variable that is defined in the same
> inner-generic-package expansion. Less obvious but important for consistency is
> to keep the "late binding" property. With single-$, the variable is expanded
> immediately, so if it is still updated later in the makefiles, the new values
> won't be used anymore. This would e.g. break $(1)-show-rdepends.
> 
>  Because it is very hard to remember when exactly you should use $$, we
> introduced the rule: use $$ *everywhere*, except for $(1), $(2) etc. Thomas's
> patches that fixed the dependencies broke that rule.

OK. I have to admit that I am still not sure what happens, though...

>  Unfortunately, this patch still doesn't fix it...

[--SNIP--]
> > -ifeq ($(filter host-tar host-skeleton host-fakedate,$(1)),)
> > +ifeq ($$(filter host-tar host-skeleton host-fakedate,$(1)),)
> >  $(2)_EXTRACT_DEPENDENCIES += $(BR2_TAR_HOST_DEPENDENCY)
>                                 ^^ This should also be $$
> 
> and the same below.

ACK, will fix.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
