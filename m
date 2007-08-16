From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 16 Aug 2007 10:03:21 +0200
Subject: [Buildroot] How to cross compile openssh for arm
In-Reply-To: <452620.55884.qm@web15811.mail.cnb.yahoo.com>
References: <452620.55884.qm@web15811.mail.cnb.yahoo.com>
Message-ID: <1187251401.2429.17.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2007-08-16 klockan 11:55 +0800 skrev Jinag Robert:
> Hello  All,
> 
> I'm trying  to  build  openssh  for  arm  platform, but failed. 
> 
> [root at armqa buildroot]#make openssh
> 
> ......
>       ./configure \
>         --target=arm-linux \
>         --host=arm-linux \
>         --build=i386-pc-linux-gnu \
>         --prefix=/usr \
>         --exec-prefix=/usr \
>         --bindir=/usr/bin \
>         --sbindir=/usr/sbin \
>         --libdir=/lib \
>         --libexecdir=/usr/sbin \
>         --sysconfdir=/etc \
>         --datadir=/usr/share \
>         --localstatedir=/var \
>         --mandir=/usr/man \
>         --infodir=/usr/info \
>         --includedir=/opt/926t/buildroot/build_arm/staging_dir/usr/include \
>         --disable-lastlog --disable-utmp \
>         --disable-utmpx --disable-wtmp --disable-wtmpx \
>         --without-x \
>         --disable-nls \
>          \
> );
> checking for arm-linux-gcc... /usr/local/arm/4.1.1-920t/bin/arm-linux-gcc -Os -pipe  -I/opt/926t/buildroot/build_arm/staging_dir/include -I/opt/926t/buildroot/build_arm/staging_dir/usr/include -I/usr/local/arm/4.1.1-920t/arm-linux/include
> checking for C compiler default output file name... configure: error: C compiler cannot create executables
> See `config.log' for more details.
> make: *** [/opt/926t/buildroot/build_arm/openssh-3.9p1/.configured] Error 77
> 
> Any help?

That is a configuration problem, but when you solve that you will end up
in another problem: openssh uses 64 bit math + float conversions which
is currently not supported by the uClibc / buildroot combination.

This is in a single file "scp.c" so this can probably be fixed 
either by taking the missing soft_fp files from glibc and 
patching openssh or by removing the need for 64 bit math in openssh.

Error message below:

openssh-3.9p1/scp.c:680: undefined reference to `__floatdidf'
openssh-3.9p1/scp.c:680: undefined reference to `__fixunsdfdi'
openssh-3.9p1/scp.c:682: undefined reference to `__udivdi3'
openssh-3.9p1/scp.c:683: undefined reference to `__umoddi3'
scp.o: In function `main':
openssh-3.9p1/scp.c:256: undefined reference to `__fixdfdi'
progressmeter.o: In function `refresh_progress_meter':
openssh-3.9p1/progressmeter.c:132: undefined reference to `__floatdidf'
openssh-3.9p1/progressmeter.c:157: undefined reference to `__floatdisf'
openssh-3.9p1/progressmeter.c:157: undefined reference to `__floatdisf'

make[1]: *** [scp] Error 1


> 
> Thanks,
> Robert
> 
> 
> 
>        
> ____________________________________________________________________________________
> Choose the right car based on your needs.  Check out Yahoo! Autos new Car Finder tool.
> http://autos.yahoo.com/carfinder/
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
