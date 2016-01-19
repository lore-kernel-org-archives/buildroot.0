From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 19 Jan 2016 15:17:07 +0100
Subject: [Buildroot] [PATCH v9] toolchain: create symlink
 ARCH_LIB_DIR->lib in addition to lib32/lib64->lib
In-Reply-To: <CAAXf6LVkS49xBPa80iqi0EbkausB2gYJRJodsPMoWR8n6LZaAg@mail.gmail.com>
References: <1450787734-2547-1-git-send-email-patrickdepinguin@gmail.com>
 <20160117154528.1bb05d3e@free-electrons.com>
 <CAAXf6LVkS49xBPa80iqi0EbkausB2gYJRJodsPMoWR8n6LZaAg@mail.gmail.com>
Message-ID: <CAAXf6LUUwQ4yt38Cy+A5QpL+kXhGmd9iiBvJLdNA8uJDv=TpMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 19, 2016 at 3:15 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi Thomas,
>
> Thanks for your response.
>
> On Sun, Jan 17, 2016 at 3:45 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Thomas,
>>
>> On Tue, 22 Dec 2015 13:35:34 +0100, Thomas De Schampheleire wrote:
>>
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
>>> Feedback from Arnout Vandecappelle is that there are packages that do depend
>>> on the lib32/lib64 symlink, even if ARCH_LIB_DIR is different. Hence, these
>>> must be kept.
>>>
>>> Fix the problem as follows:
>>> - For internal toolchains: no functional change, but move the symlink
>>>   creation from Makefile to package gcc-initial.
>>> - For external toolchains: create a symlink creation helper in
>>>   toolchain/helpers.mk, which first creates lib32->lib or lib64->lib as
>>>   appropriate, and then creates ARCH_LIB_DIR->lib if that is different from
>>>   lib32/lib64.
>>
>> I don't quite understand the benefit of duplicating the code that
>> creates the lib32/lib64 symlinks. It used to be part of the skeleton,
>> which ensures the code is common to all cases (i.e internal or external
>> cases). And now with this change, you are duplicating it in the
>> external toolchain code and the host-gcc-initial code. What's the
>> benefit of doing this?
>>
>> Unless I missed something, this patch should be simplified to leave the
>> creation of lib32/lib64 as is (i.e in skeleton.mk), and only the
>> external toolchain code should be changed to create the $(ARCH_LIB_DIR)
>> symlink when needed.
>
> In earlier versions of the patch, I stated that the symlink creation
> needs to happen before gcc-initial is built. This is the reason we are
> hooking into gcc-initial. This was also effectively the case before
> the skeleton package was introduced.

Small correction, the statement is:
+# The creation of lib32/lib64 symlinks into target and staging directories
+# needs to be done before the C library is installed.
