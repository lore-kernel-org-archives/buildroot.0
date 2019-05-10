From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 10 May 2019 07:08:10 -0700
Subject: [Buildroot] [uclibc-ng-devel] uclibc-ng built with wrong
 _FILE_OFFSET_BITS
In-Reply-To: <8b7f9c38-15cf-affa-b750-f2b3a2ecf4c0@kalray.eu>
References: <CAMo8BfKY5TyJeF=-toMXQZ1SWwM1ymn+3tTsi2nmoiHUUFeb5w@mail.gmail.com>
 <CAMo8Bf+9WcBQnt2O9DampeSE2wWFYrKrOE1KQVED+ynOArrhMA@mail.gmail.com>
 <8b7f9c38-15cf-affa-b750-f2b3a2ecf4c0@kalray.eu>
Message-ID: <CAMo8BfJq8zM2DiO9J96ZtPshMfV3TYmsos2UXnCwPxsXNNSzfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 10, 2019 at 6:32 AM Yann Sionneau <ysionneau@kalray.eu> wrote:
>
> If that can be of any help, this test seems to PASS on armv7 arch:
> https://uclibc-ng-ci.sionneau.net:8443/job/uclibc-ng-multiarch/arch=armv7/19/console
>
> However this bugs reproduces for mips32r6 :
> https://uclibc-ng-ci.sionneau.net:8443/job/uclibc-ng-multiarch/19/arch=mips32r6/console
>
> Also, I can confirm I am able to reproduce the issue with
> buildroot+uclibc-ng by building the qemu_xtensa_lx60_defconfig buildroot
> config

Thanks for the confirmation.
I've spent some more time on this issue and I hope have got a better
understanding of it. So:
- uclibc-ng itself is not meant to be compiled differently with
-D_FILE_OFFSET_BITS=64
  and without it. It is meant to provide both LFS and non-LFS function versions,
  like ftruncate and ftruncate64.
- the library user on the other hand gets different set of
declarations depending
  on the presence of -D_FILE_OFFSET_BITS=64, that results in a call to different
  functions.
- however this is not the case for preadv/pwritev: there's only one
definition for
  each of these functions. When libc is built these functions assume 32-bit
  off_t, but when the user code is built, off_t size is selected by the
  _FILE_OFFSET_BITS resulting in declaration that does not match definition.

I guess the right way to fix it is using __off64_t in declarations and
definitions
of both preadv/pwritev. With this change the test passes on xtensa.

-- 
Thanks.
-- Max
