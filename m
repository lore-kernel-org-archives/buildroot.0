From: Sergey Naumov <sknaumov@gmail.com>
Date: Tue, 18 Jun 2019 12:58:52 +0300
Subject: [Buildroot] Buildroot 2016.05: no path to staging for one
 toolchain
In-Reply-To: <20190617172713.GF2216@scaer>
References: <CAH3pVZN5cJfVmgiFxfNKgLy1YZO3ArpZc3DmRgGCc9Gv=Ya4Kw@mail.gmail.com>
 <20190617172713.GF2216@scaer>
Message-ID: <CAH3pVZPe+NF5wb2bp_n_28dAF4dCwoChDgQ8JxYSF3n5Cyn0kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann.

Thanks for your response. I've managed to find the root cause and fix it.
Unlike other toolchains I experienced problems with, this one correctly
reported path to libc.a to find a sysroot, but the problem was that
--sysroot option which toolchain-wrapper.c provides, not resulted into new
headers search path for this toolchain.

I digged into buildroot source code and found out that I can use
BR2_TARGET_OPTIMIZATION option to provide additional CFLAGS.
BR2_TARGET_OPTIMIZATION="-isystem =/usr/include" resolved the problem.

Also I do not know whether there is a problem in recent buildroot, but in
2016.05 attempt to specify alternative "march" to buildroot config always
resulted in overriding of provided value with default "mips32" one. I had
to make the following little patch to fix it:

config BR2_GCC_TARGET_ARCH
-       string
+       string "march"

Thanks,
Sergey.

??, 17 ???. 2019 ?. ? 20:27, Yann E. MORIN <yann.morin.1998@free.fr>:

> Segey, All,
>
> First of all, your title is about Buildroot 2016.05: are you really
> still usign that version? If so, this is a three-year old version, so
> don;t expect much support on that old version.
>
> On 2019-06-17 12:31 +0300, Sergey Naumov spake thusly:
> > Hello.
> > I've integrated multiple external toolchains into Buildroot so far, but
> I see the issue I've never seen before:
> > When compiling openssl, zlib.h header can't be found. I checked paths
> compiler looks for headers, and see the following:
> > ~/git/buildroot-oem/output/build/openssl-1.0.2k/crypto/comp$
> >
> LD_LIBRARY_PATH=/home/snaumov/git/buildroot-oem/toolchain/crosstools-mips-gcc-4.6-linux-3.4-uclibc-0.9.32-binutils-2.21.Rel1.2/usr/lib
>
> Setting LD_LIBRARY_PATH shjould not be needed, especially since it is
> known to actuall y break some packages, and we've remove use of it a
> long time ago (evem before 2016.05).
>
> > /home/snaumov/git/buildroot-oem/output/host/usr/bin/mips-linux-gcc -I..
> -I../.. -I../modes -I../asn1 -I../evp -I../../include
> >  -fPIC -DOPENSSL_PIC -DZLIB_SHARED -DZLIB -DOPENSSL_THREADS -D_REENTRANT
> -DDSO_DLFCN -DHAVE_DLFCN_H -D_LARGEFILE_SOURCE
> > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -ffunction-sections
> -fdata-sections -fomit-frame-pointer -Wall
> > -c -o c_zlib.o c_zlib.c -E -Wp,-v
> > #include "..." search starts here:
> > #include <...> search starts here:
> >  ..
> >  ../..
> >  ../modes
> >  ../asn1
> >  ../evp
> >  ../../include
> >
>  /home/snaumov/git/buildroot-oem/toolchain/rsdk-1.5.6-5281-EB-2.6.30-0.9.30.3-131105/include
> >
>  /home/snaumov/git/buildroot-oem/toolchain/rsdk-1.5.6-5281-EB-2.6.30-0.9.30.3-131105/include/gcc
>
> So, we have had a report (and a patch) about the RSDK toolchains in the
> past:
>     https://patchwork.ozlabs.org/patch/947617/
>
> Could you try that and report? It is indeed a very old patch, not yet
> applied, because the problem could not be reproduced (I think) because
> the RSDK toolchain is not available publicly (is it?)
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190618/b4b35f3b/attachment.html>
