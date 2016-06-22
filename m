From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Jun 2016 23:17:27 +0200
Subject: [Buildroot] [PATCH v6] openblas: new package
In-Reply-To: <57690DDE.8000404@imgtec.com>
References: <1466441142-52096-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160620172736.GB3502@free.fr> <57690DDE.8000404@imgtec.com>
Message-ID: <638a2dac-5514-724c-8252-6caf62271840@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-06-16 11:50, Vicente Olivert Riera wrote:
> Hello Yann, thanks you very much for your review. Below are some
> comments, please keep scrolling.
> 
> On 20/06/16 18:27, Yann E. MORIN wrote:
>> Vincent, All,
>>
>> [Gah, you were too fast respinning after our IRC discussion, I said I
>> did not yet do a complete review and that I was going to do one "soon".
>> Here it is! ;-) ]
>>
>> On 2016-06-20 17:45 +0100, Vicente Olivert Riera spake thusly:
[snip]
>>> +config BR2_PACKAGE_OPENBLAS_TARGET
>>> +	string "OpenBLAS target CPU"

 This smells fishy to me. Why do we ask the user to fill this in? I mean, if
we're building for power4, does it make sense to set this to e.g. CORE2?

 In other words, I think this should be a blind option.

 Which raises the next question: what happens for CPUs not in the list? What
happens when we leave it empty?

 If OpenBLAS is simply not supported on CPUs not in this list, then I think we
should use this list as the architecture dependency of the package. I.e., make
it a blind option, and add to the main symbol:

	depends on BR2_PACKAGE_OPENBLAS_TARGET != ""

>>> +	# "Target Architecture Variant" matches
>>> +	default "P2"           if BR2_x86_pentium2
>>> +	default "KATMAI"       if BR2_x86_pentium3
>>> +	default "NORTHWOOD"    if BR2_x86_pentium4
>>> +	default "PRESCOTT"     if BR2_x86_prescott
>>> +	default "BANIAS"       if BR2_x86_pentium_m
>>> +	default "CORE2"        if BR2_x86_core2
>>> +	default "NEHALEM"      if BR2_x86_corei7
>>> +	default "SANDYBRIDGE"  if BR2_x86_corei7_avx
>>> +	default "HASWELL"      if BR2_x86_core_avx2
>>> +	default "ATOM"         if BR2_x86_atom
>>> +	default "ATHLON"       if BR2_x86_athlon || BR2_x86_athlon_4
>>> +	default "OPTERON"      if BR2_x86_opteron
>>> +	default "OPTERON_SSE3" if BR2_x86_opteron_sse3
>>> +	default "BARCELONA"    if BR2_x86_barcelona
>>> +	default "STEAMROLLER"  if BR2_x86_steamroller
>>> +	default "VIAC3"        if BR2_x86_c3 || BR2_x86_c32
>>> +	default "POWER4"       if BR2_powerpc_power4
>>> +	default "POWER5"       if BR2_powerpc_power5
>>> +	default "POWER6"       if BR2_powerpc_power6
>>> +	default "POWER7"       if BR2_powerpc_power7
>>> +	default "POWER8"       if BR2_powerpc_power8
>>> +	default "PPCG4"        if BR2_powerpc_7400 || BR2_powerpc_7450
>>> +	default "PPC970"       if BR2_powerpc_970
>>> +	default "PPC440"       if BR2_powerpc_440
>>> +	default "PPC440FP2"    if BR2_powerpc_440fp
>>> +	default "P5600"        if BR2_mips_32r2
>>> +	default "SICORTEX"     if BR2_mips_64
>>> +	default "I6400"        if BR2_mips_64r6
>>> +	default "CORTEXA15"    if BR2_cortex_a15
>>> +	default "CORTEXA9"     if BR2_cortex_a9
>>> +	default "ARMV7"        if BR2_cortex_a5 || BR2_cortex_a7 || \
>>> +	                          BR2_cortex_a8 || BR2_cortex_a9 || \
>>> +				  BR2_cortex_a12 || BR2_cortex_a17
>>
>> Incorrect indentation for the ARM variants.
> 
> Fixed.
> 
>> Also, cortex_a9 is duplicated for armv7: it already has its own entry.
> 
> Fixed.
> 
>>
>>> +	# "Target Architecture" matches

 I would keep these together with their corresponding CPU options above. So
