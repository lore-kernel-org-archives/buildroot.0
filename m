From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Jun 2019 17:35:45 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-06-10
In-Reply-To: <f788114a-968d-cd2e-7893-0af9ec25ce62@mind.be>
References: <20190611060050.0BE6687AFF@hemlock.osuosl.org>
 <20190612053352.GA6981@tungsten.ozlabs.ibm.com>
 <20190612084927.4e224933@windsurf>
 <20190612070200.GB6981@tungsten.ozlabs.ibm.com>
 <20190612090647.388b2517@windsurf>
 <f788114a-968d-cd2e-7893-0af9ec25ce62@mind.be>
Message-ID: <20190612153545.GA2647@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-06-12 10:26 +0200, Arnout Vandecappelle spake thusly:
> On 12/06/2019 09:06, Thomas Petazzoni wrote:
> > On Wed, 12 Jun 2019 17:02:01 +1000
> > Sam Bobroff <sbobroff@linux.ibm.com> wrote:
> >> Ah, right. So that hack is no good, and it suggests that no hack on
> >> the buildroot side can work as long as GZIP is being overwritten by the
> >> package's build system. I'll have a go hacking the build system in cups
> >> to rename the GZIP variable but hopefully their upstream will fix it
> >> soon :-)
> > Alternatively, Buildroot could use a gzip wrapper, installed in
> > $(HOST_DIR)/bin to pass this -n option when BR2_REPRODUCIBLE=y. 
>  That sounds like the right thing to do. We only need to do install that wrapper
> if BR2_REPRODUCIBLE=y.

Yes, the wrapper thinggy is the best.

>  However, I'm afraid this will turn up packages that explicitly use /bin/gzip
> without looking at $PATH... So those will have to be fixed again...

Yup, but that's not like we are not used to these kind of stupidity,
aren't we? ;-)

> > The
> > gzip man page says that using the GZIP environment variable is
> > "obsolescent":
[--SNIP--]

That alone mandates the use of the wrapper.

> > Of course, if we go in this direction, we have to take care of what
> > happens if host-gzip is installed, as it would overwrite the wrapper.
>  Didn't we say at some point that under BR2_REPRODUCIBLE, we should always build
> all host packages? So the wrapper would be installed as part of host-gzip.

Hmm.. I usually advocate for maximising the number of host packages to
build, so as to indeed improve reproducibility.

But ultimately, I'd like we identify those host tools that indeed
generate non-reproducible output, and so we build our. Otherwise, rely
on the host provided tools.

And ultimately, I'd like that the reproducible option also applies to
the host packages too, so that we can produce reproducible toolchains
and SDKs as well. So, where do we draw the line? Surely, we're not going
to build our own host toolchain. so reproducibility of the host packages
will be limited to some extent, and only guaranteed on the system (i.e.
the machine and distribution) that actually did the build.

So, we'd have two levels of reproducibility: a high level for things
that go in target/ and staging/ (since we handle more tools), and a
lower level for things that go in host/ (since we can't handle all
tools).

Regards,
Yann E. MORIN.

>  Atharva, better put this on your list of things to do :-)
> 
> 
>  Regards,
>  Arnout
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
