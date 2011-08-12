From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 12 Aug 2011 17:44:35 +0200
Subject: [Buildroot] Python standard library problems
In-Reply-To: <4E44FA0A.1000902@free-electrons.com>
References: <4E42D99C.7080806@fosstel.com>
 <4E42FCAB.2070609@in-2-technology.co.uk> <4E43D5B4.2090106@fosstel.com>
 <4E43F72C.4060005@in-2-technology.co.uk> <4E441E25.4010600@fosstel.com>
 <4E444173.3090509@fosstel.com> <4E44FA0A.1000902@free-electrons.com>
Message-ID: <4E454A63.6030401@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok,

A little update on that.

From my tests, this brokenness occurs only when using a 64-bits system.
32 bits systems are fine, which explains why some have a working python
and other don't.

To complete a bit what I said earlier, in the build log, you have a
bunch of
Include/pyport.h:849:2: error: #error "LONG_BIT definition appears wrong
for platform (bad gcc/glibc config?)."

One for every module that fails to build.

This error comes from the code below in pyport.h

#ifndef LONG_BIT
#define LONG_BIT (8 * SIZEOF_LONG)
#endif

#if LONG_BIT != 8 * SIZEOF_LONG
/* 04-Oct-2000 LONG_BIT is apparently (mis)defined as 64 on some recent
 * 32-bit platforms using gcc.  We try to catch that here at compile-time
 * rather than waiting for integer multiplication to trigger bogus
 * overflows.
 */
#error "LONG_BIT definition appears wrong for platform (bad gcc/glibc
config?)."
#endif

LONG_BIT seems correctly defined to 32 in bits/xopen_lim.h of the toolchain.

I'm a bit confused on why this is happening...

On 12/08/2011 12:01, Maxime Ripard wrote:
> Hi all,
> 
> With the following config, I have the same problem that Pedro encountered.
> 
> When you look closer to the build output, when building python, at the
> end of the process, you have :
> 
> Failed to build these modules:
> _bisect            _codecs_iso2022    _collections
> _csv               _ctypes            _ctypes_test
> _elementtree       _functools         _heapq
> _hotshot           _io                _json
> _locale            _lsprof            _md5
> _multibytecodec    _multiprocessing   _random
> _sha               _sha256            _sha512
> _socket            _struct            _testcapi
> array              audioop            binascii
> cmath              cPickle            crypt
> cStringIO          datetime           dl
> fcntl              future_builtins    grp
> imageop            itertools          linuxaudiodev
> math               mmap               operator
> ossaudiodev        parser             resource
> select             spwd               strop
> syslog             termios            time
> unicodedata
> 
> Which is a *lot* of modules. It might be "normal" for some of them, like
> ossaudiodev which is likely to have an unmet dependency, but note that
> all three modules Pedro have mentionned are here.
> Some of them are deprecated too, like imageop.
> 
> It would be ideal if we could manage to drop the number of failed build
> modules to 0.
> 
> I'll try to look into it.
> 
> Maxime
> 


-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
