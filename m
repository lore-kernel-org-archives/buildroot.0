From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Jul 2013 23:38:31 +0200
Subject: [Buildroot] Two or three stages gcc build?
Message-ID: <20130705233831.12030038@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Khem,

(This e-mail is Cc'ed to the crossgcc@ and the buildroot@ mailing lists)

We started discussing on IRC about whether a three stage or a two stage
gcc build was needed, but seems like due to timezone issues, we're not
able to discuss simultaneously, so I'm trying to do things by e-mail. I
would like to understand a little bit better since when we can get back
to a two stages gcc build process instead of the three stages build
process that was needed since the introduction of NPTL support.

Currently, what we have in Buildroot is:

 1. Build gcc initial (--without-headers --with-newlib --disable-shared)

 2. Configure uClibc, install headers, crti.o, crtn.o, crt1.o, install
    a fake libc.so and libm.so (just empty C files being compiled as a
    share library)

 3. Build gcc intermediate (no special options passed)

 4. Build uClibc and install it.

 5. Build gcc final

Apparently, this three stage build process is no longer needed. In
OE-Core, you did the following commit:

commit b0faebd1f07e1616004bd19664395932e7c2c48f
Author: Khem Raj <raj.khem@gmail.com>
Date:   Wed Aug 15 23:12:51 2012 -0700

    gcc-cross: Make gcc-cross-initial as the only intermediate gcc stage
    
    Now glibc can be compiled with gcc-cross-initial therefore prepare
    the stage to drop gcc-cross-intermediate
    
    Also drop arm-nolibfloat.patch should not be needed anymore
    half of changes in this patch are meant for OABI which we dont
    use anymore
    
    (From OE-Core rev: 30617bde61a3b0a0944b49a0c9fb7159dacbb19f)
    
    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

So according to this, the fact that we can go back to a two stages
build seems to be related to glibc. So what happens to uClibc in this
case?

In fe9a576e8d27460468dfe5eac90aad49ab26a8d3 (gcc-cross-intermediate,
gcc-crosssdk-intermediate: Remove) you completely remove the
intermediate recipes, so I assume they are really no longer needed,
even by the uClibc build, since I believe OE-core also supports uClibc
builds (thanks to your work).

Could you explain in more details which version of gcc or glibc/uClibc
made it possible to go back to a 2-stages build? Both Yann E. Morin
(for Crosstool-NG) and myself (for Buildroot) are interested in
understanding this in order to improve those tools. Also, what should
be the two stages now? Just:

 1. Build gcc initial (no C library at all)
 2. Build C library completely
 3. Build gcc final

 ?

Thanks for your insights,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
