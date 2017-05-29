From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 09:07:39 +0200
Subject: [Buildroot] [PATCH] package/expect: don't tells the linker to
 search for libraries in /usr/lib
In-Reply-To: <20170528203721.21138-1-romain.naour@gmail.com>
References: <20170528203721.21138-1-romain.naour@gmail.com>
Message-ID: <20170529090739.257b0182@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 May 2017 22:37:21 +0200, Romain Naour wrote:

> [...]/x86_64-linux-gcc \
>     -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
>     -Os  -pipe -O2 -fomit-frame-pointer -Wall -fPIC -D_LARGEFILE_SOURCE \
>     -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
>     -Wl,--export-dynamic  \
>     -o expect exp_main_exp.o \
>     -L[...]/output/build/expect-2014-05-02 -lexpect5.45.3 \
>     -L[...]/output/build/tcl-8.6.6/unix -ltcl8.6 \
>     -ldl   \
>     -Wl,-rpath,/usr/lib \
>     -Wl,-rpath,/usr/lib/expect5.45.3

Problem is that /usr/lib/expect5.45.3 is a non-standard library path.
So if the expect binary does not have a RPATH to this location, it
won't find the shared libraries in /usr/lib/expect5.45.3, unless they
are explicitly dlopen()ed.

Have you verified that?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
