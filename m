From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 25 Jun 2018 22:50:49 +0200
Subject: [Buildroot] [PATCH] gcc: fix uclibc build with gcc-8 for xtensa
In-Reply-To: <20180619202706.17347-1-jcmvbkbc@gmail.com>
References: <20180619202706.17347-1-jcmvbkbc@gmail.com>
Message-ID: <eaba9b03-f0b0-b972-68ff-034a78d9048a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,

Le 19/06/2018 ? 22:27, Max Filippov a ?crit?:
> gcc-8.1 for xtensa miscompiles uClibc dynamic linker due to gcc PR
> target/65416. The build completes successfully, but the binary is
> non-functional because the following fragment in the _dl_get_ready_to_run
> in ld-uClibc.so overwrites register spill area on stack causing register
> corruption in the previous call frame and a subsequent crash:
> 
>     419f:       f0c1b2          addi    a11, a1, -16
>     41a2:       1ba9            s32i.n  a10, a11, 4
>     41a4:       0bc9            s32i.n  a12, a11, 0
>     41a6:       5127f2          l32i    a15, a7, 0x144
>     41a9:       1765b2          s32i    a11, a5, 92
>     41ac:       4e2782          l32i    a8, a7, 0x138
>     41af:       146af2          s32i    a15, a10, 80
>     41b2:       001b10          movsp   a1, a11
> 
> The crash terminates the init process and causes kernel panic.
> The fix prevents reordering of movsp opcode and any access to the stack
> frame memory and is applicable to all existing gcc versions..
> 

Thanks for the patch!

Do you know what changed in gcc 8.0 that trigger this issue ?

I tried to use git bisect to find the culprit commit, the last working gcc
commit is 5266910fed23d6d7f101a878dd8a28d178697ec5 (2017-06-28) and this "first"
broken commit is 7051d2393d15d0d1b848768a6f2767c75aa4b5cd (2017-07-06) but I
gave up due to lack of time...

Best regards,
Romain
