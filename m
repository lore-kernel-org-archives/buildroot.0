From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 20:26:30 +0200
Subject: [Buildroot] [PATCH v2 2/2] configs/qemu_riscv32_virt: Update to
 5.1 kernel
In-Reply-To: <CAKmqyKOA1JxWX0EZ1aBa5AGYBbTpDPXPusUthfR-Y3QXyg4ZzQ@mail.gmail.com>
References: <20190619165406.19615-1-alistair.francis@wdc.com>
 <20190619165406.19615-2-alistair.francis@wdc.com>
 <20190620155715.23c40f26@windsurf>
 <CAKmqyKMudH+KpKrF3kwkK6SudHt0Ysg_v1JnBS_BO9jXk3DR+g@mail.gmail.com>
 <58cf6eb8-6e90-1a36-1339-ba5a12c51cad@embecosm.com>
 <CAKmqyKPR0-FfVgENsyM7hodee-aOTYd4odPqB9axx0_secq4MQ@mail.gmail.com>
 <CAKmqyKOA1JxWX0EZ1aBa5AGYBbTpDPXPusUthfR-Y3QXyg4ZzQ@mail.gmail.com>
Message-ID: <20190620202630.133c7d35@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Jun 2019 10:54:27 -0700
Alistair Francis <alistair23@gmail.com> wrote:

> > Yep, it's not working for me now either. I think the Linux patch is
> > somehow not being applied. I'll investigate.  
> 
> The conversion to the BR2_GLOBAL_PATCH_DIR mechanism broke the build.
> I'll send a patch now that fixes it.

Argh, sorry about that :-/

However, if the patch is needed to be able to build the toolchain, then
there is a larger problem: it shouldn't be just this defconfig that has
the patch.

In fact, now that I think of it, I remember doing a rebuild of
toolchains recently, and riscv32 was indeed failing with:

In file included from ../sysdeps/unix/sysv/linux/lowlevellock-futex.h:23:0,
                 from ../sysdeps/nptl/lowlevellock.h:23,
                 from ../sysdeps/nptl/libc-lockP.h:33,
                 from ../sysdeps/nptl/libc-lock.h:184,
                 from gconv_db.c:26:
gconv_db.c: In function '__gconv_find_transform':
../sysdeps/unix/sysv/linux/riscv/sysdep.h:120:31: error: '__NR_futex' undeclared (first use in this function); did you mean '__futex'?
 #define SYS_ify(syscall_name) __NR_##syscall_name
                               ^
../sysdeps/unix/sysv/linux/riscv/sysdep.h:232:38: note: in definition of macro 'internal_syscall4'
  register long int __a7 asm ("a7") = number;   \
                                      ^~~~~~
../sysdeps/unix/sysv/linux/riscv/sysdep.h:151:24: note: in expansion of macro 'SYS_ify'
  internal_syscall##nr (SYS_ify (name), err, args)
                        ^~~~~~~

And this should be fixed somehow.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
