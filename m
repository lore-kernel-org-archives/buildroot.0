From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Dec 2012 16:14:09 +0100
Subject: [Buildroot] [PATCH 1/6] sg3_utils: new package
In-Reply-To: <1356126670-16186-2-git-send-email-marek.belisko@open-nandra.com>
References: <1356126670-16186-1-git-send-email-marek.belisko@open-nandra.com>
 <1356126670-16186-2-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <20121222161409.6609bd8a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marek Belisko,

On Fri, 21 Dec 2012 22:51:05 +0100, Marek Belisko wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Marek Belisko <marek.belisko@streamunlimited.com>
> ---
>  package/Config.in              |    1 +
>  package/sg3_utils/Config.in    |   15 +++++++++++++++
>  package/sg3_utils/sg3_utils.mk |   33 +++++++++++++++++++++++++++++++++
>  3 files changed, 49 insertions(+)
>  create mode 100644 package/sg3_utils/Config.in
>  create mode 100644 package/sg3_utils/sg3_utils.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 66445ff..afecb8e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -253,6 +253,7 @@ source "package/rng-tools/Config.in"
>  source "package/sane-backends/Config.in"
>  source "package/sdparm/Config.in"
>  source "package/setserial/Config.in"
> +source "package/sg3_utils/Config.in"
>  source "package/smartmontools/Config.in"
>  source "package/snowball-hdmiservice/Config.in"
>  source "package/sredird/Config.in"
> diff --git a/package/sg3_utils/Config.in b/package/sg3_utils/Config.in
> new file mode 100644
> index 0000000..d120e55
> --- /dev/null
> +++ b/package/sg3_utils/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_SG3_UTILS
> +	bool "sgutils"
> +	depends on BR2_LARGEFILE
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  Low level utilities for devices that use a SCSI command set.
> +
> +	  http://sg.danny.cz/sg/sg3_utils.html
> +
> +config BR2_PACKAGE_SG3_UTILS_PROGS
> +        bool "install programs"

The "bool" should be preceded by a tab, not spaces.

> +	depends on BR2_PACKAGE_SG3_UTILS
> +
> +comment "sgutils requires a toolchain with LARGEFILE and threads support"
> +        depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS

Tab, not spaces before the depends on.

> diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
> new file mode 100644
> index 0000000..1c629e8
> --- /dev/null
> +++ b/package/sg3_utils/sg3_utils.mk
> @@ -0,0 +1,33 @@
> +#############################################################
> +#
> +# sg3_utils
> +#
> +#############################################################
> +SG3_UTILS_VERSION = 1.34
> +SG3_UTILS_SITE    = http://sg.danny.cz/sg/p/

Please add SG3_UTILS_LICENSE and SG3_UTILS_LICENSE_FILES.

> +# install the libsgutils2 library
> +SG3_UTILS_INSTALL_STAGING = YES
> +
> +define SG3_UTILS_REMOVE_PROGS
> +	for prog in \
> +	        dd decode_sense emc_trespass format get_config \
> +		get_lba_status ident inq logs luns map26 \
> +	        map sgm_dd modes opcodes sgp_dd persist prevent \
> +		raw rbuf rdac read readcap read_block_limits \
> +	        read_buffer read_long reassign referrals \
> +	        requests reset rmsn rtpg safte sanitize \
> +	        sat_identify sat_phy_event sat_set_features scan \
> +	        senddiag ses start stpg sync test_rwbuf turs \
> +	        unmap verify vpd write_buffer write_long \
> +	        write_same wr_mode ; do \
> +		$(RM) $(TARGET_DIR)/usr/bin/sg_$${prog} ; \
> +	done
> +	$(RM) $(TARGET_DIR)/usr/bin/sginfo
> +endef
> +
> +ifneq ($(BR2_PACKAGE_SG3_UTILS_PROGS),y)
> +SG3_UTILS_POST_INSTALL_TARGET_HOOKS += SG3_UTILS_REMOVE_PROGS
> +endif

Maybe we should turn this into positive logic, and put the
SG3_UTILS_REMOVE_PROGS macro inside the condition. Something like:

ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),)
define SG3_UTILS_REMOVE_PROGS
 ...
endef

SG3_UTILS_POST_INSTALL_TARGET_HOOKS += SG3_UTILS_REMOVE_PROGS
endif

Otherwise, looks good (but untested).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
