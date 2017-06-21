From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Wed, 21 Jun 2017 16:08:02 +0200
Subject: [Buildroot] perl packages: intrusion of host LDFLAGS
Message-ID: <20170621140802.GS29444@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fran?ois, all,

We try to add and build the perl-encode package. Adding the package works fine
with the scancpan script, but the build fails:

"/home/tdescham/repo/contrib/buildroot/output/host/usr/bin/perl" "/home/tdescham/repo/contrib/buildroot/output/host/usr/lib/perl5/5.24.1/ExtUtils/xsubpp"  -nolinenumbers -typemap "/home/tdescham/repo/contrib/buildroot/output/host/usr/lib/perl5/5.24.1/ExtUtils/typemap"  Byte.xs > Byte.xsc && mv Byte.xsc Byte.c
/usr/bin/gcc -c  -I../Encode -fwrapv -fno-strict-aliasing -pipe -fstack-protector-strong -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64    -DVERSION=\"2.04\" -DXS_VERSION=\"2.04\" -fPIC "-I/home/tdescham/repo/contrib/buildroot/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/lib/perl5/5.24.1/i686-linux/CORE"   Byte.c
/usr/bin/gcc -c  -I../Encode -fwrapv -fno-strict-aliasing -pipe -fstack-protector-strong -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64    -DVERSION=\"2.04\" -DXS_VERSION=\"2.04\" -fPIC "-I/home/tdescham/repo/contrib/buildroot/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/lib/perl5/5.24.1/i686-linux/CORE"   byte_t.c
rm -f ../blib/arch/auto/Encode/Byte/Byte.so
/home/tdescham/repo/contrib/buildroot/output/host/usr/bin/i686-pc-linux-gnu-gcc  -shared -O2 -L/usr/local/lib -fstack-protector-strong Byte.o byte_t.o  -o ../blib/arch/auto/Encode/Byte/Byte.so 	\
     	\
  
i686-pc-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/local/lib'
make[2]: *** [Makefile:461: ../blib/arch/auto/Encode/Byte/Byte.so] Error 1
make[2]: Leaving directory '/home/tdescham/repo/contrib/buildroot/output/build/perl-encode-2.90/Byte'
make[1]: *** [Makefile:697: subdirs] Error 2
make[1]: Leaving directory '/home/tdescham/repo/contrib/buildroot/output/build/perl-encode-2.90'
make: *** [package/pkg-generic.mk:230: /home/tdescham/repo/contrib/buildroot/output/build/perl-encode-2.90/.stamp_built] Error 2



Looking at the Makefile(s) generated from Makefile.PL in this package, there
is:
LDFLAGS =  -fstack-protector-strong -L/usr/local/lib

which seem to be flags taken from the host gcc installation: /usr/local/lib is
not correct anyway in Buildroot, and fstack-protector-strong is not known by the
Sourcery x86 compiler I was using in Buildroot.


I checked with another perl package (perl-net-dns) which is already included in
Buildroot, and found that its Makefile _also_ includes that /usr/local/lib
string, but it does not fail. I think this must be because it is not trying to
do C compilations.
Anyway, it gives me the impression that this needs to be handled in the perl
package infrastructure, rather than at module level.
I tried using a post-configure hook to remove the /usr/local/lib, but then
bumped into the fstack-protector-strong which is not generic and can thus not be
filtered out nicely.


Do you have any suggestion on how to proceed?

Thanks,
Thomas



-- 
Thomas De Schampheleire
Embedded Software Engineer
Fixed Networks, Nokia
