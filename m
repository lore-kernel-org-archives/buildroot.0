From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 22 Apr 2019 00:43:08 +0200
Subject: [Buildroot] Qt5 parallel build of qmake
In-Reply-To: <ab39fba8-d6b5-4dfc-3390-510bc7cf2bab@mind.be>
References: <5affd9e5-511b-394c-e2a0-51617489f1c1@mind.be>
 <823bb0b7-aa62-d682-9cb7-f17471ff4926@micronovasrl.com>
 <ab39fba8-d6b5-4dfc-3390-510bc7cf2bab@mind.be>
Message-ID: <36d88896-c2f0-8522-09f8-37d2fec19acd@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout, All,

Il 21/04/2019 09:08, Arnout Vandecappelle ha scritto:
> 
> 
> On 18/04/2019 00:53, Giulio Benetti wrote:
>> Hi Arnout, All,
>>
>> Il 18/04/2019 00:16, Arnout Vandecappelle ha scritto:
>>>  ? Hi all,
>>>
>>>  ? I've put a few people in Cc that seem to be active users of Qt5.
>>>
>>>  ? I noticed during a test build that during the configure step, qmake is built
>>> but not in parallel. I think it should be possible to enable parallel build for
>>> qmake by passing MAKE="$(MAKE)" in the environment during configuration. Would
>>> someone be interested in checking that out?

I've found out which is the problem and where is its origin.

On qt5base(and every other package using MAKEFLAGS) this:
MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)"
expands in this:
MAKEFLAGS=" --no-print-directory -- -j5"
so -j5 is ignored, then is not built in parallel.

In:
https://git.buildroot.net/buildroot/tree/support/scripts/mkmakefile#n33

basic Makefile is created with a dashed argument(-C to pass Buildroot 
Root Makefile as argument), but then also O=... option is passed.

Here is a snippet of my Makefile file created by mkmakefile script:
...
MAKEARGS := -C /home/giuliobenetti/git/buildroot
MAKEARGS += O=$(if $(patsubst /%,,$(makedir)),$(CURDIR)/)$(patsubst 
%/,%,$(makedir))

MAKEFLAGS += --no-print-directory

.PHONY: _all $(MAKECMDGOALS)

all	:= $(filter-out Makefile,$(MAKECMDGOALS))

_all:
	echo Root MAKEARGS=$(MAKEARGS)
	echo Root MAKEFLAGS=$(MAKEFLAGS)
	$(Q)umask 0022 && $(MAKE) $(MAKEARGS) $(all)
...

Doing lot of tries I've found out(I didn't know) that "make", when
evaluates $(MAKEARGS) it works as expected and gives:
Root MAKEARGS=-C /home/giuliobenetti/git/buildroot 
O=/home/giuliobenetti/git/build-br/.

BUT, when printing MAKEFLAGS with echo, it gives:
Root MAKEFLAGS= --no-print-directory --

qt5base and every other package using $(MAKEFLAGS) under a *recipe* only 
will always evaluate $(MAKEFLAGS) as "--".
Indeed if you try to use $(info $(MAKEFLAGS)) it will be different, 
without showing the 2 dashes.

Going deeper I've found that those 2 dashes are appended only if you 
pass to MAKEARGS some variable like "O=/home/..."
I mean, if you remove "O=/home/..." then MAKEFLAGS is 
"--no-print-directory" only.

The point is that MAKEARGS expects Makefile arguments only and not 
Variable as I understand. When you add variables, a "--" is appended 
between Make flags and Variables.

One possible solution I thought is cleaning MAKEFLAGS from those 
isolated 2 dashes.
Before I thought to pass directly O=/home/.. when calling $(MAKE),
but the problems comes out again, since in sub-makefile, that will be a 
MAKEARGS again.
I don't see any different way to deny Make to emit "--".

This impacts MAKEFLAGS variable everywhere when evaluated under recipe 
like "echo $(MAKEFLAGS)" and it works in this way for both make-4.1 and 
make-3.82 too.

What do you think?

Happy easter and kind regards!
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

>> I am interested. I'll try to have it working, let's see if I'm able.
>>
>>>  ? Ideally, you should also test with different make versions because they
>>> sometimes throw other stuff in the MAKE variable which may screw things up.
>>
>> How much back should I go with make versions?
>> I mean, now I have 4.1, maybe back to 3.82?
>> Or more?
> 
>   Just 4.1 and 3.82 should be fine.
> 
>   Regards,
>   Arnout
> 
