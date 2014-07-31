From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 20:19:54 +0200
Subject: [Buildroot] [PATCH] ptpd2: fix static linking
In-Reply-To: <1406758585-24577-1-git-send-email-gustavo@zacarias.com.ar>
References: <1406758585-24577-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140731201954.586efea1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 30 Jul 2014 19:16:25 -0300, Gustavo Zacarias wrote:
> Do the same as in commit b64a06d7b70bd7b160826bf9b97e60e18171913d
> to avoid missing libraries needed by libpcap. Fixes:
> http://autobuild.buildroot.net/results/1a1/1a1dadfa2b22074d401b013606f0cede66efe826/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/ptpd2/ptpd2.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
> index 3133726..6a6ae60 100644
> --- a/package/ptpd2/ptpd2.mk
> +++ b/package/ptpd2/ptpd2.mk
> @@ -13,6 +13,10 @@ PTPD2_AUTORECONF = YES
>  PTPD2_LICENSE = BSD-2c
>  PTPD2_LICENSE_FILES = COPYRIGHT
>  
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +	PTPD2_CONF_OPT += LIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
> +endif
> +

Applied, thanks. However, I continue to be worried about all those
fixups we do all over the place for static linking, instead of fixing
upstream properly. If upstream suddenly fixes static linking, we won't
even notice.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
