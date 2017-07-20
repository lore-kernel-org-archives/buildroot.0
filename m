From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 20 Jul 2017 11:15:22 +0200
Subject: [Buildroot] [PATCH v7 5/9] core: sanitize RPATH in host tree at
 the very end of the build
In-Reply-To: <95606480-04d3-8486-ed26-baccddc5e18e@mind.be>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
 <1499273594-12106-6-git-send-email-wg@grandegger.com>
 <4e228fa3-0126-6752-8a98-e17967b61fb3@mind.be>
 <e869c949-611c-ecb8-98f7-e436aae1e489@grandegger.com>
 <95606480-04d3-8486-ed26-baccddc5e18e@mind.be>
Message-ID: <e42af315-8309-d086-0722-99ca20b62f52@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 20.07.2017 um 10:49 schrieb Arnout Vandecappelle:
> 
> 
> On 20-07-17 10:40, Wolfgang Grandegger wrote:
>>
>>
>> Am 20.07.2017 um 01:51 schrieb Arnout Vandecappelle:
>>>
>>>
>>> On 05-07-17 18:53, Wolfgang Grandegger wrote:
>>>> We introduce the "finalize-host" target for that purpose.
>>>>
>>>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>>>> ---
>>>>    Makefile | 7 ++++++-
>>>>    1 file changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Makefile b/Makefile
>>>> index 1a826fc..2a265e0 100644
>>>> --- a/Makefile
>>>> +++ b/Makefile
>>>> @@ -553,7 +553,12 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
>>>>    prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>>>>      .PHONY: world
>>>> -world: target-post-image
>>>> +world: target-post-image host-finalize
>>>> +
>>>> +.PHONY: host-finalize
>>>> +host-finalize:
>>>> +    @$(call MESSAGE,"Rendering the SDK relocatable")
>>>> +    $(TOPDIR)/support/scripts/fix-rpath host
>>>
>>>    I'm not sure why, but this is taking a very long time for me - twice as much as
>>> target and staging together. Possibly this is because the external toolchain
>>> (which tends to be large) is also still processed. Passing
>>> TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR in the environment of this call would
>>> help.
>>>
>>>    This sanitization takes a non-trivial amount of time. For example, on a config
>>> with basically just systemd enabled, rebuilding the rootfs tarballs without the
>>> sanitization takes just 5 seconds. target+staging sanitization adds 10 seconds
>>> to that. host sanitization adds another 20 seconds. So globally we go from 5 to
>>> 34 seconds as the baseline time to rebuild anything.
>>
>> Yes, that's the downside of doing it at the end of the build on all 3 trees.
>> Most of the time is consumed for scanning for ELF files. The execution time
>> should be therefore proportional to the number of scanned files. Maybe a
>> database/cache could speed up things.
> 
>   That was the idea behind doing things after each package build :-)
> 
>   For a cache, you still need to md5 all files to detect if they have change
> since the last time. Checking for an ELF header should be faster...
> 
>> Could you please send me your "defconfig" to check the times here?
> 
>   It's just an external toolchain + kernel + BR2_INIT_SYSTEMD=y
> 
> 
>>>    Also, we discussed this before (also with Thomas): I'm not so sure we want to
>>> do this as part of the normal build. It would make sense to me to have a new
>>> "sdk" target which is NOT a dependency of world, that should be called
>>> explicitly to get a relocatable toolchain. That already solves a big part of the
>>> time issue I mentioned above. But it also means we can later add other things to
>>> that sdk target, like creating a tarball of it. And anyway the host sanitization
>>> is only useful if you're actually going to move the sdk somewhere else.
>>
>> I already understood that "make sdk" is the preferred solution. I just thought
>> somebody else would implement that ;).
> 
>   Well, just rename host-finalize to sdk, and remove it from the dependencies of
> "world". Oh, and add it to the 'make help' output.
> 
>   Documentation should be added as well, but that should be done anyway (to
> explain that the relocate-sdk script should be called).

OK, just to double-check. "make sdk" will sanitize the staging and host 
tree and add relocate-sdk.sh. But the target tree will always be sanitized.

Wolfgang.
