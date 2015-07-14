From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Jul 2015 00:00:45 +0200
Subject: [Buildroot] [PATCHv3 for next 2/2] toolchain: create symlink to
 'lib' from ARCH_LIB_DIR iso fixed lib32/lib64
In-Reply-To: <CAAXf6LUOT3AgLYE5ZFO1jXwMfjKc9uK7LPVvfQkcd2tSbTvEaw@mail.gmail.com>
References: <1424259375-20288-1-git-send-email-patrickdepinguin@gmail.com>
 <1424259375-20288-3-git-send-email-patrickdepinguin@gmail.com>
 <55A3EDEA.7040308@mind.be>
 <CAAXf6LUOT3AgLYE5ZFO1jXwMfjKc9uK7LPVvfQkcd2tSbTvEaw@mail.gmail.com>
Message-ID: <55A5868D.8050505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Now I understand Thomas why you didn't understand what I was talking about on
IRC - seems I forgot to send this mail...]

On 07/13/15 22:19, Thomas De Schampheleire wrote:
> On Mon, Jul 13, 2015 at 6:57 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  Hi Thomas,
>>
>>  Sorry that it is taking so long to make progress on this, but the external
>> toolchain stuff is, as you know, horribly demotivating... We've spent quite a
>> bit of time to understand what this patch does and how it could be done better...
>>
>> On 02/18/15 12:36, Thomas De Schampheleire wrote:
>>> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>>
>>> Currently, following symbolic links are created in both target and
>>> staging directories:
>>> - lib(32|64) --> lib
>>> - usr/lib(32|64) --> lib
>>>
>>> The decision for lib32 or lib64 is based on the target architecture
>>> configuration in buildroot (BR2_ARCH_IS_64).
>>>
>>> In at least one case this is not correct: when building for a Cavium Octeon
>>> III processor using the toolchain from the Cavium Networks SDK, and
>>> specifying -march=octeon3 in BR2_TARGET_OPTIMIZATION, libraries are expected
>>> in directory 'lib32-fp' rather than 'lib32' (likewise for lib64-fp).
>>>
>>> More generally, for external toolchains, the correct symbolic link is
>>> from (usr/)${ARCH_LIB_DIR} to lib. For internal toolchains, current
>>> toolchains always use either lib32 or lib64.
>>>
>>> Fix the problem as follows:
>>> - create symlink creation helpers in toolchain/helpers.mk
>>> - for external toolchains, call these helpers based on ARCH_LIB_DIR
>>> - for internal toolchains, call these helpers based on the existing
>>>   fixed lib32/lib64 logic, moved from Makefile
>>> - to fix build order problems, add the correct dependency on
>>>   $(BUILD_DIR) from $(BUILD_DIR)/.root
>>
>>  It's not clear to us which build order problems are solved by this, and
>> especially how these build order problems are introduced by this patch... Could
>> you explain that a little?
> 
> As you may imagine, my memory of these issues is not so crisp anymore,
> but IIRC without these build-order changes it would not build
> correctly. I guess I was using 'make clean toolchain' and it would
> fail, but I would need to retest explicitly to be sure.
> 
>>
>>>
>>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
[snip]
>>> +host-gcc-final: create-lib-symlinks
>>
>>  This is not just awkward, it also breaks top-level parallel build. At least, if
>> host-gcc-final really does need this to be done. In top-level parallel build,
>> the order between the dependencies is not set, so it's possible that the
>> symlinks are only created after the build of gcc has already started.
> 
> Here I don't follow: the line above expresses that host-gcc-final
> needs create-lib-symlinks. 

 Semantically, yes. But technically, it doesn't. host-gcc-final is a PHONY
target that depends on the actual build steps of gcc. So in parallel build,
create-lib-symlinks will be executed in parallel with host-gcc-final-install.

> So even with top-level parallel build,
> _first_ create-lib-symlinks is executed, and only then host-gcc-final.
> 
> Your statement seems to refer to cases like:
> 
> foo: bar baz
> 
> Where bar and baz can indeed be executed in parallel.

 That's exactly the case we are in.

In toolchain-buildroot.mk:

host-gcc-final: create-lib-symlinks

Generated from generic-package:

host-gcc-final: host-gcc-final-install

and no commands.

> Or I'm misunderstanding you or the situation.
> 
> 
>> Of course,
>> it's vanishingly unlikely that it will not yet have finished by the time the gcc
>> install step starts... Actually, we wonder if it is really needed before
>> gcc-final, or even before the libc? Because the way that make evaluates things
>> in the non-parallel case, this step would have been done before anything else,
>> even before host-binutils...
> 
> For external toolchains the links are created after extraction, when
> installing the toolchain in target and staging.
> For internal toolchain I don't remember if it needs to be done before
> host-gcc-final, or if it's enough that it is done after host-gcc-final
> but I couldn't find a better way to achieve that because
> host-gcc-final is the target used for toolchain/toolchain-buildroot,
> so there wasn't a lot of hooking possibility without changing a lot of
> code. I would need to retest to be sure.

 I was actually surprised that it was even needed for the internal toolchain
itself, I thought we refactored the symlinking of the external toolchain just to
make things consistent. The current symlink was introduced in 5628776c4, before
that there was only some (partially broken) symlinking for the external toolchain.

>>
>>  If it really should be done before host-gcc-final, the full solution would be
>> to add this as a post-install hook to the libc. You could do something like this:
>>
>> $(call uppercase,$(BR_LIBC))_POST_INSTALL_STAGING_HOOKS += \
>>         $(call create_staging_lib_symlink,$(LIB_SYMLINK))
>>
>> Isn't that beautiful :-) This also has the advantage of splitting the staging
>> and target installs into their appropriate locations.
>>
>>  Alternatively, you could add a tiny package without source that does this and
>> add that as a dependency to host-gcc-final.
>>
>>
>>
>>  Do you still have the energy to make some changes and resubmit?
> 
> I'll see if I can look at some of this tomorrow but I can't make any
> promises. But if you happen to be in the heat of the moment tonight
> and can't resist reworking some of this then be my guest :-)
> I'll log into IRC tomorrow...

 We actually have other cats to whip :-) and to be honest, nobody is really
excited about touching the external toolchain stuff. I'll shout in the room here
and see if anyone jumps up.

 Regards,
 Arnout

> 
> Thanks for the feedback,
> Thomas
> 

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
