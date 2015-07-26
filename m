From: kyak <bas@bmail.ru>
Date: Sun, 26 Jul 2015 10:55:16 +0300 (MSK)
Subject: [Buildroot] [PATCH 1/1] xterm: force detection of libICE
In-Reply-To: <20150725212807.GD1847@free.fr>
References: <1437749654-29431-1-git-send-email-bas@bmail.ru>
 <20150725212807.GD1847@free.fr>
Message-ID: <alpine.LNX.2.20.1507261047230.883@bas>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

I get the following error:

>>> xterm 314 Building
PATH="/home/user/build/buildroot/output/host/bin:/home/user/build/buildroot/output/host/sbin:/home/user/build/buildroot/output/host/usr/bin:/home/user/build/buildroot/output/host/usr/sbin:/home/user/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/android-sdk/platform-tools:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/user/bin" 
/usr/bin/make -j9  -C /home/user/build/buildroot/output/build/xterm-314/
make[1]: Entering directory 
'/home/user/build/buildroot/output/build/xterm-314'
/bin/sh ./plink.sh 
/home/user/build/buildroot/output/host/usr/bin/i686-buildroot-linux-gnu-gcc 
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os 
-Wl,-rpath,/home/user/build/buildroot/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/lib 
-o xterm button.o cachedGCs.o charproc.o charsets.o cursor.o data.o 
doublechr.o fontutils.o input.o linedata.o main.o menu.o misc.o print.o 
ptydata.o scrollback.o screen.o scrollbar.o tabs.o util.o version.o 
xstrings.o xtermcap.o VTPrsTbl.o TekPrsTbl.o Tekproc.o charclass.o 
precompose.o wcwidth.o 
-L/home/user/build/buildroot/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/lib 
-lXft -lfontconfig 
-L/home/user/build/buildroot/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/lib 
-lfreetype -lutil -lXaw7 -lXmu -lXt -lX11 -lncurses
testing if -lXft is needed
...yes
testing if -lfontconfig is needed
...yes
testing if -lfreetype is needed
...yes
testing if -lutil is needed
...yes
testing if -lXaw7 is needed
...yes
testing if -lXmu is needed
...yes
testing if -lXt is needed
...yes
testing if -lX11 is needed
...yes
testing if -lncurses is needed
...yes
/home/user/build/buildroot/output/host/usr/lib/gcc/i686-buildroot-linux-gnu/4.9.3/../../../../i686-buildroot-linux-gnu/bin/ld: 
misc.o: undefined reference to symbol 'IceConnectionNumber'
/home/user/build/buildroot/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/lib/libICE.so.6: 
error adding symbols: DSO missing from command line
collect2: error: ld returned 1 exit status
Makefile:178: recipe for target 'xterm' failed
make[1]: *** [xterm] Error 1
make[1]: Leaving directory 
'/home/user/build/buildroot/output/build/xterm-314'
package/pkg-generic.mk:156: recipe for target 
'/home/user/build/buildroot/output/build/xterm-314/.stamp_built' failed
make: *** [/home/user/build/buildroot/output/build/xterm-314/.stamp_built] 
Error 2

I'm running current Arch Linux.
I don't have a defconfig, but here is the current config:
http://paste.pound-python.org/show/7ptuA3j9NutxLmAjGxgM/

On Sat, 25 Jul 2015, Yann E. MORIN wrote:

> Mikhail, All,
>
> On 2015-07-24 17:54 +0300, kyak spake thusly:
>> With some hosts, xterm configure script fails to detect presence of
>> libICE. This results in error during xterm linking stage, because -lICE
>> is not passed to linker. This patches forces configure script to detect
>> libICE.
>
> Could you share the error message you get, with some mor einfo about
> your host that exhibit the issue, please?
>
> Also, a defconfig to reproduce the build would be helpful! ;-)
>
> Regards,
> Yann E. MORIN.
>
>> Signed-off-by: Mikhail Peselnik <bas@bmail.ru>
>> ---
>>  package/xterm/xterm.mk | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
>> index 56f692d..dd07e35 100644
>> --- a/package/xterm/xterm.mk
>> +++ b/package/xterm/xterm.mk
>> @@ -11,5 +11,6 @@ XTERM_DEPENDENCIES = ncurses xlib_libXaw
>>  XTERM_LICENSE = MIT
>>  XTERM_LICENSE_FILES = version.c
>>  XTERM_CONF_OPTS = --enable-256-color
>> +XTERM_CONF_ENV = ac_cv_lib_ICE_IceConnectionNumber=yes
>>
>>  $(eval $(autotools-package))
>> --
>> 2.4.6
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
>
