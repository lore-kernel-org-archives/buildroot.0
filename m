From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2020 18:46:55 +0100
Subject: [Buildroot] [PATCH] package/perl-crypt-ssleay: fix configure
 step
In-Reply-To: <20200321085534.21655-1-francois.perrad@gadz.org>
References: <20200321085534.21655-1-francois.perrad@gadz.org>
Message-ID: <20200321174655.GG4290@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, Thomas, All,

Thomas: question for you about this package you recently submitted...

On 2020-03-21 09:55 +0100, Francois Perrad spake thusly:
> currently, the compilation of openssl-version.c relies on include files
> from the system libssl-dev
> 
> see http://autobuild.buildroot.org/results/306/30659feaa11e7d0daf01c41e1bc1da2b9538968c/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Thanks for the patch, but it seems there are a few other issues with
this perl package, with this defconfig:

    BR2_arm=y
    BR2_cortex_a7=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_PERL=y
    BR2_PACKAGE_PERL_CRYPT_SSLEAY=y

which fails with:

    >>> perl-crypt-ssleay 0.72 Configuring
    cd /home/ymorin/dev/buildroot/O/build/perl-crypt-ssleay-0.72/ && if [ -f Build.PL ] && [ MB != "EUMM" ] ; then  PERL_MM_USE_DEFAULT=1 PERL5LIB= PERL_USE_UNSAFE_INC=1 /home/ymorin/dev/buildroot/O/host/bin/perl Build.PL --config ar="/home/ymorin/dev/buildroot/O/host/bin/arm-none-linux-gnueabihf-ar" --config full_ar="/home/ymorin/dev/buildroot/O/host/bin/arm-none-linux-gnueabihf-ar" --config cc="/home/ymorin/dev/buildroot/O/host/bin/arm-none-linux-gnueabihf-gcc" --config ccflags="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  " --config optimize=" " --config ld="/home/ymorin/dev/buildroot/O/host/bin/arm-none-linux-gnueabihf-gcc" --config lddlflags="-shared " --config ldflags="" --include_dirs /home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/perl5/5.30.2/arm-linux/CORE --destdir /home/ymorin/dev/buildroot/O/target --installdirs vendor --install_path lib=/usr/lib/perl5/site_perl/5.30.2 --install_path arch=/usr/lib/perl5/site_perl/5.30.2/arm-linux --install_path bin=/usr/bin --install_path script=/usr/bin --install_path bindoc=/usr/share/man/man1 --install_path libdoc=/usr/share/man/man3 --incpath=/home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include || exit 1; else  PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps PERL5LIB= PERL_USE_UNSAFE_INC=1 /home/ymorin/dev/buildroot/O/host/bin/perl Makefile.PL AR="/home/ymorin/dev/buildroot/O/host/bin/arm-none-linux-gnueabihf-ar" FULL_AR="/home/ymorin/dev/buildroot/O/host/bin/arm-none-linux-gnueabihf-ar" CC="/home/ymorin/dev/buildroot/O/host/bin/arm-none-linux-gnueabihf-gcc" CCFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  " OPTIMIZE=" " LD="/home/ymorin/dev/buildroot/O/host/bin/arm-none-linux-gnueabihf-gcc" LDDLFLAGS="-shared " LDFLAGS="" PERL_ARCHLIB=/home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/perl5/5.30.2/arm-linux DESTDIR=/home/ymorin/dev/buildroot/O/target INSTALLDIRS=vendor INSTALLVENDORLIB=/usr/lib/perl5/site_perl/5.30.2 INSTALLVENDORARCH=/usr/lib/perl5/site_perl/5.30.2/arm-linux INSTALLVENDORBIN=/usr/bin INSTALLVENDORSCRIPT=/usr/bin INSTALLVENDORMAN1DIR=/usr/share/man/man1 INSTALLVENDORMAN3DIR=/usr/share/man/man3 --incpath=/home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include || exit 1; fi

    *** THIS IS NOT AN ERROR, JUST A MESSAGE FOR YOUR INFORMATION ***

        Do you really need Crypt::SSLeay?

        Starting with version 6.02 of LWP, https support was unbundled into
        LWP::Protocol::https. This module specifies as one of its prerequisites
        IO::Socket::SSL which is automatically used by LWP::UserAgent unless
        this preference is overridden separately. IO::Socket::SSL is a more
        complete implementation, and, crucially, it allows hostname
        verification. Crypt::SSLeay does not support this. At this point,
        Crypt::SSLeay is maintained to support existing software that already
        depends on it.

        However, it is possible that your software does not really depend on
        Crypt::SSLeay, only on the ability of LWP::UserAgent class to
        communicate with sites over SSL/TLS.

        If are using version LWP 6.02 or later, and therefore have installed
        LWP::Protocol::https and its dependencies, and do not explicitly use
        Net::SSL before loading LWP::UserAgent, or override the default socket
        class, you are probably using IO::Socket::SSL and do not really need
        Crypt::SSLeay.

        Before installing Crypt::SSLeay, you may want to try specifying a
        dependency on LWP::Protocol::https.

    In file included from /home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/features.h:474,
                     from /home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/libc-header-start.h:33,
                     from /home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/stdio.h:27,
                     from openssl-version.c:1:
    /home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/gnu/stubs.h:7:11: fatal error: gnu/stubs-soft.h: No such file or directory
        7 | # include <gnu/stubs-soft.h>
          |           ^~~~~~~~~~~~~~~~~~
    compilation terminated.
    Failed to build and link a simple executable using OpenSSL
    >>> perl-crypt-ssleay 0.72 Building
    cd /home/ymorin/dev/buildroot/O/build/perl-crypt-ssleay-0.72/ && if [ -f Build.PL ] && [ MB != "EUMM" ] ; then PERL5LIB= PERL_USE_UNSAFE_INC=1 /home/ymorin/dev/buildroot/O/host/bin/perl Build  build; else /usr/bin/make -j1 FIXIN=:  pure_all; fi
    make[2]: *** No rule to make target 'pure_all'.  Stop.
    make[1]: *** [package/pkg-generic.mk:269: /home/ymorin/dev/buildroot/O/build/perl-crypt-ssleay-0.72/.stamp_built] Error 2
    make: *** [Makefile:23: _all] Error 2

