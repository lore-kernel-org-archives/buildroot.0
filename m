From: =?ISO-8859-15?B?Qmr2cm4=?= Kirchner <bjoern@am-soft.de>
Date: Wed, 10 Dec 2014 17:26:18 +0100
Subject: [Buildroot] [PATCH 6/8] Adding sofia-sip
In-Reply-To: <1418160208-1569-6-git-send-email-gregd72002@gmail.com>
References: <1418160208-1569-1-git-send-email-gregd72002@gmail.com>
 <1418160208-1569-6-git-send-email-gregd72002@gmail.com>
Message-ID: <20141210172618.56940b3a@tux.kirchner>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gregory,

Am Tue,  9 Dec 2014 21:23:26 +0000
schrieb kiwi <gregd72002@gmail.com>:

> From: Gregory Dymarek <gregd72002@gmail.com>
> 
> Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
> ---
>  package/sofia-sip/Config.in    |  6 ++++++
>  package/sofia-sip/sofia-sip.mk | 18 ++++++++++++++++++
>  2 files changed, 24 insertions(+)
>  create mode 100644 package/sofia-sip/Config.in
>  create mode 100644 package/sofia-sip/sofia-sip.mk
> 

there was already a patch to include sofia-sip quite some time ago:
http://lists.busybox.net/pipermail/buildroot/2012-January/049258.html

I don't now why it never got accepted, but I use sofia-sip quite some
time based on this patch, but with an old buildroot version (2012.08).

This patch had additional configuration options to select SSL support
and glib2 support. And there was a patch included which fixed a bug
in an include file introduced with the sofia-sip 1.12.11 release.

Supposedly the above mentioned patch to buildroot will not work out
of the box with a current version of buildroot. Maybe you want to
use this patch as inspiration for your patch to make it better suitable
for a more generic use.


Regards

Bj?rn

> diff --git a/package/sofia-sip/Config.in b/package/sofia-sip/Config.in
> new file mode 100644
> index 0000000..3d85ffc
> --- /dev/null
> +++ b/package/sofia-sip/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_SOFIA_SIP
> +	bool "sofia-sip"
> +	help
> +	  Adds Sofia-SIP - an open-source SIP User-Agent library,
> compliant with the IETF RFC3261 specification +
> +	  http://sofia-sip.sourceforge.net
> diff --git a/package/sofia-sip/sofia-sip.mk
> b/package/sofia-sip/sofia-sip.mk new file mode 100644
> index 0000000..5258844
> --- /dev/null
> +++ b/package/sofia-sip/sofia-sip.mk
> @@ -0,0 +1,18 @@
> +#############################################################
> +#
> +# sofiasip
> +#
> +#############################################################
> +SOFIA_SIP_VERSION = 1.12.11
> +SOFIA_SIP_SITE =
> http://downloads.sourceforge.net/project/sofia-sip/sofia-sip/$(SOFIA_SIP_VERSION)
> +SOFIA_SIP_INSTALL_STAGING = YES +SOFIA_SIP_LICENSE = LGPLv2.1+ 
> +SOFIA_SIP_LICENSE_FILE = COPYING COPYRIGHTS
> +
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_INET_IPV6),y)
> +	SOFIA_SIP_CONF_OPTS = --enable-ip6
> +else
> +	SOFIA_SIP_CONF_OPTS = --disable-ip6
> +endif
> +
> +$(eval $(autotools-package))
