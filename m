From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Jun 2015 22:05:03 +0200
Subject: [Buildroot] CMake and VERBOSE variable
In-Reply-To: <a5c10080f12174d721c5f1ebad30b3f1@openmailbox.org>
References: <9943347198fceae1227501e1d00f818a@openmailbox.org>	<5578B394.1010503@mind.be>
 <a5c10080f12174d721c5f1ebad30b3f1@openmailbox.org>
Message-ID: <5579E9EF.4070402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/11/15 09:37, C?dric Marie wrote:
> Hi,
> 
> Le 2015-06-11 00:00, Arnout Vandecappelle a ?crit :
>>  The reason to export is, is to pass it to sub-makes that make use of the same
>> mechanism, e.g. the kernel.
>>
>>  However, there's something to be said for exporting it only if V=1.
> 
> Is it OK to export it when defined? i.e.:
> 
> ifndef VERBOSE
>   export VERBOSE = 1
> endif

 Actually, no. It should also be exported if the user had set it like so:

make V=1 VERBOSE=3

 Therefore, it should become (with full context otherwise other readers will not
understand why there's an ifndef)

 ifeq ($(KBUILD_VERBOSE),1)
   quiet =
   Q =
 ifndef VERBOSE
   VERBOSE = 1
 endif
+export VERBOSE
 else
   quiet = quiet_
   Q = @
 endif


 However, on second thought: why do we set VERBOSE at all? It was introduced in
2007 by Bernhard Reutner-Fischer with the explanation:

set and export VERBOSE if V= was requested

 Not much of an explanation...

 A quick review of a few typical packages (linux, busybox, uClibc, u-boot,
autotools-baed) only turns up uClibc that has a not-very-well documented use of
VERBOSE. So perhaps we should just revert Bernhard's patch and completely remove
VERBOSE.

 Peter?

> 
> This is the local fix I'm using.
> 
> 
>>> NB: All other variables in that list seems to always be not empty.
> 
> Replying to myself: No, most of them are also exported empty, but it is alright.
> Only VERBOSE will have a special meaning when defined empty.

 Well, there's no way to be sure of that...

 In fact, the export of quiet Q KBUILD_VERBOSE comes directly from the kernel
(another commit from Bernhard, log "adjust infrastructure for new kconfig"). But
of course, in the kernel the build system has complete control over what will be
called with this stuff in the environment. For us that's a lot more complicated.
So I think we should get rid of all these exports, and leave it up to individual
packages to do that. Only V is something that is really generally used I think.


 Regards,
 Arnout


>>  The thing is, the working of CMAKE_NO_VERBOSE is not intuitive either (because
>> it can still be combined with VERBOSE=1).
> 
> The different kinds of verbose modes seem to be neither intuitive nor documented...
> 
> 
> Thank you,
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
