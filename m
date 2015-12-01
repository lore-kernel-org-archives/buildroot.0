From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Dec 2015 22:37:15 +0100
Subject: [Buildroot] [PATCH v6] package/unscd: new package
In-Reply-To: <1448982954-5055-1-git-send-email-rdkehn@yahoo.com>
References: <1448982954-5055-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <565E130B.7090201@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Doug,

 Even though it's already v6 I still have some comments :-(

On 01-12-15 16:15, Doug Kehn wrote:
> A daemon which handles passwd, group and host lookups for running
> programs and caches the results for the next query. You only need this
> package if you are using slow Name Services like LDAP, NIS or NIS+.
> 
> This particular NSCD is a complete rewrite of the GNU glibc nscd which
> is a single threaded server process which offloads all NSS lookups to
> worker children; cache hits are handled by the parent, and only cache
> misses start worker children, making the parent immune to resource
> leaks, hangs, and crashes in NSS libraries.
> 
> It should mostly be a drop-in replacement for existing installs using
> nscd.

 This explanation is not really relevant for the commit log. Just keep the first
sentence. All this text should be present in the package help text, however.

 It would be good however to explain in the commit log that glibc's nscd is not
installed by buildroot at the moment, and why it only works with glibc.

> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> ---
> Changes v5 -> v6
>   - Remove toolchain patch/BR2_GLIBC_NSCD (Thomas).
>   - Change source site from Debian to upstream (Thomas).
>   - Update to version 0.52 (Thomas).
> Changes v4 -> v5
>   - Reincorporate $(APPLY_PATCHES) suggestion after update by Arnout.
> Changes v3 -> v4
>   - Incorporate feedback/suggestions by Yann and Maxime.
> Changes v2 -> v3
>   - Remove trailing '/' from UNSCD_SITE.
>   - Whitespace cleanup.
> Changes v1 -> v2
>   - Incorporate feedback/suggestions by Yann (from nss-pam-ldapd patch).
> ---
>  package/unscd/Config.in  |  8 ++++++
>  package/unscd/S46unscd   | 24 ++++++++++++++++++
>  package/unscd/nscd.conf  | 65 ++++++++++++++++++++++++++++++++++++++++++++++++
>  package/unscd/unscd.hash |  2 ++
>  package/unscd/unscd.mk   | 35 ++++++++++++++++++++++++++

 You forgot to update package/Config.in.

>  5 files changed, 134 insertions(+)
>  create mode 100644 package/unscd/Config.in
>  create mode 100644 package/unscd/S46unscd
>  create mode 100644 package/unscd/nscd.conf
>  create mode 100644 package/unscd/unscd.hash
>  create mode 100644 package/unscd/unscd.mk
> 
> diff --git a/package/unscd/Config.in b/package/unscd/Config.in
> new file mode 100644
> index 0000000..937aeb2
> --- /dev/null
> +++ b/package/unscd/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_UNSCD
> +	bool "unscd"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	help
> +	  Micro Name Service Caching Daemon

 So move the stuff that was in the commit log here. Don't forget to wrap it at
72 columns (where the tab+2spaces counts as 10 characters).

 Also, please add an upstream URL where people can go for more info.

> +
> +comment "unscd needs an (e)glibc toolchain"
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC
[snip]
> diff --git a/package/unscd/nscd.conf b/package/unscd/nscd.conf
> new file mode 100644
> index 0000000..fe77d05
> --- /dev/null
> +++ b/package/unscd/nscd.conf
> @@ -0,0 +1,65 @@
> +# This file is currently taken verbatim from the version distributed
> +# with GNU glibc's nscd with unused configurations removed

 This comment should also be part of the commit message rather than being part
of this file.

