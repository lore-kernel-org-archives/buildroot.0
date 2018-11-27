From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 Nov 2018 18:55:31 +0100
Subject: [Buildroot] [PATCH 1/3 v2] infra/pkg-golang: enforce number of
 parallel jobs
In-Reply-To: <7099f806-10ab-0538-ccbc-563a792b121d@mind.be>
References: <cover.1543137559.git.yann.morin.1998@free.fr>
 <951dd893ccaa0d4a894bfcac76dc04e28d9acafb.1543137559.git.yann.morin.1998@free.fr>
 <7099f806-10ab-0538-ccbc-563a792b121d@mind.be>
Message-ID: <20181127175531.GO28830@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-11-27 18:42 +0100, Arnout Vandecappelle spake thusly:
> On 25/11/2018 10:19, Yann E. MORIN wrote:
> > By default, the go compiler will spawn as many jobs as there are CPUs
> > available, thus possibily over-shooting the limits set by the user.
> > 
> > Make it abide by the user's wish, and specify the number of jobs allowed
> > to run.
> > 
> > We can do so without fear of a package failing to build in parallel,
> > because they were already all building in parallel, as that is the
> > default for the go compiler.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/pkg-golang.mk | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> > index 6eacd14180..4f2c7e77e1 100644
> > --- a/package/pkg-golang.mk
> > +++ b/package/pkg-golang.mk
> > @@ -55,8 +55,10 @@ ifeq ($(BR2_STATIC_LIBS),y)
> >  $(2)_LDFLAGS += -extldflags '-static'
> >  endif
> >  
> > -$(2)_BUILD_OPTS += -ldflags "$$($(2)_LDFLAGS)"
> > -$(2)_BUILD_OPTS += -tags "$$($(2)_TAGS)"
> > +$(2)_BUILD_OPTS += \
> > +	-ldflags "$$($(2)_LDFLAGS)" \
> > +	-tags "$$($(2)_TAGS)" \
> > +	-p $(PARALLEL_JOBS)
> 
>  I wonder, if BR2_LEVEL == 0, if it wouldn't be more appropriate to not pass any
> option. That said, it probably needlessly complicates things.

Well, I'd rather we be consistent: anything that want to be parallel
uses $(PARALLEL_JOBS), which is always the correct value.

>  [I also wonder but don't want to think about: what will happen in top-level
> parallel build...]

I think it would go smoothly, in fact, given the direction we're going.
AFAIR, Thomas suggested we decorelate the top-level parallelism from the
package-level parallelism, i.e. two config options: one to specify the
number of simultaneous package to build in parallel, and one to specify
the number of jobs per package [0].

That does not allow to parallelise as much as it sould be, but allows to
not overload the system too much, especially for those buildsystems that
do not know how to talk to a make-jobserver, like guess what, go, or
ninja [1] or such.

So, in the end, the existig PARALLEL_JOBS will be the package-level
paralelism, with the user specifying the top-level parallelism with
'make -j N'

Not that this is ideal, I know, but that's the best we can do...

[0] AFAIUI, that's what is done in The Other buildsystem. Or so I was
told...

[1] there is a MR pending for ninja, and they seem to be amenable to
merge it sooner or later. But there will always be outliers that don;t
know how to (or want to) play by the rules.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
