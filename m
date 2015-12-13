From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2015 21:13:58 +0100
Subject: [Buildroot] Wrong rpath after linking with libmysqlclient
In-Reply-To: <566DCFFE.5070504@mind.be>
References: <566DCFFE.5070504@mind.be>
Message-ID: <20151213201358.GC27971@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-12-13 21:07 +0100, Arnout Vandecappelle spake thusly:
>  First of all, the symptomps: build the defconfig in attachment, run with
> 
> qemu-system-arm -M nuri -kernel output/images/zImage -append \
>  "console=ttySAC1,115200" -smp 2 -serial null -serial stdio
> 
> and you'll see:
> 
> Starting php-fpm /usr/sbin/php-fpm: error while loading shared libraries:
> libmysqlclient.so.16: cannot open shared object file: No such file or directory
> 
> 
>  readelf reveals:
> 
> Library rpath: [.../host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/mysql]
> 
>  i.e. rpath points to staging instead of the on-target directory.
> 
>  Indeed, in libmysqlclient.la we find:
> 
> libdir='.../host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/mysql'
> 
> 
>  This happens because our 'Fixing libtool files' step makes sure that all
> absolute paths have STAGING_DIR prepended to them.
> 
> 
>  This problem will occur for any library that doesn't install in /lib or
> /usr/lib and that uses libtool.
> 
> 
>  My first idea was to install libmysqlclient.so in /usr/lib instead, but that's
> probably a great idea.

that's what Thomas and I were discussing the other day: why are those
libraries not in /usr/lib to start with? We believe this should be the
case.

> So the next idea is to skip the libdir= line when fixing
> up the libtool files. However, I'm not sure if that won't have some other
> effects (i.e. missing required link flags). But worse, it doesn't even work:
> php's libtool still converts it into
> -Wl,--rpath -Wl,.../host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/mysql
> (and gives warnings that the libraries have moved.
> 
>  Any idea?
> 
>  A final option is to fix up the rpaths of all ELF files in the target after
> build. I believe Yann has a series that does exactl that, no?

The fixup I've been doing is to just get rid of rpath since it should
not be needed on the target, as we should expect all NEEDED libraries to
either be in /usr/lib or /lib .

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
