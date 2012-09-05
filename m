From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 5 Sep 2012 06:55:06 +0200
Subject: [Buildroot] Package for libwt (Web Toolkit http://webtoolkit.eu)
In-Reply-To: <935246701.408118.1346804369727.JavaMail.open-xchange@email.1und1.de>
References: <935246701.408118.1346804369727.JavaMail.open-xchange@email.1und1.de>
Message-ID: <CAHXCMM+4_mA9CZfYGabOXY2kYmNku1Gyftmc3yhsPjPsZxF5ZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Norbert,

2012/9/5 norbert at nanobug.de <norbert@nanobug.de>:
> Dear Experts,
>
> I am trying to build Wt in my buildroot environment and it dHi oes not compile.
>
>  I am a real noob  with Cmake or buildroot. Obviously I have misconfigured
>  something. Cmake gets called but refuses to continue telling me something
> about
>
>  missing path. Somehow the generated Cmake command is wrong, I think. I do
> not see
>
>  how to fix it. Maybe someone has already made a package for WT and could
> share it here ?
>
>
>
>
>
>  This is what I used:
>
>  ------------- file libwt.mk in package/libwt -----------------
>
>  #############################################################
>  #
>  # libwt
>  #
>  #############################################################
>
>  LIBWT_VERSION =3.2.1
>  LIBWT_SOURCE =wt-$(LIBWT_VERSION).tar.gz
>  LIBWT_SITE =http://prdownloads.sourceforge.net/witty
>  LIBWT_INSTALL_STAGING = YES
>  LIBWT_CONF_OPT = --disable-verbose --disable-manual --enable-hidden-symbols
This looks like autotools configure options.
Since Wt uses CMake as build-system, configure options most likely are
'-DBLABLABLA=ON' or '-DBLABLABLA=OFF'
>
>  ifeq ($(BR2_PACKAGE_BOOST),y)
>  LIBWT_DEPENDENCIES += boost
>  LIBWT_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
Ditto, autotools configure env. that have no effect on CMake.

>  # configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
>  # native stuff during the rest of configure when target == host.
>  # Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
>  # are found first.
>  # LIBWT_CONF_ENV += "LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:/lib:/usr/lib"
>  endif
>

Here, at the end of the .mk file you miss to call:
$(eval $(cmake-package))
>  --------------- end of libwt.mk -----------------------------------

Usually, when packaging a CMake-based package, don't hesitate to build
it (or at least configure it) on your host to have a look at configure
options.

I guess you follow this:
http://www.webtoolkit.eu/wt/doc/reference/html/InstallationUnix.html
To see the available configure options, run cmake-gui instead of cmake.


>  --------------- file Config.in  in package/libwt ------------------
>
>  config BR2_PACKAGE_LIBWT
>  bool "libwt"
>  help
The 2 above lines should be indented with 1 tab.
>  wt web toolkit is a library for writing cgi code
>
>  http://webtoolkit.eu/
Help content should be indented with 1 tab + 2 spaces.
>
>  --------------- end of Config.in -----------------------------------
>

Don't forget to add the entry in the package/Config.in file (see:
http://buildroot.org/downloads/manual/manual.html#_package_directory
).

You can also check out some already integrated CMake-based packages
(e.g.: package/freerdp/freerdp.mk).
Overall, don't hesitate to refer to
http://buildroot.org/downloads/manual/manual.html#_infrastructure_for_cmake_based_packages


If you don't find you way out, don't hesitate to send feedback about
the doc (what is missing, misleading, or outdated, ...):
http://buildroot.org/downloads/manual/manual.html


Cheers,

-- 
Sam
