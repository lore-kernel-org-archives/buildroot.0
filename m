From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 25 Mar 2010 16:14:19 +0000 (UTC)
Subject: [Buildroot] external toolchain and sysroot
References: <1272730299.20100325182803@ya.ru>
Message-ID: <hog24r$1nu$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-03-25, Yury Luneff <bitterman@ya.ru> wrote:

[...]

> I'm trying to build my rootfs with this toolchain. I guess, I have 
> proper buildroot configuration, but as soon as package has it 
> dependency somewhere in new sysroot, I have linker problems:
>
> /home/yury/toolchain/arm-indigo-linux-uclibcgnueabi/bin/arm-indigo-linux-uclibcgnueabi-gcc 
> -Os -pipe -Os  --sysroot /home/yury/buildroot/output/staging/  -DAUTOCONF -DPOSIX -DUSG -c window.c
>
> I see --sysroot here and everything is ok.
>
> But in linking phase:
> /home/yury/toolchain/arm-indigo-linux-uclibcgnueabi/bin/arm-indigo-linux-uclibcgnueabi-gcc 
> -DAUTOCONF -DPOSIX -DUSG -o em ansi.o basic.o bind.o buffer.o crypt.o display.o eval.o exec.o 
> file.o fileio.o ibmpc.o input.o isearch.o line.o lock.o main.o pklock.o posix.o random.o 
> region.o search.o spawn.o tcap.o termio.o vmsvt.o vt52.o window.o word.o -lncurses
> /home/yury/toolchain/arm-indigo-linux-uclibcgnueabi/lib/gcc/arm-indigo-linux-uclibcgnueabi/4.3.4/../..
> /../../arm-indigo-linux-uclibcgnueabi/bin/ld: cannot find -lncurses
>
> here --sysroot is omitted and thus I'm very sad :-)

I know how you feel.  That's exactly the same problem I had building
busybox two weeks ago: --sysroot was passed correctly in the compile
phase, but wasn't passed in the link phase.  Apparently the external
toolchains used by the devs don't need a --sysroot during linking.
Apparently our toolchains do.

> I can't figure this out by myself. TARGET_LDFLAGS are good, 
> TARGET_CFLAGS are too.

In the busybox .mk file, I found that TARGET_LDFLAGS wasn't being used
(it wasn't being passed to the "make" command).  I had to patch the
.mk file to pass the TARGET_LDFLAGS value to make.

> It is definetely not the problem of package as openvpn doesn't find 
> openssl too and the corresponding .so files are in staging. Or it is 
> a bug in both uemacs and openvpn which is unprobable.

I don't think it's unprobably at all.  When I recently updated to the
current stable release, I found that both busybox and mtd-utils failed
to build because of missing "--sysroot" options in either compile or
link commands.  That's two packages out of the three that I have
selected that weren't passing a "--sysroot" option to the toolchain as
they should.

> I know there were problems with openvpn and external toolchains but
> it was kinda at least a year ago.
>
> Buildroot is both latest stable version and the current snapshot -- 
> the same problem.
>
> How should I find my way through?

It sounds like the .mk files are missing something.  See the following
bugs for patches that show how I fixed missing --sysroot problems for
busybox and mtd-utils:

  https://bugs.busybox.net/show_bug.cgi?id=1321
  https://bugs.busybox.net/show_bug.cgi?id=1327

-- 
Grant Edwards               grant.b.edwards        Yow! GOOD-NIGHT, everybody
                                  at               ... Now I have to go
                              gmail.com            administer FIRST-AID to my
                                                   pet LEISURE SUIT!!
