From: Will Newton <will.newton@gmail.com>
Date: Wed, 11 Aug 2010 14:43:26 +0100
Subject: [Buildroot] Build failure with 2010.08-rc1
In-Reply-To: <20100810182338.5c2b987c@surf>
References: <AANLkTikDrKuuL2q6Mp_rL-MFVg4nBoTMJeHiGAXFJoM-@mail.gmail.com>
	<AANLkTikMVTNWWPhg1N_30m1MsLmuSv6yjya7j76oW_v4@mail.gmail.com>
	<20100810182338.5c2b987c@surf>
Message-ID: <AANLkTi=O6T5Moy50MCccGEx=_fL5KHLJ3bv39ogGn6AK@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 10, 2010 at 5:23 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Tue, 10 Aug 2010 14:23:35 +0100
> Will Newton <will.newton@gmail.com> wrote:
>
>> This problem appears to only affect gcc 4.2.4.
>
> Interesting. I'm 100% sure that 2 weeks ago, gcc 4.2.2 for AVR32 was
> building correctly. And with today's Git, it doesn't build, failing
> with the exact same error message you're having.
>
> I'm currently retrying the build with the Git as it was two weeks ago
> and will start bisecting. I'm kind of suspecting the changes made to
> the gcc build procedure to support NPTL in uClibc.

Hi Thomas,

The attached hacky patch allows it to build a bit further, although it
now blows up with an error later in the build. I think it's unrelated
however:

/home/ldap/wnewton/src/git/buildroot/output/toolchain/gcc-4.2.4-final/./gcc/xgcc
-shared-libgcc -B/home/ldap/wnewton/src/git/buildroot/output/toolchain/gcc-4.2.4-final/./gcc
-nostdinc++ -L/home/ldap/wnewton/src/git/buildroot/output/toolchain/gcc-4.2.4-final/i686-unknown-linux-uclibc/libstdc++-v3/src
-L/home/ldap/wnewton/src/git/buildroot/output/toolchain/gcc-4.2.4-final/i686-unknown-linux-uclibc/libstdc++-v3/src/.libs
-B/home/ldap/wnewton/src/git/buildroot/output/staging/usr/i686-unknown-linux-uclibc/bin/
-B/home/ldap/wnewton/src/git/buildroot/output/staging/usr/i686-unknown-linux-uclibc/lib/
-isystem /home/ldap/wnewton/src/git/buildroot/output/staging/usr/i686-unknown-linux-uclibc/include
-isystem /home/ldap/wnewton/src/git/buildroot/output/staging/usr/i686-unknown-linux-uclibc/sys-include
-I/home/ldap/wnewton/src/git/buildroot/output/toolchain/gcc-4.2.4-final/i686-unknown-linux-uclibc/libstdc++-v3/include/i686-unknown-linux-uclibc
-I/home/ldap/wnewton/src/git/buildroot/output/toolchain/gcc-4.2.4-final/i686-unknown-linux-uclibc/libstdc++-v3/include
-I/home/ldap/wnewton/src/git/buildroot/output/toolchain/gcc-4.2.4/libstdc++-v3/libsupc++
-fno-implicit-templates -Wall -Wextra -Wwrite-strings -Wcast-qual
-fdiagnostics-show-location=once -ffunction-sections -fdata-sections
-g -Os -c ctype_members.cc  -fPIC -DPIC -o .libs/ctype_members.o
ctype_members.cc: In constructor
'std::ctype_byname<_CharT>::ctype_byname(const char*, size_t) [with
_CharT = char]':
ctype_members.cc:59: error: invalid use of incomplete type 'struct
__uclibc_locale_struct'
/home/ldap/wnewton/src/git/buildroot/output/staging/usr/i686-unknown-linux-uclibc/sys-include/bits/uClibc_locale.h:85:
error: forward declaration of 'struct __uclibc_locale_struct'
ctype_members.cc:60: error: invalid use of incomplete type 'struct
__uclibc_locale_struct'
/home/ldap/wnewton/src/git/buildroot/output/staging/usr/i686-unknown-linux-uclibc/sys-include/bits/uClibc_locale.h:85:
error: forward declaration of 'struct __uclibc_locale_struct'
ctype_members.cc:61: error: invalid use of incomplete type 'struct
__uclibc_locale_struct'
/home/ldap/wnewton/src/git/buildroot/output/staging/usr/i686-unknown-linux-uclibc/sys-include/bits/uClibc_locale.h:85:
error: forward declaration of 'struct __uclibc_locale_struct'
make[5]: *** [ctype_members.lo] Error 1
make[5]: *** Waiting for unfinished jobs....
make[5]: Leaving directory
`/home/ldap/wnewton/src/git/buildroot/output/toolchain/gcc-4.2.4-final/i686-unknown-linux-uclibc/libstdc++-v3/src'

Time to turn off uClibc locales I think...
-------------- next part --------------
A non-text attachment was scrubbed...
Name: gcc_4_2_4.patch
Type: text/x-patch
Size: 2501 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100811/d1602301/attachment.bin>
