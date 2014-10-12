From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 10:25:54 +0200
Subject: [Buildroot] [PATCH 2/2] package/mono: new package
In-Reply-To: <1413100208-12776-3-git-send-email-angelo.compagnucci@gmail.com>
References: <1413100208-12776-1-git-send-email-angelo.compagnucci@gmail.com>
 <1413100208-12776-3-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20141012102554.39aa340a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Sun, 12 Oct 2014 09:50:08 +0200, Angelo Compagnucci wrote:

> +config BR2_PACKAGE_MONO
> +	bool "mono"
> +	select BR2_STRIP_none

Why ? This is not acceptable in a package.

> +	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
> +	depends on BR2_INET_IPV6
> +	help
> +	  An open source, cross-platform, implementation of C#
> +	  and the CLR that is binary compatible with Microsoft.NET.
> +
> +	  http://download.mono-project.com/sources/mono/
> +
> +if BR2_PACKAGE_MONO

One empty new line here.

> +	config BR2_PACKAGE_MONO_20

No indentation here.

> +		bool "2.0 .Net Runtime"
> +		help
> +		  Version 2.0 of Mono .Net runtime

Empty new line here as well.

> +	config BR2_PACKAGE_MONO_35
> +		bool "3.5 .Net Runtime"
> +		help
> +		  Version 3.0 of Mono .Net runtime

Help text doesn't match the prompt.

> +	config BR2_PACKAGE_MONO_40
> +		bool "4.0 .Net Runtime"
> +		help
> +		  Version 4.0 of Mono .Net runtime
> +	config BR2_PACKAGE_MONO_45
> +		default y
> +		bool "4.5 .Net Runtime"
> +		help
> +		  Version 4.5 of Mono .Net runtime

The help texts are useless. So either remove them, or make them a
little bit more useful, like "This option enables the installation of
the 4.5 version of the Mono .Net runtime to the target".

Also, please enable by default one of the runtime versions, so that at
least by default, things work.

> diff --git a/package/mono/mono-001-gc-fix-uclibc.patch b/package/mono/mono-001-gc-fix-uclibc.patch
> new file mode 100644
> index 0000000..951d568
> --- /dev/null
> +++ b/package/mono/mono-001-gc-fix-uclibc.patch
> @@ -0,0 +1,16 @@
> +Disable backtrace on not supprted uclibc.

Typo: supported

> diff --git a/package/mono/mono.mk b/package/mono/mono.mk
> new file mode 100644
> index 0000000..621ad96
> --- /dev/null
> +++ b/package/mono/mono.mk
> @@ -0,0 +1,74 @@
> +#############################################################
> +#
> +# mono
> +#
> +#############################################################
> +
> +MONO_VERSION = 3.10.0
> +MONO_SITE = http://download.mono-project.com/sources/mono/
> +MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
> +MONO_LICENSE = Dual license LGPL, commercial

Which version of the LGPL ?

Also, it should be:

MONO_LICENSE = LGPLvX or commecial

> +ifeq ($(BR2_PACKAGE_MONO_20),y)
> +	ASSEMBLY_INCLUDED += $(HOST_DIR)/usr/lib/mono/2.0
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MONO_35),y)
> +	ASSEMBLY_INCLUDED += $(HOST_DIR)/usr/lib/mono/3.5
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MONO_40),y)
> +	ASSEMBLY_INCLUDED += $(HOST_DIR)/usr/lib/mono/4.0
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MONO_45),y)
> +	ASSEMBLY_INCLUDED += $(HOST_DIR)/usr/lib/mono/4.5
> +endif

Using a variable like ASSEMBLY_INCLUDED is not good. Remember that the
namespace of variables is global in Buildroot, so all variables defined
by a package should *always* be prefixed by the package name. In this
case MONO_.

That being said, are you sure this dance is really needed? There are
some configure options to Mono to enable or disable the various
versions of the runtime.

> +ifneq ($(ASSEMBLY_INCLUDED),)
> +$(eval $(host-autotools-package))
> +endif

Conditional not needed. I think we should ensure at least one runtime
version is enabled.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
