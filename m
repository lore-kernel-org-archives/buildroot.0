From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Apr 2016 16:09:59 +0200
Subject: [Buildroot] [PATCH v3] gutenprint: fix host build
In-Reply-To: <20160417095237.GA4469@waldemar-brodkorb.de>
References: <20160417095237.GA4469@waldemar-brodkorb.de>
Message-ID: <57139937.1090800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


  Hi Waldemar,

On 04/17/16 11:52, Waldemar Brodkorb wrote:
> Disable USB support when CUPS disabled, otherwise host build breaks.
> Fixes following autobuild error:
> http://autobuild.buildroot.net/results/081b3be918ac1eaa8cfbc5919e00bc1ea267c1df/
>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v2 -> v3:
>   * add patch from upstream
> v1 -> v2:
>   * extended comment why we need autoreconf suggested by Baruch
>   * patch suggested upstream as requested by Baruch
> ---
>   .../0004-build-usb-backends-conditional.patch      | 29 ++++++++++++++++++++++
>   package/gutenprint/gutenprint.mk                   |  3 ++-
>   2 files changed, 31 insertions(+), 1 deletion(-)
>   create mode 100644 package/gutenprint/0004-build-usb-backends-conditional.patch
>
> diff --git a/package/gutenprint/0004-build-usb-backends-conditional.patch b/package/gutenprint/0004-build-usb-backends-conditional.patch
> new file mode 100644
> index 0000000..7c744be
> --- /dev/null
> +++ b/package/gutenprint/0004-build-usb-backends-conditional.patch
> @@ -0,0 +1,29 @@
> +Backport from Upstream:
> +https://sourceforge.net/p/gimp-print/source/ci/fc1713589fed645f2c8002c3f66dfb69af314716/

  If a patch is backported from upstream, it still needs a proper commit message 
with description. You can reuse the upstream commit message:

build: Don't allow USB backends to be built if CUPS is not enabled.

  Actually, it would be even better if you could just cherry-pick it in a git 
checkout of 5.2.11, add the upstream reference and your Sob, and use git 
format-patch to generate the patch. Particularly because patches 2 and 3 are 
already git formatted.

  Regards,
  Arnout

> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +
> +diff -Nur gutenprint-5.2.11.orig/configure.ac gutenprint-5.2.11/configure.ac
> +--- gutenprint-5.2.11.orig/configure.ac	2016-01-14 04:02:49.000000000 +0100
> ++++ gutenprint-5.2.11/configure.ac	2016-04-16 17:16:17.017485358 +0200
> +@@ -442,12 +442,14 @@
> + dnl   [EXTRA_LIBREADLINE_DEPS]=""
> + dnl fi
> +
> +-# libusb-1.0 (For CUPS backends)
> +-PKG_CHECK_MODULES([LIBUSB], [libusb-1.0],
> +-                  [HAVE_LIBUSB=yes
> +-                   BUILD_LIBUSB_BACKENDS=yes],
> +-                  [HAVE_LIBUSB=no
> +-	           BUILD_LIBUSB_BACKENDS=no])
> ++# libusb-1.0 (For CUPS backends, but only bother if CUPS is enabled)
> ++if test "x$BUILD_CUPS" = "xyes" ; then
> ++ PKG_CHECK_MODULES([LIBUSB], [libusb-1.0],
> ++                   [HAVE_LIBUSB=yes
> ++                    BUILD_LIBUSB_BACKENDS=yes],
> ++                   [HAVE_LIBUSB=no
> ++	            BUILD_LIBUSB_BACKENDS=no])
> ++fi
> +
> + AC_PATH_PROGS([GIMPTOOL2_CHECK], [gimptool-2.0 gimptool])
> + if test -z "${GIMPTOOL2_CHECK}" ; then
> diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
> index 7e3024d..8cf4caf 100644
> --- a/package/gutenprint/gutenprint.mk
> +++ b/package/gutenprint/gutenprint.mk
> @@ -11,7 +11,7 @@ GUTENPRINT_SOURCE = gutenprint-$(GUTENPRINT_VERSION).tar.bz2
>   GUTENPRINT_LICENSE = GPLv2+
>   GUTENPRINT_LICENSE_FILES = COPYING
>
> -# Needed, as we touch Makefile.am
> +# Needed, as we touch Makefile.am and configure.ac
>   GUTENPRINT_AUTORECONF = YES
>
>   GUTENPRINT_DEPENDENCIES = \
> @@ -67,6 +67,7 @@ HOST_GUTENPRINT_CONF_OPTS = \
>   	--disable-escputil \
>   	--disable-test \
>   	--disable-testpattern \
> +	--without-libusb \
>   	--without-cups
>
>   # Needed by autoreconf
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
