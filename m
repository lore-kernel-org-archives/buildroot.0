From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Oct 2012 23:18:33 +0200
Subject: [Buildroot] [PATCH v8 02/11] perl: new package
In-Reply-To: <1348593508-14254-2-git-send-email-francois.perrad@gadz.org>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
 <1348593508-14254-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <20121004231833.7c4f3cb5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois,

On Tue, 25 Sep 2012 19:18:18 +0200, Francois Perrad wrote:

> +		-Dldflags="$(TARGET_LDFLAGS) -l gcc_s" \

You should also apply the following patch:

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index fbe7ba9..4e6f50b 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -52,7 +52,7 @@ define PERL_CONFIGURE_CMDS
                -Dnm="$(TARGET_NM)" \
                -Dranlib="$(TARGET_RANLIB)" \
                -Dccflags="$(TARGET_CFLAGS)" \
-               -Dldflags="$(TARGET_LDFLAGS) -l gcc_s" \
+               -Dldflags="$(TARGET_LDFLAGS) -l gcc_s -lm" \
                -Dlddlflags="-shared" \
                -Dlibc=$(TARGET_HOST)/usr/$(GNU_TARGET_NAME)/sysroot/lib/libc.so \
                -Duseshrplib \

Otherwise, the build fails with:

/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gnueabihf-gcc -l gcc_s -fstack-protector -o miniperl \
            perlmini.o opmini.o miniperlmain.o  malloc.o gv.o toke.o perly.o pad.o regcomp.o dump.o util.o mg.o reentr.o mro.o keywords.o hv.o av.o run.o pp_hot.o sv.o pp.o scope.o pp_ctl.o pp_sys.o doop.o doio.o regexec.o utf8.o taint.o deb.o universal.o globals.o perlio.o perlapi.o numeric.o mathoms.o locale.o pp_pack.o pp_sort.o   
pp.o: In function `Perl_pp_pow':
pp.c:(.text+0x1b24): undefined reference to `pow'
pp.o: In function `Perl_pp_modulo':
pp.c:(.text+0x1f92): undefined reference to `floor'
pp.c:(.text+0x1fa0): undefined reference to `floor'
pp.c:(.text+0x1fbc): undefined reference to `fmod'
[...]

with certain toolchains.

Also, on the target there is a usr/bin/perl and a usr/bin/perl5.x.y
files. One is a hardlink to the other, but it is always a bit
disturbing to see two big files of the same size. Shouldn't we replace
that by a symlink instead, which is more obvious?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
