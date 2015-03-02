From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 2 Mar 2015 23:21:01 +0100
Subject: [Buildroot] [PATCH v2 4/4 GNURadio: new package
In-Reply-To: <1424891914-27748-4-git-send-email-gwenj@trabucayre.com>
References: <1424891914-27748-1-git-send-email-gwenj@trabucayre.com>
 <1424891914-27748-4-git-send-email-gwenj@trabucayre.com>
Message-ID: <CAHXCMMK_NkaMiZvgLdPfM+9qToFQdLaEPv8=E2KCQ4=w0zRVLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gwenhael,

On Wed, Feb 25, 2015 at 8:18 PM, Gwenhael Goavec-Merou
<gwenj@trabucayre.com> wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v1 -> v2:
> * overload _BUILDDIR variable to specify build directory
> ---
>  package/Config.in            |  1 +
>  package/gnuradio/Config.in   | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  package/gnuradio/gnuradio.mk | 24 ++++++++++++++++++++++++
>  3 files changed, 69 insertions(+)
>  create mode 100644 package/gnuradio/Config.in
>  create mode 100644 package/gnuradio/gnuradio.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index fe3d3d0..37235d5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1034,6 +1034,7 @@ menu "Miscellaneous"
>         source "package/clamav/Config.in"
>         source "package/collectd/Config.in"
>         source "package/empty/Config.in"
> +       source "package/gnuradio/Config.in"
>         source "package/googlefontdirectory/Config.in"
>         source "package/haveged/Config.in"
>         source "package/mcrypt/Config.in"
> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> new file mode 100644
> index 0000000..826e6fc
> --- /dev/null
> +++ b/package/gnuradio/Config.in
> @@ -0,0 +1,44 @@
> +config BR2_PACKAGE_GNURADIO
> +       bool "GNURadio"
> +       depends on BR2_INET_IPV6
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_LARGEFILE
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_USE_MMU
> +       depends on BR2_USE_WCHAR
> +       select BR2_PACKAGE_BOOST
> +       select BR2_PACKAGE_BOOST_DATE_TIME
> +       select BR2_PACKAGE_BOOST_FILESYSTEM
> +       select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
> +       select BR2_PACKAGE_BOOST_PYTHON
I guess boost-python is used to do the python binding, so it is not
needed if BR2_PACKAGE_GNURADIO_PYTHON is disabled, right?
Unless it is volk that pulls it?

> +       select BR2_PACKAGE_BOOST_SYSTEM
> +       select BR2_PACKAGE_BOOST_TEST
For what is boost-test used?
In BR we disable test build, and you explicitly disabled it in the *.mk file.

> +       select BR2_PACKAGE_BOOST_THREAD
> +       select BR2_PACKAGE_PYTHON
ditto  (same comment as boost-python)

> +
> +       help
> +         GNU Radio is a free & open-source software development toolkit that
> +         provides signal processing blocks to implement software radios. It can be
> +         used with readily-available low-cost external RF hardware to create
> +         software-defined radios, or without hardware in a simulation-like
> +         environment. It is widely used in hobbyist, academic and commercial
> +         environments to support both wireless communications research and
> +         real-world radio systems.
> +
> +         http://gnuradio.org/
> +
> +comment "GNURadio needs a toolchain w/ C++, mmu, threads"
> +       depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_MMU \
> +               && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS \
> +               && BR2_LARGEFILE && BR2_INET_IPV6)
Move the comment above "config BR2_PACKAGE_GNURADIO", otherwise the
indentation of the below sub-options will be lost in menuconfig.

> +
> +
> +if BR2_PACKAGE_GNURADIO
> +
> +config BR2_PACKAGE_GNURADIO_BLOCKS
> +       bool "gnuradio-blocks"
> +
> +config BR2_PACKAGE_GNURADIO_PYTHON
> +       bool "gnuradio-python"
If python and boost-python are only needed when
BR2_PACKAGE_GNURADIO_PYTHON is enable, BR2_PACKAGE_GNURADIO should
select the correct deps and the *.mk file should reflect the same
logic.

> +
> +endif
> diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
> new file mode 100644
> index 0000000..ba9ba13
> --- /dev/null
> +++ b/package/gnuradio/gnuradio.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# gnuradio
> +#
> +################################################################################
> +
> +GNURADIO_VERSION = 2bb2b31476cb33e9c1bbb196fffba3a857b4f75a
> +GNURADIO_SITE = git://git.gnuradio.org/gnuradio
Any reason to use the git instead of a released tarball?

> +GNURADIO_LICENSE = GPLv3+
> +GNURADIO_LICENSE_FILES = COPYING
> +
> +GNURADIO_BUILDDIR = $(GNURADIO_SRCDIR)/build
Just add a comment telling that gnuradio prevent from in-source-tree build.

> +#needed for volk compile
> +GNURADIO_DEPENDENCIES += host-python-cheetah
> +GNURADIO_DEPENDENCIES += host-swig host-boost boost
> +GNURADIO_INSTALL_STAGING = YES
Why is this needed?

> +
> +GNURADIO_CONF_OPTS += -DENABLE_DEFAULT=OFF -DENABLE_TESTING=OFF
> +GNURADIO_CONF_OPTS += -DENABLE_VOLK=ON -DENABLE_GNURADIO_RUNTIME=ON
> +
> +GNURADIO_CONF_OPTS += -DENABLE_GR_BLOCKS=$(if $(BR2_PACKAGE_GNURADIO_BLOCKS),ON,OFF)
> +GNURADIO_CONF_OPTS += -DENABLE_PYTHON=$(if $(BR2_PACKAGE_GNURADIO_PYTHON),ON,OFF)
> +
> +$(eval $(cmake-package))
> --
> 2.0.5
>

Regards,

-- 
Samuel
