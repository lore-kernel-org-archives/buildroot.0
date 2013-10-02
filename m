From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Oct 2013 13:50:42 +0200
Subject: [Buildroot] [Patch v4] libcgroup: new package
In-Reply-To: <1380658785-16964-1-git-send-email-clshotwe@rockwellcollins.com>
 (Clayton Shotwell's message of "Tue, 1 Oct 2013 15:19:45 -0500")
References: <1380658785-16964-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <87ioxfriwd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Clayton" == Clayton Shotwell <clshotwe@rockwellcollins.com> writes:

 Clayton> Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>

Sorry, we're not quite there yet .. (see below)

 Clayton> ---
 Clayton>  package/Config.in              |    1 +
 Clayton>  package/libcgroup/Config.in    |    7 +++++++
 Clayton>  package/libcgroup/libcgroup.mk |   34 ++++++++++++++++++++++++++++++++++
 Clayton>  3 files changed, 42 insertions(+), 0 deletions(-)
 Clayton>  create mode 100644 package/libcgroup/Config.in
 Clayton>  create mode 100644 package/libcgroup/libcgroup.mk

 Clayton> diff --git a/package/Config.in b/package/Config.in
 Clayton> index bb8c6b7..8427abc 100644
 Clayton> --- a/package/Config.in
 Clayton> +++ b/package/Config.in
 Clayton> @@ -661,6 +661,7 @@ source "package/libatomic_ops/Config.in"
 Clayton>  source "package/libbsd/Config.in"
 Clayton>  source "package/libcap/Config.in"
 Clayton>  source "package/libcap-ng/Config.in"
 Clayton> +source "package/libcgroup/Config.in"
 Clayton>  source "package/libdaemon/Config.in"
 Clayton>  source "package/libelf/Config.in"
 Clayton>  source "package/libevent/Config.in"
 Clayton> diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
 Clayton> new file mode 100644
 Clayton> index 0000000..9f8754d
 Clayton> --- /dev/null
 Clayton> +++ b/package/libcgroup/Config.in
 Clayton> @@ -0,0 +1,7 @@
 Clayton> +config BR2_PACKAGE_LIBCGROUP
 Clayton> +	bool "libcgroup"
 Clayton> +	help
 Clayton> +	  libcgroup is a library that abstracts the control
 Clayton> +	  group file system in Linux.
 Clayton> +	  

Nit: the empty <tab> shouldn't be here.

 Clayton> +	  http://libcg.sourceforge.net/
 Clayton> diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
 Clayton> new file mode 100644
 Clayton> index 0000000..fd7c4fc
 Clayton> --- /dev/null
 Clayton> +++ b/package/libcgroup/libcgroup.mk
 Clayton> @@ -0,0 +1,34 @@
 Clayton> +################################################################################
 Clayton> +#
 Clayton> +# libcgroup
 Clayton> +#
 Clayton> +################################################################################
 Clayton> +
 Clayton> +LIBCGROUP_VERSION = 0.38
 Clayton> +LIBCGROUP_SOURCE = libcgroup-$(LIBCGROUP_VERSION).tar.bz2
 Clayton> +LIBCGROUP_SITE = http://sourceforge.net/projects/libcg/files/latest/download

This ends up downloading a .tar.gz of 0.40.rc1. I believe you need to
use:

http://downloads.sourceforge.net/project/libcg/libcgroup/v.038

The version number syntax is unfortunately different than above so we
cannot use $(LIBCGROUP_VERSION) :/


 Clayton> +LIBCGROUP_LICENSE = LGPLv2.1
 Clayton> +LIBCGROUP_LICENSE_FILES = COPYING
 Clayton> +
 Clayton> +LIBCGROUP_INSTALL_STAGING = YES
 Clayton> +
 Clayton> +# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h 
 Clayton> +# large file support. See https://bugzilla.redhat.com/show_bug.cgi?id=574992 

The trailing white space should go.


 Clayton> +# for more information.
 Clayton> +LIBCGROUP_CONF_ENV = \
 Clayton> +	CXXFLAGS+="-U_FILE_OFFSET_BITS" \
 Clayton> +	CFLAGS+="-U_FILE_OFFSET_BITS"

The fact that you're setting CXXFLAGS is a hint that it needs C++
support.

configure.in has AC_PROG_CXX. The only thing really using C++ is
./tests/libcg_ba.cpp, but there doesn't seem to be any easy way of not
building it, so you should make the package depend on
BR2_INSTALL_LIBSTDCPP (and show a comment if not available).

I gave it a test with the internal uClibc toolchain, but it doesn't
work:

make[4]: Entering directory `/home/peko/source/buildroot/output/build/libcgroup-0.38/src'
  CC     parse.lo
  CC     api.lo
  CC     lex.lo
  CC     config.lo
  CC     wrapper.lo
In file included from api.c:35:0:
./libcgroup-internal.h:22:17: fatal error: fts.h: No such file or directory
compilation terminated.

fts.h is not provided by default (and not in our default config) by uClibc:

config UCLIBC_HAS_FTS
        bool "Support the fts() interface (bsd-compat)"
        help
          The fts functions are provided for traversing UNIX file hierarchies.

          This interface is currently used by the elfutils and adds
          around 7.5k.
          You should port your application to use the POSIX nftw()
          interface.

          Unless you need to build/use elfutils, you should prolly
          answer N.

So either we should see how much work it would be to change libcgroup to
use nftw() instead (perhaps it is already done in 0.40.rc1?) or you
should make it depend on BR2_TOOLCHAIN_USES_GLIBC (see cppcms for an
example).

Care to take a look at these issues and resubmit?

-- 
Bye, Peter Korsgaard
