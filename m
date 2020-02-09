From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 9 Feb 2020 20:01:44 +0100
Subject: [Buildroot] [PATCH] package/uclibc: fix ctype.h is*_l
 definitions
In-Reply-To: <20200209163842.GT23769@scaer>
References: <20200207195144.4060-1-jcmvbkbc@gmail.com>
 <87mu9tv5qu.fsf@dell.be.48ers.dk> <20200209163842.GT23769@scaer>
Message-ID: <2675df01-0793-0d16-17b2-4b17477fe317@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Yann, Max, All,

Le 09/02/2020 ? 17:38, Yann E. MORIN a ?crit?:
> Max, All,
> 
> On 2020-02-08 09:32 +0100, Peter Korsgaard spake thusly:
>>>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:
>>
>>  > ctype locale-specific macro definitions are broken because they result
>>  > in dereference of pointer to structure of incomplete type.
>>  > Drop these macros since they are optional and let applications use
>>  > functions with the same names.
>>
>>  > Backported from:
>>  >   https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=d1a3ca7ca56630fddde7311a0474eed4a21335a7
>>  > Fixes:
>>  >   http://autobuild.buildroot.net/results/b7ba1210d5aa184b133f0171da621d2b0083ec39
>>
>>  > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
>>
>> Committed, thanks.
> 
> uClibc now fails to build:
>     http://autobuild.buildroot.org/results/124/124e8ad32e1dbaf131749456f4b59333623cd91f/build-end.log
> 
>     home/test/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-build
>     root-linux-uclibc/8.3.0/../../../../xtensa-buildroot-linux-uclibc/bin
>     /ld: libc/libc_so.a(isalnum_l.os):(.text+0x0): undefined reference to
>     `__isctype_l'
> 
> Care to have a look, please?

There are new issues on other target related to this change:

(host-gcc-final for arm)

http://autobuild.buildroot.net/results/36f/36ff953212b49875ef47f17f8e2fa817199391b0//host-gcc-final-8.3.0/build/arm-buildroot-linux-uclibcgnueabi/libatomic/config.log

host-gcc-final for arc)

http://autobuild.buildroot.net/results/8ce/8ce70ba8a7a7c767ad51becccfb4ab15f35d1c31//host-gcc-final-arc-2019.09-release/build/arc-buildroot-linux-uclibc/libatomic/config.log

arc-buildroot-linux-uclibc/bin/ld: sysroot/usr/lib/libc.a(isspace_l.os): in
function `__isspace_l':
isspace_l.c:(.text+0xc): undefined reference to `__isctype_l'
arc-buildroot-linux-uclibc/bin/ld: isspace_l.c:(.text+0xc): undefined reference
to `__isctype_l'
arc-buildroot-linux-uclibc/bin/ld: GOT and PLT relocations cannot be fixed with
a non dynamic linker
arc-buildroot-linux-uclibc/bin/ld: final link failed: bad value

Best regards,
Romain

> 
> Regards,
> Yann E. MORIN.
> 
