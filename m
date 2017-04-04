From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Apr 2017 20:59:28 +0200
Subject: [Buildroot] [PATCH] core: add rule to dump packages' build order
In-Reply-To: <39bc6b12-1dfd-8ada-f1bc-8597c6872a1c@mind.be>
References: <20170402130338.12542-1-yann.morin.1998@free.fr>
 <39bc6b12-1dfd-8ada-f1bc-8597c6872a1c@mind.be>
Message-ID: <20170404185928.GA3828@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-04-03 12:10 +0200, Arnout Vandecappelle spake thusly:
> On 02-04-17 15:03, Yann E. MORIN wrote:
> > When debugging hidden dependencies, the build order is very important.
> > Most notably, it is interesting to identify potential culprits.
> > 
> > Add a new top-level rule, show-biuld-order, that dumps all the packages
> > in the order they would get built.
> > 
> > Note that there are a few differences with show-targets:
> > 
> >   - more packages are reported, becasue show-targets does not report
> >     host packages that have no prompt;
> > 
> >   - the output is line-based, because we're using $(info $(1)); getting
> >     a single output line like show-targets would require we use an
> >     actual command, like printf '%s ' $(1); but that takes a lot of
> >     time, while $(info $(1)) is almost instantaneous (the time to parse
> >     the Makefiles);
> > 
> >   - rootfs targets are not reported.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> > ---
> >  Makefile               | 2 ++
> >  package/pkg-generic.mk | 3 +++
> >  2 files changed, 5 insertions(+)
> > 
> > diff --git a/Makefile b/Makefile
> > index 941bf78..919d589 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -757,6 +757,8 @@ legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p
> >  show-targets:
> >  	@echo $(PACKAGES) $(TARGETS_ROOTFS)
> >  
> > +show-build-order: $(patsubst %,%-show-build-order,$(PACKAGES))
> > +
> >  graph-build: $(O)/build/build-time.log
> >  	@install -d $(GRAPHS_DIR)
> >  	$(foreach o,name build duration,./support/scripts/graph-build-time \
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 31dbc54..3b26e6b 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -737,6 +737,9 @@ $(1)-show-depends:
> >  $(1)-show-rdepends:
> >  			@echo $$($(2)_RDEPENDENCIES)
> >  
> > +$(1)-show-build-order: $$(patsubst %,%-show-build-order,$$($(2)_FINAL_ALL_DEPENDENCIES))
> > +	$$(info $(1))
> > +
> 
>  I don't like this...
> 
>  IMO we already have way too many of these informational targets messing up
> pkg-generic.mk. This is bad for two reasons:
> 
> - it makes the code more complicated, more difficult to understand what's going
> on int pkg-generic.mk;
> 
> - it's bad for performance. This adds 2000 rules to the make rules database,
> which makes the dependency resolution slower (even if this rule is not used).
> Just this one extra rule doesn't make much of a difference, but it's all these
> extra rules that we've added over the years combined that make it slower. That
> said, there is probably some refactoring that could be done to make it less bad,
> so it's not too big of a factor.

Timing the run before/after this change does not yield a noticeable
difference, tested with:

    $ for((i=0;i<50;i++)); do
        /usr/bin/time make CMD 2>&1 >/dev/null |head -n 1
    done

with CMD = help, before and after the patch, and then with
CMD = show-build-order (obviously, after the patch), and using the
'user' part of the timings:


                    Help, before    Help, after     Build order
Mean                2.9612          2.9934          2.9716
Standard Error      0.00393456685   0.00505972492   0.00338496073
Mode                2.96            2.98            2.96
Median              2.96            2.98            2.97
First Quartile      2.94            2.97            2.96
Third Quartile      2.97            3.01            2.98
Variance            0.00077404081   0.00128004081   0.00057289795
Standard Deviation  0.02782158903   0.03577765806   0.02393528690
Kurtosis            0.84170374930   2.10366593785   1.32436717983
Skewness            0.95495029123   1.20563022139   0.44501404736
Range               0.12            0.19            0.13
Minimum             2.92            2.93            2.91
Maximum             3.04            3.12            3.04
Sum                 148.06          149.67          148.58
Count               50              50              50

Hmm... ;-)

[ BTW, thanks libreoffice! ;-) ]

>  But I wonder why you need this feature anyway. If you just build, you see the
> build order as well, right?

Oh yeah, and I pay the price of a three-hour build, jsut to see the
build order...

> And if you don't want to see the actual build, you
> can do 'make -nk'.

I hope you were kidding? For a config with 227 packages, this yields:

    $ make -nk 2>&1 |wc -l
    8459

And I'm not doing the statistical analysis I did above, but a few runs
give a runtime of ~5s. So it is a 66% overhead just for this, while the
new rules add just about 1% overhead (30ms for 3s).

Plus, it requires non-trivial post-processing... :-(

> OK, it looks a lot nicer with this show-build-order target,
> but I wouldn't say it's very valuable.

Well, I've been tracking build-order issues for a while last WE, and
believe me, I was very happy to be able to see the build order before
I attempted a build, yes.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
