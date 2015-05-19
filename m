From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 May 2015 09:48:26 +0200
Subject: [Buildroot] [PATCH] ntp: install after busybox
In-Reply-To: <b7e8d9cf7284fc2740398f50b767427e8e39c29b.1432012043.git.baruch@tkos.co.il>
References: <b7e8d9cf7284fc2740398f50b767427e8e39c29b.1432012043.git.baruch@tkos.co.il>
Message-ID: <20150519094826.67d5a7b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 19 May 2015 08:07:23 +0300, Baruch Siach wrote:
> Make sure that ntp installs after busybox so that it overrides the busybox
> provided ntpd applet.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/ntp/ntp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
> index 554094db1b3a..6254dc2a7313 100644
> --- a/package/ntp/ntp.mk
> +++ b/package/ntp/ntp.mk
> @@ -7,7 +7,7 @@
>  NTP_VERSION_MAJOR = 4.2
>  NTP_VERSION = $(NTP_VERSION_MAJOR).8p2
>  NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
> -NTP_DEPENDENCIES = host-pkgconf libevent
> +NTP_DEPENDENCIES = host-pkgconf libevent busybox

busybox should not be mandatory dependency of ntp, you can have a
system without busybox. So you should do like the other packages in the
same situation:

# Prefer full-blown tar over buybox's version
ifeq ($(BR2_PACKAGE_BUSYBOX),y)
TAR_DEPENDENCIES += busybox
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