So I see at least two problems here:

  - first, this module seems to be deprecated. It was added recently
    with lwp-protocols-https, although the version for that is already
    more recent than the one in the warning above.

  - second, the configure step, although it fails, does not cause
    Buildroot to stop immediately; instead, the build continues.
    And indeed, the code does just 'exit 0' when the test fails (see
    patch below)

So, do we really need to have this legacy package that is broken?


If you are interested, here's the patch I came up to fix the sanity
checks:

    diff --git a/package/perl-crypt-ssleay/0001-configure-exits-in-error.patch b/package/perl-crypt-ssleay/0001-configure-exits-in-error.patch
    new file mode 100644
    index 0000000000..0759a6600d
    --- /dev/null
    +++ b/package/perl-crypt-ssleay/0001-Makefile.PL-exit-in-error.patch
    @@ -0,0 +1,34 @@
    +Makefile.PL: exit in error when a sanity check fails
    +
    +Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
    +
    +diff -durN perl-crypt-ssleay-0.72.orig/Makefile.PL perl-crypt-ssleay-0.72/Makefile.PL
    +--- perl-crypt-ssleay-0.72.orig/Makefile.PL2014-04-24 16:50:29.000000000 +0200
    ++++ perl-crypt-ssleay-0.72/Makefile.PL2020-03-21 18:41:15.480352640   +0100
    +@@ -72,7 +72,7 @@
    +         }
    +         catch {
    +             print "Failed to resolve '$arg=$path': $_\n";
    +-            exit 0;
    ++            exit 1;
    +         };
    +     }
    + 
    +@@ -88,7 +88,7 @@
    + 
    +     unless (defined $my_openssl_version_cmd) {
    +         print "Failed to build and link a simple executable using OpenSSL\n";
    +-        exit 0;
    ++        exit 1;
    +     };
    + 
    +     show_cmd_output($my_openssl_version_cmd);
    +@@ -308,7 +308,7 @@
    +             "Cannot link with any of the requested SSL libraries '%s'\n",
    +             join(', ' => @$libs),
    +         );
    +-        exit 0;
    ++        exit 1;
    +     }
    + 
    +     printf "Found libraries '%s'\n", join(', ' => @found);


Regards,
Yann E. MORIN.

> ---
>  package/perl-crypt-ssleay/perl-crypt-ssleay.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/perl-crypt-ssleay/perl-crypt-ssleay.mk b/package/perl-crypt-ssleay/perl-crypt-ssleay.mk
> index 9564ee2b3..a67554847 100644
> --- a/package/perl-crypt-ssleay/perl-crypt-ssleay.mk
> +++ b/package/perl-crypt-ssleay/perl-crypt-ssleay.mk
> @@ -15,4 +15,6 @@ PERL_CRYPT_SSLEAY_LICENSE = Artistic-2.0
>  PERL_CRYPT_SSLEAY_LICENSE_FILES = README.md
>  PERL_CRYPT_SSLEAY_DISTNAME = Crypt-SSLeay
>  
> +PERL_CRYPT_SSLEAY_CONF_OPTS = --incpath=$(STAGING_DIR)/usr/include
> +
>  $(eval $(perl-package))
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
