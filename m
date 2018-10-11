From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Oct 2018 12:42:43 +0200
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <87y3b5ks97.fsf@tkos.co.il> (Baruch Siach's message of "Thu, 11
 Oct 2018 07:43:32 +0300")
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf> <87y3b5ks97.fsf@tkos.co.il>
Message-ID: <87a7nksr18.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >>> powerpc | squid-4.2 | NOK |
 >>> http://autobuild.buildroot.net/results/e679ef90219c5e8f9c94ddcd7d3f9582f79ef751
 >>> | ORPH
 >> 
 >> ../../src/StatHist.h:112:30: error: invalid pure specifier (only '= 0' is allowed) before ';' token
 >> ../../src/StatHist.h:113:31: error: invalid pure specifier (only '= 0' is allowed) before ';' token
 >> 
 >> Not sure. Baruch, you recently bumped the squid package, could you have
 >> a look ?

 > This failure is from before my patch bumping squid to 4.3 (commit
 > 419c47a2135). But I believe we'll see the same failure with 4.3.

 > The build only fails with the CT-NG PowerPC e500 toolchain. Is that the
 > only gcc 4.7 toolchain?

 > This is the failing code:

 > typedef double hbase_f(double);

Isn't there a * missing if this is a function pointer?

E.G.:

typedef double (*hbase_f)(double);

Unless this is something special in C++? Testing that on a 4.7.2
toolchain:

g++ -v
Using built-in specs.
COLLECT_GCC=g++
COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-linux-gnu/4.7/lto-wrapper
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Debian 4.7.2-5' --with-bugurl=file:///usr/share/doc/gcc-4.7/README.Bugs --enable-languages=c,c++,go,fortran,objc,obj-c++ --prefix=/usr --program-suffix=-4.7 --enable-shared --enable-linker-build-id --with-system-zlib --libexecdir=/usr/lib --without-included-gettext --enable-threads=posix --with-gxx-include-dir=/usr/include/c++/4.7 --libdir=/usr/lib --enable-nls --with-sysroot=/ --enable-clocale=gnu --enable-libstdcxx-debug --enable-libstdcxx-time=yes --enable-gnu-unique-object --enable-plugin --enable-objc-gc --with-arch-32=i586 --with-tune=generic --enable-checking=release --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu
Thread model: posix
gcc version 4.7.2 (Debian 4.7.2-5)

g++ -std=c++11  -c t.cpp
t.cpp:5:27: error: invalid pure specifier (only ?= 0? is allowed) before ?;? token
g++ -std=c++11  -c t2.cpp
diff -u t.cpp t2.cpp
--- t.cpp       2018-10-11 12:35:32.122441311 +0200
+++ t2.cpp      2018-10-11 12:35:53.786261260 +0200
@@ -1,4 +1,4 @@
-typedef double hbase_f(double);
+typedef double (*hbase_f)(double);

 class StatHist

-- 
Bye, Peter Korsgaard
