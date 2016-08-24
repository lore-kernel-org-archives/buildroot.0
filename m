From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Tue, 23 Aug 2016 20:47:33 -0400
Subject: [Buildroot] rust?
In-Reply-To: <4da48b8a-2226-6f88-c3dc-8b90ccd7dd11@mind.be>
References: <CAK7rcp_PjZ996EDpV6jH_Bf+MQ6d37Sc+xd67g5Fyup4J-F2Bw@mail.gmail.com>
 <20160820223145.497a1f2d@free-electrons.com>
 <CAK7rcp_0b+G66kST51=mugcCb=aZy8y-H5Q-O5p42JSFLtKZ_w@mail.gmail.com>
 <4da48b8a-2226-6f88-c3dc-8b90ccd7dd11@mind.be>
Message-ID: <CAK7rcp9=VhUnDLOP3xa-F=_2KiE7wtGqk+74TdLKx5xs+=_GhQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 23, 2016 at 8:38 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 21-08-16 00:43, Kenneth Adam Miller wrote:
>> The issue that I'm having with building rust is that it appears that
>> the crosstool compiler linking step is adding not only uclibc, but
>> also references to libc. ldd output for a given rust cross compile
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
>>
>> I'm not sure if that means that my compiling rust outside of buildroot
>> is the source of the error or not. I'm pretty sure that ld64-uclibc.so
>> is the intended C implementation, but that the two libc instances
>> referenced should not even be there. Any confirmation?
>
>  You seem to be building a uClibc-based toolchain, which means that you can't
> use ldd (that's a glibc tool). My guess is that you are using your host ldd to
> try to interpret a target ELF file. That _seems_ to work because your host and
> target are both x86_64, but you get weird output like above.
>

Well, I wasn't expecting the resolved locations to be correct, and in
fact I wasn't concerned about those. I was just checking what all
libraries were listed.

As it turns out, I managed to get things linked correctly using
buildroot's internal toolchain.

>  To check which dynamic libraries are used by an executable, you can only use
> 'readelf -d'. In the buildroot case, it's very easy to find which library is
> then actually used, because all libraries are installed in target/lib or
> target/usr/lib.

Thanks for this tip.

>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
