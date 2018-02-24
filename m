From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 24 Feb 2018 23:25:48 +0200
Subject: [Buildroot] unsafe header/library path used in
 cross-compilation: '-I/usr/include/readline'
In-Reply-To: <CAPzckP7PfQYz-+vH09kjX3v0C7kM8nrdEB8aNrhoe4ZfiiF2dQ@mail.gmail.com>
References: <CAPzckP7PfQYz-+vH09kjX3v0C7kM8nrdEB8aNrhoe4ZfiiF2dQ@mail.gmail.com>
Message-ID: <20180224212548.i2xsnhq6clxclmob@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sjoerd Venema,

On Sat, Feb 24, 2018 at 10:12:19PM +0100, Sjoerd Venema wrote:
> I'm getting an "unsafe header/library path used in cross-compilation"-error
> while building ecasound (https://ecasound.seul.org/ecasound/download.php).
> From what I've read so far is that it's because the makefile references the
> /usr/-directory. What I can't figure out is how to change the makefile to
> not do that. Turning on/off the "paranoid"-function in menuconfig didn't
> make a difference.

There is no ecasound package in current Buildroot. Have you added this package 
locally?

> [buildroot at br buildroot]$ make ecasound
> >>> ecasound 2.9.1 Building
> PATH="/home/buildroot/buildroot-2018.02-rc2/output/host/bin:/home/buildroot/buildroot-2018.02-rc2/output/host/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/buildroot/.local/bin:/home/buildroot/bin"
> /usr/bin/make -j5  -C
> /home/buildroot/buildroot-2018.02-rc2/output/build/ecasound-2.9.1/
> /usr/bin/make  all-recursive
> Making all in kvutils
> make[4]: Nothing to be done for `all'.
> Making all in libecasound
> Making all in plugins
> make[5]: Nothing to be done for `all'.
> make[5]: Nothing to be done for `all-am'.
> Making all in ecasound
> /home/buildroot/buildroot-2018.02-rc2/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-g++
> -DHAVE_CONFIG_H -I. -I. -I.. *-I/usr/include/readline* -I. -I..
> -I../libecasound -I../kvutils -D_REENTRANT -D_XOPEN_SOURCE=600
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> -ffast-math -fstrict-aliasing -DNDEBUG -DENABLE_DBC -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -c -o eca-curses.o
> eca-curses.cpp
> arm-buildroot-linux-uclibcgnueabihf-g++: WARNING: unsafe header/library
> path used in cross-compilation: '*-I/usr/include/readline*'

This is just a warning, it doesn't break your build. But you should fix it.

The BR2_COMPILER_PARANOID_UNSAFE_PATH option makes this a hard error. But the 
warning is shown anyway.

> eca-curses.cpp:46:22: fatal error: readline.h: No such file or directory
>  #include <readline.h>
>                       ^

This is your problem. Your package need readline. You need to select 
BR2_PACKAGE_READLINE, as well as add readline to your package dependencies.

> compilation terminated.
> make[4]: *** [eca-curses.o] Error 1
> make[3]: *** [all-recursive] Error 1
> make[2]: *** [all] Error 2
> make[1]: ***
> [/home/buildroot/buildroot-2018.02-rc2/output/build/ecasound-2.9.1/.stamp_built]
> Error 2
> make: *** [_all] Error 2

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