first all the specific x86 CPUs, and then the SSE_GENERIC one; then the
powerpcs, etc.

>>> +	default "SSE_GENERIC"  if BR2_i386 || BR2_x86_64
>>
>> Are you sure we want to default to "SSE_GENERIC" for i386? AFAIK, SSE
>> arrived quite late in the x86 32-bit line; CPUs up to and including some
>> of the pentiums do not have SSE.
> 
> Ok, SSE_GENERIC only for BR2_x86_64.

 I would say: use BR2_X86_CPU_HAS_SSE

> 
>> For example i486, i586, x1000, i686, pentiumpro, pentium_mmx, pentium2,
>> k6, k6_2 and athlon do not have SSE.
>>
>> Is there an even lower "target CPU" that openBLAS knows of? Or should we
>> just disable openBLAS for the aforementioned CPUs?
>>
>> Note: I haven't looked at the other archs, but arm springs to mind too
>> (what would be the value for armv4, armv5 or armv6? Should it also be
>> disabled for those as well?)
> 
> So you want me to disable this package for every core we have in
> Buildroot that doesn't have a matching OpenBLAS core?

 That depends on whether OpenBLAS works on them or not. This is absolutely not
clear from this patch. Please explain this in the commit log or in comments in
your next version.

> 
>>
>>> +	default "SPARC"        if BR2_sparc
>>> +	default "ARMV8"        if BR2_aarch64 || BR2_aarch64_be
>>> +	help
>>> +	  OpenBLAS target CPU
>>> +
>>> +endif
[snip]
>>> +define OPENBLAS_INSTALL_STAGING_CMDS
>>> +	$(TARGET_MAKE_ENV) $(MAKE) $(OPENBLAS_MAKE_OPTS) \
>>> +		-C $(@D) install PREFIX=$(STAGING_DIR)/usr
>>> +endef
>>
>> On IRC, you said that it was "very unlikely" that there would be a
>> package that depends on OpenBLAS in the future. So, what is the point in
>> installing it to staging if no package will ever use it?
> 
> Forget about that, I didn't say anything :-)
> 
>> If you don;t plan on adding such a package in the future, no need to
>> install into staging; we can very well add it at the time we add our
>> first package that needs OpenBLAS.
>>
>> Or do you have a hidden, unmentionable reason? ;-]
> 
> Well, it's a library so there may be other packages who will use it in
> order to be built at some point. Is not the default policy to install
> library packages to staging? I thought it was, but maybe I'm wrong.

 Of course it is, Yann was talking gibberish. We have plenty of libraries on
which no package depends. For example, most of the qt5 sublibraries.


 Regards,
 Arnout


> 
> Would it be so bad to install it to staging just in case someone wants
> to develop a package which depends on OpenBLAS but for some reason that
> package cannot be added to Buildroot upstream? That way the user will
> not need to modify the OpenBLAS package in order to add the
> install_staging line plus the install_target_cmds function.
> 
>>> +define OPENBLAS_INSTALL_TARGET_CMDS
>>> +	$(TARGET_MAKE_ENV) $(MAKE) $(OPENBLAS_MAKE_OPTS) \
>>> +		-C $(@D) install PREFIX=$(TARGET_DIR)/usr
>>> +endef
>>> +
>>> +$(eval $(generic-package))
>>
>> Well, they have a CMakelist.txt; why can't we use cmake-package?
> 
> For two reasons. The first one is that the official documentation uses
> make in the installation guide.
> 
> The second one is this line in the CMakelist.txt file:
> 
> message(WARNING "CMake support is experimental. This will not produce
> the same Makefiles that OpenBLAS ships with. Only x86 support is
> currently available.")
> 
> Regards,
> 
> Vincent.
> 
>>
>>> -- 
>>> 2.7.3
>>>
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
