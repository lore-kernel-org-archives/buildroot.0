From: daniele_dll <d.albano@gmail.com>
Date: Sun, 10 May 2009 22:14:05 +0200
Subject: [Buildroot] Problem compiling microperl package for a virtex ii
	pro xc2vp30 (using a ppc405 no fpu)
In-Reply-To: <159a01660905100318u525d6f86p4e97780ac434dcde@mail.gmail.com>
References: <159a01660905091618t2b347c53mc361a9091b981c9b@mail.gmail.com>
	<159a01660905100318u525d6f86p4e97780ac434dcde@mail.gmail.com>
Message-ID: <159a01660905101314k4c2cf892n70c1ed4792ae3025@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the end, i fixed all errors i got

I got last problems with util-linux. Here there is a patch founded
googling around and adapted to work with util linux 2.13 pre7

http://bugs.gentoo.org/221939
http://article.gmane.org/gmane.linux.utilities.util-linux-ng/1463

--- a/text-utils/more.c
+++ b/text-utils/more.c
@@ -53,8 +53,7 @@
 #include <sys/stat.h>
 #include <sys/file.h>
 #include <sys/wait.h>
-#include <a.out.h>
 #include <locale.h>
 #include "xstrncpy.h"
 #include "nls.h"
 #include "widechar.h"
@@ -546,9 +545,9 @@ magic(f, fs)

 	if (fread(twobytes, 2, 1, f) == 1) {
 		switch(twobytes[0] + (twobytes[1]<<8)) {
-		case OMAGIC:	/* 0407 */
-		case NMAGIC:	/* 0410 */
-		case ZMAGIC:	/* 0413 */
+		case 0407:	/* a.out obj */
+		case 0410:	/* a.out exec */
+		case 0413:	/* a.out demand exec */
 		case 0405:
 		case 0411:
 		case 0177545:


2009/5/10 daniele_dll <d.albano@gmail.com>:
> i've founded the problem, but i'm still recompiling all to be sure it will be ok
>
> ?makedepend script in perl-5.8.8 directory is buggy: he tries to
> launch a sed without putting the closing single quote.
>
> Line 106 is
> ? ?*/*) finc="-I`echo $file | sed 's#/[^/]*$##`" ;;
>
> but should be
> ? ?*/*) finc="-I`echo $file | sed 's#/[^/]*$##'`" ;;
>
> launching manually mkdepend on x2p directory doesn't give the error anymore.
> I've commented the sed related to makefile in x2p directory too
>
> Here there is a little patch to fix this problem
> #########
> daniele at daniele-desktop:~/Development/Projects/xupv2p/Buildroot/package/microperl$
> cat microperl.makedepend-fix-quote.patch
> --- makedepend ?2009-05-10 11:27:11.032334188 +0200
> +++ makedepend.quote-fixed ? ? ?2009-05-10 11:31:42.293834325 +0200
> @@ -103,7 +103,7 @@
> ? ? *.y) filebase=`basename $file .y` ;;
> ? ? esac
> ? ? case "$file" in
> - ? ?*/*) finc="-I`echo $file | sed 's#/[^/]*$##`" ;;
> + ? ?*/*) finc="-I`echo $file | sed 's#/[^/]*$##'`" ;;
> ? ? *) ? finc= ;;
> ? ? esac
> ? ? $echo "Finding dependencies for $filebase$_o."
> ##########
>
> However i get more errors
> ##########
> cd lib/unicore && ?../../miniperl -I../../lib mktables -w
> ./miniperl -Ilib lib/lib_pm.PL
> cd x2p; ?/usr/bin/make s2p
>
> ? ? ? ?Making x2p stuff
> make[2]: ingresso nella directory
> ?/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/x2p?
> make[2]: ingresso nella directory
> ?/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/x2p?
> ../miniperl -I../lib s2p.PL
> You haven't done a "make depend" yet!
> make[2]: *** [hash.o] Errore 1
> make[2]: uscita dalla directory
> ?/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/x2p?
> make[1]: *** [translators] Errore 2
> make[1]: *** In attesa di lavori non terminati...
> Extracting lib.pm (with variable substitutions)
> Extracting s2p (with variable substitutions)
> Linking s2p to psed.
> make[2]: uscita dalla directory
> ?/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/x2p?
> touch uni.data
> make[1]: uscita dalla directory
> ?/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8?
> An error is expected on make
> touch /home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/.host_make
> /home/daniele/Development/Projects/xupv2p/Buildroot/toolchain_build_powerpc/bin/sed
> -i -e 's#^.*<asm/page.h>.*##g'
> /home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/ext/IPC/SysV/SysV.c
> /home/daniele/Development/Projects/xupv2p/Buildroot/toolchain_build_powerpc/bin/sed:
> impossibile leggere
> /home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/ext/IPC/SysV/SysV.c:
> Nessun file o directory
> make: *** [/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/.host_make_fixed]
> Errore 2
> ##########
>
> So i modified target/generic/Config.in to drop support for autoconf,
> automake and microperl ... i'm checking if it compiles successfully
