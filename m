From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Sun, 21 Aug 2016 11:27:42 -0400
Subject: [Buildroot] rust?
In-Reply-To: <20160821140104.15222c1b@free-electrons.com>
References: <CAK7rcp_PjZ996EDpV6jH_Bf+MQ6d37Sc+xd67g5Fyup4J-F2Bw@mail.gmail.com>
 <20160820223145.497a1f2d@free-electrons.com>
 <CAK7rcp_0b+G66kST51=mugcCb=aZy8y-H5Q-O5p42JSFLtKZ_w@mail.gmail.com>
 <20160821140104.15222c1b@free-electrons.com>
Message-ID: <CAK7rcp8iBbY-Q3gM+JSjQk9g80FAbsM6S_0=ONbE2_pdisuetw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 21, 2016 at 8:01 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sat, 20 Aug 2016 18:43:06 -0400, Kenneth Adam Miller wrote:
>
>> The issue that I'm having with building rust is that it appears that
>> the crosstool compiler linking step is adding not only uclibc, but
>> also references to libc.
>
> uClibc is precisely what provides libc, libpthread, librt, and several
> other libraries.
>
>> ldd output for a given rust cross compile
>> target with uclibc includes the following:
>>
>>
>>     linux-vdso.so.1 =>  (0x00007ffe997ca000)
>>     libdl.so.1 => not found
>>     librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007f6a13bfa000)
>>     libpthread.so.1 => not found
>>     libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f6a139e4000)
>>     libc.so.1 => not found
>>     ld64-uClibc.so.1 => not found
>>     libm.so.1 => not found
>>     libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0
>> (0x00007f6a137c7000)
>>     libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f6a133fe000)
>>     /lib64/ld-linux-x86-64.so.2 (0x00007f6a1420a000)
>
> I don't see how this can be the output of ldd, since you have two
> references to libc (libc.so.1 and libc.so.6) and two references to
> libpthread (libpthread.so.1, libpthread.so.0).
>

Well, probably the linking part went wrong somehow. I don't know that
I did anything in particular to intervene with that or not, but that's
the output.

>> I'm not sure if that means that my compiling rust outside of buildroot
>> is the source of the error or not. I'm pretty sure that ld64-uclibc.so
>
> ld64-uclibc.so is only the dynamic loader. Your program must at least
> link with libc.so, and possibly with other libraries provided by the C
> library (libpthread, librt, libdl, etc.).

Ok good, that gives these issues rest then.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
