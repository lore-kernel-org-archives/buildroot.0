From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 29 Jun 2016 10:45:32 -0400
Subject: [Buildroot] [PATCH 1/1] toolchain: allow crosstool-ng musl
	toolchains
In-Reply-To: <20160628182415.42ef8e25@free-electrons.com>
References: <1466530603-6041-1-git-send-email-fhunleth@troodon-software.com>
 <20160628182415.42ef8e25@free-electrons.com>
Message-ID: <CA+-urNSsOA8bDca-JyW7fZrLcAKWvkVpQaSqobrzD=CqOD2t_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jun 28, 2016 at 12:24 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 21 Jun 2016 13:36:43 -0400, Frank Hunleth wrote:
>
>> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
>> index 108fdaa..9a41bd6 100644
>> --- a/toolchain/helpers.mk
>> +++ b/toolchain/helpers.mk
>> @@ -210,7 +210,7 @@ check_glibc = \
>>  # $1: sysroot directory
>>  check_musl = \
>>       SYSROOT_DIR="$(strip $1)"; \
>> -     if test ! -f $${SYSROOT_DIR}/lib/libc.so -o -e $${SYSROOT_DIR}/lib/libm.so ; then \
>> +     if test ! \( -f $${SYSROOT_DIR}/lib/libc.so -o -f $${SYSROOT_DIR}/usr/lib/libc.so \) -o -e $${SYSROOT_DIR}/lib/libm.so ; then \
>>               echo "Incorrect selection of the C library" ; \
>
> Thanks for this patch. However, I dislike a bit this test: the test
> that libm exists is not super great, and we're really looking at
> consequences of having musl, and not whether we're using musl or not.

I completely agree. The original test didn't seem like the best test
for musl, and I like your idea of verifying the linkage of a short C
program.

I'm quite busy at the moment, but as soon as I free up, I'll play
around with it and post a revision.

Thanks,
Frank

>
> What about instead changing to:
>
>  1/ Building a minimal C program "int main(void) { return 0; }"
>
>  2/ Check if the program interpreter contains /lib/ld-musl or not ?
>
> I.e:
>
> thomas at skate:~/nerves-mipsel-unknown-linux-musl-linux-x86_64-v0.6.3$ cat foo.c
> int main(void) { return 0; }
> thomas at skate:~/nerves-mipsel-unknown-linux-musl-linux-x86_64-v0.6.3$ ./bin/mipsel-unknown-linux-musl-gcc -o foo foo.c
> thomas at skate:~/nerves-mipsel-unknown-linux-musl-linux-x86_64-v0.6.3$ ./bin/mipsel-unknown-linux-musl-readelf -a foo | grep "program interpreter"
>       [Requesting program interpreter: /lib/ld-musl-mipsel.so.1]
>
> This would, IMO, be a much better solution. What do you think?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Frank Hunleth
Troodon Software LLC
Embedded Software Development
http://troodon-software.com/
