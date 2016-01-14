From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 14 Jan 2016 20:35:47 +0100
Subject: [Buildroot] [PATCH v9] toolchain: create symlink
 ARCH_LIB_DIR->lib in addition to lib32/lib64->lib
In-Reply-To: <56958862.1080408@gmail.com>
References: <1450787734-2547-1-git-send-email-patrickdepinguin@gmail.com>
 <56958862.1080408@gmail.com>
Message-ID: <CAAXf6LVXXyMhB6igDA+qQ_8-6-axhuHvqPcnT8JD0hqHy22uCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 13, 2016 at 12:12 AM, Romain Naour <romain.naour@gmail.com> wrote:
> Hi Thomas, All,
>
> Le 22/12/2015 13:35, Thomas De Schampheleire a ?crit :
>> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> Currently, following symbolic links are created in both target and
>> staging directories:
>> - lib(32|64) --> lib
>> - usr/lib(32|64) --> lib
>>
>> The decision for lib32 or lib64 is based on the target architecture
>> configuration in buildroot (BR2_ARCH_IS_64).
>>
>> In at least one case this is not correct: when building for a Cavium Octeon
>> III processor using the toolchain from the Cavium Networks SDK, and
>> specifying -march=octeon3 in BR2_TARGET_OPTIMIZATION, libraries are expected
>> in directory 'lib32-fp' rather than 'lib32' (likewise for lib64-fp).
>>
>> More generally, for external toolchains, the correct symbolic link is
>> from (usr/)${ARCH_LIB_DIR} to lib. For internal toolchains, current
>> toolchains always use either lib32 or lib64.
>>
>> Feedback from Arnout Vandecappelle is that there are packages that do depend
>> on the lib32/lib64 symlink, even if ARCH_LIB_DIR is different. Hence, these
>> must be kept.
>>
>> Fix the problem as follows:
>> - For internal toolchains: no functional change, but move the symlink
>>   creation from Makefile to package gcc-initial.
>> - For external toolchains: create a symlink creation helper in
>>   toolchain/helpers.mk, which first creates lib32->lib or lib64->lib as
>>   appropriate, and then creates ARCH_LIB_DIR->lib if that is different from
>>   lib32/lib64.
>
> Not so related to your patch though...
> I reviewed some patches about x32 and ilp32 toolchains support and it seems that
> we need to handle at least two more weird libraries location: libx32 and
> libilp32. Each of these series try to define LIB_SYMLINK with their own specific
> value (libilp32 and libx32).
>
> See:
> x86-64 x32 ABI:
> http://patchwork.ozlabs.org/patch/561904/
>
> aarch64 ilp32 ABI:
> http://patchwork.ozlabs.org/patch/506803/
> http://patchwork.ozlabs.org/patch/506800/
> http://patchwork.ozlabs.org/patch/506801/
>
> In your patch, I like create_lib_symlinks helper function which avoid to define
> TOOLCHAIN_LIB_SYMLINK with a different value than lib32 and lib64. Instead we
> rely on the ARCH_LIB_DIR returned by the arch-sysroot to create additional
> symlinks with the correct name.
>
> Obviously, we need to adjust the sed "magic" in toolchain_find_libdir and
> toolchain_find_sysroot for libilp32 and libx32 but we can do that in a followup
> patch series.
>
> So, I think this patch make it easier to add the support of theses specific
> toolchains:
>
> Reviewed-by: Romain Naour <romain.naour@gmail.com>
>

Thank you, Romain.

With the upcoming Febuary stabilization month and subsequent release,
I would like to kindly ask (almost beg, really) that this patch be
included in the release. I know that toolchain patches are not sexy,
but they are important. This patch has been around for a very long
time, and the associated rebasing and retesting on my part is
time-consuming and very demotivating.

Thanks,
Thomas
