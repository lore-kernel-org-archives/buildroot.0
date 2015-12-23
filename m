From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 23 Dec 2015 22:41:58 +0100
Subject: [Buildroot] LIB_SYMLINK in top-level Makefile
In-Reply-To: <CAKbGBLi+bNVjwk6WhDO5Jd_iS0U7p=7LLnN5ZV_T+EQ9X6VRRw@mail.gmail.com>
References: <CAKbGBLgHuT-cQh4SW_NMBJ9iSpf_gan_3cjRn3Kc4pT+bEtTZw@mail.gmail.com>
 <20151223190949.GG3426@free.fr>
 <CAKbGBLi+bNVjwk6WhDO5Jd_iS0U7p=7LLnN5ZV_T+EQ9X6VRRw@mail.gmail.com>
Message-ID: <20151223214158.GH3426@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steven, All,

On 2015-12-23 13:32 -0800, Steven Noonan spake thusly:
> My question was not about order of operations but rather whether any
> definitions in the top-level Makefile applied to package .mk files. I
> wasn't sure whether those were invoked in a sub-make or similar. From your
> response it's clear they are included into the main Make process.

Ah, sorry, I misunderstood your question, then.

We're only doing a single-level make, there's no sub-make.

Well, in fact, there can be sub-makes, if your umask is not what
Buildroot expects, but then the to-most make only set the umask
correctly before it calls a sub-make that does all the job.

Another case where you may see a sub-make being run is when you build
out-of-tree, in which case, the top-most make is just a wrapper to the
Makefile in Buildroot's topdir.

So, in all cases, all build actions are done in a single invocation of
make, so there's no need to propagate variables to sub-makes as there
are none.

Regards,
Yann E. MORIN.

> On Dec 23, 2015 11:09 AM, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > Steven, All,
> >
> > On 2015-12-23 00:44 -0800, Steven Noonan spake thusly:
> > > Are the LIB_SYMLINK definitions in the top-level Makefile defined at
> > > the time they're used in package/skeleton/skeleton.mk? It looks like
> > > those lines didn't get moved along with the rest of the bits from the
> > > $(STAGING_DIR) target.
> >
> > As Thomas already replied, they are.
> >
> > And even if they are defined after they are used', that is not a
> > problem. In Makefiles, the expansion of variables is not done at
> > the time of parsing, but at the time the rules are executed.
> >
> > For example, test this simple Makefile:
> >
> >     $ cat Makefile
> >     all:
> >         @echo FOO="'$(FOO)'"
> >     FOO=1234
> >
> >     $ make
> >     FOO='1234'
> >
> > Regards,
> > Yann E. MORIN.
> >
> > --
> >
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> > conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
> >      |
> > | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is
> > no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
> >  conspiracy.  |
> >
> > '------------------------------^-------^------------------^--------------------'
> >

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
