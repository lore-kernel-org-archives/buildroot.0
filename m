From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:13 -0800
Subject: [Buildroot] [buildroot 0000925]: __global_locale error from gcc
	(buildroot)
Message-ID: <a63f1481aa045df0996f3849f83086a9@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=925 
====================================================================== 
Reported By:                STV
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   925
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-26-2006 01:44 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    __global_locale error from gcc (buildroot)
Description: 
Hi, I've been having real trouble getting gcc to build from buildbox whilst
using the latest uClibc snapshots. I have tried all sorts of version
combinations with no luck. The problem I have been having is:

# GCC 4.1.1, uClibC daily snapshot, Build/install c++ compiler and
libstdc++, Build/install Objective-C compiler and runtime, no locale
support...
monetary_members.cc: In member function 'void std::moneypunct<_CharT,
_Intl>::_M_initialize_moneypunct(int*, const char*) [with _CharT =
wchar_t, bool _Intl = true]':
monetary_members.cc:409: error: '__global_locale' was not declared in this
scope
monetary_members.cc: In member function 'void std::moneypunct<_CharT,
_Intl>::_M_initialize_moneypunct(int*, const char*) [with _CharT =
wchar_t, bool _Intl = false]':
monetary_members.cc:564: error: '__global_locale' was not declared in this
scope
make[5]: *** [monetary_members.lo] Error 1
make[5]: Leaving directory
`/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.1-final/i686-linux-uclibc/libstdc++-v3/src'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.1-final/i686-linux-uclibc/libstdc++-v3'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.1-final/i686-linux-uclibc/libstdc++-v3'
make[2]: *** [all-target-libstdc++-v3] Error 2
make[2]: Leaving directory
`/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.1-final'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.1-final'
make: ***
[/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.1-final/.compiled]
Error 2

I thought I had found a fix when I found
http://www.busybox.net/lists/uclibc/2006-March/014899.html, which says:

>    2) I took your 20x- patches from gcc-4.2.0 and applied them to
>       gcc-4.1.0 and tried to build a toolchain without locale support
>       and it would not build the c++ support again. The error had to
>       do with missing ctype functions. I also tried to build WITH
>       locale support and got the same errors.

> you have to use gcc-4.1.0 patches and 204-* from gcc-4.2.0 only, that 
> should fix the missing __global_locale and missing _LC_*. You can't use

> the complete 20x* patches from gcc-4.2.0, because you will miss
os/uclibc 
> part of it (that was added upstream)
> The 204-* patch is based on similar "corrections" done by mjn3 in 
> monetary_members.cc, it should allow to build gcc-4.1 w/ WCHAR enabled,

> but LOCALE disabled. I am not sure if my patch is correct, maybe we need

> some "replacement" for the case if __global_locale is not available, 
> asked mjn3 about it, have gotten no answer yet.
> If you want to be able to build gcc-4.1 w/ XLOCALE enabled (not only 
> LOCALE), you will also need 203-*.

> Note: the 203-* patch is needed for all gcc's, if you want them to build

> w/ XLOCALE enabled against current uClibc-svn.

so I tried and do exactly that... 

GCC 4.1.0
uClibc latest snapshot
Build/install c++ compiler and libstdc++
Build/install java compiler and libgcj
Build/install Objective-C compiler and runtime
no locale support
and the following patches in the toolchain/gcc/4.1.0 directory:

-rw-r--r--  1 tom users  17749 Jun 26 00:46 100-uclibc-conf.patch
-rw-r--r--  1 tom users   1302 Jun 26 00:46 110-arm-eabi.patch
-rw-r--r--  1 tom users 112159 Jun 26 08:36 200-uclibc-locale.patch
-rw-r--r--  1 tom users   7665 Jun 26 01:39 203-uclibc-locale-no__x.patch
-rw-r--r--  1 tom users   1988 Jun 26 08:35
204-uclibc-locale-wchar_fix.patch
-rw-r--r--  1 tom users   1742 Jun 26 00:46 300-libstdc++-pic.patch
-rw-r--r--  1 tom users    446 Jun 26 00:46 301-missing-execinfo_h.patch
-rw-r--r--  1 tom users    333 Jun 26 00:46 302-c99-snprintf.patch
-rw-r--r--  1 tom users    402 Jun 26 00:46
303-c99-complex-ugly-hack.patch
-rw-r--r--  1 tom users    721 Jun 26 00:46 304-index_macro.patch
-rw-r--r--  1 tom users    679 Jun 26 00:46 740-sh-pr24836.patch
-rw-r--r--  1 tom users   2059 Jun 26 00:46 800-arm-bigendian.patch

it sucessfully applies the 200-*patch, the 203-* patch from 4.2, but then
fails to apply the 204-* patch from 4.2:

