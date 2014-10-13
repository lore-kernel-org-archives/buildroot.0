From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Oct 2014 22:49:03 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package/mono: new package
In-Reply-To: <1413209030-8187-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1413209030-8187-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20141013224903.0bfe6d76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Mon, 13 Oct 2014 16:03:50 +0200, Angelo Compagnucci wrote:

> +config BR2_PACKAGE_MONO
> +	bool "mono"
> +	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
> +	depends on BR2_INET_IPV6
> +	help
> +	  An open source, cross-platform, implementation of C#
> +	  and the CLR that is binary compatible with Microsoft.NET.
> +
> +	  http://download.mono-project.com/sources/mono/
> +
> +if BR2_PACKAGE_MONO
> +
> +	config BR2_PACKAGE_MONO_20
> +		bool "2.0/3.5 .Net Runtime"
> +		help
> +		  This option enables the installation of
> +		  the 2.0/3.5 version of the Mono .Net runtime to the target
> +
> +	config BR2_PACKAGE_MONO_40
> +		bool "4.0 .Net Runtime"
> +		help
> +		  This option enables the installation of
> +		  the 4.0 version of the Mono .Net runtime to the target
> +
> +	config BR2_PACKAGE_MONO_45
> +		bool "4.5 .Net Runtime"
> +		default y
> +		help
> +		  This option enables the installation of
> +		  the 4.5 version of the Mono .Net runtime to the target

I think I already told you, but I repeat if: no indentation inside
if ... endif, so:

if BR2_PACKAGE_FOO

config BR2_PACKAGE_FOO_BAZ
	bool "..."

config BR2_PACKAGE_FOO_BAZ2
	bool "..."

endif

Also, the wrapping of your help text for the runtime version options is
weird.


> +ifneq ($(BR2_PACKAGE_MONO_20),y) 
> +ifneq ($(BR2_PACKAGE_MONO_40),y)
> +ifneq ($(BR2_PACKAGE_MONO_45),y)
> +	BR2_PACKAGE_MONO_45 = y
> +endif
> +endif
> +endif

Noooooooo! Where have you seen that we're allowed to change the value
of Config.in options from within Makefiles?

Please handle this inside the Config.in directly in a proper way:

config BR2_PACKAGE_MONO
	bool "mono"
	...
	select BR2_PACKAGE_MONO_45 if !BR2_PACKAGE_MONO20 && !BR2_PACKAGE_MONO40

This way, you are guaranteed that if neither mono 2.0 nor mono 4.0 are
selected, then mono 4.5 is selected.

> +ifeq ($(BR2_PACKAGE_MONO_20),y)
> +	HOST_MONO_CONF_OPTS := $(patsubst --with-profile2=no,--with-profile2=yes,$(HOST_MONO_CONF_OPTS))
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MONO_40),y)
> +	HOST_MONO_CONF_OPTS := $(patsubst --with-profile4=no,--with-profile4=yes,$(HOST_MONO_CONF_OPTS))
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MONO_45),y)
> +	HOST_MONO_CONF_OPTS := $(patsubst --with-profile4_5=no,--with-profile4_5=yes,$(HOST_MONO_CONF_OPTS))
> +endif

Whaaat?

Remove:

+	--with-profile2=no \
+	--with-profile4=no \
+	--with-profile4_5=no

from the unconditional HOST_MONO_CONF_OPTS. And then simply do:

ifeq ($(BR2_PACKAGE_MONO_20),y)
HOST_MONO_CONF_OPTS += --with-profile2=yes
else
HOST_MONO_CONF_OPTS += --with-profile2=no
endif

And do it for each version. Or if you want a shorter version:

HOST_MONO_CONF_OPTS += --with-profile2=$(if $(BR2_PACKAGE_MONO_20),yes,no)

I'm not sure where you found this crazy patsubst solution, since what
I'm proposing here is what is done in *all* Buildroot packages. Maybe
you should spend a bit of time reading the .mk files of a few other
packages to get some idea on how we generally do things.

There's still on things that bothers me a bit: those options
(BR2_PACKAGE_MONO_{20,40,45}) are target options, but they are in fact
used when building host-mono, which isn't very clean. I assume it's not
possible to have the target mono package build the runtime libraries
using the compiler built by the host-mono package, right?

If not, then keep things as they are today, but put a comment above the
place where BR2_PAKCAGE_MONO_{20,40,45} is used in the .mk file
explaining why we're using those target options for a host package.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
