From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Apr 2019 09:56:45 +0200
Subject: [Buildroot] Qt5 parallel build of qmake
In-Reply-To: <36d88896-c2f0-8522-09f8-37d2fec19acd@micronovasrl.com>
References: <5affd9e5-511b-394c-e2a0-51617489f1c1@mind.be>
 <823bb0b7-aa62-d682-9cb7-f17471ff4926@micronovasrl.com>
 <ab39fba8-d6b5-4dfc-3390-510bc7cf2bab@mind.be>
 <36d88896-c2f0-8522-09f8-37d2fec19acd@micronovasrl.com>
Message-ID: <3d42506c-0a69-f3e9-cbc3-c36e21b47cd0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/04/2019 00:43, Giulio Benetti wrote:
> Hello Arnout, All,
> 
> Il 21/04/2019 09:08, Arnout Vandecappelle ha scritto:
>>
>>
>> On 18/04/2019 00:53, Giulio Benetti wrote:
>>> Hi Arnout, All,
>>>
>>> Il 18/04/2019 00:16, Arnout Vandecappelle ha scritto:
>>>> ?? Hi all,
>>>>
>>>> ?? I've put a few people in Cc that seem to be active users of Qt5.
>>>>
>>>> ?? I noticed during a test build that during the configure step, qmake is built
>>>> but not in parallel. I think it should be possible to enable parallel build for
>>>> qmake by passing MAKE="$(MAKE)" in the environment during configuration. Would
>>>> someone be interested in checking that out?
> 
> I've found out which is the problem and where is its origin.
> 
> On qt5base(and every other package using MAKEFLAGS) this:
> MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)"
> expands in this:
> MAKEFLAGS=" --no-print-directory -- -j5"
> so -j5 is ignored, then is not built in parallel.
> 
> In:
> https://git.buildroot.net/buildroot/tree/support/scripts/mkmakefile#n33

 Note that I observed the same issue without out-of-tree build, and anyway if I
do out-of-tree build I always use explicit O= rather than the generated
makefile. So the problem is not (only) due to mkmakefile.

> 
> basic Makefile is created with a dashed argument(-C to pass Buildroot Root
> Makefile as argument), but then also O=... option is passed.
> 
> Here is a snippet of my Makefile file created by mkmakefile script:
> ...
> MAKEARGS := -C /home/giuliobenetti/git/buildroot
> MAKEARGS += O=$(if $(patsubst /%,,$(makedir)),$(CURDIR)/)$(patsubst
> %/,%,$(makedir))

 Note that MAKEARGS is not a special variable for make...

> 
> MAKEFLAGS += --no-print-directory

 But MAKEFLAGS is. However, the MAKEFLAGS variable is always rebuilt by the new
make process by combining the environment variable MAKEFLAGS with the command
line options that are passed to it.


> .PHONY: _all $(MAKECMDGOALS)
> 
> all??? := $(filter-out Makefile,$(MAKECMDGOALS))
> 
> _all:
> ????echo Root MAKEARGS=$(MAKEARGS)
> ????echo Root MAKEFLAGS=$(MAKEFLAGS)
> ????$(Q)umask 0022 && $(MAKE) $(MAKEARGS) $(all)
> ...
> 
> Doing lot of tries I've found out(I didn't know) that "make", when
> evaluates $(MAKEARGS) it works as expected and gives:
> Root MAKEARGS=-C /home/giuliobenetti/git/buildroot
> O=/home/giuliobenetti/git/build-br/.
> 
> BUT, when printing MAKEFLAGS with echo, it gives:
> Root MAKEFLAGS= --no-print-directory --
> 
> qt5base and every other package using $(MAKEFLAGS) under a *recipe* only will
> always evaluate $(MAKEFLAGS) as "--".
> Indeed if you try to use $(info $(MAKEFLAGS)) it will be different, without
> showing the 2 dashes.

 The difference between echo and $(info) is that echo is in a subshell and info
is not. So apparently, make doesn't just manipulate $(MAKEFLAGS) when it starts,
but also when it forks a subprocess.


> Going deeper I've found that those 2 dashes are appended only if you pass to
> MAKEARGS some variable like "O=/home/..."
> I mean, if you remove "O=/home/..." then MAKEFLAGS is "--no-print-directory" only.

 That is ...weird... because you do the echo in the outer make, which doesn't
know that MAKEARGS has any relation with MAKEFLAGS...


> The point is that MAKEARGS expects Makefile arguments only and not Variable as I
> understand. When you add variables, a "--" is appended between Make flags and
> Variables.

 Yes, when make starts, it reworks things so that the variables go into
MAKEOVERRIDES.


> One possible solution I thought is cleaning MAKEFLAGS from those isolated 2 dashes.

 I don't think that that's possible, because they're not really there.

> Before I thought to pass directly O=/home/.. when calling $(MAKE),
> but the problems comes out again, since in sub-makefile, that will be a MAKEARGS
> again.
> I don't see any different way to deny Make to emit "--".
> 
> This impacts MAKEFLAGS variable everywhere when evaluated under recipe like
> "echo $(MAKEFLAGS)" and it works in this way for both make-4.1 and make-3.82 too.
> 
> What do you think?

 What about swapping the -j and the MAKEFLAGS in qt5base? I.e.

	MAKEFLAGS="-j$(PARALLEL_JOBS) $(MAKEFLAGS)"

 Regards,
 Arnout
> 
> Happy easter and kind regards!
