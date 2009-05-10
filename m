From: daniele_dll <d.albano@gmail.com>
Date: Sun, 10 May 2009 12:18:36 +0200
Subject: [Buildroot] Problem compiling microperl package for a virtex ii
	pro xc2vp30 (using a ppc405 no fpu)
In-Reply-To: <159a01660905091618t2b347c53mc361a9091b981c9b@mail.gmail.com>
References: <159a01660905091618t2b347c53mc361a9091b981c9b@mail.gmail.com>
Message-ID: <159a01660905100318u525d6f86p4e97780ac434dcde@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i've founded the problem, but i'm still recompiling all to be sure it will be ok

 makedepend script in perl-5.8.8 directory is buggy: he tries to
launch a sed without putting the closing single quote.

Line 106 is
    */*) finc="-I`echo $file | sed 's#/[^/]*$##`" ;;

but should be
    */*) finc="-I`echo $file | sed 's#/[^/]*$##'`" ;;

launching manually mkdepend on x2p directory doesn't give the error anymore.
I've commented the sed related to makefile in x2p directory too

Here there is a little patch to fix this problem
#########
daniele at daniele-desktop:~/Development/Projects/xupv2p/Buildroot/package/microperl$
cat microperl.makedepend-fix-quote.patch
--- makedepend	2009-05-10 11:27:11.032334188 +0200
+++ makedepend.quote-fixed	2009-05-10 11:31:42.293834325 +0200
@@ -103,7 +103,7 @@
     *.y) filebase=`basename $file .y` ;;
     esac
     case "$file" in
-    */*) finc="-I`echo $file | sed 's#/[^/]*$##`" ;;
+    */*) finc="-I`echo $file | sed 's#/[^/]*$##'`" ;;
     *)   finc= ;;
     esac
     $echo "Finding dependencies for $filebase$_o."
##########

However i get more errors
##########
cd lib/unicore &&  ../../miniperl -I../../lib mktables -w
./miniperl -Ilib lib/lib_pm.PL
cd x2p;  /usr/bin/make s2p

	Making x2p stuff
make[2]: ingresso nella directory
?/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/x2p?
make[2]: ingresso nella directory
?/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/x2p?
../miniperl -I../lib s2p.PL
You haven't done a "make depend" yet!
make[2]: *** [hash.o] Errore 1
make[2]: uscita dalla directory
?/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/x2p?
make[1]: *** [translators] Errore 2
make[1]: *** In attesa di lavori non terminati...
Extracting lib.pm (with variable substitutions)
Extracting s2p (with variable substitutions)
Linking s2p to psed.
make[2]: uscita dalla directory
?/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/x2p?
touch uni.data
make[1]: uscita dalla directory
?/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8?
An error is expected on make
touch /home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/.host_make
/home/daniele/Development/Projects/xupv2p/Buildroot/toolchain_build_powerpc/bin/sed
-i -e 's#^.*<asm/page.h>.*##g'
/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/ext/IPC/SysV/SysV.c
/home/daniele/Development/Projects/xupv2p/Buildroot/toolchain_build_powerpc/bin/sed:
impossibile leggere
/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/ext/IPC/SysV/SysV.c:
Nessun file o directory
make: *** [/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/.host_make_fixed]
Errore 2
##########

So i modified target/generic/Config.in to drop support for autoconf,
automake and microperl ... i'm checking if it compiles successfully

2009/5/10 daniele_dll <d.albano@gmail.com>:
> Hi to all,
>
> i'm trying to set up a development platform on a virtex ii board
> (ppc405 no fpu based board) but i getting some problems. I'm tryng to
> compile all the stuff but when it should compiler microperl package
> give an error!
>
> I've seen on archives that there was a problem related to this on
> 2009.02-rc3 build of buildroot but there wasn't any solution.
>
> Here there is some output:
> ------------------------
> [SNIP]
> ------------------------
>
> makefile in x2p directory is missing!
>
> I need to add the development tools to the root filesystem, someone
> has a solution or a suggestion?
>
> Attached there is my .config file!
>
> Thank you for this great work!!!
