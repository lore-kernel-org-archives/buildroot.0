From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 11 Nov 2013 18:54:27 +0800
Subject: [Buildroot] [PATCH] alsa-lib: FLAT: Disable alsa lib when FLAT
 bianry is selected.
In-Reply-To: <20131111112128.60a4a348@skate>
References: <1384146177-6020-1-git-send-email-Sonic.adi@gmail.com>
 <20131111112128.60a4a348@skate>
Message-ID: <CAJxxZ0NkAviss7TVczJhJogiLFU3Ts4KS8sqstEfK1H=Fkv4rQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Nov 11, 2013 at 6:21 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 11 Nov 2013 13:02:57 +0800, sonic.adi at gmail.com wrote:
>> From: Sonic Zhang <sonic.zhang@analog.com>
>>
>> Alsa lib depends on the runtime library loader.
>>
>> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>> ---
>>  package/alsa-lib/Config.in | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
>> index df05240..1e148cc 100644
>> --- a/package/alsa-lib/Config.in
>> +++ b/package/alsa-lib/Config.in
>> @@ -9,6 +9,7 @@ config BR2_PACKAGE_ALSA_LIB
>>       # the usage of alsa-lib on no-thread systems is pretty
>>       # unlikely, just require thread support globally for alsa-lib.
>>       depends on BR2_TOOLCHAIN_HAS_THREADS
>> +     depends on !BR2_BINFMT_FLAT
>
> I am not sure this is the right dependency. Shouldn't this instead be a:
>
>         depends on !BR2_PREFER_STATIC_LIB
>
>  ?
>
> The problem is really that we need shared library support, no that
> specifically the FLAT binary format is causing problems. If another
> binary format doesn't support shared libraries, then we would have to
> exclude it as well.

Some alsa-lib code include head file dlfcn.h, which doesn't exist in
the FLAT GNU toolchain, while it does in the ELF/FDPIC GNU toolchain.
So, alsa-lib has no error with BR2_PREFER_STATIC_LIB is selected in
the 2nd case.


Regards,

Sonic
