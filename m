From: Faisal Mehmood <f.m3hm00d@gmail.com>
Date: Tue, 4 Sep 2018 15:32:40 +0000
Subject: [Buildroot] Fwd:  Beginner help: Compilation errors for bison,
 ncurses and arm-buildroot-linux-uclibcgnueabihf
In-Reply-To: <CAL8qisnsRCYbC5+x8GAT+wZ_qiB=6EGBUVkK=GRk0JHy-T4ifA@mail.gmail.com>
References: <CAL8qis=5F5kDuMjpsZJZLbnAkFKBVaH_V1CcV6uuK5Lu1ooPAw@mail.gmail.com>
 <20180904102005.1d63cc85@windsurf>
 <CAL8qisnsRCYbC5+x8GAT+wZ_qiB=6EGBUVkK=GRk0JHy-T4ifA@mail.gmail.com>
Message-ID: <CAL8qisnNqN9Mn1wM2FiMmgs3phgke4RF4xNCxprm3s-i4VAkqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---------- Forwarded message ---------
From: Faisal Mehmood <f.m3hm00d@gmail.com>
Date: Tue, Sep 4, 2018 at 3:31 PM
Subject: Re: [Buildroot] Beginner help: Compilation errors for bison,
ncurses and arm-buildroot-linux-uclibcgnueabihf
To: <thomas.petazzoni@bootlin.com>


On Tue, Sep 4, 2018 at 8:20 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Tue, 4 Sep 2018 11:24:53 +0000, Faisal Mehmood wrote:
>
> > ################################1#1#1#1#1#1#1#1#1#1########################
> >
> > /home/kenobi/projects/zero/rootfs/buildroot-2018.02.5/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/Scrt1.o:
> > In function `_start':
> > (.text+0x54): undefined reference to `main'
> > collect2: error: ld returned 1 exit status
> > make[2]: *** [Makefile:850: ../lib/libncurses.so.6.0] Error 1
> > make[2]: Leaving directory
> > '/home/kenobi/projects/zero/rootfs/buildroot-2018.02.5/output/build/ncurses-6.0/ncurses'
> > make[1]: *** [Makefile:114: all] Error 2
> > make[1]: Leaving directory
> > '/home/kenobi/projects/zero/rootfs/buildroot-2018.02.5/output/build/ncurses-6.0'
> > make: *** [package/pkg-generic.mk:226:
> > /home/kenobi/projects/zero/rootfs/buildroot-2018.02.5/output/build/ncurses-6.0/.stamp_built]
> > Error 2
> >
> > ################################1#1#1#1#1#1#1#1#1#1########################
>
> This one looks a bit weird. Are you sure you are getting this after a
> full rebuild, i.e "make clean all" ?
>
> > lib/fseterr.c: In function 'fseterr':
> > lib/fseterr.c:77:3: error: #error "Please port gnulib fseterr.c to
> > your platform! Look at the definitions of ferror and clearerr on your
> > system, then report this to bug-gnulib."
> >   #error "Please port gnulib fseterr.c to your platform! Look at the
> > definitions of ferror and clearerr on your system, then report this to
> > bug-gnulib."
> >    ^~~~~
>
> What is your host system ? I guess it's a pretty new one, which uses
> glibc-2.28. This issue has been fixed in master in commit
> 373ac58b82d2430b745e90c7c8b39e319949882a, but it hasn't been backported
> yet to our 2018.02.x branch. It will be backported soon by Peter
> Korsgaard, who maintains the 2018.02.x branch.
>
> > ##############################3#3#3#3#3#3#3#3#3#3#3#3#######################
> > /home/kenobi/Downloads/buildroot-2018.08-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
> > -shared -Wl,-soname,libz.so.1,--version-script,zlib.map -fPIE
> > -Wl,-z,now -Wl,-z,relro -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> > -D_FILE_OFFSET_BITS=64  -Os  -fPIC -fPIC -D_LARGEFILE64_SOURCE=1
> > -DHAVE_HIDDEN -o libz.so.1.2.11 adler32.lo crc32.lo deflate.lo
> > infback.lo inffast.lo inflate.lo inftrees.lo trees.lo zutil.lo
> > compress.lo uncompr.lo gzclose.lo gzlib.lo gzread.lo gzwrite.lo  -lc
> > -pie
> > /home/kenobi/Downloads/buildroot-2018.08-rc3/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/Scrt1.o:
> > In function `_start':
> > (.text+0x54): undefined reference to `main'
> > collect2: error: ld returned 1 exit status
>
> Same issue as for ncurses, building shared libraries doesn't work.
> Again, are you sure this happens after a full rebuild, i.e "make clean
> all".
>
> If that happens after a full rebuild, could you provide:
>
>  - Details on your host system
>
>  - Your Buildroot .config file
>

