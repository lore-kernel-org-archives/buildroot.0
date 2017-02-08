From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 8 Feb 2017 10:22:14 +0100
Subject: [Buildroot] [PATCHv3 03/12] toolchain-external: clarify rsync
	excludes in copy_toolchain_sysroot
In-Reply-To: <36c567b1-c955-1ed8-aa35-20e97138281c@gmail.com>
References: <20170207215649.364-1-patrickdepinguin@gmail.com>
 <20170207215649.364-4-patrickdepinguin@gmail.com>
 <36c567b1-c955-1ed8-aa35-20e97138281c@gmail.com>
Message-ID: <CAAXf6LVTZqdXdZGcr+ni-Xr+zM05UmNDaFvsDdnE-mpRYua_3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Wed, Feb 8, 2017 at 12:03 AM, Romain Naour <romain.naour@gmail.com> wrote:
> Le 07/02/2017 ? 22:56, Thomas De Schampheleire a ?crit :
>> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>>
>> The copy_toolchain_sysroot helper features a complex rsync loop that copies
>> various directories from the extracted toolchain to the staging directory.
>> The complexity mainly stems from the fact that we support multilib toolchain
>> tarballs but only copy one of the multilib variants into staging.
>>
>> Increase understandability of this logic by explicitly restricting the
>> rsync excludes to the iteration of the for loop they are relevant for.
>> Additionally, update the function comment.
>>
>> Note: all attempts to reduce duplication between both rsync while keeping
>> things nice and readable failed. One has to be extremely careful regarding
>> line continuation, indentation, and single vs double quoting. In the end, a
>> split up rsync seemed most clean.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>> ---
>> v2,v3: no changes other than rebase
>>
>>  toolchain/helpers.mk | 26 ++++++++++++++++++--------
>>  1 file changed, 18 insertions(+), 8 deletions(-)
>>
>> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
>> index 6f87230..33f6213 100644
>> --- a/toolchain/helpers.mk
>> +++ b/toolchain/helpers.mk
>> @@ -39,11 +39,16 @@ copy_toolchain_lib_root = \
>>  # dir. The operation of this function is rendered a little bit
>>  # complicated by the support for multilib toolchains.
>>  #
>> -# We start by copying etc, lib, sbin and usr from the sysroot of the
>> -# selected architecture variant (as pointed by ARCH_SYSROOT_DIR). This
>> -# allows to import into the staging directory the C library and
>> -# companion libraries for the correct architecture variant. We
>> -# explictly only copy etc, lib, sbin and usr since other directories
>> +# We start by copying etc, 'lib', sbin, usr and usr/'lib' from the
>> +# sysroot of the selected architecture variant (as pointed to by
>> +# ARCH_SYSROOT_DIR). This allows to import into the staging directory
>> +# the C library and companion libraries for the correct architecture
>> +# variant. 'lib' may not be literally 'lib' but could be something else,
>> +# e.g. lib32-fp (as determined by ARCH_LIB_DIR) and we only want to copy
>> +# that lib directory and no other. When copying usr, we therefore need
>> +# to be extra careful not to include usr/lib* but we _do_ want to
>> +# include usr/libexec.
>> +# We are selective in the directories we copy since other directories
>>  # might exist for other architecture variants (on Codesourcery
>>  # toolchain, the sysroot for the default architecture variant contains
>>  # the armv4t and thumb2 subdirectories, which are the sysroot for the
>> @@ -92,9 +97,14 @@ copy_toolchain_sysroot = \
>>               if [ ! -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
>>                       continue ; \
>>               fi ; \
>> -             rsync -au --chmod=u=rwX,go=rX --exclude 'locale/' \
>> -                     --include '/libexec*/' --exclude '/lib*/' \
>> -                     $${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
>> +             if [ "$$i" = "usr" ]; then \
>> +                     rsync -au --chmod=u=rwX,go=rX --exclude 'locale/' \
>> +                             --include '/libexec*/' --exclude '/lib*/' \
>> +                             $${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
>> +             else \
>> +                     rsync -au --chmod=u=rwX,go=rX --exclude 'locale/' \
>> +                             $${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
>
> With the current CodeSourcery NiosII toolchain, this change have a weird side
> effect...
>
> If you look at "host/opt/ext-toolchain/nios2-linux-gnu/libc/usr/lib/", you will
> find a directory named "libffi-3.2.1". This directory contain the libffi headers !?
>
> ls libffi-3.2.1/include
> ffi.h  ffitarget.h
>
> So this directory is now present in STAGING_DIR:
> ls staging/usr/lib/libffi-3.2.1
>
> I think it's a mistake in the toolchain itself...

Yes, I think so too. It is very weird that headers would be placed in
usr/lib/something. Are they also present elsewhere, like in
usr/include ?

In any case, the fact that these files are now present in staging
should not hurt. Also for target it will not make a difference.

Also, the fact that they used to be skipped with the original code is
more of an accident, than actual intention.

Thanks,
Thomas
