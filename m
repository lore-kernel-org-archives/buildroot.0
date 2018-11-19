From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Nov 2018 20:49:05 +0100
Subject: [Buildroot] [PATCH next v4 6/6] core: implement per-package SDK
 and target
In-Reply-To: <20181119114806.4fb9d98b@windsurf.home>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
 <20181114105557.12599-7-thomas.petazzoni@bootlin.com>
 <de9da9af-71f4-cfe2-f691-5aae17e3ca0a@andin.de>
 <20181116144735.19585727@windsurf>
 <CAAXf6LWM0dcCJSVTSerox320PWKkpPcOXORF2cTaWfHitgRguQ@mail.gmail.com>
 <20181116195741.GV10271@scaer>
 <10c54101-3264-eefb-58d0-4770ef723717@mind.be>
 <20181119114806.4fb9d98b@windsurf.home>
Message-ID: <20181119194905.GC2601@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-11-19 11:48 +0100, Thomas Petazzoni spake thusly:
> On Sun, 18 Nov 2018 22:55:26 +0100, Arnout Vandecappelle wrote:
[--SNIP--]
> > > I am all in favour of simplifying it if it can be made simpler by adding
> > > an official extra 'prepare' step, that exists for all types of package
> > > infras. This we'd have 4 levels of dependencies:
> > > 
> > >  1- download dependencies
> > >  2- extract dependencies
> > >  3- prepare dependencies
> > >  4- configure dependencies  
> > 
> >  I think your mixing two things here. The "prepare" that ThomasP is talking
> > about is really the PPD creation. The additional step for autoreconf or kconfig
> > is something else - it's a step with commands that are defined by the package
> > (infra).
> 
> I don't think Yann is mixing things here. Indeed we are using the word
> "prepare" for two different things: preparing the PPD folder, and
> "doing some stuff before the configure step".

Yeah, I was actually kinda mixing things here, in fact. ;-)

> For the PPD folder, some preparation currently occurs at the download
> step (for download dependencies), some preparation occurs at the
> extract step (for the extract dependencies) and some preparation occurs
> at the configuration step (for the normal dependencies).

Thanks, I was missing that piece. PPD preparation is split into as many
step as we have.

> The issue with the kconfig infrastructure is that it creates a new type
> of dependency called "kconfig dependency", which should be ready to do
> all the kconfig-related activities, but that we want separate from the
> normal "configure dependencies" because we want to be able to do "make
> linux-menuconfig" or "make busybox-menuconfig" without having to wait
> for their dependencies to build.

Exactly.

> So what Yann is proposing is that instead of having this "kconfig
> dependency" stuff be shoe-horned into the dependency chain by
> pkg-kconfig.mk, we should promote it to a new step in the build steps.

Yes.

> By the lack of better naming, Yann named that step "prepare", but it
> has nothing to do with "preparing PPD".

So, that's where I got it mixed up, indeed.

> Indeed, what we would do is:
> 
>  1. Download step
>     Prepare PPD with download dependencies
>     Do the normal download stuff
> 
>  2. Extract step
>     Prepare PPD with extract dependencies
>     Do the normal extract stuff
> 
>  3. Patch step
>     Prepare PPD with patch dependencies
>     Do the normal patch stuff
> 
>  4. Prepare step
>     Prepare PPD with the prepare dependencies
>     Do the prepare stuff (i.e only the kconfig stuff for now)
> 
>  5. Configure step
>     Prepare PPD with the normal dependencies
>     Do the normal configure stuff
> 
> Does that clarify Yann's proposal ?

Yes, that clarifies it perfectly. Thanks! :-)

> I personally find it OK, even though it's a bit annoying to introduce
> yet another step just for the sake of pkg-kconfig.
> 
> Also: I would not move autoreconf into this prepare step, but keep it
> as it is today, within the configure step. I don't (today at least) see
> the point/usefulness of moving the autoreconf into this prepare step.

For the PPD stuff? Definitely not.

But it will be usefull to run autoreconf in a step that is not the
configure step, so we are able to share the source tree between host and
target build, as well as stop rsyncing from _OVERRIDE_SRCDIR.

But then, I wonder if that is really the same as the 'prepare' step
above, because autoreconf will also require the same dependencies as the
configure step.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
