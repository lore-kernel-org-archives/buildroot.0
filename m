From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 28 May 2013 13:02:39 +0100
Subject: [Buildroot] [PATCH] Add HW decoding support for Hantro x170
In-Reply-To: <20130528133906.5bfff499@skate>
References: <1369689224-492-1-git-send-email-alexandre.belloni@free-electrons.com>
 <20130528133906.5bfff499@skate>
Message-ID: <CAHt8ZCOuz5b36gHziMCoW+d57a3k14tt_pUAZwG-9xi1qQJ6ig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexandre, Thomas.

On 28 May 2013 12:39, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> As was pointed out in a previous review, this package contains
> pre-built library. And they can only work with glibc:
>
> $ readelf -d libdwlx170.so | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libc.so.6]
>
> This means that whenever something will try to load libdwlx170.so, it
> will try to find libc.so.6, which is glibc.
>
> So your package should have something like:
>
>         depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
>                 BR2_TOOLCHAIN_CTNG_eglibc || \
>                 BR2_TOOLCHAIN_CTNG_glibc
>
> with a comment above that explains why.

Indeed, this is true. I spent some time trying to get this hardware
decoder to work, and never managed to get anywhere with it. Atmel
technical support were incredibly frustrating, providing such pearls
of wisdom as:

"We found that there might be a little problem if you we use dynamic
libraries like cannot play video correctly. Our OS experts are still
working on this."

On the basis of this and other information provided by Atmel, I ended
up using the static libraries. This complicates the package makefiles
somewhat, of course; but you can presumably then avoid the restriction
to glibc.

Alexandre: have you actually managed to get the decoder to work?

Simon.
