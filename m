From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Dec 2015 18:41:05 +0100
Subject: [Buildroot] [PATCH] toolchain: create symlink to 'lib' from
 ARCH_LIB_DIR iso fixed lib32/lib64
In-Reply-To: <5681B2D7.1000202@mind.be>
References: <1445245676-21017-1-git-send-email-patrickdepinguin@gmail.com>
 <564A515D.1030800@mind.be>
 <CAAXf6LVq=n35Gq242XiUU3vKkkjZtQwRd+q77OFe8WjZm2jj=Q@mail.gmail.com>
 <5681B2D7.1000202@mind.be>
Message-ID: <CAAXf6LU1K3V+oBHdpvZ-AK2h3tHvqEjC9HSSnLUt=NZ7xiEJ7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Dec 28, 2015 at 11:08 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 21-12-15 14:29, Thomas De Schampheleire wrote:
>> Hi Arnout,
>>
>> Sorry, I completely missed your reply. Thanks for reviewing. See below...
>>
>> On Mon, Nov 16, 2015 at 10:57 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>  Hi Thomas,
>>>
>>> On 19-10-15 11:07, Thomas De Schampheleire wrote:
>>>> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>>>
>>>> Currently, following symbolic links are created in both target and
>>>> staging directories:
>>>> - lib(32|64) --> lib
>>>> - usr/lib(32|64) --> lib
>>>>
>>>> The decision for lib32 or lib64 is based on the target architecture
>>>> configuration in buildroot (BR2_ARCH_IS_64).
>>>>
>>>> In at least one case this is not correct: when building for a Cavium Octeon
>>>> III processor using the toolchain from the Cavium Networks SDK, and
>>>> specifying -march=octeon3 in BR2_TARGET_OPTIMIZATION, libraries are expected
>>>> in directory 'lib32-fp' rather than 'lib32' (likewise for lib64-fp).
>>>>
>>>> More generally, for external toolchains, the correct symbolic link is
>>>> from (usr/)${ARCH_LIB_DIR} to lib. For internal toolchains, current
>>>> toolchains always use either lib32 or lib64.
>>>
>>>  Sorry, it's not OK (yet). The reason we add the lib32 and lib64 symlinks for
>>> the internal toolchain as well is because there are some slightly broken
>>> packages that expect these directories to exist. With this patch, the symlink is
>>> no longer created for some external toolchains, e.g. musl. Unfortunately, I'm
>>> not sure which packages are problematic. A quick search through the archives
>>> points at libatomic_ops as a candidate.
>>
>> Did you mean 'external' instead of 'internal' in the second sentence
>> of this paragraph?
>
>  No, I meant external. But I agree that my explanation wasn't very clear.
>
>>
>> For internal toolchains, the lib32 or lib64 symlink is always created,
>> with and without this patch. Agreed?
>
>  For internal toolchains, things are still OK with your patch.
>
>>
>> For external toolchains, if ARCH_LIB_DIR == 'lib', previously symbolic
>> links lib32 or lib64 would be created anyhow, but with this patch they
>> are not. I guess this is the case you refer to?
>
>  Exactly, and for example external musl toolchains are in this situation.
>
>>
>>>
>>>  So I think the solution is to keep on creating the symlink like is done now,
>>> and just check if ${ARCH_LIB_DIR} exists for the external toolchains.
>>
>> You mean to create a lib32/lib64 symlink as before, and additionally a
>> link '${ARCH_LIB_DIR} -> lib' in case ARCH_LIB_DIR is different from
>> 'lib32' and 'lib64', right?
>
>  Yep. Though it probably will make things even uglier.

Thanks for clarifying.
I think these comments are addressed in v9:
http://patchwork.ozlabs.org/patch/560003/

Care to review?

Thanks a lot,
Thomas
