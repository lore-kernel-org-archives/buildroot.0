From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Aug 2010 15:55:35 +0200
Subject: [Buildroot] Build failure with 2010.08-rc1
In-Reply-To: <AANLkTi=O6T5Moy50MCccGEx=_fL5KHLJ3bv39ogGn6AK@mail.gmail.com>
References: <AANLkTikDrKuuL2q6Mp_rL-MFVg4nBoTMJeHiGAXFJoM-@mail.gmail.com>
	<AANLkTikMVTNWWPhg1N_30m1MsLmuSv6yjya7j76oW_v4@mail.gmail.com>
	<20100810182338.5c2b987c@surf>
	<AANLkTi=O6T5Moy50MCccGEx=_fL5KHLJ3bv39ogGn6AK@mail.gmail.com>
Message-ID: <20100811155535.593127a3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 11 Aug 2010 14:43:26 +0100
Will Newton <will.newton@gmail.com> wrote:

> -g -Os -c ctype_members.cc  -fPIC -DPIC -o .libs/ctype_members.o
> ctype_members.cc: In constructor
> 'std::ctype_byname<_CharT>::ctype_byname(const char*, size_t) [with
> _CharT = char]':
> ctype_members.cc:59: error: invalid use of incomplete type 'struct
> __uclibc_locale_struct'
> /home/ldap/wnewton/src/git/buildroot/output/staging/usr/i686-unknown-linux-uclibc/sys-include/bits/uClibc_locale.h:85:
> error: forward declaration of 'struct __uclibc_locale_struct'
> ctype_members.cc:60: error: invalid use of incomplete type 'struct
> __uclibc_locale_struct'
> /home/ldap/wnewton/src/git/buildroot/output/staging/usr/i686-unknown-linux-uclibc/sys-include/bits/uClibc_locale.h:85:
> error: forward declaration of 'struct __uclibc_locale_struct'
> ctype_members.cc:61: error: invalid use of incomplete type 'struct
> __uclibc_locale_struct'
> /home/ldap/wnewton/src/git/buildroot/output/staging/usr/i686-unknown-linux-uclibc/sys-include/bits/uClibc_locale.h:85:
> error: forward declaration of 'struct __uclibc_locale_struct'
> make[5]: *** [ctype_members.lo] Error 1
> make[5]: *** Waiting for unfinished jobs....
> make[5]: Leaving directory
> `/home/ldap/wnewton/src/git/buildroot/output/toolchain/gcc-4.2.4-final/i686-unknown-linux-uclibc/libstdc++-v3/src'
> 
> Time to turn off uClibc locales I think...

Ah, ah. I thought this problem was only affecting the AVR32
architecture, so we added 60f945e47a15e10f0e777f69b05492b6f7ba918d to
the tree to prevent uClibc 0.9.31 + C++ + locale from being choosen on
AVR32. But it seems that 0.9.31 + C++ + locale fails to build on any
architecture with gcc 4.2.

I've discussed the issue a few weeks ago with Berhnard on IRC, but I
didn't quite get what the solution was.

Concerning the original problem, I've started discussing with Khem on
IRC, but he didn't manage to reproduce it for some reason. One possible
solution is to somehow revert to the two-stage gcc build procedure for
gcc 4.2 and use the three-stage gcc build procedure only for gcc 4.3+.
But I'd prefer to have Khem opinion on this beforehand.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
