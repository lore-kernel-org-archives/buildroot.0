From: Matuschka, Sebastian <Sebastian.Matuschka@gcd-solutions.de>
Date: Fri, 25 Jul 2008 14:16:01 +0200
Subject: [Buildroot] Patch for gcc-uclibc-4.x.mk
In-Reply-To: <20080725120725.GB12249@mx.loc>
References: <49ED01FC03EE524BB7BB258E8F93BFF3265383@bfl-exchange-1.BFL.local>
	<20080725120725.GB12249@mx.loc>
Message-ID: <49ED01FC03EE524BB7BB258E8F93BFF3265388@bfl-exchange-1.BFL.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> -----Urspr?ngliche Nachricht-----
> Von: Bernhard Fischer [mailto:rep.dot.nop at gmail.com]
> Gesendet: Freitag, 25. Juli 2008 14:07
> An: Matuschka, Sebastian
> Cc: buildroot at uclibc.org
> Betreff: Re: [Buildroot] Patch for gcc-uclibc-4.x.mk
> 
> On Fri, Jul 25, 2008 at 01:46:42PM +0200, Matuschka, Sebastian wrote:
> >Hi,
> >
> >when compiling with sstrip, the path $(TARGET_DIR)/usr/bin must exist,
> >otherwise the compilation of gcc will abort and say that
> >$(TARGET_DIR)/usr/bin doesn't exist.
> 
> Please show the actual error you were seeing.

Here is the error and some lines above it:


#
# Now for the ugly 3.3.x soft float hack...
#
#
# Ok... that's enough of that.
#
mkdir -p /atmel/buildrootWork/project_build_avr32/GCD/root/usr/lib /atmel/buildrootWork/project_build_avr32/GCD/root/usr/sbin
touch /atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final/.installed
# These are in /lib, so...
rm -rf /atmel/buildrootWork/project_build_avr32/GCD/root/usr/lib/libgcc_s*.so*
cp -dpf /atmel/buildrootWork/build_avr32/staging_dir/usr/avr32-linux-uclibc/lib/libgcc_s* \
                /atmel/buildrootWork/project_build_avr32/GCD/root/lib/
cp: Aufruf von stat f?r "/atmel/buildrootWork/build_avr32/staging_dir/usr/avr32-linux-uclibc/lib/libgcc_s*" nicht m?glich: Datei oder Verzeichnis nicht gefunden
make: [/atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final/.libs_installed] Fehler 1 (ignoriert)
/atmel/buildrootWork/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-strip --remove-section=.comment --remove-section=.note --strip-unneeded /atmel/buildrootWork/project_build_avr32/GCD/root/lib/libgcc_s*
/atmel/buildrootWork/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-strip: '/atmel/buildrootWork/project_build_avr32/GCD/root/lib/libgcc_s*': No such file
touch /atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final/.libs_installed
/usr/bin/make -j1 CC="/usr/bin/gcc" -C /atmel/buildrootWork/toolchain_build_avr32/ccache-2.4
make[1]: Entering directory `/atmel/buildrootWork/toolchain_build_avr32/ccache-2.4'
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o ccache.o ccache.c
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o mdfour.o mdfour.c
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o hash.o hash.c
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o execute.o execute.c
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o util.o util.c
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o args.o args.c
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o stats.o stats.c
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o cleanup.o cleanup.c
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o snprintf.o snprintf.c
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o unify.o unify.c
/usr/bin/gcc -g -O2 -Wall -W -I. -o ccache ccache.o mdfour.o hash.o execute.o util.o args.o stats.o cleanup.o snprintf.o unify.o
make[1]: Leaving directory `/atmel/buildrootWork/toolchain_build_avr32/ccache-2.4'
mkdir -p /atmel/buildrootWork/build_avr32/staging_dir/usr/bin
cp /atmel/buildrootWork/toolchain_build_avr32/ccache-2.4/ccache /atmel/buildrootWork/build_avr32/staging_dir/usr/bin
# Keep the actual toolchain binaries in a directory at the same level.
# Otherwise, relative paths for include dirs break.
mkdir -p /atmel/buildrootWork/build_avr32/staging_dir/usr/bin-ccache
(cd /atmel/buildrootWork/build_avr32/staging_dir/usr/bin-ccache; \
                ln -fs avr32-linux-uclibc-gcc avr32-linux-gcc; \
                ln -fs avr32-linux-uclibc-gcc avr32-linux-cc; \
                ln -fs avr32-linux-uclibc-gcc avr32-linux-uclibc-cc; \
        )
[ -f /atmel/buildrootWork/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc ] && \
                mv /atmel/buildrootWork/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc \
                        /atmel/buildrootWork/build_avr32/staging_dir/usr/bin-ccache/
(cd /atmel/buildrootWork/build_avr32/staging_dir/usr/bin; \
                ln -fs ccache avr32-linux-cc; \
                ln -fs ccache avr32-linux-gcc; \
                ln -fs ccache avr32-linux-uclibc-cc; \
                ln -fs ccache avr32-linux-uclibc-gcc; \
        )
mkdir -p /atmel/buildrootWork/build_avr32/staging_dir/usr/bin /atmel/buildrootWork/build_avr32/staging_dir/usr/avr32-linux-uclibc/bin
/usr/bin/gcc -g -O2 .//toolchain/sstrip/sstrip.c -o /atmel/buildrootWork/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-sstrip
ln -snf ../../bin/avr32-linux-uclibc-sstrip \
                /atmel/buildrootWork/build_avr32/staging_dir/usr/avr32-linux-uclibc/bin/sstrip
ln -snf avr32-linux-uclibc-sstrip \
                /atmel/buildrootWork/build_avr32/staging_dir/usr/bin/avr32-linux-sstrip
/atmel/buildrootWork/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc -O3  -I/atmel/buildrootWork/build_avr32/staging_dir/usr/include -I/atmel/buildrootWork/build_avr32/staging_dir/include --sysroot=/atmel/buildrootWork/build_avr32/staging_dir/ -isysroot /atmel/buildrootWork/build_avr32/staging_dir -msoft-float .//toolchain/sstrip/sstrip.c -o /atmel/buildrootWork/project_build_avr32/GCD/root/usr/bin/sstrip
/atmel/buildrootWork/build_avr32/staging_dir/usr/bin-ccache/../lib/gcc/avr32-linux-uclibc/4.2.2/../../../../avr32-linux-uclibc/bin/ld: cannot open output file /atmel/buildrootWork/project_build_avr32/GCD/root/usr/bin/sstrip: Datei oder Verzeichnis nicht gefunden
collect2: ld returned 1 exit status
make: *** [/atmel/buildrootWork/project_build_avr32/GCD/root/usr/bin/sstrip] Fehler 1
