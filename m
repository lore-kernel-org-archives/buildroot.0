From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Jun 2017 12:41:18 +0200
Subject: [Buildroot] [RFC PATCH v3 00/10] Make the SDK relocatable
In-Reply-To: <4243e8e2-baaf-37f5-4149-d085388f3b13@grandegger.com>
References: <1490255693-9134-1-git-send-email-wg@grandegger.com>
 <6799ad7b-a16e-d89e-eb73-d7d91880d341@mind.be>
 <d993626e-11b0-ab21-f022-d64f6a7340b6@grandegger.com>
 <8b074253-3002-1db9-d902-a73bb47e734b@grandegger.com>
 <dec2b16c-50f5-15d2-2082-c31ca82170ec@mind.be>
 <6a236664-6cd5-c2e6-e4bc-ee5f7b6b21a1@grandegger.com>
 <311f5c7c-ad46-e1f1-4570-dfffb5605292@mind.be>
 <4243e8e2-baaf-37f5-4149-d085388f3b13@grandegger.com>
Message-ID: <319491ac-9a65-f82f-892c-1e54b8df70da@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-06-17 08:45, Wolfgang Grandegger wrote:
> Am 28.06.2017 um 00:47 schrieb Arnout Vandecappelle:
>>
>>
>> On 22-06-17 08:37, Wolfgang Grandegger wrote:
>>> Hello Arnout,
>>>
>>> Am 21.06.2017 um 23:03 schrieb Arnout Vandecappelle:
>>>>    Hi Wolfgang,
>>>>
>>>> On 21-06-17 09:59, Wolfgang Grandegger wrote:
>>>>> Hello,
>>>>>
>>>>> this topic is still pending... some more input below...
>>>>>
>>>>> Am 27.04.2017 um 11:37 schrieb Wolfgang Grandegger:
>>>>>> Hello Arnout,
>>>>>>
>>>>>> Am 12.04.2017 um 15:59 schrieb Arnout Vandecappelle:
>>>>>>>
>>>>>>>
>>>>>>> On 23-03-17 08:54, Wolfgang Grandegger wrote:
[snip]
>>>>>>>    I'm not entirely sure about staging, whether ld will use RPATH as an
>>>>>>> alternative to -L and in that case whether it is done relative to sysroot or
>>>>>>> not.
>>>>>>
>>>>>> So far, the patch series works for me very well. Just my usecase, of course.
>>>>
>>>>    IIRC I checked a while ago and it looked like ld would use RPATH as a
>>>> link path
>>>> (i.e. as if it's given with -L), and I think it was NOT relative to sysroot.
>>>> Which means that we shouldn't make the RPATHs in staging relative to
>>>> STAGING_DIR, otherwise it may pick up the library from the host. This really
>>>> shouldn't happen because the link normally should get the appropriate -L
>>>> flag to
>>>> find the target lib and the -L has precedence over RPATH, but better be safe.
>>>
>>> The man page of "ld" says:
>>>
>>> "The linker uses the following search paths to locate required shared libraries:
>>>   ...
>>>   6.  For a native ELF linker, the directories in "DT_RUNPATH" or "DT_RPATH"
>>> of a shared library are
>>>       searched for shared libraries needed by it. The "DT_RPATH" entries are
>>> ignored if "DT_RUNPATH" entries
>>>       exist."
>>
>>   But this doesn't clarify if these paths are interpreted relative to --sysroot
>> or not.
> 
> I'm going to check what is in the orogilan rpath. I guess that the pathes are
> absolute to the host.

 Thinking again about this: for staging, we should probably remove RPATH completely.

* At build time, the RPATH is only used as an extra directory to search for
shared library. However, any such directory should anyway be passed with -L to
cover the static libs case. So it's better to remove the RPATH, then we see any
missing -L earlier.

* The binaries in staging should never be executed. They shouldn't be copied to
target any more. Therefore, the RPATH is never used by the dynamic linker.

 So to keep things simple and to avoid discussion about the --sysroot, I propose
to remove RPATH entirely.

> 
>>>
>>> Then we should use $ORIGIN relative to the ELF file for the staging tree
>>> (like for the host tree) to make it relocatable.
>>
>>   That is for sure the safest option.
> 
> BTW, like for the target, /lib and /usr/lib is removed from the rpath. Don't
> know if the linker looks into sysrot/lib or sysroot/usr/lib by default.
> 
>> [snip]
>>>>>>>> Things not yet addressed:
>>>>>>>>
>>>>>>>> - "make toolchain" creates a toolchain tree which still has references
>>>>>>>>     to the build system (in ELF and text files).
>>>>>>>
>>>>>>>    A solution to this (and other problems) is to use the same approach as
>>>>>>> check-bin-arch: do it as an instrumentation hook for each package, and
>>>>>>> only look
>>>>>>> at the files added by that package. That way, the overhead is spread out
>>>>>>> over
>>>>>>> the entire build process, and doing rebuilds doesn't run patchelf on all
>>>>>>> files
>>>>>>> anymore in the finalize step.
>>>>>>
>>>>>> This is just to solve the issue mentioned above or a general approach
>>>>>> (instead
>>>>>> of doning rtpath sanitation at the end)?
>>>>>
>>>>> Any opinions here?
>>>>
>>>>    Preferably as an instrumentation hook, because:
>>>> - it speeds things up dramatically if you do 'make foo-rebuild';
>>>> - things are still correct if you interrupt the build in the middle;
>>>> - it makes no difference if you do a rebuild (if patchelf is done at the end,
>>>> and then you rebuild a package, the RPATH in the libs you link with is
>>>> different
>>>> than the first time you built it).
>>>
>>> OK, as I see it, check-bin-arch is only for the files in the target tree.
>>> Having a
>>> closer look now.
>>
>>   Yes, for this approach to work the packages-file-list has to be extended to
>> cover host and staging as well. And since host includes staging, the find
>> command for host is a little complicated.
> 
> With that approach we do not need "find" any longer. There will by a list of
> installed files per package.

 There is currently no packages-file-list for host and staging, so you need to
build it. To build the list, you need to do a find.

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
