From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Mar 2020 23:22:43 +0100
Subject: [Buildroot] [PATCH] package/mini-snmpd: bump to version 1.6
In-Reply-To: <20200302185054.1815056-1-alexander.sverdlin@gmail.com>
References: <20200302185054.1815056-1-alexander.sverdlin@gmail.com>
Message-ID: <20200303232243.77a2e0fc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander,

On Mon,  2 Mar 2020 19:50:54 +0100
Alexander Sverdlin <alexander.sverdlin@gmail.com> wrote:

> v1.6 changelog:
> 
> Bug fix release.
> 
> - Fix #16: regression in ifTable for point-to-point interfaces
> - Fix #17: major memory leak in Linux backend
> - Fix #18: consistent timeout handling in .conf file and command line
> 
> v1.5 changelog:
> 
> Major feature release.  Support for TCP-MIB, UDP-MIB, IP-MIB,
> ifXTable with 64-bit counters.
> 
> - Majority of new features from [NDM Systems][]
> - CVE fixes from [Cisco Talos Intelligence Group][talos]
> 
> - Add support for ifXTable (64-bit counters), from NDM Systems
> - Add support for TCP-MIB, from NDM Systems
> - Add support for UDP-MIB, from NDM Systems
> - Add support for IP-MIB, from NDM Systems
> - Add support for ifType
> - Add support for ifMtu
> - Binary and man page renamed: `mini_snmpd` --> `mini-snmpd`
> - New command line option `-l LEVEL` replaces `--verbose`
> - New command line option `-v` to show program version
> - Create PID file when daemon is ready to receive signals
> - Add support for systemd unit file on Linux
> - Add support for /etc/mini-snmpd.conf, disabled by default
> 
> - CVE-2020-6060: Fix stack overflow in client connection handler
> - CVE-2020-6059: Fix out-of-bounds read in parsing of SNMP packet
> - CVE-2020-6058: Fix out-of-bounds read in parsing of SNMP packet
> - Let `-s` flag control use of syslog, when running in foreground
> - Removed all (known) GNU:isms; i.e., `__progname` and `%m`
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Thanks, I have applied to next, after doing some changes.

First, the commit log did not really explain the packaging changes:
drop of patches, addition of /etc/default file, etc. Having the
changelog of the upstream project is very good, but details on the
changes in the packaginjg is also important.

> diff --git a/package/mini-snmpd/mini-snmpd.mk b/package/mini-snmpd/mini-snmpd.mk
> index 698402bc51..d91c428adc 100644
> --- a/package/mini-snmpd/mini-snmpd.mk
> +++ b/package/mini-snmpd/mini-snmpd.mk
> @@ -4,15 +4,19 @@
>  #
>  ################################################################################
>  
> -MINI_SNMPD_VERSION = 1.4
> +MINI_SNMPD_VERSION = 1.6
>  MINI_SNMPD_SITE = $(call github,troglobit,mini-snmpd,v$(MINI_SNMPD_VERSION))
>  MINI_SNMPD_LICENSE = GPL-2.0
>  MINI_SNMPD_LICENSE_FILES = COPYING
>  MINI_SNMPD_AUTORECONF = YES

The configure script now uses pkg-config, so I had to add
host-pkgconfig to MINI_SNMPD_DEPENDENCIES.

>  
>  define MINI_SNMPD_INSTALL_INIT_SYSTEMD
> -	$(INSTALL) -D -m 644 package/mini-snmpd/mini-snmpd.service \
> -		$(TARGET_DIR)/usr/lib/systemd/system/mini-snmpd.service
> +	mkdir -p $(TARGET_DIR)/etc/default

This mkdir is not needed as intermediate directories are created by
$(INSTALL) when -D is used.

> +	$(INSTALL) -D -m 644 package/mini-snmpd/mini-snmpd \
> +		$(TARGET_DIR)/etc/default/mini-snmpd

I've moved the installation of this file to a post install target hook,
as it's not really completely systemd related.

> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -sf ../../../../usr/lib/systemd/system/mini-snmpd.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mini-snmpd.service

This is no longer needed nowadays: these symlinks are created by
host-systemd, so I dropped this.

Could you try what's in the next branch, and make sure it works for you?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
