From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 9 May 2014 09:23:17 +0200
Subject: [Buildroot] [PATCH v3] toolchain-external: Fix EABIhf check
In-Reply-To: <536C06AF.2000107@mind.be>
References: <2531b66f78bfdb046ddb.1399375540@argentina>
 <536C06AF.2000107@mind.be>
Message-ID: <CAAXf6LUActiMzXEXGqUJDkmrGhb_LXNaf1=Ca+A16PurGRBuBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Fri, May 9, 2014 at 12:35 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 06/05/14 13:25, Thomas De Schampheleire wrote:
>> From: Stefan S?rensen <stefan.sorensen@spectralink.com>
>>
>> Currently the check for EABI/EABIhf toolchains looks for the
>> Tag_ABI_VFP_args attribute in the crt1.o file which gcc adds in an
>> EABIhf toolchain.
>> In uClibc, however, crt1.o is not compiled from c but assembly, so the
>> Tag_ABI_VFP_args attribute is not added in the object file. This causes
>> the EABIhf check in the external toolchain logic to fail for
>> uClibc-based toolchains.
>>
>> Fix by compiling a dummy .c file and trying to link the object against the
>> C library. Since it is impossible to mix EABI and EABIhf code, a mismatch
>> between the buildroot and toolchain ABI settings will be detected during
>> this link step.
>>
>> Fixes bug #6842: https://bugs.busybox.net/show_bug.cgi?id=6842
>>
>> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
>> [ThomasDS: do full link iso readelf test, update commit message]
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> ---
>> v3: (ThomasDS)
>>   - v2 properly recognized a uClibc EABIhf toolchain, but failed to detect a
>>     mismatch with buildroot settings (detected by ThomasP). Fix by
>>     performing an actual link step to detect any incompatibility.
>> v2: (ThomasDS)
>>   - avoid creating a temporary source file
>>   - update commit message
>>
>>  toolchain/helpers.mk |  18 ++++++------------
>>  1 files changed, 6 insertions(+), 12 deletions(-)
>>
>> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
>> --- a/toolchain/helpers.mk
>> +++ b/toolchain/helpers.mk
>> @@ -297,20 +297,14 @@ check_arm_abi = \
>>               echo "External toolchain uses the unsuported OABI" ; \
>>               exit 1 ; \
>>       fi ; \
>> -     EXT_TOOLCHAIN_CRT1=`LANG=C $${__CROSS_CC} -print-file-name=crt1.o` ; \
>> -     if $${__CROSS_READELF} -A $${EXT_TOOLCHAIN_CRT1} | grep -q "Tag_ABI_VFP_args:" ; then \
>> -             EXT_TOOLCHAIN_ABI="eabihf" ; \
>> -     else \
>> -             EXT_TOOLCHAIN_ABI="eabi" ; \
>> -     fi ; \
>> -     if [ "$(BR2_ARM_EABI)" = "y" -a "$${EXT_TOOLCHAIN_ABI}" = "eabihf" ] ; then \
>> -             echo "Incorrect ABI setting: EABI selected, but toolchain uses EABIhf" ; \
>> +     TEMP_OBJ_FILE=`mktemp --tmpdir --suffix=.o`; \
>> +     if ! echo 'int main(void) {}' | $${__CROSS_CC} -x c -o $${TEMP_OBJ_FILE} /dev/null - 2>/dev/null; then \
>
>  You can write directly to /dev/null instead of going through TEMP_OBJ_FILE, no?

Ah yes. When we were still using the readelf approach I tried avoiding
the temporary file by using 'gcc -o -' so that I could pipe it into
readelf, but gcc did not accept that.
When changing approach I did not realize I could remove it, thanks.

I also noticed now that there is an extra /dev/null on this line as
input file, which is not needed.

>
>> +             abistr_$(BR2_ARM_EABI)='EABI'; \
>> +             abistr_$(BR2_ARM_EABIHF)='EABIhf'; \
>> +             echo "Incorrect ABI setting: $${abistr_y} selected, but toolchain is incompatible"; \
>
>  Nice approach! But to keep the original output, you could use:
>
> $${abistr_y} selected, but toolchain uses $${abistr_}
>

This did cross my mind, but it assumes that there are only two
possibilities: EABI and EABIhf. Suppose that a new EABI pops up. Or
suppose the compilation/link step fails for a completely different
reason. Then we have told the user that their toolchain is EABI or
EABIhf while it is not true.
So here I choice correctness over completeness, but if you prefer I
can change it. Do let me know if you still think we should add
$${abistr_} to the message.

Thanks,
Thomas
