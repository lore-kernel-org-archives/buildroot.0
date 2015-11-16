From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Nov 2015 23:25:49 +0100
Subject: [Buildroot] [PATCH 1/1] netsniff-ng:override NACL_INC_DIR and
 NACL_LIB_DIR because the default value can cause a wrong build
In-Reply-To: <1447332289-31940-1-git-send-email-joris.lijssens@gmail.com>
References: <1447332289-31940-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <564A57ED.2020405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12-11-15 13:44, Joris Lijssens wrote:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
> ---
>  package/netsniff-ng/netsniff-ng.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
> index 4fed88c..5f0e119 100644
> --- a/package/netsniff-ng/netsniff-ng.mk
> +++ b/package/netsniff-ng/netsniff-ng.mk
> @@ -8,6 +8,9 @@ NETSNIFF_NG_VERSION = v0.5.9
>  NETSNIFF_NG_SITE = $(call github,netsniff-ng,netsniff-ng,$(NETSNIFF_NG_VERSION))
>  NETSNIFF_NG_LICENSE = GPLv2
>  NETSNIFF_NG_LICENSE_FILES = README COPYING
> +NETSNIFF_NG_CONF_ENV = \
> +			NACL_INC_DIR=/dev/null \
> +			NACL_LIB_DIR=/dev/null
>  NETSNIFF_NG_DEPENDENCIES = \
>  	libnl libpcap libcli libnetfilter_conntrack \
>  	liburcu libnet
> @@ -19,6 +22,7 @@ define NETSNIFF_NG_CONFIGURE_CMDS
>  		$(TARGET_CONFIGURE_OPTS) \
>  		./configure \
>  		--prefix=$(TARGET_DIR)/usr \
> +		$(NETSNIFF_NG_CONF_ENV) \

 I guess you didn't test this... In this hand-written configure script, you
really have to pass environment variables in the environment. So before the
./configure instead of after.

 Regards,
 Arnout

>  	)
>  endef
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
