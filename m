From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 23:02:24 +0100
Subject: [Buildroot] [PATCH 1/1] Fix build of lttng-libust
In-Reply-To: <CADYdroNJAbhAJb3=cghUYj1807k02PGs--nN258J8AKRsN4U8w@mail.gmail.com>
References: <20171030163121.939-1-norbert.lange@andritz.com>
 <20171030204054.723cdc99@windsurf>
 <CADYdroP3-gaXzRy61r7FraPq+g6MeB5CUGN_nFLyFy3MxxfVvw@mail.gmail.com>
 <cf2f5ee6-d0e2-fcfa-f2af-5ff722d3388c@mind.be>
 <CADYdroNJAbhAJb3=cghUYj1807k02PGs--nN258J8AKRsN4U8w@mail.gmail.com>
Message-ID: <70c7ad00-5286-b254-fe7e-9d7e7d25eb70@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-11-17 21:36, Norbert Lange wrote:
> 2017-11-05 17:13 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
>>
>>
>> On 31-10-17 11:20, Norbert Lange wrote:
>>> Hello Thomas,
>>>
>>> I dont know about the autobuilder (can I upload configs to test
>>> there?), this is an issue I encountered with a private buildroot
>>> config.
>>> I tried to reduce it as much as possible, and added the defconfig.
>>>
>>> 2017-10-30 20:40 GMT+01:00 Thomas Petazzoni
>>> <thomas.petazzoni@free-electrons.com>:
>>>> Hello,
>>>>
>>>> On Mon, 30 Oct 2017 17:31:21 +0100, Norbert Lange wrote:
>>>>> The build of doc/examples/cmake-multiple-shared-libraries
>>>>> does fail as a dependend library is missing.
>>>>> This issue is not specific to builroot and should ideally
>>>>> be fixed upstream (Issue: https://bugs.lttng.org/issues/1132)
>>>>>
>>>>> The fix is done without any indepth knowledge of the CMake
>>>>> mechanisms, but seems to work correctly
>>>>>
>>>>> Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
>>>>
>>>> Which specific build problem are you fixing? Is this a problem that has
>>>> been found by http://autobuild.buildroot.org? If that's the case, we
>>>> like to include a reference to such an autobuilder failure in the
>>>> commit log.
>>
>>  It has not been found by the autobuilders, the only failure is
>> http://autobuild.buildroot.net/results/c86a82b2fd41316a7a451b20d9274d5c95f89baa
>> and that's due to CMake version.
> 
> So, is that a problem, or even something I should do anything about?
> I am not sure why you bring this up repeatedly.

 Ah yes sorry, we didn't explain about the autobuilders. The autobuilders do
continuous builds of random configurations, and upload the result of those
builds to http://autobuild.buildroot.org. Usually if a package fails to build in
some circumstances, it is detected by these random builds. In this case, it is
not detected. So the issue must be caused by something that is not covered by
these random configurations. Since LTO is one of the aspects that doesn't get
tested, I thought that that could be the trigger.

 Now I noticed however that the defconfig you sent also contains
BR2_SHARED_STATIC_LIBS=y
and that's a much more likely trigger (it is also not covered by the
autobuilders). Hm, I retested a different config (with a prebuilt toolchain so
it builds faster) with this option enabled and that does work. So maybe it's LTO
after all.


>>  The build error is:
>>
>> output/host/lib/gcc/x86_64-buildroot-linux-gnu/7.2.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
>> warning: liblttng-ust-tracepoint.so.0, needed by
>> output/build/lttng-libust-2.9.0/liblttng-ust/.libs/liblttng-ust.so, not found
>> (try using -rpath or -rpath-link)
>> output/build/lttng-libust-2.9.0/liblttng-ust/.libs/liblttng-ust.so: undefined
>> reference to `exit_tracepoint'
>> output/build/lttng-libust-2.9.0/liblttng-ust/.libs/liblttng-ust.so: undefined
>> reference to `__tracepoint_probe_unregister_queue_release'
>> output/build/lttng-libust-2.9.0/liblttng-ust/.libs/liblttng-ust.so: undefined
>> reference to `__tracepoint_probe_register_queue_release'
>> output/build/lttng-libust-2.9.0/liblttng-ust/.libs/liblttng-ust.so: undefined
>> reference to `__tracepoint_probe_prune_release_queue'
>> output/build/lttng-libust-2.9.0/liblttng-ust/.libs/liblttng-ust.so: undefined
>> reference to `init_tracepoint'
>> collect2: error: ld returned 1 exit status
> 
> So I take, you can reproduce it.

 Indeed, with the defconfig you sent before it can be reproduced.


>>
>>  The weird thing is: liblttng-ust.so.0 does have the correct RPATH to find the
>> tracepoint library. And on all other builds I tried (and apparently including
>> all the autobuilders), it does find it. So I guess it's either binutils 2.29 or
>> GCC 7's LTO plugin that is acting up somehow...
> 
> LTO doesn't seem involved (I think?)

 Well, selecting the same packages and using one of the prebuilt toolchains does
*not* trigger this issue, so it must be one of the toolchain options.


>>  Since this is anyway just an example, wouldn't it be better to just disable the
>> documentation entirely? I.e. teach configure.ac to understand --disable-doc and
>> teach Makefile.am to not recurse into doc if docs are disabled?
> 
> No problem with that, for the upstream package this might be more of an issue.

 Philippe (one of the upstream developers) already said that he'd look into it.

> I am certainly curious where this issue comes from, and what other problems
> could be showing up. Whether this is a lttng, CMake, gcc or binutils issue...
 For upstream it's obviously interesting to find the underlying issue, but for
Buildroot it's not relevant since it's only an example. It gets installed in
/usr/share/doc and that directory is removed in target-finalize.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
