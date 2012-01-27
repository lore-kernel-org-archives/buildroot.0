From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 27 Jan 2012 08:27:47 -0600
Subject: [Buildroot] gtkmm in buildroot toolchain
In-Reply-To: <loom.20120127T145617-861@post.gmane.org>
References: <loom.20120127T095631-99@post.gmane.org>
 <20120127111928.3e881f03@skate> <loom.20120127T145617-861@post.gmane.org>
Message-ID: <201201270827.51630.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri January 27 2012, Willy wrote:
> Thomas Petazzoni <thomas.petazzoni@...> writes:
> 
> > All options are possible of course, but option 1) is the one that will
> > allow you to re-use your software as-is. We already have gtk+ support
> > in Buildroot, and I don't think that gtkmm has many more dependencies
> > outside of gtk+, so it should be relatively easy to integrate into
> > Buildroot.
> 
> I've added gtkmm with the following .mk file (with no errors):
> #####################################################
> LIBGTKMM_VERSION = 2.24.0
> LIBGTKMM_SOURCE = glibmm-$(LIBGTKMM_VERSION).tar.bz2
> LIBGTKMM_INSTALL_STAGING = YES
> LIBGTKMM_CONF_OPT = --enable-shared
> LIBGTKMM_DEPENDENCIES = libglib2 host-pkg-config
> 
> $(eval $(call AUTOTARGETS))
> #####################################################
> 
> the when I try to compile a gtkmm helloworld example I get this error:
> 
> #####################################################
> >>> helloworldgtkmm 1.0 Building
> /usr/bin/make -j4
> CXX=/buildroot_folder/output/host/
>     usr/bin/i586-unknown-linux-uclibc-g++
> LD=/buildroot_folder/output/host/usr/bin/
>     i586-unknown-linux-uclibc-ld -C
> /buildroot_folder/output/build/helloworldgtkmm-1.0 all
> make[1]: ingresso nella directory
> "/buildroot_folder/output/build/helloworldgtkmm-1.0"
> /buildroot_folder/output/host/usr/bin/i586-unknown-linux-uclibc-g++ 
>     helloworld.o
> main.o -o helloworldgtkmm `pkg-config gtkmm-2.4 --cflags --libs`
> /buildroot_folder/output/host/usr/lib/gcc/i586-unknown-linux-uclibc
>     /4.3.6/../../../../i586-unknown-linux-uclibc/bin/ld:
> cannot find -lgtkmm-2.4
> /buildroot_folder/output/host/usr/lib/gcc/i586-unknown-linux-uclibc
>     /4.3.6/../../../../i586-unknown-linux-uclibc/bin/ld:
> cannot find -latkmm-1.6
> /buildroot_folder/output/host/usr/lib/gcc/i586-unknown-linux-uclibc
>     /4.3.6/../../../../i586-unknown-linux-uclibc/bin/ld:
> cannot find -lgdkmm-2.4
> /buildroot_folder/output/host/usr/lib/gcc/i586-unknown-linux-uclibc
>     /4.3.6/../../../../i586-unknown-linux-uclibc/bin/ld:
> cannot find -lpangomm-1.4
> /buildroot_folder/output/host/usr/lib/gcc/i586-unknown-linux-uclibc
>     /4.3.6/../../../../i586-unknown-linux-uclibc/bin/ld:
> cannot find -lcairomm-1.0
> /buildroot_folder/output/host/usr/i586-unknown-linux-uclibc/
>     sysroot/usr/lib/libglib-2.0.so:
> warning: the use of OBSOLESCENT `utime' is discouraged, use `utimes'
> collect2: ld returned 1 exit status
> make[1]: *** [helloworldgtkmm] Errore 1
> #####################################################
> 
> Perhaps do I install those *mm library manually one by one? 
>

That is one choice.

Might be worth the effort of writing another makefile for each,
setting your dependencies in the gtkmm makefile to depend on them,
then let Buildroot build the entire set.

Mike 
> 
> 
> > There is some documentation in the Buildroot sources, run 'make manual'
> > to generate the documentation.
> 
> Thanks,
> Willy
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
