From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Jul 2014 07:59:50 +0200
Subject: [Buildroot] nasm package error installing to target
In-Reply-To: <CABDNR14V6t+yxJN9-y5ZdU+iwpx+wM0e5Sb+gq1S48Q4Yq=8LQ@mail.gmail.com>
References: <CABDNR14V6t+yxJN9-y5ZdU+iwpx+wM0e5Sb+gq1S48Q4Yq=8LQ@mail.gmail.com>
Message-ID: <53C371D6.4060404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/07/14 19:58, Michael Sumulong wrote:
> I'm trying to install the nasm package to my target but I get the following
> error when buildroot 2014.05 tries to compile it:
> 
>>>> nasm 2.11.02 Installing to target
> PATH="/home/mbs/Desktop/testing/staging/buildroot-2014.05/output/host/bin:/home/mbs/Desktop/testing/staging/buildroot-2014.05/output/host/sbin:/home/mbs/Desktop/testing/staging/buildroot-2014.05/output/host/usr/bin:/home/mbs/Desktop/testing/staging/buildroot-2014.05/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games" 
> /usr/bin/make -j5
> DESTDIR=/home/mbs/Desktop/testing/staging/buildroot-2014.05/output/target 
> install -C
> /home/mbs/Desktop/testing/staging/buildroot-2014.05/output/build/nasm-2.11.02/
> make[1]: Entering directory
> `/home/mbs/Desktop/testing/staging/buildroot-2014.05/output/build/nasm-2.11.02'
> mkdir -p /usr/bin
> /usr/bin/install -c nasm /usr/bin/nasm
> /usr/bin/install: cannot remove ?/usr/bin/nasm?: Permission denied
> make[1]: *** [install] Error 1
> make[1]: Leaving directory
> `/home/mbs/Desktop/testing/staging/buildroot-2014.05/output/build/nasm-2.11.02'
> make: ***
> [/home/mbs/Desktop/testing/staging/buildroot-2014.05/output/build/nasm-2.11.02/.stamp_target_installed]
> Error 2
> 

 Actually, we don't support nasm for the target. Since we don't have a compiler
on the target, nasm is quite useless. It is not possible to select nasm in the
menuconfig - that you can build it with 'make nasm' is an oversight on our part
which I'll fix shortly.

 That said, the issue is that nasm is not a proper autotools package: it uses
autoconf but not automake. And in its handwritten Makefile.in, it uses
INSTALLROOT instead of DESTDIR. For the host variant, it works because we don't
use DESTDIR there, just --prefix.

 So if you would want nasm on the target (but you don't want that!), you should
add the following to nasm.mk:

NASM_INSTALL_TARGET_OPT = INSTALLROOT=$$(TARGET_DIR) install


 Regards,
 Arnout

> 
> I'm fairly new to buildroot and I'm not entirely sure what's going on here. I've
> tried looking at nasm.mk <http://nasm.mk> file but its pretty much just relying
> on the autotools-package to perform the build.
> 
> Mike
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
