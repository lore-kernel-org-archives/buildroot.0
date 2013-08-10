From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Aug 2013 19:13:16 +0200
Subject: [Buildroot] [PATCH 1/1] ola: new package
In-Reply-To: <1375881032-23901-1-git-send-email-blanco.ether@gmail.com>
References: <1375881032-23901-1-git-send-email-blanco.ether@gmail.com>
Message-ID: <20130810191316.7fd6fdbe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dave Skok,

Thanks for this patch! It is not sent properly, isn't wrapped, and has
the proper format. So I tried it, but found a few issues.

On Wed,  7 Aug 2013 09:10:32 -0400, Dave Skok wrote:

> +config BR2_PACKAGE_OLA
> +	bool "open lighting architecture"
> +	select BR2_PACKAGE_PROTOBUF
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +	select BR2_PACKAGE_UTIL_LINUX
> +	depends on BR2_INSTALL_LIBSTDCPP # protobuf
> +	depends on BR2_LARGEFILE # util-linux
> +	depends on BR2_USE_WCHAR # util-linux

You should also:

	depends on BR2_TOOLCHAIN_HAS_THREADS

> +	help
> +	  Open Lighting Architecture provides applications 
> +	  with a mechanism to send and receive DMX512 & RDM 
> +	  commands using hardware devices and DMX over IP protocols.
> +
> +	  http://www.opendmx.net/index.php/OLA
> +
> +comment "ola requires a toolchain with C++, largefile and wchar support"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_USE_WCHAR

and change this to mention the need for thread support. Without thread
support, OLA fails to build as it tries to include <pthread.h>.

Then, the most annoying issue I had was that the very basic
configuration of OLA (just enable OLA and leave all the sub-options to
the default) doesn't build here:

OlaServer.cpp: In member function 'void ola::OlaServer::UpdatePidStore(const ola::rdm::RootPidStore*)':
OlaServer.cpp:467:14: error: request for member 'SetPidStore' in '*((ola::OlaServer*)this)->ola::OlaServer::m_httpd.std::auto_ptr<_Tp>::operator-><int>()', which is of non-class type 'std::auto_ptr<int>::element_type {aka int}'

I'm really bad at C++, but it looks like SetPidStore() is a method that
only exists when the HTTP server of OLA is enabled, or something like that.

> --- /dev/null
> +++ b/package/ola/ola.mk
> @@ -0,0 +1,155 @@
> +################################################################################
> +#
> +# ola
> +#
> +################################################################################
> +
> +OLA_VERSION = 0.8.30
> +OLA_SITE = https://code.google.com/p/open-lighting/
> +OLA_SITE_METHOD = git
> +
> +# autoreconf required for source pulled from git repo
> +# as it does not track configuration
> +OLA_AUTORECONF = YES
> +OLA_LICENSE = LGPLv2.1+
> +OLA_LICENSE_FILES = LICENSE COPYING.LGPLv2.1

These license informations are not correct. They should be:

OLA_LICENSE = LGPLv2.1+ (libola, libolacommon, Python bindings), GPLv2+ (libolaserver, olad, Python examples and tests)
OLA_LICENSE_FILES = LICENCE GPL LGPL

Also, I believe you should add:

OLA_INSTALL_STAGING = YES

because it installs some clients libraries to talk to the 'olad'
daemon, and those libraries can be useful to link other programs.

I could have fixed those myself, but I've stopped due to the build
failure.

Here is the minimal defconfig that I used to exhibit the build problem:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2013.05-1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_OLA=y

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
