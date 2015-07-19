From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jul 2015 12:42:06 +0200
Subject: [Buildroot] [PATCH] core/pkg-generic: host variants inherits
 target's override-srcdir
In-Reply-To: <559B02FB.8010803@mind.be>
References: <1436097417-1809-1-git-send-email-yann.morin.1998@free.fr>
 <559B02FB.8010803@mind.be>
Message-ID: <20150719104206.GA4020@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015-07-07 00:36 +0200, Arnout Vandecappelle spake thusly:
> On 07/05/15 13:56, Yann E. MORIN wrote:
> > When a package has both a target and a host variants, and there is an
> > override-srcdir set for the target variant, the host variant should
> > inherit the target's override-srcdir, unless explicitly set, like we do
> > for all other target-variant properties.
> > 
> > Reported-by: Mike <mikez@OpenPlayer.org>
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  package/pkg-generic.mk | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 9fe01b8..926d594 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -310,6 +310,12 @@ else
> >    $(2)_VERSION := $$(call sanitize,$$($(2)_VERSION))
> >  endif
> >  
> > +ifndef $(2)_OVERRIDE_SRCDIR
> > +  ifdef $(3)_OVERRIDE_SRCDIR
> > +    $(2)_OVERRIDE_SRCDIR = $$($(3)_OVERRIDE_SRCDIR)
> > +  endif
> > +endif
> 
>  IMHO this should be
> 
> ifdef $(3)_OVERRIDE_SRCDIR)
>   $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
> endif
> 
> i.e. don't set the override if it has been explicitly set to empty. Note that
> the ifdef is still needed, otherwise the target override will always be set.

Sorry, I don't understand what would go wrong...

Here are test-cases for a package that is both host and target, mpc:

    $ make menuconfig
        -> enable BR2_PACKAGE_MPC
        -> host-mpc is selected because it is part of the internal
           toolchain

Then create a local.mk:

1) with:

    $ cat local.mk
    MPC_OVERRIDE_SRCDIR = /path/to/somewhere

    $ make printvars |grep -E '^[^[:space:]]+_OVERRIDE_SRCDIR' |grep MPC
    HOST_MPC_OVERRIDE_SRCDIR=/path/to/somewhere ($(MPC_OVERRIDE_SRCDIR))
    MPC_OVERRIDE_SRCDIR=/path/to/somewhere (/path/to/somewhere)

    ==> OK

2) with:

    $ cat local.mk
    HOST_MPC_OVERRIDE_SRCDIR = /path/to/somewhere

    $ make printvars |grep -E '^[^[:space:]]+_OVERRIDE_SRCDIR' |grep MPC
    HOST_MPC_OVERRIDE_SRCDIR=/path/to/somewhere (/path/to/somewhere)

    ==> OK

3) with:

    $ cat local.mk
    MPC_OVERRIDE_SRCDIR = 
    HOST_MPC_OVERRIDE_SRCDIR = /path/to/somewhere

    $ make printvars |grep -E '^[^[:space:]]+_OVERRIDE_SRCDIR' |grep MPC
    HOST_MPC_OVERRIDE_SRCDIR=/path/to/somewhere (/path/to/somewhere)
    MPC_OVERRIDE_SRCDIR= ()

    ==> OK

4) with:

    $ cat local.mk
    MPC_OVERRIDE_SRCDIR = /path/to/somewhere
    HOST_MPC_OVERRIDE_SRCDIR = 

    $ make printvars |grep -E '^[^[:space:]]+_OVERRIDE_SRCDIR' |grep MPC
    HOST_MPC_OVERRIDE_SRCDIR=/path/to/somewhere ($(MPC_OVERRIDE_SRCDIR))
    MPC_OVERRIDE_SRCDIR=/path/to/somewhere (/path/to/somewhere)

    ==> KO

So, you're right, something's wrong, but it seems to me that the case
you described (my 3rd test-case) does work as expected, whereas the
other way around (test-case 4) indeed does not work. Sigh... :-/

I'll fix that, thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
