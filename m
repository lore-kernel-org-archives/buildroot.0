From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Thu, 7 May 2009 11:57:22 +0200
Subject: [Buildroot] 2009.05-rc1: fix dmraid build
In-Reply-To: <871vr1e589.fsf@macbook.be.48ers.dk>
References: <20090506121110.46c105f8@bandomeer.europe.flane.local>
	<871vr1e589.fsf@macbook.be.48ers.dk>
Message-ID: <20090507115722.6d0e1b82@bandomeer.europe.flane.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 07 May 2009 09:34:30 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Olaf" == Olaf Rempel <razzor@kopf-tisch.de> writes:
> 
>  Olaf> Hi,
>  Olaf> the dmraid build seems to be broken.
>  Olaf> On x86 it bails out with missing include files.
>  Olaf> I think it's some sort of $FOO_SUBDIR issue, but I couldn't find/fix it.
> 
>  Olaf> After adding the "include" dir to CFLAGS it compiles, but fails during linking.
>  Olaf> Disabling parallel build (I'm using -j2) fixed that too.
> 
> Hmm, can you be a bit more specific? I see that the dmraid build
> system is broken, as lib and tools race against each other with
> parallel builds. I've fixed that in git - But other than that it
> builds for me (x86-64 host, x86-core2 target).
> 

See attached dmraid build-log and buildroot config.
This happens with a clean rebuild (rm *build*; make).

The dmraid-build system seems to ignore the implicit rules in make.tmpl when 
building with -j2:
/home/development/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc -Os -pipe -Os  -I/home/development/buildroot/build_i586/staging_dir/usr/include -I/home/development/buildroot/build_i586/staging_dir/include --sysroot=/home/development/buildroot/build_i586/staging_dir/ -isysroot /home/development/buildroot/build_i586/staging_dir -mtune=i586 -march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -DDMRAID_NATIVE_LOG -DHAVE_GETOPTLONG -fPIC -Wall -Wundef -Wcast-align -Wwrite-strings -Winline -DDMRAID_TEST -O2 -D_LARGEFILE64_SOURCE  -L/home/development/buildroot/build_i586/staging_dir/lib -L/home/development/buildroot/build_i586/staging_dir/usr/lib --sysroot=/home/development/buildroot/build_i586/staging_dir/  tools/dmraid.c   -o tools/dmraid

Building with -j1:
/home/development/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc -Os -pipe -Os  -I/home/development/buildroot/build_i586/staging_dir/usr/include -I/home/development/buildroot/build_i586/staging_dir/include --sysroot=/home/development/buildroot/build_i586/staging_dir/ -isysroot /home/development/buildroot/build_i586/staging_dir -mtune=i586 -march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -MM -MF dmraid.d -I  -I. -I../include -I../lib -O2 -DDMRAID_NATIVE_LOG -DHAVE_GETOPTLONG -fPIC -Wall -Wundef -Wcast-align -Wwrite-strings -Winline -DDMRAID_TEST -O2 -D_LARGEFILE64_SOURCE dmraid.c; \
        /home/development/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc -Os -pipe -Os  -I/home/development/buildroot/build_i586/staging_dir/usr/include -I/home/development/buildroot/build_i586/staging_dir/include --sysroot=/home/development/buildroot/build_i586/staging_dir/ -isysroot /home/development/buildroot/build_i586/staging_dir -mtune=i586 -march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c -I  -I. -I../include -I../lib -O2 -DDMRAID_NATIVE_LOG -DHAVE_GETOPTLONG -fPIC -Wall -Wundef -Wcast-align -Wwrite-strings -Winline -DDMRAID_TEST -O2 -D_LARGEFILE64_SOURCE dmraid.c -o dmraid.o

$ make --version
GNU Make 3.81

After applying your parallel-build patch it *works*,
so no further actions are needed.

Regards
Olaf
-------------- next part --------------
A non-text attachment was scrubbed...
Name: dmraid-i686-without-patch.config.gz
Type: application/x-gzip
Size: 4922 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090507/65ea41fb/attachment-0002.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: dmraid-i686-without-patch.log.gz
Type: application/x-gzip
Size: 4152 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090507/65ea41fb/attachment-0003.bin>
