From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jul 2018 23:21:44 +0200
Subject: [Buildroot] [PATCH] gcc: fix uclibc build with gcc-8 for xtensa
In-Reply-To: <20180619202706.17347-1-jcmvbkbc@gmail.com> (Max Filippov's
 message of "Tue, 19 Jun 2018 13:27:06 -0700")
References: <20180619202706.17347-1-jcmvbkbc@gmail.com>
Message-ID: <87bmb4i6jb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > gcc-8.1 for xtensa miscompiles uClibc dynamic linker due to gcc PR
 > target/65416. The build completes successfully, but the binary is
 > non-functional because the following fragment in the _dl_get_ready_to_run
 > in ld-uClibc.so overwrites register spill area on stack causing register
 > corruption in the previous call frame and a subsequent crash:

 >     419f:       f0c1b2          addi    a11, a1, -16
 >     41a2:       1ba9            s32i.n  a10, a11, 4
 >     41a4:       0bc9            s32i.n  a12, a11, 0
 >     41a6:       5127f2          l32i    a15, a7, 0x144
 >     41a9:       1765b2          s32i    a11, a5, 92
 >     41ac:       4e2782          l32i    a8, a7, 0x138
 >     41af:       146af2          s32i    a15, a10, 80
 >     41b2:       001b10          movsp   a1, a11

 > The crash terminates the init process and causes kernel panic.
 > The fix prevents reordering of movsp opcode and any access to the stack
 > frame memory and is applicable to all existing gcc versions..

 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
 > ---
 >  .../gcc/6.4.0/871-xtensa-fix-PR-target-65416.patch | 101 +++++++++++++++++++++
 >  .../7.3.0/0002-xtensa-fix-PR-target-65416.patch    | 101 +++++++++++++++++++++
 >  .../8.1.0/0004-xtensa-fix-PR-target-65416.patch    | 101 +++++++++++++++++++++

Committed to 2018.02.x and 2018.05.x after dropping the gcc-8.x patch,
thanks.

-- 
Bye, Peter Korsgaard
