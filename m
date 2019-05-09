From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 9 May 2019 14:10:39 -0700
Subject: [Buildroot] uclibc-ng built with wrong _FILE_OFFSET_BITS
In-Reply-To: <CAMo8BfKY5TyJeF=-toMXQZ1SWwM1ymn+3tTsi2nmoiHUUFeb5w@mail.gmail.com>
References: <CAMo8BfKY5TyJeF=-toMXQZ1SWwM1ymn+3tTsi2nmoiHUUFeb5w@mail.gmail.com>
Message-ID: <CAMo8Bf+9WcBQnt2O9DampeSE2wWFYrKrOE1KQVED+ynOArrhMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 9, 2019 at 11:34 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
> I've tried to run uclibc-ng tests on xtensa in a buildroot-built rootfs
> and found misc/tst-preadvwritev failing with the following message:
>
>   first buffer from first preadv different than expected
>
> Digging deeper into it I've found that the test is built with the following
> definition in the command line: -D_FILE_OFFSET_BITS=64,
> due to the following line in the uclibc-ng-test.mk:
>
>   UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)"
>
> but uclibc-ng itself does not have -D_FILE_OFFSET_BITS=64,
> because of the following definition in the uclibc-ng.mk:
>
>   UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)"
>
> uclibc-ng defaults to 32-bit off_t type then.
> I'm not sure what's broken here, buildroot or uclibc-ng. Ideas?

Ok, I see something definitely strange in the uclibc-ng:
ublibc-ng does not honor -D_FILE_OFFSET_BITS=64
when it's passed to it in the make command, because
the following fragment of the include/features.h that defines
__USE_FILE_OFFSET64 based on the value of
_FILE_OFFSET_BITS

#if defined _FILE_OFFSET_BITS && _FILE_OFFSET_BITS == 64
# define __USE_FILE_OFFSET64    1
#endif

is neutralized by the following fragment at the end of the same file:

#ifdef _LIBC
#  undef _FILE_OFFSET_BITS
#  undef __USE_FILE_OFFSET64
# include <libc-internal.h>
#endif

--
Thanks.
-- Max
