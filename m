From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Aug 2020 23:13:56 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/frr: new package
In-Reply-To: <20200225155322.8440-3-vadim4j@gmail.com>
References: <20200225155322.8440-1-vadim4j@gmail.com>
 <20200225155322.8440-3-vadim4j@gmail.com>
Message-ID: <20200826231356.4b04ae09@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 25 Feb 2020 17:53:22 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:

> FRR is free software that implements and manages various IPv4 and IPv6
> routing protocols. It runs on nearly all distributions of Linux and BSD
> as well as Solaris and supports all modern CPU architectures.
> 
> FRR currently supports the following protocols:
> 
>     BGP
>     OSPFv2
>     OSPFv3
>     RIPv1
>     RIPv2
>     RIPng
>     IS-IS
>     PIM-SM/MSDP
>     LDP
>     BFD
>     Babel
>     PBR
>     OpenFabric
>     VRRP
>     EIGRP (alpha)
>     NHRP (alpha)
> 
> Some not-needed features were disabled to minimize package dependencies:
> 
>     - POSIX capabilities
>     - RPKi
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>

I've applied to next, with a few changes, see below.

> diff --git a/package/frr/Config.in b/package/frr/Config.in
> new file mode 100644
> index 0000000000..c0c3bdd693
> --- /dev/null
> +++ b/package/frr/Config.in
> @@ -0,0 +1,25 @@
> +config BR2_PACKAGE_FRR
> +	bool "frr"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS # libyang
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_PACKAGE_BASH # init

I've selected bash instead of depending on it.

> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
> +	select BR2_PACKAGE_C_ARES
> +	select BR2_PACKAGE_LIBYANG
> +	select BR2_PACKAGE_LIBNL
> +	select BR2_PACKAGE_READLINE
> +	select BR2_PACKAGE_JSON_C
> +	help
> +	  The FRRouting Protocol Suite.
> +
> +	  FRR is free software that implements and manages various IPv4 and
> +	  IPv6 routing protocols.
> +
> +	  https://frrouting.org
> +
> +comment "frr needs BASH, threads, dynamic library"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on BR2_USE_MMU
> +	depends on !BR2_PACKAGE_BASH || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_STATIC_LIBS

And so I dropped the "bash" part of this comment.

> +start() {
> +	install -m 755 -o frr -g frr -d /var/run/frr
> +	install -m 755 -o frr -g frr -d /var/log/frr
> +
> +	printf 'Starting %s: ' "$DAEMON"
> +	/usr/sbin/frrinit.sh start

It's not really great to have the Buildroot init script call another
sort of init script. But looking into the frrinit.sh and ffrcommon.sh
stuff, we can't really re-invent all this in Buildroot, it would be a
nightmare to maintain, so we really have to re-use what upstream
provides, like you did.


> diff --git a/package/frr/frr.mk b/package/frr/frr.mk
> new file mode 100644
> index 0000000000..2add98542a
> --- /dev/null
> +++ b/package/frr/frr.mk
> @@ -0,0 +1,69 @@
> +################################################################################
> +#
> +# frr
> +#
> +################################################################################
> +
> +FRR_VERSION = 7.3

I've updated to 7.4, as 7.3 didn't build for me with uClibc-ng, due to
the use of non-standard TRUE/FALSE. This was fixed in 7.4, which uses
the standard true/false definitions.

> +FRR_SITE = https://github.com/FRRouting/frr/archive

Changed to use the github macro we have.

> +FRR_DEPENDENCIES = host-frr readline json-c \
> +	libyang libnl c-ares
> +
> +HOST_FRR_DEPENDENCIES = host-flex host-bison host-python

Changed to use host-python3. We generally try to use host-python3
whenever possible nowadays.

> +define FRR_INSTALL_CONFIG_FILES
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/frr

Not needed, as you're using $(INSTALL) -D below

> +
> +	$(foreach f,daemons daemons.conf frr.conf vtysh.conf support_bundle_commands.conf,\
> +		$(INSTALL) -D -m 0640 $(@D)/tools/etc/frr/$(f) \
> +		$(TARGET_DIR)/etc/frr/$(f)

Indented with one more tab the last line.

That's it!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
