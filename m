From: Sonic Zhang <sonic.adi@gmail.com>
Date: Tue, 16 Apr 2013 18:26:22 +0800
Subject: [Buildroot] [PATCH v2 4/7] arch: toolchain: Introduce binary
 format FLAT types.
In-Reply-To: <20130413163126.0726a238@skate>
References: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
 <1364550643-11793-4-git-send-email-sonic.adi@gmail.com>
 <20130407225132.38a9471c@skate>
 <CAJxxZ0P=w5Bv44jO6TMPnRC6e-tU6oWpV1zpsNnMAjBkofQpdw@mail.gmail.com>
 <20130413163126.0726a238@skate>
Message-ID: <CAJxxZ0MehskGrHv15LenF25SV4YB32od+mLJAwn0WJfZbSh9Og@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Apr 13, 2013 at 10:31 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Sonic Zhang,
>
> On Fri, 12 Apr 2013 11:39:41 +0800, Sonic Zhang wrote:
>
>> Just figure out the compiling flags for BINFMT_FLAT_SHARED and
>> BINFMT_FLAT_SEP can't be put into the toolchain wrapper, because these
>> flags are for application only, they can't be used to build Linux
>> kernel.
>>
>> -mid-shared-library -mshared-library-id=0
>> -msep-data
>>
>> So, I have to move them back to file package/Makefile.in .
>
> Hum, that is not really nice, because the idea of the external
> toolchain wrapper is to ensure that when the user will use
> output/host/usr/bin/<arch>-gcc, he will get binaries that are built for
> the same architecture/flags than the binaries built by Buildroot.
> That's more or less the whole idea of the external toolchain wrapper
> thing.
>
> One option is to have something like:
>
> ifeq ($(BR2_bfin),y)
> LINUX_MAKE_FLAGS =
>         KBUILD_CFLAGS = "$(TARGET_CFLAGS) -mno-id-shared-library ..."
> endif
>
> Not sure exactly if that's the right solution or not. Peter, you're the
> one who did the external toolchain wrapper originally. Could you
> comment on this specific issue?
>
The LINUX_MAKE_FLAGS should not include the shared flat specific flags
"-mno-id-shared-library ...". Your suggestion doesn't work when
building Linux kernel. We need some ways to remove flags
"-mno-id-shared-library ..." from the gcc wrapper for the shared flat
binary format when building Linux kernel.

My new patch is to append the shared flat flags only when building applications.

Any better solution?

Regards,

Sonic
