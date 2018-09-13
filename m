From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Sep 2018 14:33:02 +0200
Subject: [Buildroot] [PATCH/next v2 2/3]
 package/perl-crypt-openssl-random: bump
In-Reply-To: <dec5946c-8c4e-0075-62a3-251daf7cb856@t-online.de>
References: <20180821204134.2819-1-bernd.kuhls@t-online.de>
 <dec5946c-8c4e-0075-62a3-251daf7cb856@t-online.de>
Message-ID: <20180913143302.518e13d6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Thu, 13 Sep 2018 08:09:47 +0200, Bernd Kuhls wrote:

> I can not reproduce the problem with this defconfig
> http://autobuild.buildroot.net/results/54f/
> 54f274f33e5221d6979c6c0ad9b5633a1869b204/
> 
> xlocale.h is present:
> 
> $ find output/staging/usr/include/ | grep xlocale
> output/staging/usr/include/xlocale.h

The same problem happens with perl-crypt-blowfish, and I was able to
reproduce it. If you build just this package (i.e simple
configuration), then it works fine because it uses the Perl headers
from STAGING_DIR:

/home/test/buildroot/output/host/bin/powerpc-linux-gcc -c   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os      -DVERSION=\"2.14\" -DXS_VERSION=\"2.14\" -fPIC "-I/home/test/buildroot/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/perl5/5.26.2/powerpc-linux/CORE"   Blowfish.c
/home/test/buildroot/output/host/bin/powerpc-linux-gcc -c   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os      -DVERSION=\"2.14\" -DXS_VERSION=\"2.14\" -fPIC "-I/home/test/buildroot/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/perl5/5.26.2/powerpc-linux/CORE"   _blowfish.c

However, if you do the full build of
http://autobuild.buildroot.net/results/aa764fd8e851225664af94e3bcb68657126d85e0/
using br-reproduce-build, you can reproduce the issue. And in this
case, it's the host Perl headers that are included:

/home/test/aa764fd8e851225664af94e3bcb68657126d85e0/output/host/bin/powerpc-linux-gcc -c   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os      -DVERSION=\"2.14\" -DXS_VERSION=\"2.14\" -fPIC "-I/home/test/aa764fd8e851225664af94e3bcb68657126d85e0/output/host/lib/perl5/5.26.2/x86_64-linux/CORE"   Blowfish.c
In file included from Blowfish.xs:9:0:
/home/test/aa764fd8e851225664af94e3bcb68657126d85e0/output/host/lib/perl5/5.26.2/x86_64-linux/CORE/perl.h:738:24: fatal error: xlocale.h: No such file or directory
 #   include <xlocale.h>

Not only this is incorrect, but it also fails badly because there is no
xlocale.h in the toolchain sysroot:

output$ find . -name 'xlocale.h'
output$

Could you try:

wget http://git.buildroot.net/buildroot-test/plain/utils/br-reproduce-build
chmod +x br-reproduce-build
./br-reproduce-build aa764fd8e851225664af94e3bcb68657126d85e0

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
