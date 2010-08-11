From: Will Newton <will.newton@gmail.com>
Date: Wed, 11 Aug 2010 16:19:31 +0100
Subject: [Buildroot] Build failure with 2010.08-rc1
In-Reply-To: <20100811155535.593127a3@surf>
References: <AANLkTikDrKuuL2q6Mp_rL-MFVg4nBoTMJeHiGAXFJoM-@mail.gmail.com>
	<AANLkTikMVTNWWPhg1N_30m1MsLmuSv6yjya7j76oW_v4@mail.gmail.com>
	<20100810182338.5c2b987c@surf>
	<AANLkTi=O6T5Moy50MCccGEx=_fL5KHLJ3bv39ogGn6AK@mail.gmail.com>
	<20100811155535.593127a3@surf>
Message-ID: <AANLkTi=Qrco8D8kFjh2FUehMO_gV5MMb-qA-qOJc+17-@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 11, 2010 at 2:55 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Wed, 11 Aug 2010 14:43:26 +0100
> Will Newton <will.newton@gmail.com> wrote:
>
>> -g -Os -c ctype_members.cc ?-fPIC -DPIC -o .libs/ctype_members.o
>> ctype_members.cc: In constructor
>> 'std::ctype_byname<_CharT>::ctype_byname(const char*, size_t) [with
>> _CharT = char]':
>> ctype_members.cc:59: error: invalid use of incomplete type 'struct
>> __uclibc_locale_struct'
>> /home/ldap/wnewton/src/git/buildroot/output/staging/usr/i686-unknown-linux-uclibc/sys-include/bits/uClibc_locale.h:85:
>> error: forward declaration of 'struct __uclibc_locale_struct'
>> ctype_members.cc:60: error: invalid use of incomplete type 'struct
>> __uclibc_locale_struct'
>> /home/ldap/wnewton/src/git/buildroot/output/staging/usr/i686-unknown-linux-uclibc/sys-include/bits/uClibc_locale.h:85:
>> error: forward declaration of 'struct __uclibc_locale_struct'
>> ctype_members.cc:61: error: invalid use of incomplete type 'struct
>> __uclibc_locale_struct'
>> /home/ldap/wnewton/src/git/buildroot/output/staging/usr/i686-unknown-linux-uclibc/sys-include/bits/uClibc_locale.h:85:
>> error: forward declaration of 'struct __uclibc_locale_struct'
>> make[5]: *** [ctype_members.lo] Error 1
>> make[5]: *** Waiting for unfinished jobs....
>> make[5]: Leaving directory
>> `/home/ldap/wnewton/src/git/buildroot/output/toolchain/gcc-4.2.4-final/i686-unknown-linux-uclibc/libstdc++-v3/src'
>>
>> Time to turn off uClibc locales I think...
>
> Ah, ah. I thought this problem was only affecting the AVR32
> architecture, so we added 60f945e47a15e10f0e777f69b05492b6f7ba918d to
> the tree to prevent uClibc 0.9.31 + C++ + locale from being choosen on
> AVR32. But it seems that 0.9.31 + C++ + locale fails to build on any
> architecture with gcc 4.2.
>
> I've discussed the issue a few weeks ago with Berhnard on IRC, but I
> didn't quite get what the solution was.
>
> Concerning the original problem, I've started discussing with Khem on
> IRC, but he didn't manage to reproduce it for some reason. One possible
> solution is to somehow revert to the two-stage gcc build procedure for
> gcc 4.2 and use the three-stage gcc build procedure only for gcc 4.3+.
> But I'd prefer to have Khem opinion on this beforehand.

It should be fairly simple to reproduce with a clean cloned tree:

# make i686_defconfig
# make menuconfig (switch compiler to 4.2.4)
# make

I disabled locales and the build almost completes successfully with my
hack in place, but unfortunately gdbserver and busybox fail to build
claiming there is no usleep defined:

libbb/lib.a(inet_common.o): In function `INET_rresolve':
inet_common.c:(.text.INET_rresolve+0xa8): warning: gethostbyaddr is
obsolescent, use getaddrinfo() instead.
util-linux/lib.a(mount.o): In function `nfsmount':
mount.c:(.text.nfsmount+0xdb): warning: gethostbyname is obsolescent,
use getnameinfo() instead.
miscutils/lib.a(beep.o): In function `beep_main':
beep.c:(.text.beep_main+0xf1): undefined reference to `usleep'
beep.c:(.text.beep_main+0x10d): undefined reference to `usleep'
miscutils/lib.a(watchdog.o): In function `watchdog_main':
watchdog.c:(.text.watchdog_main+0xfb): undefined reference to `usleep'
networking/lib.a(ifupdown.o): In function `dhcp_down':
ifupdown.c:(.text.dhcp_down+0x1d): undefined reference to `usleep'
networking/lib.a(traceroute.o): In function `common_traceroute_main':
traceroute.c:(.text.common_traceroute_main+0x5c3): undefined reference
to `usleep'
procps/lib.a(top.o):top.c:(.text.top_main+0x216): more undefined
references to `usleep' follow
collect2: ld returned 1 exit status
make[1]: *** [busybox_unstripped] Error 1
make[1]: Leaving directory
`/home/ldap/wnewton/src/git/buildroot/output/build/busybox-1.17.1'

I'm not sure why that is happening yet...
