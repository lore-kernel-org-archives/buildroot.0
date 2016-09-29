From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Sep 2016 11:41:14 +0200
Subject: [Buildroot] pppd breaks build without libutils
In-Reply-To: <20160928163439.GA3622@free.fr>
References: <CAOoxthNVzy2PCz1tsACpxdhaoVO=RZgQR-A1dMB2u0HA3yXPqA@mail.gmail.com>
 <20160925205851.18f334ec@free-electrons.com>
 <CAOoxthNdJjSjiLS7PT_SguV7VSWxHrF8UiK0qtPz+D3bDEpnUA@mail.gmail.com>
 <5cce18a6-b051-a6bf-17e0-e9fa82a1491e@mind.be>
 <20160927214325.GC8646@free.fr> <20160928105900.55310907@free-electrons.com>
 <20160928163439.GA3622@free.fr>
Message-ID: <3f845217-f8a0-1ca2-206c-5fc2776f532f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-09-16 18:34, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2016-09-28 10:59 +0200, Thomas Petazzoni spake thusly:
>> On Tue, 27 Sep 2016 23:43:25 +0200, Yann E. MORIN wrote:
>>
>>> Which suddenly rings a bell here: the latest uClibc-ng version, 1.0.18,
>>> now is one-lib, i.e. everything merged into libc.so like musl is, so
>>> we could get external toolchains which will lack libutil.so because
>>> there is no longer such a library now.
>>>
>>> If uClibc-ng does like musl does, there will be a lot of empty static
>>> versions of the libraries, libutil.a, libcrypt.a and so on, but there
>>> will no longer be shared variants.
>>>
>>> We'll have to account for that in our external toolchain handling.
>>
>> I'm not sure what needs to be handled. We already support musl that
>> does this, and it works fine. It should be perfectly transparent to the
>> external toolchain handling (except the copying of the shared libraries
>> to the target, of course).
> 
> That's exactly what I meant: currently, we copy anexplicit set of shared
> libraries from external uClibc-based toolchains:
> 
>    66 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
>    67 TOOLCHAIN_EXTERNAL_LIBS += libatomic.so.* libc.so.* libcrypt.so.*
>         libdl.so.* libgcc_s.so.* libm.so.*       libnsl.so.* libresolv.so.*
>         librt.so.* libutil.so.*
>    68 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_ARM_EABIHF),yy)
>    69 TOOLCHAIN_EXTERNAL_LIBS += ld-linux-armhf.so.*
>    70 else
>    71 TOOLCHAIN_EXTERNAL_LIBS += ld*.so.*
>    72 endif
>    73 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>    74 TOOLCHAIN_EXTERNAL_LIBS += libpthread.so.*
>    75 ifneq ($(BR2_PACKAGE_GDB)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
>    76 TOOLCHAIN_EXTERNAL_LIBS += libthread_db.so.*
>    77 endif # gdbserver
>    78 endif # ! no threads
>    79 endif
> 
> Now, old uClibc-based toolchains will have those libs, while newer ones
> will only have libc.so.* .
> 
> This is that which we need to account for.

TOOLCHAIN_EXTERNAL_LIBS is used as the -name argument of a find, so no error if
it doesn't exist. I tried adding a libfoobar.so.* and it doesn't complain (and
obviously there is no libfoobar.so.* in staging).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
