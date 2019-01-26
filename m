From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Jan 2019 15:09:50 +0100
Subject: [Buildroot] Building host-python-2.7.15 Failed
In-Reply-To: <CAAsE_udvpXEBB_euZymg+QHajf5oC5SSywpOCvoiY=Oyan2Xog@mail.gmail.com>
References: <CAAsE_udvpXEBB_euZymg+QHajf5oC5SSywpOCvoiY=Oyan2Xog@mail.gmail.com>
Message-ID: <20190126150950.20114d4e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Jan 2019 00:15:36 +0800, Woody Wu wrote:

> /usr/bin/gcc -pthread -shared
> -L/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/lib
> -Wl,-rpath,/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/lib
> -Wl,--enable-new-dtags
> build/temp.linux-x86_64-2.7/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/build/host-python-2.7.15/Modules/cryptmodule.o
> -L/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/lib
> -L/usr/lib/x86_64-linux-gnu -L/usr/local/lib -L. -lcrypt -lpython2.7 -o
> build/lib.linux-x86_64-2.7/crypt.so
> /usr/bin/ld: /usr/lib/x86_64-linux-gnu/libcrypt.a(crypt-entry.o):
> relocation R_X86_64_PC32 against symbol `_ufc_foobar' can not be used when
> making a shared object; recompile with -fPIC
> /usr/bin/ld: final link failed: bad value
> collect2: error: ld returned 1 exit status

The problem here is that it is trying to build a shared library
(Python module crypt.so), which uses the system libcrypt library.
However, it seems like on your system only the static version of
libcrypt is available, and this static version is not compiled with
-fPIC, which is OK but makes it unsuitable for linking in a shared
library.

Could you check why you don't have libcrypt.so available on your
system ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
