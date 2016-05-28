From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 19:21:33 +0200
Subject: [Buildroot] [PATCH 2/2] batman-adv: new package
In-Reply-To: <1464136502-302-3-git-send-email-christian@paral.in>
References: <1464136502-302-1-git-send-email-christian@paral.in>
 <1464136502-302-3-git-send-email-christian@paral.in>
Message-ID: <20160528192133.60ee0701@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've applied, but after fixing a few things. See below.

On Tue, 24 May 2016 17:35:02 -0700, Christian Stewart wrote:

> +config BR2_PACKAGE_BATMAN_ADV_DEBUG
> +	bool "enable debugging"
> +	default n

"default n" is useless, as it's the default.

> +	help
> +		Enables B.A.T.M.A.N. debugging

Indentation is one tab + two spaces for the help text.

> +config BR2_PACKAGE_BATMAN_ADV_NC
> +	bool "enable network coding"
> +	default n
> +	help
> +		Enables B.A.T.M.A.N. network coding.
> +		Note: this requires promiscuous mode on ALL nodes!
> +
> +		If unsure, answer n.
> +		https://www.open-mesh.org/projects/batman-adv/wiki/NetworkCoding

Same comments.

> +
> +config BR2_PACKAGE_BATMAN_ADV_BATMAN_V
> +	bool "enable B.A.T.M.A.N. V protocol (experimental)"
> +	default n
> +	help
> +		Enables B.A.T.M.A.N. V network protocol.
> +		This is the next-gen protocol and is experimental at this time.
> +
> +		If unsure, answer n.
> +		https://www.open-mesh.org/projects/batman-adv/wiki/BATMAN_V

Ditto.

> diff --git a/package/batman-adv/batman-adv.hash b/package/batman-adv/batman-adv.hash
> new file mode 100644
> index 0000000..6c0e5ca
> --- /dev/null
> +++ b/package/batman-adv/batman-adv.hash
> @@ -0,0 +1,2 @@
> +# From https://downloads.open-mesh.org/batman/stable/sources/batman-adv/batman-adv-2016.1.tar.gz.sha1
> +sha1 c9ca52c913fbf81aca266695a77359ecdbcc8bd8 batman-adv-2016.1.tar.gz
> diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
> new file mode 100644
> index 0000000..f8d9ba7
> --- /dev/null
> +++ b/package/batman-adv/batman-adv.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# batman-adv
> +#
> +################################################################################
> +
> +BATMAN_ADV_VERSION = 2016.1
> +BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-adv
> +BATMAN_ADV_SOURCE = batman-adv-$(BATMAN_ADV_VERSION).tar.gz
> +BATMAN_ADV_LICENSE = GPL

GPL is not specific enough. The exact license is GPLv2.

> +
> +# Bridge Loop Avoidance, Distributed Arp Table are always enabled
> +BATMAN_ADV_CFLAGS = \
> +	-I$(@D)/compat-include/ \
> +	-include $(@D)/compat.h \
> +	-DBATADV_SOURCE_VERSION=\"\\\"$(BATMAN_ADV_VERSION)\\\"\"
> +BATMAN_ADV_MAKE_OPTS = \

Naming this BATMAN_ADV_MODULE_MAKE_OPTS seems more logical, there's no
need to have an intermediate variable.

As said above, I've applied to the next branch after fixing the minor
issues pointed above.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
