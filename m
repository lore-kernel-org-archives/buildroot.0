From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 05 Apr 2021 17:42:01 +0300
Subject: [Buildroot] Busybox install error
In-Reply-To: <MWHPR02MB236895429FB7ADEBC694608FF1779@MWHPR02MB2368.namprd02.prod.outlook.com>
References: <MWHPR02MB236895429FB7ADEBC694608FF1779@MWHPR02MB2368.namprd02.prod.outlook.com>
Message-ID: <87blas7pza.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nicolas,

On Mon, Apr 05 2021, Nicolas Chango wrote:
> I would like to install busybox on ubuntu 20.04,
>
> I used the following code :
>
> $git clone git://git.busybox.net/busybox
> $cd busybox
> $git checkout 1_26_stable
> $make defconfig
> $make
>
> After the last command, I have the following error message :
>
> LINK    busybox_unstripped
> Trying libraries: crypt m
> Failed: -Wl,--start-group  -lcrypt -lm  -Wl,--end-group
> Output of:
> gcc -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-builtin-printf -Os -o busybox_unstripped -Wl,--sort-common -Wl,--sort-section,alignment -Wl,--gc-sections -Wl,--start-group applets/built-in.o archival/lib.a archival/libarchive/lib.a console-tools/lib.a coreutils/lib.a coreutils/libcoreutils/lib.a debianutils/lib.a e2fsprogs/lib.a editors/lib.a findutils/lib.a init/lib.a libbb/lib.a libpwdgrp/lib.a loginutils/lib.a mailutils/lib.a miscutils/lib.a modutils/lib.a networking/lib.a networking/libiproute/lib.a networking/udhcp/lib.a printutils/lib.a procps/lib.a runit/lib.a selinux/lib.a shell/lib.a sysklogd/lib.a util-linux/lib.a util-linux/volume_id/lib.a archival/built-in.o archival/libarchive/built-in.o console-tools/built-in.o coreutils/built-in.o coreutils/libcoreutils/built-in.o debianutils/built-in.o e2fsprogs/built-in.o editors/built-in.o findutils/built-in.o init/built-in.o libbb/built-in.o libpwdgrp/built-in.o loginutils/built-in.o mailutils/built-in.o miscutils/built-in.o modutils/built-in.o networking/built-in.o networking/libiproute/built-in.o networking/udhcp/built-in.o printutils/built-in.o procps/built-in.o runit/built-in.o selinux/built-in.o shell/built-in.o sysklogd/built-in.o util-linux/built-in.o util-linux/volume_id/built-in.o -Wl,--end-group -Wl,--start-group -lcrypt -lm -Wl,--end-group
> ==========
> /usr/bin/ld: debianutils/lib.a(mktemp.o): in function `mktemp_main':
> mktemp.c:(.text.mktemp_main+0xa6): warning: the use of `mktemp' is dangerous, better use `mkstemp' or `mkdtemp'
> /usr/bin/ld: util-linux/lib.a(rdate.o): in function `rdate_main':
> rdate.c:(.text.rdate_main+0x11e): undefined reference to `stime'
> /usr/bin/ld: coreutils/lib.a(date.o): in function `date_main':
> date.c:(.text.date_main+0x27e): undefined reference to `stime'
> collect2: error: ld returned 1 exit status
> Note: if build needs additional libraries, put them in CONFIG_EXTRA_LDLIBS.
> Example: CONFIG_EXTRA_LDLIBS="pthread dl tirpc audit pam"
> make: *** [Makefile:717: busybox_unstripped] Error 1
>
> Someone can help me ?

Recent glibc removed stime(). You need to backport Busybox commit
d3539be8f27b8 ("Remove stime() function calls").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
