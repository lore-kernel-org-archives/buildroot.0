From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 17:12:04 +0200
Subject: [Buildroot] [PATCH v2,1/1] boinc: new package
References: <1490523107-130671-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <47301exniq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

running test-pkg fails with a static-only build:

       br-arm-full-static [11/49]: FAILED

Because of that I have two more things to note:

Am Sun, 26 Mar 2017 12:11:47 +0200 schrieb Fabrice Fontaine:

> +BOINC_CONF_OPTS += \
> +	--enable-client \
> +	--with-libcurl=$(STAGING_DIR)/usr/lib \

this should read

	--with-libcurl=$(STAGING_DIR)/usr

$ output/build/boinc-7.6.34/configure --help | grep curl
  --with-libcurl=PREFIX   look for the curl library in PREFIX/lib and headers

> +	$(if $(BR2_STATIC_LIBS),--disable-dynamic-client-linkage, \
> +		--enable-dynamic-client-linkage)

Building with BR2_STATIC_LIBS=y is broken:

coproc.cpp:45:19: fatal error: dlfcn.h: No such file or directory
 #include <dlfcn.h>

Tested static-only build using this defconfig:

BR2_STATIC_LIBS=y
BR2_KERNEL_HEADERS_3_2=y
BR2_BINUTILS_VERSION_2_26_X=y
BR2_GCC_VERSION_4_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBCURL=y
BR2_PACKAGE_BOINC=y

Regards, Bernd
