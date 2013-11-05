From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Nov 2013 19:48:38 +0100
Subject: [Buildroot] [PATCH] Makefile: fix out-of-tree builds with
 multiple	targets with 'all'
In-Reply-To: <b1481f89-f6b5-4d9e-bdc4-ae572b3c48ff@email.android.com>
References: <1383676405-25536-1-git-send-email-yann.morin.1998@free.fr>
 <b1481f89-f6b5-4d9e-bdc4-ae572b3c48ff@email.android.com>
Message-ID: <20131105184837.GA3337@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

On 2013-11-05 19:39 +0100, Thomas De Schampheleire spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> >For out-of-tree builds, this use-case fails to build:
> >    $ make clean all
> >
> >This is because 'all' is filtered-out in the Makefile wrapper, since
> >the wrapper itself has a 'all' target.
> >
> >The 'all' target is just the usual naming for the default target in a
> >Makefile. In fact, the first target is the default one, so we can name
> >it whatever we want.
> >
> >Rename the Makefile wrapper 'all' target to avoid name-clashing.


[moved the question here, it's easier to answer below]
> Just curious: if you now type 'make all', which of the above rules 
> gets executed? Can you explain what is going on here?

Please, follow the numbers, below:

> >diff --git a/support/scripts/mkmakefile b/support/scripts/mkmakefile
> >index cef2ec7..27b1507 100755
> >--- a/support/scripts/mkmakefile
> >+++ b/support/scripts/mkmakefile
> >@@ -32,16 +32,16 @@ MAKEFLAGS += --no-print-directory
> > 
> > .PHONY: all \$(MAKECMDGOALS)
> > 
> >-all	:= \$(filter-out all Makefile,\$(MAKECMDGOALS))
> >+all	:= \$(filter-out Makefile,\$(MAKECMDGOALS))

(1)
With 'make all', the variable $(MAKECMDGOALS) is the string "all"
(without the quotes). So the variable $(all) is assigned the string
"all" (still without quotes).

> > 
> >-all:
> >+_all:
> > 	\$(MAKE) \$(MAKEARGS) \$(all)

(3)
And finally here, the rulle is:
    make -C /path/to/buildroot O=$(pwd) all
         `----------------------------' `-'
                $(MAKEARGS)             $(all)

> > 
> > Makefile:;
> > 

> >-\$(all): all
> >+\$(all): _all

(2)
And here the variable $(all) ix expanded, and as it depends on _all, the
rulle _all above is executed

> > 	@:
> > 
> >-%/: all
> >+%/: _all
> > 	@:
> > EOF
> 

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
