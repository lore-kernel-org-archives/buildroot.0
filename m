From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 5 Nov 2014 16:46:58 +0000
Subject: [Buildroot] [PATCH] stunnel: bump to version 5.07
In-Reply-To: <1415203319-30399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415203319-30399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <545A5482.3070404@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 11/05/2014 04:01 PM, Gustavo Zacarias wrote:
> Also enable optional systemd support.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/stunnel/stunnel.hash |  2 +-
>  package/stunnel/stunnel.mk   | 11 +++++++++--
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
> index 89af571..e4e6366 100644
> --- a/package/stunnel/stunnel.hash
> +++ b/package/stunnel/stunnel.hash
> @@ -1,2 +1,2 @@
>  # From http://www.stunnel.org/pipermail/stunnel-announce/2014-October/000084.html
> -sha256	098c2b6db0793ea4fa5b6767ce6ef1853e9f6cc2f32133024be55f6a460b1a40	stunnel-5.06.tar.gz
> +sha256	505c6c63c4a20fc0cce8c35ef1ab7626c7b01071e3fca4ac6ea417afe8065309	stunnel-5.07.tar.gz
> diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
> index 7be0cc7..dc56261 100644
> --- a/package/stunnel/stunnel.mk
> +++ b/package/stunnel/stunnel.mk
> @@ -4,13 +4,20 @@
>  #
>  ################################################################################
>  
> -STUNNEL_VERSION = 5.06
> +STUNNEL_VERSION = 5.07
>  STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/archive/5.x
>  STUNNEL_DEPENDENCIES = openssl
> -STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork
> +STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
> +	--disable-libwrap
>  STUNNEL_LICENSE = GPLv2+
>  STUNNEL_LICENSE_FILES = COPYING COPYRIGHT.GPL
>  
> +ifeq ($(BR2_INIT_SYSTEMD),y)
> +STUNNEL_DEPENDENCIES += systemd
> +else
> +STUNNEL_CONF_OPTS += --disable-systemd
> +endif
> +
>  define STUNNEL_INSTALL_CONF_SCRIPT
>  	$(INSTALL) -m 0755 -D package/stunnel/S50stunnel $(TARGET_DIR)/etc/init.d/S50stunnel
>  	[ -f $(TARGET_DIR)/etc/stunnel/stunnel.conf ] || \
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Compile-test on MIPS architecture plus checking the files are actually
installed in target and were built for the right architecture.

$ file output/target/usr/bin/stunnel
output/target/usr/bin/stunnel: ELF 32-bit MSB executable, MIPS, MIPS32
rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.16, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70401, stripped

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
