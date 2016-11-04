From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 4 Nov 2016 15:12:05 +0100
Subject: [Buildroot] [PATCH 1/1] berkeleydb: fix build on powerpc64le
In-Reply-To: <20161104035222.GB2553@tungsten.ozlabs.ibm.com>
References: <8e91fa81e0236517f95907ca16ac00830306854a.1478151515.git.sam.bobroff@au1.ibm.com>
 <f671f551-8851-b1c2-2be1-46ea91e7e13b@lucaceresoli.net>
 <20161104035222.GB2553@tungsten.ozlabs.ibm.com>
Message-ID: <b5df43b5-fb6c-b106-fdfd-64011373cd2d@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam,

On 04/11/2016 04:52, Sam Bobroff wrote:
> On Thu, Nov 03, 2016 at 09:41:11AM +0100, Luca Ceresoli wrote:
>>
>>
>> On 03/11/2016 06:38, Sam Bobroff wrote:
>>> Fixes
>>> http://autobuild.buildroot.net/results/964326466789f8d6ff8a064327c38cf145409ab0
>>>
>>> The issue appears as a link failure in exim, where pthread symbols are
>>> undefined (they are not even used by the binary that causes the first
>>> failure). This is caused by libdb (used by exim) producing static
>>> rather than shared libraries, and this is due to berkeleydb's
>>> configure failing to correctly detect shared library support.
>>>
>>> Add a case for powerpc64le to allow correct detection of shared library
>>> support in the linker.
>>>
>>> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
>>> ---
>>>
>>>  .../berkeleydb/0001-configure-powerpc64le.patch    | 29 ++++++++++++++++++++++
>>>  1 file changed, 29 insertions(+)
>>>  create mode 100644 package/berkeleydb/0001-configure-powerpc64le.patch
>>>
>>> diff --git a/package/berkeleydb/0001-configure-powerpc64le.patch b/package/berkeleydb/0001-configure-powerpc64le.patch
>>> new file mode 100644
>>> index 0000000..1f76562
>>> --- /dev/null
>>> +++ b/package/berkeleydb/0001-configure-powerpc64le.patch
>>> @@ -0,0 +1,29 @@
>>> +Currently, dist/configure on powerpc64le fails to determine the
>>> +availability of shared library support in the toolchain, causing
>>> +static libraries to be built even when shared libraries are supported.
>>> +This can lead to linker failures in packages that use libdb.
>>> +
>>> +Add a case for powerpc64le which corrects the problem.
>>> +
>>> +Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
>>> +---
>>> + dist/configure | 3 +++
>>> + 1 file changed, 3 insertions(+)
>>> +
>>> +diff --git a/dist/configure b/dist/configure
>>> +index db718de..81f2fae 100755
>>> +--- a/dist/configure
>>> ++++ b/dist/configure
>>> +@@ -9330,6 +9330,9 @@ s390*-*linux*|s390*-*tpf*|sparc*-*linux*)
>>> + 	  x86_64-*linux*)
>>> + 	    LD="${LD-ld} -m elf_x86_64"
>>> + 	    ;;
>>> ++	  ppc64le-*linux*|powerpc64le-*linux*)
>>> ++	    LD="${LD-ld} -m elf64lppc"
>>> ++	    ;;
>>> + 	  ppc*-*linux*|powerpc*-*linux*)
>>> + 	    LD="${LD-ld} -m elf64ppc"
>>> + 	    ;;
>>
>> I tested this patch and it does fix the build failure.
>>
>> However, the best way to fix the issue should be to fix configure.ac and
>> then enable BERKELEYDB_AUTORECONF in berkeleydb.mk so the configure
>> script gets regenerated. Can you have a look to that?
> 
> Ah, you're right of course but it's more complicated than just setting
> AUTORECONF (which is why I didn't do it that way initially).
> 
> BerkeleyDB places their autotools files in a subdirectory (dist) so the
> autoreconf rule fails:
> 
>>>> berkeleydb 5.3.28 Autoreconfiguring
> autoreconf: 'configure.ac' or 'configure.in' is required
> 
> Even if you can get autoreconf to run, it doesn't work because it needs
> an additional set of version symbols to be defined. It looks like it's
> all handled by a script they include ("s_config"), and it appears to
> work so I'll try a patch based on running that before configure.

Oh, I see. Packages using a standard configuration system in a
non-standard way are very annoying. But it looks the right way to do it.

> Luckily, it appears the case block is already fixed upstream in libtool
> (where the case statement eventually comes from) and buildroot's
> libtool version already has the fix, so if we force regeneration it
> fixes the bug without having to add a patch at all :-)
>
> I'm slightly concerned that because the change will cause a regeneration
> on all arches, and might break them but I suppose if it does then it's
> just exposing real bugs that should be fixed.

I agree. I hope the s_config thing provided by upstream does not do any
nasty things that screw up other architectures. Should that happen, as a
last resort we could get back to your initial patch.

> (And the upstream fix would just be to update their autoconf files.)

Agreed, except I'm not sure we will get any new release in the 5.3
branch from Oracle, and we're not supposed to bump to version 6 for
"licensing issues" (see berkeleydb.mk).

> Does this sound OK?

Your plan sounds OK to me, thanks.

-- 
Luca
