From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Jun 2013 21:14:47 +0200
Subject: [Buildroot] [PATCH 2/4] package/libsvg: new package
In-Reply-To: <1372445557-15546-2-git-send-email-c.schoenert@gmail.com>
 (Carsten Schoenert's message of "Fri, 28 Jun 2013 20:52:35 +0200")
References: <1372445557-15546-1-git-send-email-c.schoenert@gmail.com>
 <1372445557-15546-2-git-send-email-c.schoenert@gmail.com>
Message-ID: <87ehbmyrmg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carsten" == Carsten Schoenert <c.schoenert@gmail.com> writes:

 Carsten> From: Carsten Schoenert <c.schoenert@gmail.com>
 Carsten> Libsvg provides a library for parsing SVG content in files or buffers.
 Carsten> Libsvg does not do any rendering, but instead provides a function-based
 Carsten> interface that can be used by various rendering engines.

 Carsten> Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
 Carsten> ---
 Carsten>  package/Config.in        |    1 +
 Carsten>  package/libsvg/Config.in |   10 ++++++++++
 Carsten>  package/libsvg/libsvg.mk |   15 +++++++++++++++
 Carsten>  3 files changed, 26 insertions(+)
 Carsten>  create mode 100644 package/libsvg/Config.in
 Carsten>  create mode 100644 package/libsvg/libsvg.mk

 Carsten> diff --git a/package/Config.in b/package/Config.in
 Carsten> index ebeabeb..7f5714d 100644
 Carsten> --- a/package/Config.in
 Carsten> +++ b/package/Config.in
 Carsten> @@ -461,6 +461,7 @@ source "package/libpng/Config.in"
 Carsten>  source "package/libqrencode/Config.in"
 Carsten>  source "package/libraw/Config.in"
 Carsten>  source "package/librsvg/Config.in"
 Carsten> +source "package/libsvg/Config.in"
 Carsten>  source "package/libsvgtiny/Config.in"
 Carsten>  source "package/libungif/Config.in"
 Carsten>  source "package/opencv/Config.in"
 Carsten> diff --git a/package/libsvg/Config.in b/package/libsvg/Config.in
 Carsten> new file mode 100644
 Carsten> index 0000000..0e372fe
 Carsten> --- /dev/null
 Carsten> +++ b/package/libsvg/Config.in
 Carsten> @@ -0,0 +1,10 @@
 Carsten> +config BR2_PACKAGE_LIBSVG
 Carsten> +	bool "libsvg"
 Carsten> +	select BR2_PACKAGE_LIBXML2
 Carsten> +	help
 Carsten> +	  Libsvg provides a parser for SVG content in files or buffers.
 Carsten> +	  Libsvg does not do any rendering, but instead provides a
 Carsten> +	  function-based interface that can be used by various rendering
 Carsten> +	  engines.
 Carsten> +
 Carsten> +	  http://www.t2-project.org/packages/libsvg.html

Are you sure that's the upstream URL? Isn't t2 yet another embedded
build system?

 Carsten> diff --git a/package/libsvg/libsvg.mk b/package/libsvg/libsvg.mk
 Carsten> new file mode 100644
 Carsten> index 0000000..069314d
 Carsten> --- /dev/null
 Carsten> +++ b/package/libsvg/libsvg.mk
 Carsten> @@ -0,0 +1,15 @@
 Carsten> +################################################################################
 Carsten> +#
 Carsten> +# libsvg
 Carsten> +#
 Carsten> +################################################################################
 Carsten> +
 Carsten> +LIBSVG_VERSION         = 0.1.4
 Carsten> +LIBSVG_SOURCE          = libsvg-$(LIBSVG_VERSION).tar.gz

This is the default, so you can drop this line.

Personally I prefer to not align the '=' signs, but I know we have a bit
of a mix in the tree.

 Carsten> +LIBSVG_SITE            = http://cairographics.org/snapshots/
 Carsten> +LIBSVG_DEPENDENCIES    = libxml2
 Carsten> +LIBSVG_INSTALL_STAGING = YES
 Carsten> +LIBSVG_LICENSE         = LGPLv2

grep -rls 'any later version' src | wc -l
24

It looks to be LGPLv2+.


 Carsten> +LIBSVG_LICENSE_FILES   = COPYING
 Carsten> +
 Carsten> +$(eval $(autotools-package))

It looks good, but it doesn't work:

checking for ANSI C header files... (cached) yes
checking whether libexpat is requested... no
./configure: line 20639: /home/peko/source/buildroot/output/host/usr/bin/pkg-config: No such file or directory
*** Your version of pkg-config is too old. You need version 0.9.0 or newer.
*** See http://www.freedesktop.org/software/pkgconfig
configure: error: Library requirements (libxml-2.0 >= 2.4.7 ) not met; consider adjusting the PKG_CONFIG_PATH environment variable if your libraries are in a nonstandard prefix so pkg-config can find them.

So you atleast need host-pkgconf as a dependency. It looks like it can
work with expat instead, so you could drop the hard dependency on
libxml2, but that is not really critical.

-- 
Bye, Peter Korsgaard
