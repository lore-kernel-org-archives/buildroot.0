From: Frank Bergmann <frank@frajasalo.de>
Date: Thu, 20 Feb 2014 21:52:34 +0100
Subject: [Buildroot] [PATCH 1/1] e2fsprogs: fix missing fallocate64() on
 nios2
In-Reply-To: <5303E913.2080701@frajasalo.de>
References: <20140214073009.1D7E6102637@stock.ovh.net>	<20140214101241.27857b9e@skate>	<CAAEAJfBHZ_4hSWN+boCRCvxJbFC1+T_WN=Dv3oVM2yz0z=t5JQ@mail.gmail.com>	<52FFA40D.1040100@rosho.de>	<52FFB751.1090903@frajasalo.de>
 <20140218221937.469b0b66@skate> <5303E913.2080701@frajasalo.de>
Message-ID: <53066B12.2030107@frajasalo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 19.02.2014 00:13, Frank Bergmann wrote:
> On 18.02.2014 22:19, Thomas Petazzoni wrote:
>>> diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
>>> index 7775e94..1e87aef 100644
>>> --- a/package/e2fsprogs/Config.in
>>> +++ b/package/e2fsprogs/Config.in
>>> @@ -49,7 +49,7 @@ config BR2_PACKAGE_E2FSPROGS_E2UNDO
>>>
>>>    config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
>>>           bool "e4defrag"
>>> -       depends on !BR2_avr32 # fallocate not implemented
>>> +       depends on !BR2_avr32 && !BR2_nios2 # fallocate not implemented
>>>
>>>    config BR2_PACKAGE_E2FSPROGS_FILEFRAG
>>>           bool "filefrag"
>>> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
>>> index 2eb59f5..310f549 100644
>>> --- a/package/e2fsprogs/e2fsprogs.mk
>>> +++ b/package/e2fsprogs/e2fsprogs.mk
>>> @@ -23,7 +23,8 @@ E2FSPROGS_CONF_OPT = \
>>>           --disable-libuuid \
>>>           --enable-fsck \
>>>           --disable-e2initrd-helper \
>>> -       --disable-testio-debug
>>> +       --disable-testio-debug \
>>> +       $(if $(BR2_nios2),ac_cv_func_fallocate=no,)
>>
>> Such variables are normally passed in <pkg>_CONF_ENV. Also, in
>> Config.in, the fallocate problem seems to also apply for AVR32, while
>> you only pass ac_cv_func_fallocate=no for NIOS II here. Could you
>> explain why?
>
> As written in the patch description fallocate is replaced by fallocate64 if using
> _FILE_OFFSET_BITS=64 . fallocate64 is not available in nios2 toolchain library. So
> if in that case we want to avoid fallocate64 then we have to avoid fallocate.
>
> Not sure for the moment why it's working for AVR32 but fallocate is referenced in
> lib/ext2fs/unix_io.c which builds libext2fs.so and therefore it's independent of
> e4defrag. Only avoiding e4defrag does not work for nios2.

On AVR32 there is neither fallocate nor fallocate64 available. e4defrag has to be
disabled on this architecture because it uses the fallocate system call which is
also not available.

Frank.
