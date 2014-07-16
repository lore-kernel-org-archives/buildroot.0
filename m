From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Jul 2014 00:08:54 +0200
Subject: [Buildroot] Migrating libconfuse package from .tar.gz to github
In-Reply-To: <CAM+bi4vVkn-TivZymaXuKswCLfFewXnAd1L-c-O9o=h7L3VXqg@mail.gmail.com>
References: <CAM+bi4vVkn-TivZymaXuKswCLfFewXnAd1L-c-O9o=h7L3VXqg@mail.gmail.com>
Message-ID: <53C6F7F6.40702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/07/14 09:55, Alvaro Gamez wrote:
> Hi there!
> 
> libconfuse is being migrated to github (see http://www.nongnu.org/confuse/)
> 
> I'm trying to migrate buildroot's package definition too, but I'm
> facing a problem I don't know how to resolve.
> 
> I've applied this small patch to get libconfuse source code from github.
> 
> Since code inside github doesn't contain autoconf files, autoreconf
> must be run, and that's the reason for the new LIBCONFUSE_AUTORECONF =
> YES. However, when trying to build it, the following happens:
> 
>>>> libconfuse V2_7 Configuring
>>>> libconfuse V2_7 Autoreconfiguring
> libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `support'.
> libtoolize: copying file `support/ltmain.sh'
> libtoolize: putting macros in `m4'.
> libtoolize: copying file `m4/libtool.m4'
> libtoolize: copying file `m4/ltoptions.m4'
> libtoolize: copying file `m4/ltsugar.m4'
> libtoolize: copying file `m4/ltversion.m4'
> libtoolize: copying file `m4/lt~obsolete.m4'
> libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.ac and
> libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
> configure.ac:33: error: required file 'support/config.rpath' not found

 That comes from gettext, so it means you need Yann's gettextize patches.

 Unfortunately, it still doesn't work, but for a different reason:

configure.ac:49: error: `po/Makefile.in' is already registered with AC_CONFIG_FILES.
../../lib/autoconf/status.m4:288: AC_CONFIG_FILES is expanded from...
configure.ac:49: the top level

 po/Makefile.in is mentioned twice in configure.ac, because gettextize adds it
as well. Yann, any ideas how to solve this? The easiest solution is probably
patch libconfuse.

 Regards,
 Arnout


> doc/Makefile.am:8: warning: 'INCLUDES' is the old name for
> 'AM_CPPFLAGS' (or '*_CPPFLAGS')
> examples/Makefile.am:3: warning: 'INCLUDES' is the old name for
> 'AM_CPPFLAGS' (or '*_CPPFLAGS')
> autoreconf: /home/sslayer/Proyectos/RADAR/ART3500/buildroot-pi/output/host/usr/bin/automake
> failed with exit status: 1
> package/pkg-generic.mk:167: recipe for target
> '/home/sslayer/Proyectos/RADAR/ART3500/buildroot-pi/output/build/libconfuse-V2_7/.stamp_configured'
> failed
> make: *** [/home/sslayer/Proyectos/RADAR/ART3500/buildroot-pi/output/build/libconfuse-V2_7/.stamp_configured]
> Error 1
> 
> 
> I've also tried to run a post extract hook, for an autogen.sh file is
> provided. However, this results on host autotools being run, linking
> to files outside buildroot hierarchy (such as
> /usr/share/gettext/config.rpath, etc) that can't be overwritten, so
> this also fails.
> 
> Does anybody have any idea on how to solve this?
> 
> Regards,
> 
> 
> diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
> index 8a0d80f..b24a560 100644
> --- a/package/libconfuse/libconfuse.mk
> +++ b/package/libconfuse/libconfuse.mk
> @@ -4,13 +4,15 @@
>  #
>  ################################################################################
> 
> -LIBCONFUSE_VERSION = 2.7
> -LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.gz
> -LIBCONFUSE_SITE = http://savannah.nongnu.org/download/confuse/
> +LIBCONFUSE_VERSION = V2_7
> +LIBCONFUSE_SITE = $(call github,martinh,libconfuse,$(LIBCONFUSE_VERSION))
>  LIBCONFUSE_INSTALL_STAGING = YES
>  LIBCONFUSE_CONF_OPT = --disable-rpath
>  LIBCONFUSE_LICENSE = ISC
>  LIBCONFUSE_LICENSE_FILES = src/confuse.c
> 
> +LIBCONFUSE_AUTORECONF = YES
> +LIBCONFUSE_DEPENDENCIES += host-gettext
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
