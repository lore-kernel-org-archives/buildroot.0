From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 13 Jul 2018 10:37:33 +0200
Subject: [Buildroot] [PATCH 1/1] <wireless-regdb>: Adds the option to
 copy "regulatory.db[.p7s]" to /lib/firmware
In-Reply-To: <20180712200941.4873-1-me@noctarius.com>
References: <20180712200941.4873-1-me@noctarius.com>
Message-ID: <5cacd1ab-5a85-4d51-f655-fddbd96ce681@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Christoph,

 Thank you for this patch. I have a few small remarks.


On 12-07-18 22:09, noctarius wrote:

 The Author should be the same as the signed-off-by, so could you set your
user.name to Christoph Engelbert?

> Certain wireless drivers (like the Broadcom FullMac drivers" expect the regulatory.db and
> regulatory.db.p7s files to be available to be loadable from /lib/firmware. If not available
> the driver still loads but runs on a minimal subset of channels.
> 
> This newly added option gives possibility to have those files copied to the necessary directory.
> 
> Signed-off-by: Christoph Engelbert <me@noctarius.com>
> ---
>  package/wireless-regdb/Config.in         |  8 ++++++++
>  package/wireless-regdb/wireless-regdb.mk | 10 ++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/package/wireless-regdb/Config.in b/package/wireless-regdb/Config.in
> index 0c9896deb9..5c91a7d8c7 100644
> --- a/package/wireless-regdb/Config.in
> +++ b/package/wireless-regdb/Config.in
> @@ -7,3 +7,11 @@ config BR2_PACKAGE_WIRELESS_REGDB
>  	  allowed radio frequencies for each local jurisdiction.
>  
>  	  https://wireless.wiki.kernel.org/en/developers/regulatory/wireless-regdb
> +
> +config BR2_PACKAGE_WIRELESS_REGDB_FIRMWARE
> +	bool "wireless-regdb-firmware"
> +	depends on BR2_PACKAGE_WIRELESS_REGDB
> +	help
> +	  Copies the regulatory.db and regulatory.db.p7s files to
> +	  /lib/firmware which is necessary for certain drivers like
> +	  the Broadcom FullMac driver.
> diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
> index e9283a00e2..e322035841 100644
> --- a/package/wireless-regdb/wireless-regdb.mk
> +++ b/package/wireless-regdb/wireless-regdb.mk
> @@ -10,6 +10,16 @@ WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
>  WIRELESS_REGDB_LICENSE = ISC
>  WIRELESS_REGDB_LICENSE_FILES = LICENSE
>  
> +ifeq ($(BR2_PACKAGE_WIRELESS_REGDB_FIRMWARE),y)
> +define WIRELESS_REGDB_FIRMWARE_INSTALL
> +	$(INSTALL) -m 644 -D -T $(@D)/regulatory.db \
> +		$(TARGET_DIR)/lib/firmware/regulatory.db
> +	$(INSTALL) -m 644 -D -T $(@D)/regulatory.db.p7s \
> +		$(TARGET_DIR)/lib/firmware/regulatory.db.p7s

 Since these two files only add up to 6KB, I don't think it's worthwhile to make
installing them conditional.

 Regards,
 Arnout

> +endef
> +WIRELESS_REGDB_POST_INSTALL_TARGET_HOOKS += WIRELESS_REGDB_FIRMWARE_INSTALL
> +endif
> +
>  define WIRELESS_REGDB_INSTALL_TARGET_CMDS
>  	$(INSTALL) -m 644 -D -T $(@D)/regulatory.bin \
>  		$(TARGET_DIR)/usr/lib/crda/regulatory.bin
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
