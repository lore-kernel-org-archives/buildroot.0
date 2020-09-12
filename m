From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Sep 2020 00:43:47 +0200
Subject: [Buildroot] [PATCH 3/3] package/s390-tools: new package
In-Reply-To: <20200910174143.311039-4-egorenar@linux.ibm.com>
References: <20200910174143.311039-1-egorenar@linux.ibm.com>
 <20200910174143.311039-4-egorenar@linux.ibm.com>
Message-ID: <20200912224347.GJ10548@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander, All,

On 2020-09-10 19:41 +0200, Alexander Egorenkov spake thusly:
> Collection of tools for the IBM s390x and Z architectures.
> 
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
[--SNIP--]
> diff --git a/package/s390-tools/Config.in b/package/s390-tools/Config.in
> new file mode 100644
> index 0000000000..bddcd1d096
> --- /dev/null
> +++ b/package/s390-tools/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_S390_TOOLS_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_s390x

In this case, this package is really architecture-specific, so it will
never be available on other archtectures (or sub-architectures).

As such, BR2_PACKAGE_S390_TOOLS_ARCH_SUPPORTS is superfluous here,
and...

> +comment "s390-tools needs a uClibc or glibc toolchain w/ wchar, dynamic library"
> +	depends on BR2_PACKAGE_S390_TOOLS_ARCH_SUPPORTS

... here you should directly depend on BR2_s390x, and...

> +	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
> +		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
> +
> +config BR2_PACKAGE_S390_TOOLS
> +	bool "s390-tools"
> +	depends on BR2_PACKAGE_S390_TOOLS_ARCH_SUPPORTS

... here as well.

> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC

I see that s390-tools is supposed to work on a uclibc toolchain, but
your previous patch only enabled glibc for the internal toolchain.

However, I don;t see much support for s390x in uClibc-ng.

Quid?

> diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
> new file mode 100644
> index 0000000000..c72adaa6dc
> --- /dev/null
> +++ b/package/s390-tools/s390-tools.mk
> @@ -0,0 +1,80 @@
> +################################################################################
> +#
> +# s390-tools
> +#
> +################################################################################
> +
> +S390_TOOLS_VERSION = 2.14.0
> +S390_TOOLS_SITE = $(call github,ibm-s390-tools,s390-tools,v$(S390_TOOLS_VERSION))
> +S390_TOOLS_LICENSE = MIT
> +S390_TOOLS_LICENSE_FILES = LICENSE
> +
> +S390_TOOLS_MAKE_OPTS  = V=1 ARCH=$(BR2_ARCH)
> +S390_TOOLS_MAKE_OPTS += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
> +S390_TOOLS_MAKE_OPTS += LINK="$(TARGET_CC)" LINKXX="$(TARGET_CXX)"

It is custimary to do that with a single assignment:

    S390_TOOLS_MAKE_OPTS = \
        ARCH=$(BR2_ARCH) \
        CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
        LINK="$(TARGET_CC)" \
        LINKXX="$(TARGET_CXX)"

Any reason for forcing verbosity (V=1)?

> +ifeq ($(BR2_PACKAGE_LIBCURL),y)
> +S390_TOOLS_DEPENDENCIES += libcurl
> +else
> +S390_TOOLS_MAKE_OPTS += HAVE_CURL=0
> +endif

We want explicitly enabling of options as well (applicable to the other
options as well, of course):

    ifeq ($(BR2_PACKAGE_LIBCURL),y)
    S390_TOOLS_DEPENDENCIES += libcurl
    S390_TOOLS_MAKE_OPTS += HAVE_CURL=1
    else
    S390_TOOLS_MAKE_OPTS += HAVE_CURL=0
    endif

If that does not work, please explain it in the commit log:

    Options (e.g. HAVE_CURL=0) can only be disabled, and can't be
    explicitly enabled.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
