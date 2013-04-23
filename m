From: Sonic Zhang <sonic.adi@gmail.com>
Date: Tue, 23 Apr 2013 13:57:50 +0800
Subject: [Buildroot] [PATCH v2 4/7] arch: toolchain: Introduce binary
 format FLAT types.
In-Reply-To: <CAJxxZ0Opexp7+cKMiO4EixmZ57CRJXW_QQ9rUbXrkdnNTxbsvQ@mail.gmail.com>
References: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
 <1364550643-11793-4-git-send-email-sonic.adi@gmail.com>
 <20130407225132.38a9471c@skate>
 <CAJxxZ0P=w5Bv44jO6TMPnRC6e-tU6oWpV1zpsNnMAjBkofQpdw@mail.gmail.com>
 <20130413163126.0726a238@skate>
 <CAJxxZ0MehskGrHv15LenF25SV4YB32od+mLJAwn0WJfZbSh9Og@mail.gmail.com>
 <20130416124648.6370bda6@skate>
 <CAJxxZ0Opexp7+cKMiO4EixmZ57CRJXW_QQ9rUbXrkdnNTxbsvQ@mail.gmail.com>
Message-ID: <CAJxxZ0OTLgDJkctuB_5qz+bq0pF3k9Cp4hTYyDnqAvPtMEeR7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter and Thomas,

Any further suggestion on how can I push forward this patch?

Compiler parameter -mno-xxx is not an option for blackfin specific flag
id-shared-library=0.

Regards,

Sonic


On Wed, Apr 17, 2013 at 5:02 PM, Sonic Zhang <sonic.adi@gmail.com> wrote:

> Hi Thomas,
>
>
> On Tue, Apr 16, 2013 at 6:46 PM, Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com> wrote:
>
>> Dear Sonic Zhang,
>>
>> On Tue, 16 Apr 2013 18:26:22 +0800, Sonic Zhang wrote:
>>
>> > > Not sure exactly if that's the right solution or not. Peter, you're
>> the
>> > > one who did the external toolchain wrapper originally. Could you
>> > > comment on this specific issue?
>> > >
>> > The LINUX_MAKE_FLAGS should not include the shared flat specific flags
>> > "-mno-id-shared-library ...". Your suggestion doesn't work when
>> > building Linux kernel. We need some ways to remove flags
>> > "-mno-id-shared-library ..." from the gcc wrapper for the shared flat
>> > binary format when building Linux kernel.
>>
>> Hm? If you pass -mno-id-shared-library after -mid-shared-library, it
>> will be just as if you hadn't passed the option at all. So if the
>> external toolchain wrapper passes -mid-shared-library, but then the
>> CFLAGS passed to the kernel override that by passing
>> -mno-id-shared-library, it will be just as if the external wrapper
>> hadn't passed -mid-shared-library.
>>
>>
> The blackfin GNU toolchain doesn't understand flag
> "-mno-shared-library-id", "-mno-shared-library-id=" and
> "-mno-shared-library-id=0". Flag "-mshared-library-id=0" set in wrapper
> can't be canceled by passing "-mno-shared-library-id" later in linux.mk.
>
>
> ifeq ($(BR2_bfin),y)
> LINUX_MAKE_FLAGS += KBUILD_CFLAGS="$(TARGET_CFLAGS) -mno-id-shared-library
> -mno-shared-library-id -mno-sep-data"
> endif
>
>
> PATH="/home/sonic/projects/buildroot/output/host/bin:/home/sonic/projects/buildroot/output/host/usr/bin:/home/sonic/projects/buildroot/output/host/usr/sbin/:/opt/arm/bin:/opt/uclinux/bfin-elf/bin/:/opt/uclinux/bfin-uclinux/bin/:/opt/uclinux/bfin-linux-uclibc/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
> PERLLIB="/home/sonic/projects/buildroot/output/host/usr/lib/perl"
> /usr/bin/make -j4
> O="/home/sonic/projects/buildroot/output/build/linux-custom"
> HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=blackfin
> INSTALL_MOD_PATH=/home/sonic/projects/buildroot/output/target
> CROSS_COMPILE="
> /home/sonic/projects/buildroot/output/host/usr/bin/bfin-uclinux-"
> DEPMOD=/home/sonic/projects/buildroot/output/host/usr/sbin/depmod
> KBUILD_CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64  -pipe -Os  -D__NOMMU__ -D__uClinux__
> -mno-id-shared-library -mno-shared-library-id -mno-sep-data" -C
> "linux/linux-kernel"/ uImage
> make[1]: Entering directory
> `/home/sonic/projects/buildroot/linux/linux-kernel'
>   GEN     /home/sonic/projects/buildroot/output/build/linux-custom/Makefile
>   CHK     include/generated/uapi/linux/version.h
>   CC      scripts/mod/empty.o
> cc1: error: unrecognized command line option "-mno-shared-library-id"
> /home/sonic/projects/buildroot/linux/linux-kernel/scripts/mod/empty.c:1:
> error: -mshared-library-id= specified without -mid-shared-library
> make[4]: *** [scripts/mod/empty.o] Error 1
> make[3]: *** [scripts/mod] Error 2
> make[2]: *** [scripts] Error 2
>
>
> Regards,
>
> Sonic
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130423/d5499318/attachment-0001.html>
