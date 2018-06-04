From: Mike Davies <busybox_mail@rovoreed.com>
Date: Mon, 04 Jun 2018 19:51:34 +0100
Subject: [Buildroot] Buildroot 2018.05-rc3 released
In-Reply-To: <ab40f635-f541-ab68-77c9-1a8dc7f749d0@mind.be>
References: <87efhvufjm.fsf@dell.be.48ers.dk>
 <1527599917.2053.2.camel@rovoreed.com> <87fu2a7bkq.fsf@dell.be.48ers.dk>
 <1527615682.2053.4.camel@rovoreed.com> <87po1e5mev.fsf@dell.be.48ers.dk>
 <1527674917.2072.2.camel@rovoreed.com> <87tvqp2lqv.fsf@dell.be.48ers.dk>
 <20180530180026.77e1dfac@windsurf.home> <87efht2k8o.fsf@dell.be.48ers.dk>
 <1527778369.2065.4.camel@rovoreed.com> <20180531172600.3cc0568e@windsurf>
 <1527791404.2065.8.camel@rovoreed.com>
 <ab40f635-f541-ab68-77c9-1a8dc7f749d0@mind.be>
Message-ID: <1528138294.2054.3.camel@rovoreed.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2018-05-31 at 22:18 +0200, Arnout Vandecappelle wrote:
> 
> 
> ?Well, this may happen to other people as well, so it would be good
> to get to the bottom of it.
> 
> ?Let's see if we can find where the problem is. Can you do
> 
> readelf -d output/host/bin/python

[mike at modron buildroot-2018.05]$ readelf -d output/host/bin/python

Dynamic section at offset 0xdc0 contains 30 entries:
  Tag        Type                         Name/Value
 0x0000000000000001 (NEEDED)             Shared library: [libpython2.7.so.1.0]
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libutil.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
 0x000000000000001d (RUNPATH)            Library runpath: [/home/mike/work/pi/buildroot-2018.05/output/host/lib]
 0x000000000000000c (INIT)               0x4006a8
 0x000000000000000d (FINI)               0x400864
 0x0000000000000019 (INIT_ARRAY)         0x600da8
 0x000000000000001b (INIT_ARRAYSZ)       8 (bytes)
 0x000000000000001a (FINI_ARRAY)         0x600db0
 0x000000000000001c (FINI_ARRAYSZ)       8 (bytes)
 0x000000006ffffef5 (GNU_HASH)           0x400298
 0x0000000000000005 (STRTAB)             0x4004c0
 0x0000000000000006 (SYMTAB)             0x4002f8
 0x000000000000000a (STRSZ)              345 (bytes)
 0x000000000000000b (SYMENT)             24 (bytes)
 0x0000000000000015 (DEBUG)              0x0
 0x0000000000000003 (PLTGOT)             0x601000
 0x0000000000000002 (PLTRELSZ)           24 (bytes)
 0x0000000000000014 (PLTREL)             RELA
 0x0000000000000017 (JMPREL)             0x400690
 0x0000000000000007 (RELA)               0x400660
 0x0000000000000008 (RELASZ)             48 (bytes)
 0x0000000000000009 (RELAENT)            24 (bytes)
 0x000000006ffffffe (VERNEED)            0x400640
 0x000000006fffffff (VERNEEDNUM)         1
 0x000000006ffffff0 (VERSYM)             0x40061a
 0x0000000000000000 (NULL)               0x0
[mike at modron buildroot-2018.05]$ 

> readelf -W -s output/host/lib/libpython2.7.so | \
> ? grep PyUnicodeUCS._AsEncodedString


[mike at modron buildroot-2018.05]$ readelf -W -s output/host/lib/libpython2.7.so | grep PyUnicodeUCS._AsEncodedString
  1374: 00000000000dcbe0   308 FUNC    GLOBAL DEFAULT   12 PyUnicodeUCS2_AsEncodedString
  4961: 00000000000dcbe0   308 FUNC    GLOBAL DEFAULT   12 PyUnicodeUCS2_AsEncodedString
[mike at modron buildroot-2018.05]$ 


> readelf -W -s output/build/host-python-2.7.14/Objects/unicodeobject.o 
> | \
> ? grep PyUnicodeUCS._AsEncodedString
> 

[mike at modron buildroot-2018.05]$ readelf -W -s output/build/host-python-2.7.14/Objects/unicodeobject.o | grep PyUnicodeUCS._AsEncodedString
   482: 000000000000f680   308 FUNC    GLOBAL DEFAULT    1 PyUnicodeUCS2_AsEncodedString
