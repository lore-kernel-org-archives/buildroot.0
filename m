From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Mar 2015 21:31:34 +0100
Subject: [Buildroot] [PATCH 1/2] bfin: remove the dependency of flat
 shared mode to shared library
In-Reply-To: <CAJxxZ0NLdyD=zC5QCUPX7fkrmzss3xSoF1LdTyyqmwGB3M0wog@mail.gmail.com>
References: <1426669156-24250-1-git-send-email-sonic.adi@gmail.com>	<20150320224508.73c0c84b@free-electrons.com>	<CAJxxZ0OGa0OcPUXSJapo51ft0juQVWPYOJxM5Xx0aTCxFriVqQ@mail.gmail.com>	<5511B655.9020800@mind.be>
 <CAJxxZ0NLdyD=zC5QCUPX7fkrmzss3xSoF1LdTyyqmwGB3M0wog@mail.gmail.com>
Message-ID: <5515BE26.2050004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/03/15 09:55, Sonic Zhang wrote:
> Hi Arnout,
> 
> On Wed, Mar 25, 2015 at 3:09 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 23/03/15 03:43, Sonic Zhang wrote:
>>> Hi Thomas,
>>>
>>> On Sat, Mar 21, 2015 at 5:45 AM, Thomas Petazzoni
>>> <thomas.petazzoni@free-electrons.com> wrote:
>>>> Dear Sonic Zhang,
>>>>
>>>> On Wed, 18 Mar 2015 16:59:15 +0800, Sonic Zhang wrote:
>>>>> From: Sonic Zhang <sonic.zhang@analog.com>
>>>>>
>>>>> Blackfin flat shared library isn't generated and linked in the same way
>>>>> as the ELF shared library. So, don't mark it depend on the static library
>>>>> only.
>>>>>
>>>>> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>>>>> ---
>>>>>  arch/Config.in |    1 -
>>>>>  1 file changed, 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/Config.in b/arch/Config.in
>>>>> index 16ad8be..6179960 100644
>>>>> --- a/arch/Config.in
>>>>> +++ b/arch/Config.in
>>>>> @@ -295,7 +295,6 @@ config BR2_BINFMT_FLAT_SEP_DATA
>>>>>
>>>>>  config BR2_BINFMT_FLAT_SHARED
>>>>>       bool "Shared binary"
>>>>> -     select BR2_BINFMT_SUPPORTS_SHARED
>>>>
>>>> If you don't select BR2_BINFMT_SUPPORTS_SHARED, then the only available
>>>> option amongst: static libs, static libs + shared libs, shared libs is
>>>> "static libs", which means that the "-static" flag is always passed. If
>>>> that's OK, then I'm fine with the patch.
>>>>
>>> Yes, -static is OK in the link flag for FLAT shared mode.
>>
>>  But then it won't generate dynamically linked executables, right?
> 
> Yes, Bfin FLAT shared format isn't the standard dynamic linked ELF.
> For example, following command is used for FLAT shared.
> 
> bfin-uclinux-gcc -Wl,-elf2flt -mid-shared-library
> -mshared-library-id=0 -static -D__NOMMU__ -Wall -o mpicalc
> mpicalc-mpicalc.o  ./.libs/libgcrypt.a
> -L/home/sonic/projects/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib
> /home/sonic/projects/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libgpg-error.a

 So I tried linking with a few different options, and it looks that with the
-mid-shared-library option, it's always a shared executable that is created even
if -static is specified as well. flthdr tells me:

Flags:        0x2 ( Has-PIC-GOT )

 When I link without -mid-shared-library and with -static, I get an executable with:

Flags:        0x1 ( Load-to-Ram )


 So basically, with BR2_BINFMT_FLAT_SHARED, you _always_ get shared and the
static options should be removed. Except that it's not shared in the way that we
use it in buildroot, because libdl is not available.

 So basically, the fix by Sonic Zhang does the correct thing, but it looks
pretty strange. Perhaps after adding an explanatory comment it could be accepted.

 I'll resend.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
