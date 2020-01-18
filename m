From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2020 15:59:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/olsr: bump to version 0.9.8
In-Reply-To: <20200118135708.86185-1-fontaine.fabrice@gmail.com>
References: <20200118135708.86185-1-fontaine.fabrice@gmail.com>
Message-ID: <20200118145946.GD22540@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-01-18 14:57 +0100, Fabrice Fontaine spake thusly:
> - Switch site to github
> - Drop patch (already in version)
> - Add poprouting plugin (added in version 0.9.7 with
>   https://github.com/OLSR/olsrd/commit/316901040f310f39b4d8d993ad0dcf5121640bf2)
> - Add hash for license files
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/olsr/0001-configurable-ldconfig.patch | 33 -------------------
>  package/olsr/olsr.hash                        |  6 ++--
>  package/olsr/olsr.mk                          |  8 ++---
>  3 files changed, 7 insertions(+), 40 deletions(-)
>  delete mode 100644 package/olsr/0001-configurable-ldconfig.patch
> 
> diff --git a/package/olsr/0001-configurable-ldconfig.patch b/package/olsr/0001-configurable-ldconfig.patch
> deleted file mode 100644
> index 73fff7eecf..0000000000
> --- a/package/olsr/0001-configurable-ldconfig.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Make ldconfig configurable
> -
> -In a cross-compilation set up, running /sbin/ldconfig is useless, so
> -we make the path to ldconfig configurable through the environment/make
> -command line. This allows to pass LDCONFIG=/bin/true when doing
> -cross-compilation.
> -
> -[Gustavo: update patch for olsr 0.6.4]
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -
> -diff -Nura olsrd-0.6.4.orig/make/Makefile.linux olsrd-0.6.4/make/Makefile.linux
> ---- olsrd-0.6.4.orig/make/Makefile.linux	2013-01-29 09:00:18.041356389 -0300
> -+++ olsrd-0.6.4/make/Makefile.linux	2013-01-29 09:01:51.598226624 -0300
> -@@ -3,6 +3,7 @@
> - #
> - 
> - ARCH := $(shell uname -m)
> -+LDCONFIG ?= /sbin/ldconfig
> - 
> - DESTDIR ?=
> - prefix ?= /usr/local
> -@@ -26,9 +27,9 @@
> - PLUGIN_SONAME ?= lib$(PLUGIN_NAME).so
> - PLUGIN_FULLNAME ?= $(PLUGIN_NAME).so.$(PLUGIN_VER)
> - INSTALL_LIB =	install -D -m 755 $(PLUGIN_FULLNAME) $(LIBDIR)/$(PLUGIN_FULLNAME); \
> --		/sbin/ldconfig -n $(LIBDIR)
> -+		$(LDCONFIG) -n $(LIBDIR)
> - UNINSTALL_LIB =	rm -f $(LIBDIR)/$(PLUGIN_FULLNAME); \
> --		/sbin/ldconfig -n $(LIBDIR)
> -+		$(LDCONFIG) -n $(LIBDIR)
> - 
> - ifdef OLSRD_PLUGIN
> - GENERATE_PIC = true
> diff --git a/package/olsr/olsr.hash b/package/olsr/olsr.hash
> index 6de0290559..821361bb13 100644
> --- a/package/olsr/olsr.hash
> +++ b/package/olsr/olsr.hash
> @@ -1,2 +1,4 @@
> -# From http://www.olsr.org/releases/0.9/SHA256SUM-0.9.6.1
> -sha256 9cac290e9bff5fc7422110b9ccd972853f10962c962d2f31a63de9c6d1520612  olsrd-0.9.6.1.tar.bz2
> +# Locally computed
> +sha256 ee9e524224e5d5304dcf61f1dc5485c569da09d382934ff85b233be3e24821a3  olsr-0.9.8.tar.gz
> +sha256 7dcf1fb93ef105e2708b02603bb6ee443115d4819fbf2c5a3a001b46887acb9a  license.txt
> +sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  lib/pud/nmealib/LICENSE
> diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
> index 53bf874af0..31c601f80e 100644
> --- a/package/olsr/olsr.mk
> +++ b/package/olsr/olsr.mk
> @@ -4,12 +4,10 @@
>  #
>  ################################################################################
>  
> -OLSR_VERSION_MAJOR = 0.9
> -OLSR_VERSION = $(OLSR_VERSION_MAJOR).6.1
> -OLSR_SOURCE = olsrd-$(OLSR_VERSION).tar.bz2
> -OLSR_SITE = http://www.olsr.org/releases/$(OLSR_VERSION_MAJOR)
> +OLSR_VERSION = 0.9.8
> +OLSR_SITE = $(call github,OLSR,olsrd,v$(OLSR_VERSION))
>  OLSR_PLUGINS = arprefresh bmf dot_draw dyn_gw dyn_gw_plain httpinfo jsoninfo \
> -	mdns nameservice netjson p2pd pgraph secure txtinfo watchdog
> +	mdns nameservice netjson poprouting p2pd pgraph secure txtinfo watchdog
>  # Doesn't really need quagga but not very useful without it
>  OLSR_PLUGINS += $(if $(BR2_PACKAGE_QUAGGA),quagga)
>  OLSR_LICENSE = BSD-3-Clause, LGPL-2.1+
> -- 
> 2.24.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