Build Station 1:
---------------------
Arch linux x64
gcc (GCC) 8.2.1 20180831
ldd (GNU libc) 2.28
Linux 4.18.5
buildroot-2018.08-rc3

Build Station 2:
-----------------------
Debian on VirtualBox
gcc 6.3.2 20170516
ldd (Debian Glibc) 2.24
Linux 4.9.0
buildroot-2018.02.5

I was told over at #buildroot that glibc 2.28 has issues with
buildroot. Since my host (Arch Linux) used 2.28, I was advised to give
Debian (Glibc 2.24) a go.

FYI, I deleted the entire buildroot folder and started compilation from scratch.

On Build Station 1, I again got an error [4] after starting from scratch.

On Build Station 2, although it was a new debian install on virtual
machine, I still got an error [5]

Please visit [6] for my .config file. The file was huge so I didn't
upload it here in text.

The thing that keeps repeating in these errors is Scrt1.o.

Regards,
m3hm00d

##########################4#4#4#4#4#4#4#4#4#4############################
/home/kenobi/Downloads/buildroot-2018.08-rc3/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/Scrt1.o:
In function `_start':
(.text+0x54): undefined reference to `main'
collect2: error: ld returned 1 exit status
make[1]: *** [Makefile:282: libz.so.1.2.11] Error 1
make[1]: Leaving directory
'/home/kenobi/Downloads/buildroot-2018.08-rc3/output/build/libzlib-1.2.11'
make: *** [package/pkg-generic.mk:232:
/home/kenobi/Downloads/buildroot-2018.08-rc3/output/build/libzlib-1.2.11/.stamp_built]
Error 2
##########################4#4#4#4#4#4#4#4#4#4############################

##########################5#5#5#5#5#5#5#5#5#5############################
/home/kenobid/Downloads/buildroot-2018.02.5/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/Scrt1.o:
In function `_start':
(.text+0x54): undefined reference to `main'
collect2: error: ld returned 1 exit status
Makefile:849: recipe for target '../lib/libncurses.so.6.0' failed
make[2]: *** [../lib/libncurses.so.6.0] Error 1
make[2]: Leaving directory
'/home/kenobid/Downloads/buildroot-2018.02.5/output/build/ncurses-6.0/ncurses'
Makefile:113: recipe for target 'all' failed
make[1]: *** [all] Error 2
make[1]: Leaving directory
'/home/kenobid/Downloads/buildroot-2018.02.5/output/build/ncurses-6.0'
package/pkg-generic.mk:223: recipe for target
'/home/kenobid/Downloads/buildroot-2018.02.5/output/build/ncurses-6.0/.stamp_built'
failed
make: *** [/home/kenobid/Downloads/buildroot-2018.02.5/output/build/ncurses-6.0/.stamp_built]
Error 2
##########################5#5#5#5#5#5#5#5#5#5############################


[6] https://drive.google.com/drive/folders/1eFVrGFUF2IY_p3PD6glK5K68wDw52INY
