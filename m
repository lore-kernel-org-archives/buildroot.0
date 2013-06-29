From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 29 Jun 2013 17:09:37 +0200
Subject: [Buildroot] [PATCH 2/4] package/libsvg: new package
In-Reply-To: <51CE9EEC.3090809@googlemail.com> (Carsten Schoenert's message of
 "Sat, 29 Jun 2013 10:46:36 +0200")
References: <1372445557-15546-1-git-send-email-c.schoenert@gmail.com>
 <1372445557-15546-2-git-send-email-c.schoenert@gmail.com>
 <87ehbmyrmg.fsf@dell.be.48ers.dk> <51CE9EEC.3090809@googlemail.com>
Message-ID: <877ghdx8b2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carsten" == Carsten Schoenert <c.schoenert@gmail.com> writes:

 Carsten> Hello Peter,
 Carsten> Am 28.06.2013 21:14, schrieb Peter Korsgaard:
 Carsten> +	  http://www.t2-project.org/packages/libsvg.html
 >> 
 >> Are you sure that's the upstream URL? Isn't t2 yet another embedded
 >> build system?

 Carsten> Yes, true. After a longer try to find a "official" project webpage I
 Carsten> couldn't find no one that fits into.
 Carsten> The source is placed under cairographics.org (but even without any
 Carsten> dedicated info for the package libsvg (and also for libsvg-cairo). So
 Carsten> just point to the main site of cairographics.org?

Yes, just use http://cairographics.org

 >> It looks good, but it doesn't work:
 >> 
 >> checking for ANSI C header files... (cached) yes
 >> checking whether libexpat is requested... no
 >> ./configure: line 20639: /home/peko/source/buildroot/output/host/usr/bin/pkg-config: No such file or directory
 >> *** Your version of pkg-config is too old. You need version 0.9.0 or newer.
 >> *** See http://www.freedesktop.org/software/pkgconfig
 >> configure: error: Library requirements (libxml-2.0 >= 2.4.7 ) not met; consider adjusting the PKG_CONFIG_PATH environment variable if your libraries are in a nonstandard prefix so pkg-config can find them.
 >> 
 >> So you atleast need host-pkgconf as a dependency. It looks like it can
 >> work with expat instead, so you could drop the hard dependency on
 >> libxml2, but that is not really critical.

 Carsten> That's correct, it should working with expat too (as a deeper
 Carsten> look into configure.in is showing). I changed the the
 Carsten> libsvg.mk to cover this

 >> ifeq ($(BR2_PACKAGE_EXPAT),y)
 >> LIBSVG_CONF_OPT += --with-expat
 >> else
 >> LIBSVG_DEPENDENCIES += libxml2
 >> endif

You should also add expat to LIBSVG_DEPENDENCIES for the expat case, and
select the libxml2 package in Config.in if need (so Kconfig is in sync
with the makefile) - something like:

     select BR2_PACKAGE_LIBXML2 if !BR2_PACKAGE_EXPAT


 Carsten> but it doesn't work with my external (crosstool-NG) toolchain which I
 Carsten> create at my self, the expat.h is missing.

 >> checking whether libexpat is requested... yes
 >> configure: creating ./config.status
 >> config.status: creating libsvg.spec
 >> config.status: creating libsvg.pc
 >> config.status: creating src/svg_version.h
 >> config.status: creating Makefile
 >> config.status: creating src/Makefile
 >> config.status: creating config.h
 >> config.status: executing depfiles commands
 >>>>> libsvg 0.1.4 Building
 Carsten> ...
 >> In file included from svg.c:31:0:
 >> svgint.h:28:19: fatal error: expat.h: No such file or directory

Probably because you forgot to add expat to the dependencies, so it
isn't built yet by the time libsvg configure runs.

 Carsten> The BR2_PACKAGE_EXPAT is set by BR2_INSTALL_LIBSTDCPP which is set by
 Carsten> BR2_TOOLCHAIN_EXTERNAL_CXX. But crosstool-NG didn't provide the expat
 Carsten> related files.

Ehh, I don't quite follow. BR2_PACKAGE_EXPAT is about libexpat for the
TARGET. It doesn't have anything to do with the cross compiler needing
expat for the host.

-- 
Bye, Peter Korsgaard
