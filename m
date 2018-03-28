From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 28 Mar 2018 22:37:38 +0200
Subject: [Buildroot] Allow building a toolchain without (non-trivial)
 dependencies
In-Reply-To: <20180328192536.GB3533@scaer>
References: <CADYdroNk0nCYZTZt6aVact8URP_fDu5x9pPkKRMHoYEw_KtmdA@mail.gmail.com>
 <20180328192536.GB3533@scaer>
Message-ID: <CADYdroNtgi8Lum7FApJbW_z6RQ3dvs-_fQ5EnHgRFQ9=JS7TUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Its more flexible, more complicated and the non-discriminating path
search and replace script is just asking for some silent breakage
haunting you once a year.

Different tastes I guess, I would be looking for something that's the
clean, bare minimum without all the auxiliary build-time tools (m4).
My plan was letting build-root run, then do a manual "DESTDIR=/hugo
make install" just on gcc, C library and binutils.

The other way is issue as far as I understood, using externally
toolchains with buildroot. Looks like I am gonna try that.

Thanks anyway.

Kind regards,
Norbert

2018-03-28 21:25 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> Norbert, All,
>
> On 2018-03-28 20:57 +0200, Norbert Lange spake thusly:
>> I would like to have an option to make a reasonable "portable" toolchain,
>> means no dependencies apart from the C libs (libc libm libdl).
>>
>> As you see below, I cant run the toolchain without keeping the libs
>> around and setting the LD path,
>> limiting its use outside the (locally built) rootfs.
>>
>> ie. all support libs from gcc should be optionally linked statically
>>
>> $ ldd cc1plus
>> linux-vdso.so.1 (0x00007ffdacd5e000)
>> libisl.so.15 => /usr/lib/x86_64-linux-gnu/libisl.so.15 (0x00007f591aad0000)
>> libmpc.so.3 => /usr/lib/x86_64-linux-gnu/libmpc.so.3 (0x00007f591a8b7000)
>> libmpfr.so.4 => not found
>> libgmp.so.10 => /usr/lib/x86_64-linux-gnu/libgmp.so.10 (0x00007f591a633000)
>> libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f591a42f000)
>> libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f591a09c000)
>> libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f5919ce2000)
>> /lib64/ld-linux-x86-64.so.2 (0x00007f591ae78000)
>> libmpfr.so.6 => /usr/lib/x86_64-linux-gnu/libmpfr.so.6 (0x00007f5919a60000)
>
> Not so long ago, we introduced the notion of 'SDK', whereby you build
> your toolchain, and as many libraries you want (which can be none for
> a pure toolchain), and distribute that as an SDK, as explained in the
> manual:
>
> https://buildroot.org/downloads/manual/manual.html#_using_the_generated_toolchain_outside_buildroot
>
> This is basically a three-step procedure:
>
>   - first, you generate the SDK,
>
>   - then you distribute the content of the host/ directory (supposedly
>     as a tarball or other such archive),
>
>   - the user extracts it and run a script that fixes the SDK for local
>     use (presumable in another directory).
>
> That is more flexible than just doing a static link of the toolchain,
> and covers the case of distributing the toolchain too, so there we go...
> ;-)
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
