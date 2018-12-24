From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Dec 2018 12:22:23 +0100
Subject: [Buildroot] [PATCH 1/2] package: pkg-autotools: Add option to
 run autogen.sh
In-Reply-To: <20181224105911.19475421@windsurf.home>
References: <20181223223742.23710-1-vadim4j@gmail.com>
 <20181223223742.23710-2-vadim4j@gmail.com>
 <20181224092159.GA2703@scaer>
 <20181224105911.19475421@windsurf.home>
Message-ID: <20181224112223.GB2703@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-12-24 10:59 +0100, Thomas Petazzoni spake thusly:
> On Mon, 24 Dec 2018 10:21:59 +0100, Yann E. MORIN wrote:
> > On 2018-12-24 00:37 +0200, Vadim Kochan spake thusly:
> > > Add $(PKG)_AUTOGEN variable which allows to execute autogen.sh script
> > > on pre-configure stage.  
[--SNIP--]
> > So, my opinion is that we should not have it in the infra.
> 
> Overall, I agree with you. If we wanted to make this more flexible than
> what we have today, I would suggest to allow customizing the command
> that it used for autoreconfiguring.
> 
> Something like this:
> 
> $(2)_AUTORECONF_CMD ?= $(AUTORECONF)
> 
> define AUTORECONF_HOOK
>         @$(call MESSAGE,"Autoreconfiguring")
>         $(Q)cd $($(PKG)_SRCDIR) && $($(PKG)_AUTORECONF_ENV) $($(PKG)_AUTORECONF_CMD) $($(PKG)_AUTORECONF_OPTS)
> endef
> 
> One drawback is that having a CMD variable doesn't really match our
> typical CMDS pattern.

Indeed no, and besides, there are so many different commands being run
before running configure. You can get a peek at it and see the various
sneaky things we do:

    $ grep -E '_PRE_CONFIGURE_HOOKS' $(git grep -l -E '\$\(eval \$\((host-)?autotools-package\)\)')

One of the funniest being libtool, for which we need to carefully touch
some files to make configure believe they are up-to-date.

There are a bunch of packages running just 'autoconf' because they are
not in fact real autotools packages; they are just using autoconf, not
automake, so they do not autoreconf nicely.

Then we have at least one package that needs to chmod +x configure.

And all the various 'mkdir m4' we have here and there...

So, in the end, I stand by my position: no need to make that part of the
infra, the variance is too large.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
