From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 May 2012 09:34:21 +0200
Subject: [Buildroot] [PATCH] quota: new package (v3)
In-Reply-To: <1338325205-28310-1-git-send-email-jarkko.sakkinen@intel.com>
References: <1338325205-28310-1-git-send-email-jarkko.sakkinen@intel.com>
Message-ID: <20120531093421.3a037f45@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The (v3) should not be at the end of the title, but inside the [PATCH
v3]. The title becomes part of the commit history of the project,
except what is between [].

Le Wed, 30 May 2012 00:00:05 +0300,
Jarkko Sakkinen <jarkko.sakkinen@intel.com> a ?crit :

> Added linuxquota package.

This is useless as it repeats the title.

> [update: removed invalid change]

This should be below the ---, so that it does not become part of the
commit history.

> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
> ---

It should be here.

>  package/Config.in       |    3 +++
>  package/quota/Config.in |   11 +++++++++++
>  package/quota/quota.mk  |   20 ++++++++++++++++++++
>  3 files changed, 34 insertions(+)
>  create mode 100644 package/quota/Config.in
>  create mode 100644 package/quota/quota.mk
> 
>  source "package/sysvinit/Config.in"
> diff --git a/package/quota/Config.in b/package/quota/Config.in
> new file mode 100644
> index 0000000..a2fa9b6
> --- /dev/null
> +++ b/package/quota/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_QUOTA
> +	bool "quota"
> +	depends on BR2_INET_RPC
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_MOUNT
> +	help
> +		Implementation of the disk quota system.
> +		http://sourceforge.net/projects/linuxquota/

Indentation for the help text is one tab + two spaces, and not two tabs.

> index 0000000..5fd83c7
> --- /dev/null
> +++ b/package/quota/quota.mk
> @@ -0,0 +1,20 @@
> +#############################################################
> +#
> +# QUOTA
> +#
> +#############################################################
> +
> +QUOTA_VERSION = 4.00
> +QUOTA_SOURCE = quota-$(QUOTA_VERSION).tar.gz
> +QUOTA_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
> +
> +QUOTA_MAKE_OPT = \
> +	CC="$(TARGET_CC)" \
> +	CXX="$(TARGET_CXX)" \
> +	LD="$(TARGET_LD)"

What about CFLAGS, CXXFLAGS and LDFLAGS? Maybe you should just be doing:

QUOTA_MAKE_OPT = $(TARGET_CONFIGURE_OPTS)

> +
> +QUOTA_INSTALL_TARGET_OPT = \
> +	ROOTDIR=$(TARGET_DIR) \
> +	install

Above those two variable definitions, please mention that this is
needed because the package uses autoconf but not automake. (Had the
package been using automake, those definitions wouldn't have been
necessary).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
