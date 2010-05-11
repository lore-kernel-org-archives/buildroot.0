From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 11 May 2010 10:54:16 +0200
Subject: [Buildroot] AVR32 support is broken since commit "toolchain: add
	uClibc 0.9.31, mark 0.9.30.x as recent"
Message-ID: <AANLkTilfHmEU3NnpiaWdcYHffhNv7NI07fbNGpkhv3oH@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

It seems support for AVR32 is broken since commit
266fa65afb20bf93b813d96421dce537a4dd2742 "toolchain: add uClibc 0.9.31, mark
0.9.30.x as recent". Basically, the toolchain for AVR32 will not build. Steps
to reproduce:

$ make atngw100_defconfig
$ make
[snip]
/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/./gcc/xgcc
-shared-libgcc -B/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/./gcc
-nostdinc++ -L/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/avr32-linux-uclibc/libstdc++-v3/src
-L/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/avr32-linux-uclibc/libstdc++-v3/src/.libs
-B/usr/avr32-linux-uclibc/bin/ -B/usr/avr32-linux-uclibc/lib/ -isystem
/usr/avr32-linux-uclibc/include -isystem
/usr/avr32-linux-uclibc/sys-include
-I/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/avr32-linux-uclibc/libstdc++-v3/include/avr32-linux-uclibc
-I/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/avr32-linux-uclibc/libstdc++-v3/include
-I/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5/libstdc++-v3/libsupc++
-fno-implicit-templates -Wall -Wextra -Wwrite-strings -Wcast-qual
-fdiagnostics-show-location=once -ffunction-sections -fdata-sections
-g -Os -c ctype_members.cc  -fPIC -DPIC -o .libs/ctype_members.o
ctype_members.cc: In constructor
'std::ctype_byname<_CharT>::ctype_byname(const char*, size_t) [with
_CharT = char]':
ctype_members.cc:59: error: invalid use of incomplete type 'struct
__uclibc_locale_struct'
/home/bjornfor/forks/buildroot/output/staging/usr/include/bits/uClibc_locale.h:85:
error: forward declaration of 'struct __uclibc_locale_struct'
ctype_members.cc:60: error: invalid use of incomplete type 'struct
__uclibc_locale_struct'
/home/bjornfor/forks/buildroot/output/staging/usr/include/bits/uClibc_locale.h:85:
error: forward declaration of 'struct __uclibc_locale_struct'
ctype_members.cc:61: error: invalid use of incomplete type 'struct
__uclibc_locale_struct'
/home/bjornfor/forks/buildroot/output/staging/usr/include/bits/uClibc_locale.h:85:
error: forward declaration of 'struct __uclibc_locale_struct'
make[5]: *** [ctype_members.lo] Error 1
make[5]: *** Waiting for unfinished jobs....
numeric_members.cc: In member function 'void
std::numpunct<_CharT>::_M_initialize_numpunct(__uclibc_locale_struct*)
[with _CharT = wchar_t]':
numeric_members.cc:140: error: invalid use of incomplete type 'struct
__uclibc_locale_struct'
/home/bjornfor/forks/buildroot/output/staging/usr/include/bits/uClibc_locale.h:85:
error: forward declaration of 'struct __uclibc_locale_struct'
numeric_members.cc:141: error: invalid use of incomplete type 'struct
__uclibc_locale_struct'
/home/bjornfor/forks/buildroot/output/staging/usr/include/bits/uClibc_locale.h:85:
error: forward declaration of 'struct __uclibc_locale_struct'
make[5]: *** [numeric_members.lo] Error 1
monetary_members.cc: In member function 'void std::moneypunct<_CharT,
_Intl>::_M_initialize_moneypunct(__uclibc_locale_struct*, const char*)
[with _CharT = wchar_t, bool _Intl = true]':
monetary_members.cc:407: error: invalid use of incomplete type 'struct
__uclibc_locale_struct'
/home/bjornfor/forks/buildroot/output/staging/usr/include/bits/uClibc_locale.h:85:
error: forward declaration of 'struct __uclibc_locale_struct'
monetary_members.cc:408: error: invalid use of incomplete type 'struct
__uclibc_locale_struct'
/home/bjornfor/forks/buildroot/output/staging/usr/include/bits/uClibc_locale.h:85:
error: forward declaration of 'struct __uclibc_locale_struct'
monetary_members.cc: In member function 'void std::moneypunct<_CharT,
_Intl>::_M_initialize_moneypunct(__uclibc_locale_struct*, const char*)
[with _CharT = wchar_t, bool _Intl = false]':
monetary_members.cc:562: error: invalid use of incomplete type 'struct
__uclibc_locale_struct'
/home/bjornfor/forks/buildroot/output/staging/usr/include/bits/uClibc_locale.h:85:
error: forward declaration of 'struct __uclibc_locale_struct'
monetary_members.cc:563: error: invalid use of incomplete type 'struct
__uclibc_locale_struct'
/home/bjornfor/forks/buildroot/output/staging/usr/include/bits/uClibc_locale.h:85:
error: forward declaration of 'struct __uclibc_locale_struct'
make[5]: *** [monetary_members.lo] Error 1
make[5]: Leaving directory
`/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/avr32-linux-uclibc/libstdc++-v3/src'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/avr32-linux-uclibc/libstdc++-v3'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/avr32-linux-uclibc/libstdc++-v3'
make[2]: *** [all-target-libstdc++-v3] Error 2
make[2]: Leaving directory
`/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final'
make: *** [/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/.compiled]
Error 2


Are there any toolchain guru's that can fix this issue?

(While running git bisect to find the bad commit I also had some
builds error out during u-boot build. But that is another thread...)

Best regards,
Bj?rn Forsman