> +# 
> +# /etc/nscd.conf
> +#
> +# An example Name Service Cache config file.  This file is needed by nscd.
> +#
> +# Legal entries are:
> +#
> +#	logfile			<file>
> +#	debug-level		<level>
> +#	threads			<initial #threads to use>
> +#	max-threads		<maximum #threads to use>
> +#	server-user             <user to run server as instead of root>
> +#		server-user is ignored if nscd is started with -S parameters
> +#       stat-user               (ignored; any user can stat)
> +#	reload-count		(ignored; unscd should never crash)
> +#	paranoia		(ignored)
> +#	restart-interval	(ignored; unscd should never crash)

 I thought you removed the unused entries? :-)

> +#
> +#       enable-cache		<service> <yes|no>
> +#	positive-time-to-live	<service> <time in seconds>
> +#	negative-time-to-live   <service> <time in seconds>
> +#       suggested-size		<service> <prime number>
> +#	check-files		<service> <yes|no>
> +#	persistent		<service> (ignored)
> +#	shared			<service> (ignored)
> +#	auto-propagate		<service> (ignored)
> +#
> +# Currently supported cache names (services): passwd, group, hosts
> +
> +
> +
> +# logfile /var/log/nscd.log
> +# threads 14
> +# max-threads 32
> +server-user unscd
> +debug-level 0
> +
> +enable-cache            passwd  yes
> +positive-time-to-live   passwd  600
> +negative-time-to-live   passwd  20
> +suggested-size          passwd  1001
> +check-files             passwd  yes
> +
> +enable-cache            group   yes
> +positive-time-to-live   group   3600
> +negative-time-to-live   group   60
> +suggested-size          group   1001
> +check-files             group   yes
> +
> +# hosts caching is broken with gethostby* calls, hence is now disabled
> +# by default. Specifically, the caching does not obey DNS TTLs, and
> +# thus could lead to problems if the positive-time-to-live is
> +# significantly larger than the actual TTL.
> +#
> +# You should really use a caching nameserver instead of nscd for this
> +# sort of request. However, you can easily re-enable this by default.
> +enable-cache            hosts   no
> +positive-time-to-live   hosts   3600
> +negative-time-to-live   hosts   20
> +suggested-size	        hosts   1001
> +check-files             hosts   yes
> +
> +# unscd does not support services caching
> diff --git a/package/unscd/unscd.hash b/package/unscd/unscd.hash
> new file mode 100644
> index 0000000..ab8ffdc
> --- /dev/null
> +++ b/package/unscd/unscd.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256	4c1f83dcd120469fceef749050cb29fa666fa4666bd308dfe92e933a4c200d55	nscd-0.52.c
> diff --git a/package/unscd/unscd.mk b/package/unscd/unscd.mk
> new file mode 100644
> index 0000000..87ba1bf
> --- /dev/null
> +++ b/package/unscd/unscd.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# unscd
> +#
> +################################################################################
> +
> +UNSCD_VERSION = 0.52
> +UNSCD_SOURCE = nscd-$(UNSCD_VERSION).c
> +UNSCD_SITE = http://busybox.net/~vda/unscd
> +UNSCD_LICENSE = GPLv2
> +UNSCD_LICENSE_FILES = COPYING

 There is just a single file, so COPYING doesn't exist. The only option we have
is nscd.c itself.

> +
> +define UNSCD_EXTRACT_CMDS
> +	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/nscd.c
> +endef
> +
> +define UNSCD_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) nscd

 Although it works because of the default rules, it looks very strange to me to
call make when there is no Makefile. I would instead call the compiler directly:

	cd $(@D); \
	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o nscd nscd.c

 What do the others think?


 Regards,
 Arnout

> +endef
> +
> +define UNSCD_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 755 -D $(@D)/nscd $(TARGET_DIR)/usr/sbin/nscd
> +	$(INSTALL) -m 600 -D package/unscd/nscd.conf $(TARGET_DIR)/etc/nscd.conf
> +endef
> +
> +define UNSCD_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 755 -D package/unscd/S46unscd \
> +		$(TARGET_DIR)/etc/init.d/S46unscd
> +endef
> +
> +define UNSCD_USERS
> +	unscd -1 unscd -1 * - - - unscd user
> +endef
> +
> +$(eval $(generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