Applying 204-uclibc-locale-wchar_fix.patch using plaintext:
patching file libstdc++-v3/config/locale/uclibc/monetary_members.cc
patching file libstdc++-v3/config/locale/uclibc/numeric_members.cc
Hunk http://busybox.net/bugs/view.php?id=1 FAILED at 127.
1 out of 1 hunk FAILED -- saving rejects to file
libstdc++-v3/config/locale/uclibc/numeric_members.cc.rej
Patch failed!  Please fix 204-uclibc-locale-wchar_fix.patch!
make: *** [/data/stv/buildroot4/toolchain_build_i686/gcc-4.1.0/.patched]
Error 1

what am I doing wrong? How can I use buildroot with the latest uClibc and
a recent version of gcc?

The only combination I can get to work is the following, although I'm not
happy to work with gcc 4.0.3:
# buildroot3 - GCC 4.0.3, uClibc daily snapshot, linux-2.6.12


here are the errors from some other combinations that I have tried and
failed with:

# GCC 4.2 (snapshot), uClibC daily snapshot, Build/install c++ compiler
and libstdc++, Build/install Objective-C compiler and runtime, no
locale...
/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/include/ext/rope:2522:32:
error: macro "index" requires 2 arguments, but only 1 given
In file included from
/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/include/ext/rope:2899,
                 from
