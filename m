From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Oct 2015 15:51:26 +0200
Subject: [Buildroot] [PATCH v2] liquid-dsp: new package
In-Reply-To: <1444411216-20242-1-git-send-email-guillaume.bressaix@gmail.com>
References: <1444411216-20242-1-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <20151011155126.0749ea7c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guillaume,

Thanks for this new version. I've applied your patch, but I've done a
lot of changes to it. See below for some details.

On Fri, 9 Oct 2015 11:20:16 -0600, Guillaume William Bres wrote:
> Applied modifications suggested by Thomas:
> 
> package/liquid-dsp/Config.in =>
> 	updated dependencies: BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL,
> 	fixed indentation problem,
> 	PACKAGE_VERSION = commit ID instead of master branch,
> 	updated licence,
> 	removed -mfloat-abi=hard from CFLAGS,
> 	renamed linker flags to LDFLAGS.

Such text should be here, but below the "---" marker. What is *before*
the marker gets kept forever in the history in the patch, while what is
*after* the marker is only visible when reviewing the patch and gets
removed when the patch is applied. So all the history about the
numerous iterations of a patch should be written after the "---" marker.

> Signed-off-by: Guillaume William Bres <guillaume.bressaix@gmail.com>
> ---

Here.

>  package/Config.in                |    1 +
>  package/liquid-dsp/Config.in     |   21 +++++++++++++++++
>  package/liquid-dsp/liquid-dsp.mk |   48 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 70 insertions(+)
>  create mode 100644 package/liquid-dsp/Config.in
>  create mode 100644 package/liquid-dsp/liquid-dsp.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 3794f44..60ad72a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1123,6 +1123,7 @@ comment "linux-pam plugins"
>  	source "package/libpam-radius-auth/Config.in"
>  	source "package/libpam-tacplus/Config.in"
>  endif
> +	source "package/liquid-dsp/Config.in"
>  	source "package/lttng-libust/Config.in"
>  	source "package/mpc/Config.in"
>  	source "package/mpdecimal/Config.in"
> diff --git a/package/liquid-dsp/Config.in b/package/liquid-dsp/Config.in
> new file mode 100644
> index 0000000..261d3af
> --- /dev/null
> +++ b/package/liquid-dsp/Config.in
> @@ -0,0 +1,21 @@
> +comment "liquid-dsp requires a (e)glibc toolchain"

or musl

> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL

And this is wrong: the comment would be shown precisely when glibc or
musl is used, while we want the opposite.

Also, liquid-dsp unconditionally builds a shared library, so we need to
depend on dynamic library support.

> +
> +config BR2_PACKAGE_LIQUID_DSP
> +	bool "liquid-dsp"

You need to have the dependency on glibc or musl here, otherwise the
package can be selected.

And the dependency on !BR2_STATIC_LIBS to avoid being built in static
only scenarios.

> +	help
> +	  Liquid-DSP is a free and open-source signal processing library 
> +	  for software-defined radios written in C. 
> +	  Its purpose is to provide a set of extensible DSP modules 
> +	  that do no rely on external dependencies or cumbersome frameworks.

There's lots of trailing whitespaces all over the place here (and
elsewhere). I suggest that you change your text editor configuration to
make such trailing whitespaces clearly visible. They are dislike in
many open-source projects.

> +
> +	  http://liquidsdr.org/
> +
> +if BR2_PACKAGE_LIQUID_DSP
> +
> +config BR2_PACKAGE_LIQUID_DSP_FAST
> +	bool "optimize for speed over accuracy"
> +	help 
> +	  Optimize for speed over accuracy.
> +
> +endif
> diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
> new file mode 100644
> index 0000000..ccabbf9
> --- /dev/null
> +++ b/package/liquid-dsp/liquid-dsp.mk
> @@ -0,0 +1,48 @@
> +################################################################################
> +#
> +# liquid-dsp
> +#
> +################################################################################
> +
> +LIQUID_DSP_VERSION = df5a459fa0

You should have used a full Git commit ID here, and not a short version.

> +LIQUID_DSP_SITE = https://github.com/jgaeddert/liquid-dsp.git
> +LIQUID_DSP_SITE_METHOD = git

The github function should have been used here.

> +LIQUID_DSP_LICENSE = MIT 

Trailing whitespace again here.

> +LIQUID_DSP_LICENSE_FILES = COPYING
> +LIQUID_DSP_INSTALL_STAGING = YES 
> +
> +LIQUID_DSP_DEPENDENCIES = host-autoconf host-automake
> +
> +define LIQUID_DSP_PRE_CONFIGURE_BOOTSTRAP
> +	rm -f $(LIQUID_DSP_DIR)/config.cache 
> +	rm -f $(LIQUID_DSP_DIR)/aclocal.m4
> +	cd $(LIQUID_DSP_DIR) && $(ACLOCAL) -I./scripts && $(AUTOCONF) && $(AUTOHEADER) 
> +endef
> +
> +LIQUID_DSP_PRE_CONFIGURE_HOOKS += LIQUID_DSP_PRE_CONFIGURE_BOOTSTRAP

This hack is not needed. Instead, a simple addition to the configure.ac
(using AC_CONFIG_MACRO_DIR) solves the problem much more cleanly. I've
submitted a patch upstream:
https://github.com/jgaeddert/liquid-dsp/pull/15.

> +
> +LIQUID_DSP_CFLAGS = $(TARGET_CFLAGS)
> +LIQUID_DSP_LDFLAGS = $(TARGET_LDFLAGS)
> +
> +# Speed over accuracy trade off
> +ifeq ($(BR2_PACKAGE_LIQUID_DSP_FAST),y)
> +LIQUID_DSP_CFLAGS += -ffast-math
> +endif
> +
> +# use FFTW instead of built-in FFT
> +ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
> +LIQUID_DSP_LDFLAGS += -lfftw3f
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),y)
> +LIQUID_DSP_LDFLAGS += -lfftw3
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),y)
> +LIQUID_DSP_LDFLAGS += -lfftw3l
> +endif
> +
> +LIQUID_DSP_CONF_OPTS += CFLAGS="$(LIQUID_DSP_CFLAGS)"
> +LIQUID_DSP_CONF_OPTS += LDFLAGS="$(LIQUID_DSP_LDFLAGS)"

This could have be done in one assignment.

In total the list of changes I've made is:

    [Thomas:
      - add patch to fix autoreconf issue, and use LIQUID_DSP_AUTORECONF =
        YES instead of an horrible hack calling aclocal/autoconf manually.
      - use the github macro instead of hand-coding <pkg>_SITE and
        <pkg>_SITE_METHOD. This allows to remove <pkg>_SITE_METHOD
        entirely.
      - use a full hash as the <pkg>_VERSION
      - remove trailing whitespace everywhere.
      - use one single assignment of LIQUID_DSP_CONF_OPTS
      - fix the comment about the eglibc/musl dependency (it was only
        mentioning eglibc, and the condition was inverted)
      - add the musl/glibc dependency on the package option itself
      - make the package depend on dynamic library support, since the
        makefile unconditionally builds a shared library.
      - add hash file.]

See
http://git.buildroot.net/buildroot/commit/?id=f9e4ccac112e87c924ef9ff78049e35e65f3b465
for the final commit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