[mike at modron buildroot-2018.05]$ 


Now, if I understand these dumps correctly, the symbol is there, but
this new release still fails to build ca-certificates ...

>>> ca-certificates 20170717 Patching
>>> ca-certificates 20170717 Configuring
>>> ca-certificates 20170717 Building
PATH="/home/mike/work/pi/buildroot-2018.05/output/host/bin:/home/mike/work/pi/buildroot-2018.05/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/mike/bin:/sbin:/home/mike/.local/bin:/home/mike/bin:/home/mike/bin:/sbin" /usr/bin/make -j9 -C /home/mike/work/pi/buildroot-2018.05/output/build/ca-certificates-20170717 all
for dir in mozilla; do \
  /usr/bin/make -C $dir all; \
done
python certdata2pem.py
Traceback (most recent call last):
  File "certdata2pem.py", line 23, in <module>
    import base64
  File "/home/mike/work/pi/buildroot-2018.05/output/host/lib64/python2.7/base64.py", line 9, in <module>
    import struct
  File "/home/mike/work/pi/buildroot-2018.05/output/host/lib64/python2.7/struct.py", line 1, in <module>
    from _struct import *
ImportError: /home/mike/work/pi/buildroot-2018.05/output/host/lib64/python2.7/lib-dynload/_struct.so: undefined symbol: PyUnicodeUCS2_AsEncodedString
Makefile:6: recipe for target 'all' failed
make[3]: *** [all] Error 1
Makefile:9: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:223: recipe for target '/home/mike/work/pi/buildroot-2018.05/output/build/ca-certificates-20170717/.stamp_built' failed
make[1]: *** [/home/mike/work/pi/buildroot-2018.05/output/build/ca-certificates-20170717/.stamp_built] Error 2
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2
[mike at modron buildroot-2018.05]$ 

I hope this is of some help, because I'm even more confused now. The
symbol really is undefined in _struct.so, so why isn't it picking it up
from libpython.2.7.so, because if I understand the following dumps it
should.

[mike at modron buildroot-2018.05]$ readelf -d output/host/lib64/python2.7/lib-dynload/_struct.so

Dynamic section at offset 0x8db8 contains 27 entries:
  Tag        Type                         Name/Value
 0x0000000000000001 (NEEDED)             Shared library: [libpython2.7.so.1.0]
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
 0x000000000000001d (RUNPATH)            Library runpath: [/home/mike/work/pi/buildroot-2018.05/output/host/lib]
 0x000000000000000c (INIT)               0x2538
 0x000000000000000d (FINI)               0x74e4
 0x0000000000000019 (INIT_ARRAY)         0x208d98
 0x000000000000001b (INIT_ARRAYSZ)       8 (bytes)
 0x000000000000001a (FINI_ARRAY)         0x208da0
 0x000000000000001c (FINI_ARRAYSZ)       8 (bytes)
 0x000000006ffffef5 (GNU_HASH)           0x1f0
 0x0000000000000005 (STRTAB)             0xa28
 0x0000000000000006 (SYMTAB)             0x230
 0x000000000000000a (STRSZ)              1533 (bytes)
 0x000000000000000b (SYMENT)             24 (bytes)
 0x0000000000000003 (PLTGOT)             0x209000
 0x0000000000000002 (PLTRELSZ)           1488 (bytes)
 0x0000000000000014 (PLTREL)             RELA
 0x0000000000000017 (JMPREL)             0x1f68
 0x0000000000000007 (RELA)               0x1110
 0x0000000000000008 (RELASZ)             3672 (bytes)
 0x0000000000000009 (RELAENT)            24 (bytes)
 0x000000006ffffffe (VERNEED)            0x10d0
 0x000000006fffffff (VERNEEDNUM)         1
 0x000000006ffffff0 (VERSYM)             0x1026
 0x000000006ffffff9 (RELACOUNT)          138
 0x0000000000000000 (NULL)               0x0
[mike at modron buildroot-2018.05]$ readelf -W -s output/host/lib64/python2.7/lib-dynload/_struct.so | grep PyUnicodeUCS._AsEncodedString
    62: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND PyUnicodeUCS2_AsEncodedString
   217: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND PyUnicodeUCS2_AsEncodedString
[mike at modron buildroot-2018.05]$ 

Mike
