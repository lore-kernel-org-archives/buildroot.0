From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Sat, 20 Aug 2016 18:43:06 -0400
Subject: [Buildroot] rust?
In-Reply-To: <20160820223145.497a1f2d@free-electrons.com>
References: <CAK7rcp_PjZ996EDpV6jH_Bf+MQ6d37Sc+xd67g5Fyup4J-F2Bw@mail.gmail.com>
 <20160820223145.497a1f2d@free-electrons.com>
Message-ID: <CAK7rcp_0b+G66kST51=mugcCb=aZy8y-H5Q-O5p42JSFLtKZ_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Aug 20, 2016 at 4:31 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sat, 20 Aug 2016 14:04:46 -0400, Kenneth Adam Miller wrote:
>> So, is anybody following this:
>>
>>
>> https://github.com/elebihan/buildroot.git
>>
>> ?
>
> We don't need to follow it: Eric is a regular Buildroot contributor,
> and he has already submitted the rust support in Buildroot:
>
>   https://patchwork.ozlabs.org/patch/648613/
>   https://patchwork.ozlabs.org/patch/648614/
>
>> I'm trying to use it to compile a particular version of rust and cargo
>> with the buildroot internal cross compilers in order to add a uclibc
>> target. There doesn't seem to be much direction on how to use the
>> scripts included in order to add a particular target. In particular, I
>> had to make some modifications to even make it useful to enable uclibc
>> as a potential target. Does someone have an example invocation that
>> can be used to derive a valid buildroot target? Because I got errors
>> trying to use the python script. I think that's all that I need, is an
>> example.
>
> I'm Cc'ing Eric, hopefully he can help with those questions.
>

Ok thanks.

The issue that I'm having with building rust is that it appears that
the crosstool compiler linking step is adding not only uclibc, but
also references to libc. ldd output for a given rust cross compile
target with uclibc includes the following:


    linux-vdso.so.1 =>  (0x00007ffe997ca000)
    libdl.so.1 => not found
    librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007f6a13bfa000)
    libpthread.so.1 => not found
    libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f6a139e4000)
    libc.so.1 => not found
    ld64-uClibc.so.1 => not found
    libm.so.1 => not found
    libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0
(0x00007f6a137c7000)
    libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f6a133fe000)
    /lib64/ld-linux-x86-64.so.2 (0x00007f6a1420a000)

I'm not sure if that means that my compiling rust outside of buildroot
is the source of the error or not. I'm pretty sure that ld64-uclibc.so
is the intended C implementation, but that the two libc instances
referenced should not even be there. Any confirmation?


Also, I'm a bit concerned about the need for gcc_s, librt, libdl and
libm; can a buildroot based bzImage have these? If so, what packages
would they be in?

> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
