From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Nov 2012 11:31:12 +0100
Subject: [Buildroot] [PATCH] perl: build with perlcross instead of qemu
In-Reply-To: <1352425626-10628-1-git-send-email-arnout@mind.be>
References: <1352425626-10628-1-git-send-email-arnout@mind.be>
Message-ID: <20121109113112.1a7606ff@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Fri,  9 Nov 2012 02:47:05 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:

> This is still a bit RFC.  I've tested in on a glibc x86_64, on a
> minimal internal powerpc and a glibc ARM.  I haven't tested with any
> of the autobuilder configurations, but I expect it will at least be
> better than what we get now...
> 
> Francois, can you check if it also runs?  I've only done build tests.
> 
> Peter, if Francois confirms that the perl binary actually runs and if
> he has no other concerns, then I'd commit this patch quickly and wait
> for the autobuilder fallout.

This patch unfortunately breaks the build of cpanminus, which
apparently still requires qemu:

>>> cpanminus 1.5018 Configuring
>>> cpanminus 1.5018 Building
/bin/bash: /home/thomas/projets/buildroot/output/host/usr/bin/qemu-arm: Aucun fichier ou dossier de ce type
/bin/bash: /home/thomas/projets/buildroot/output/host/usr/bin/qemu-arm: Aucun fichier ou dossier de ce type
/bin/bash: /home/thomas/projets/buildroot/output/host/usr/bin/qemu-arm: Aucun fichier ou dossier de ce type
/bin/bash: /home/thomas/projets/buildroot/output/host/usr/bin/qemu-arm: Aucun fichier ou dossier de ce type
/bin/bash: /home/thomas/projets/buildroot/output/host/usr/bin/qemu-arm: Aucun fichier ou dossier de ce type
/bin/bash: /home/thomas/projets/buildroot/output/host/usr/bin/qemu-arm: Aucun fichier ou dossier de ce type
>>> cpanminus 1.5018 Installing to target
echo "#!/bin/sh"                                                        > /home/thomas/projets/buildroot/output/build/cpanminus-1.5018/run_perl
echo "PERL5LIB=/home/thomas/projets/buildroot/output/target/usr/lib/perl5/site_perl/5.16.1/:/home/thomas/projets/buildroot/output/target/usr/lib/perl5/site_perl/5.16.1:/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/perl5/5.16.1/:/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/perl5/5.16.1 /home/thomas/projets/buildroot/output/host/usr/bin/qemu-arm /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/perl \"\$@\""    >>/home/thomas/projets/buildroot/output/build/cpanminus-1.5018/run_perl
chmod +x /home/thomas/projets/buildroot/output/build/cpanminus-1.5018/run_perl
PERL5LIB=/home/thomas/projets/buildroot/output/target/usr/lib/perl5/site_perl/5.16.1/:/home/thomas/projets/buildroot/output/target/usr/lib/perl5/site_perl/5.16.1:/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/perl5/5.16.1/:/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/perl5/5.16.1 PERL_MM_OPT="DESTDIR=/home/thomas/projets/buildroot/output/target PERL=/home/thomas/projets/buildroot/output/build/cpanminus-1.5018/run_perl PERL_LIB=/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/perl5/5.16.1 PERL_ARCHLIB=/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/perl5/5.16.1/" PERL_MB_OPT="--destdir /home/thomas/projets/buildroot/output/target" RUN_PERL="/home/thomas/projets/buildroot/output/build/cpanminus-1.5018/run_perl" /home/thomas/projets/buildroot/output/host/usr/bin/qemu-arm /home/thomas/projets/buildroot/outpu
 t/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/perl /home/thomas/projets/buildroot/output/build/cpanminus-1.5018/cpanm --perl=/home/thomas/projets/buildroot/output/build/cpanminus-1.5018/run_perl --notest --no-man-pages  Curses::UI
/bin/bash: /home/thomas/projets/buildroot/output/host/usr/bin/qemu-arm: Aucun fichier ou dossier de ce type
make: *** [/home/thomas/projets/buildroot/output/build/cpanminus-1.5018/.stamp_target_installed] Erreur 127

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