/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-20060408/libstdc++-v3/src/ext-inst.cc:34:
/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1665:67:
error: macro "index" requires 2 arguments, but only 1 given
/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1667:26:
error: macro "index" requires 2 arguments, but only 1 given
/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1667:55:
error: macro "index" requires 2 arguments, but only 1 given
/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1669:28:
error: macro "index" requires 2 arguments, but only 1 given
/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1669:44:
error: macro "index" requires 2 arguments, but only 1 given
/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1669:63:
error: macro "index" requires 2 arguments, but only 1 given
/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1671:27:
error: macro "index" requires 2 arguments, but only 1 given
/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1671:45:
error: macro "index" requires 2 arguments, but only 1 given
/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1671:63:
error: macro "index" requires 2 arguments, but only 1 given
/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/include/ext/rope:1086:
error: expected ';' before 'const'
/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/include/ext/rope:1089:
error: expected `;' before '_Rope_iterator_base'
make[5]: *** [ext-inst.lo] Error 1
make[5]: Leaving directory
`/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/src'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3'
make[2]: *** [all-target-libstdc++-v3] Error 2
make[2]: Leaving directory
`/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-final'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-final'
make: ***
[/data/stv/buildroot4/toolchain_build_i686/gcc-4.2-final/.compiled] Error
2


# buildroot4 - GCC 4.1.0, uClibC daily snapshot, +4.2/202,203,204 patches,
 Build/install c++ compiler and libstdc++, Build/install Objective-C
compiler and runtime, no locale...
/data/stv/buildroot4/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/ctype_noninline.h:40:
error: request for member '__ctype_b' in '*
std::locale::facet::_S_get_c_locale()', which is of non-class type 'int'
/data/stv/buildroot4/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/ctype_noninline.h:
In constructor 'std::ctype<char>::ctype(int*, const short unsigned int*,
bool, size_t)':
/data/stv/buildroot4/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/ctype_noninline.h:64:
error: request for member '__ctype_toupper' in
'*((std::ctype<char>*)this)->std::ctype<char>::_M_c_locale_ctype', which
is of non-class type 'int'
/data/stv/buildroot4/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/ctype_noninline.h:65:
error: request for member '__ctype_tolower' in
'*((std::ctype<char>*)this)->std::ctype<char>::_M_c_locale_ctype', which
is of non-class type 'int'
/data/stv/buildroot4/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/ctype_noninline.h:66:
error: request for member '__ctype_b' in
'*((std::ctype<char>*)this)->std::ctype<char>::_M_c_locale_ctype', which
is of non-class type 'int'
/data/stv/buildroot4/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/ctype_noninline.h:
In constructor 'std::ctype<char>::ctype(const short unsigned int*, bool,
size_t)':
/data/stv/buildroot4/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/ctype_noninline.h:100:
error: request for member '__ctype_toupper' in
'*((std::ctype<char>*)this)->std::ctype<char>::_M_c_locale_ctype', which
is of non-class type 'int'
/data/stv/buildroot4/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/ctype_noninline.h:101:
error: request for member '__ctype_tolower' in
'*((std::ctype<char>*)this)->std::ctype<char>::_M_c_locale_ctype', which
is of non-class type 'int'
/data/stv/buildroot4/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/ctype_noninline.h:102:
error: request for member '__ctype_b' in
'*((std::ctype<char>*)this)->std::ctype<char>::_M_c_locale_ctype', which
is of non-class type 'int'
make[5]: *** [ctype.lo] Error 1
make[5]: Leaving directory
`/data/stv/buildroot4/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/src'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/data/stv/buildroot4/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/data/stv/buildroot4/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3'
make[2]: *** [all-target-libstdc++-v3] Error 2
make[2]: Leaving directory
`/data/stv/buildroot4/toolchain_build_i686/gcc-4.1.0-final'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/data/stv/buildroot4/toolchain_build_i686/gcc-4.1.0-final'
make: ***
[/data/stv/buildroot4/toolchain_build_i686/gcc-4.1.0-final/.compiled]
Error 2


# buildroot5 - GCC 4.1.0, uClibC daily snapshot, +4.2/202,203 patches, 
Build/install c++ compiler and libstdc++, Build/install Objective-C
compiler and runtime, no locale...
ections -c
/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.0/libstdc++-v3/src/ctype.cc
 -fPIC -DPIC -o .libs/ctype.o
/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/ctype_noninline.h:
In static member function 'static const short unsigned int*
std::ctype<char>::classic_table()':
/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/ctype_noninline.h:40:
error: request for member '__ctype_b' in '*
std::locale::facet::_S_get_c_locale()', which is of non-class type 'int'
/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/ctype_noninline.h:
In constructor 'std::ctype<char>::ctype(int*, const short unsigned int*,
bool, size_t)':
/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/ctype_noninline.h:64:
error: request for member '__ctype_toupper' in
'*((std::ctype<char>*)this)->std::ctype<char>::_M_c_locale_ctype', which
is of non-class type 'int'
/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/ctype_noninline.h:65:
error: request for member '__ctype_tolower' in
'*((std::ctype<char>*)this)->std::ctype<char>::_M_c_locale_ctype', which
is of non-class type 'int'
/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/ctype_noninline.h:66:
error: request for member '__ctype_b' in
'*((std::ctype<char>*)this)->std::ctype<char>::_M_c_locale_ctype', which
is of non-class type 'int'
/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/ctype_noninline.h:
In constructor 'std::ctype<char>::ctype(const short unsigned int*, bool,
size_t)':
/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/ctype_noninline.h:100:
error: request for member '__ctype_toupper' in
'*((std::ctype<char>*)this)->std::ctype<char>::_M_c_locale_ctype', which
is of non-class type 'int'
/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/ctype_noninline.h:101:
error: request for member '__ctype_tolower' in
'*((std::ctype<char>*)this)->std::ctype<char>::_M_c_locale_ctype', which
is of non-class type 'int'
/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/ctype_noninline.h:102:
error: request for member '__ctype_b' in
'*((std::ctype<char>*)this)->std::ctype<char>::_M_c_locale_ctype', which
is of non-class type 'int'
make[5]: *** [ctype.lo] Error 1
make[5]: Leaving directory
`/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3/src'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.0-final/i686-linux-uclibc/libstdc++-v3'
make[2]: *** [all-target-libstdc++-v3] Error 2
make[2]: Leaving directory
`/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.0-final'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.0-final'
make: ***
[/data/stv/buildroot5/toolchain_build_i686/gcc-4.1.0-final/.compiled]
Error 2


# buildroot-1.1.3 - GCC 3.4.2, uClibC,  Build/install c++ compiler and
libstdc++, Build/install Objective-C compiler and runtime, no locale...
/data/stv/buildroot-1.1.3/build_i686/busybox/util-linux/fdisk.c: In
function `get_sectorsize':
/data/stv/buildroot-1.1.3/build_i686/busybox/util-linux/fdisk.c:3921:
error: `BLKSSZGET' undeclared (first use in this function)
/data/stv/buildroot-1.1.3/build_i686/busybox/util-linux/fdisk.c:3921:
error: (Each undeclared identifier is reported only once
/data/stv/buildroot-1.1.3/build_i686/busybox/util-linux/fdisk.c:3921:
error: for each function it appears in.)
make[2]: ***
[/data/stv/buildroot-1.1.3/build_i686/busybox/util-linux/fdisk.o] Error 1
make[1]: *** [_all] Error 2
make[1]: Leaving directory `/data/stv/buildroot-1.1.3/build_i686/busybox'
make: *** [/data/stv/buildroot-1.1.3/build_i686/busybox/busybox] Error 2



====================================================================== 

---------------------------------------------------------------------- 
 vapier - 06-29-06 18:22  
---------------------------------------------------------------------- 
fixed in svn 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-26-06 01:44  STV            New Issue                                    
06-26-06 01:44  STV            Status                   new => assigned     
06-26-06 01:44  STV            Assigned To               => uClibc          
06-29-06 18:22  vapier         Note Added: 0001480                          
06-29-06 18:22  vapier         Status                   assigned => closed  
06-29-06 18:22  vapier         Resolution               open => fixed       
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
