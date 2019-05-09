From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 9 May 2019 11:34:30 -0700
Subject: [Buildroot] uclibc-ng built with wrong _FILE_OFFSET_BITS
Message-ID: <CAMo8BfKY5TyJeF=-toMXQZ1SWwM1ymn+3tTsi2nmoiHUUFeb5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've tried to run uclibc-ng tests on xtensa in a buildroot-built rootfs
and found misc/tst-preadvwritev failing with the following message:

  first buffer from first preadv different than expected

Digging deeper into it I've found that the test is built with the following
definition in the command line: -D_FILE_OFFSET_BITS=64,
due to the following line in the uclibc-ng-test.mk:

  UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)"

but uclibc-ng itself does not have -D_FILE_OFFSET_BITS=64,
because of the following definition in the uclibc-ng.mk:

  UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)"

uclibc-ng defaults to 32-bit off_t type then.
I'm not sure what's broken here, buildroot or uclibc-ng. Ideas?

-- 
Thanks.
-- Max
