From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 24 Jan 2016 21:42:33 +0100
Subject: [Buildroot] [PATCH v11 4/4] toolchain-external: create symlink
 ARCH_LIB_DIR->lib
In-Reply-To: <CAAXf6LVbd1Y=Pyk+04c17SWAKbm9r7HmuEqkD6U7oG3A3svXdg@mail.gmail.com>
References: <1453317091-17676-1-git-send-email-patrickdepinguin@gmail.com>
 <1453317091-17676-4-git-send-email-patrickdepinguin@gmail.com>
 <56A52D37.90009@gmail.com>
 <CAAXf6LVbd1Y=Pyk+04c17SWAKbm9r7HmuEqkD6U7oG3A3svXdg@mail.gmail.com>
Message-ID: <56A53739.4060909@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Le 24/01/2016 21:23, Thomas De Schampheleire a ?crit :
> Hi Romain,
> 
> Thanks a lot for reviewing/testing!

You're welcome :)

> 
> On Sun, Jan 24, 2016 at 8:59 PM, Romain Naour <romain.naour@gmail.com> wrote:
>> Hi Thomas, All,
>>
>> Le 20/01/2016 20:11, Thomas De Schampheleire a ?crit :
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
>>> in directory 'lib32-fp' rather than 'lib32' (ABI=n32; likewise for
>>> lib64-fp in case of ABI=n64)
>>>
>>> More generally the correct symbolic link is from (usr/)${ARCH_LIB_DIR}->lib.
>>> However, feedback from Arnout Vandecappelle is that there are packages that
>>> do depend on the lib32/lib64 symlink, even if ARCH_LIB_DIR is different.
>>> Hence, these links must be kept.
>>>
>>> Fix the problem as follows:
>>> - For internal toolchains: no change
>>> - For external toolchains: create a symlink ARCH_LIB_DIR->lib if
>>>   (usr/)ARCH_LIB_DIR does not exist yet.
>>>
>>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>> Cc: Arnout Vandecappelle <arnout@mind.be>
>>> Cc: "Yann E. Morin" <yann.morin.1998@free.fr>
>>> Cc: Romain Naour <romain.naour@gmail.com>
>>> Cc: Peter Korsgaard <peter@korsgaard.com>
>>>
>>> ---
>>> v11:
>>> - check for existence of destination instead of explicitly checking on the
>>>   known values lib/lib32/lib64. (ThomasP)
>>> v10:
>>> - simplify after realization that skeleton symlink creation can be kept
>>>   (thanks Thomas Petazzoni for noticing this)
>>> v9:
>>> - remove redundant mkdir's (handled by skeleton) (Yann)
>>> v8:
>>> - use helper only for external toolchain and incorporate ARCH_LIB_DIR
>>>   definition (Arnout)
>>> - keep lib32/lib64->lib symlink anyway
>>> v7: rebase
>>> v6: rebase only
>>> v5:
>>> - move internal toolchain logic into gcc-initial.mk
>>> - also silence the internal toolchain link steps with $(Q)
>>> v4:
>>> - merge both helpers into one
>>> - remove the separate target for the internal toolchain and hook into
>>>   gcc-initial
>>> - re-add deleted comment about MIPS64/n32
>>> v3:
>>> - update commit message wrapping
>>> - change dependency on $(BUILD_DIR) to a order-only dependency
>>> v2:
>>> - fix 'lib32-fp' leftover in toolchain-buildroot
>>> - silence commands creating symlink with $(Q)
>>> - fix case where ARCH_LIB_DIR is 'lib'
>>>
>>> Note: in output/staging/usr/ there would still be more directories than I
>>> think are really necessary. This behavior is not changed by this patch, it
>>> was already present before.
>>> For example, with the mentioned Octeon III toolchain, output/staging/usr/
>>> contains:
>>>     bin      bin32      bin32-fp      bin64-fp,
>>>     lib      lib32      lib32-fp      lib64-fp
>>>     libexec  libexec32  libexec32-fp  libexec64-fp
>>>     sbin     sbin32     sbin32-fp     sbin64-fp
>>>
>>> where bin/lib/libexec/sbin seem to be the 64-bit equivalents of
>>> bin32/lib32/libexec32/sbin32.
>>> This is related to the behavior of copy_toolchain_sysroot in
>>> toolchain/helpers.mk. It already attempts to filter out the unnecessary lib*
>>> directories, but does not care about any bin/sbin/libexec directories.
>>> As this poses no known problem and is not impacted by this patch, I make no
>>> attempt to change it.
>>>
>>>  toolchain/toolchain-external/toolchain-external.mk | 23 ++++++++++++++++++++++
>>>  1 file changed, 23 insertions(+)
>>>
>>> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
>>> index ddefd01..6383f8b 100644
>>> --- a/toolchain/toolchain-external/toolchain-external.mk
>>> +++ b/toolchain/toolchain-external/toolchain-external.mk
>>> @@ -517,6 +517,27 @@ endef
>>>  TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
>>>  endif
>>>
>>> +# Create a symlink from (usr/)$(ARCH_LIB_DIR) to lib.
>>> +# Note: the skeleton package additionally creates lib32->lib or lib64->lib
>>> +# (as appropriate)
>>> +#
>>> +# $1: destination directory (TARGET_DIR / STAGING_DIR)
>>> +create_lib_symlinks = \
>>> +       $(Q)DESTDIR="$(strip $1)" ; \
>>> +       ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
>>> +       if [ ! -f "$${DESTDIR}/$${ARCH_LIB_DIR}" -a ! -f "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ]; then \
>>
>> -f (regular file) ?
>> I expected -d (directory) instead.
>>
>> With -f the test doesn't work and create a dead simlink (lib -> lib) in
>> staging/lib and staging/usr/lib/ etc...
>>
> 
> Is it correct that you see this in a case where ARCH_LIB_DIR is simply 'lib' ?

Indeed I'm in the case where ARCH_LIB_DIR is 'lib'.
I'm using the CS ARM 2014.05 as example.

> Seems I did not test that case then, and I will fix it.
> 
> For the case of ARCH_LIB_DIR=lib32-fp, ARCH_LIB_DIR does not exist at
> all in DESTDIR/ and DESTDIR/usr. Links need to be created.
> For the case of ARCH_LIB_DIR=lib64, DESTDIR/ARCH_LIB_DIR and
> DESTDIR/usr/ARCH_LIB_DIR are symlinks already. No links need to be
> created. This was the case I was testing, really.
> For the case of ARCH_LIB_DIR=lib, DESTDIR/ARCH_LIB_DIR and
> DESTDIR/usr/ARCH_LIB_DIR will be directories, as you noticed, and then
> the test -f indeed fails. No links need to be created.
> 
> I think that a better test would then be 'test -e' (exists). Do you agree?

Seems good to me (tested locally).

> I'd need to test tomorrow and resend, thanks a lot for noticing!

Best regards,
Romain

> 
> Thanks,
> Thomas
> 
