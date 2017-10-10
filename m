From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Oct 2017 23:43:01 +0200
Subject: [Buildroot] [PATCH] flatbuffers: new package
In-Reply-To: <1505730918-17857-1-git-send-email-erik.tideman@faltcom.se>
References: <1505730918-17857-1-git-send-email-erik.tideman@faltcom.se>
Message-ID: <20171010234301.5d278dcc@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Sep 2017 12:35:18 +0200, Erik Tideman wrote:
> ---
>  DEVELOPERS                           |  3 +++
>  package/Config.in                    |  1 +
>  package/flatbuffers/Config.in        | 13 +++++++++++++
>  package/flatbuffers/flatbuffers.hash |  2 ++
>  package/flatbuffers/flatbuffers.mk   | 23 +++++++++++++++++++++++
>  5 files changed, 42 insertions(+)
>  create mode 100644 package/flatbuffers/Config.in
>  create mode 100644 package/flatbuffers/flatbuffers.hash
>  create mode 100644 package/flatbuffers/flatbuffers.mk

Thanks for this contribution! Looks mostly good. However, one important
thing that is missing is your Signed-off-by in the commit log. Could
you resend with this added ?

> diff --git a/package/flatbuffers/Config.in b/package/flatbuffers/Config.in
> new file mode 100644
> index 0000000..b3a9941
> --- /dev/null
> +++ b/package/flatbuffers/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_FLATBUFFERS
> +	bool "flatbuffers"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	help
> +	  FlatBuffers is an efficient cross platform serialization
> +	  library for C++, C#, C, Go, Java, JavaScript, PHP, and
> +	  Python. It was originally created at Google for game
> +	  development and other performance-critical applications.
> +	  It is available as Open Source on GitHub under the Apache
> +	  license, v2 (see LICENSE.txt).
> +
> +	  https://google.github.io/flatbuffers/index.html

You need a Config.in comment here:

comment "flatbuffers needs a toolchain w/ C++, gcc >= 4.7"
	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7

> diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
> new file mode 100644
> index 0000000..7e3eb36
> --- /dev/null
> +++ b/package/flatbuffers/flatbuffers.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# flatbuffers
> +#
> +################################################################################
> +
> +FLATBUFFERS_VERSION = v1.7.1
> +FLATBUFFERS_SITE = $(call github,google,flatbuffers,$(FLATBUFFERS_VERSION))
> +FLATBUFFERS_LICENSE = Apache-2.0
> +FLATBUFFERS_LICENSE_FILES = COPYING
> +FLATBUFFERS_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +FLATBUFFERS_CONF_OPTS += -DFLATBUFFERS_BUILD_SHAREDLIB=OFF
> +else
> +FLATBUFFERS_CONF_OPTS += -DFLATBUFFERS_BUILD_SHAREDLIB=TRUE
> +endif

Using OFF and TRUE doesn't look very consistent. Can we use OFF/ON
instead ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
