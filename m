From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 16:33:22 +0100
Subject: [Buildroot] [PATCH 3/3] package/python-iptables: use installed
 iptables by default
In-Reply-To: <20200226142617.4170-3-frank.vanbever@essensium.com>
References: <20200226142617.4170-1-frank.vanbever@essensium.com>
 <20200226142617.4170-3-frank.vanbever@essensium.com>
Message-ID: <20200226163322.675b66f5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Frank,

On Wed, 26 Feb 2020 15:26:17 +0100
Frank Vanbever <frank.vanbever@essensium.com> wrote:

> diff --git a/package/python-iptables/python-iptables.mk b/package/python-iptables/python-iptables.mk
> index 66e478a89a..086d5b2457 100644
> --- a/package/python-iptables/python-iptables.mk
> +++ b/package/python-iptables/python-iptables.mk
> @@ -9,5 +9,14 @@ PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/08/5e/16a5ca35c42
>  PYTHON_IPTABLES_SETUP_TYPE = setuptools
>  PYTHON_IPTABLES_LICENSE = Apache-2.0
>  PYTHON_IPTABLES_LICENSE_FILES = NOTICE
> +PYTHON_IPTABLES_DEPENDENCIES = iptables
> +
> +define PYTHON_IPTABLES_SET_XTABLES_ENV_VARS
> +	XTABLES_VERSION=`awk '/XTABLES_VERSION_CODE/ {print $$NF}' $(STAGING_DIR)/usr/include/xtables-version.h`; \
> +	sed -i "s/os.getenv(\"PYTHON_IPTABLES_XTABLES_VERSION\")/$$XTABLES_VERSION/" $(@D)/iptc/xtables.py; \
> +	sed -i "s/os.getenv(\"XTABLES_LIBDIR\")/\"\/usr\/lib\/xtables\"/" $(@D)/iptc/xtables.py

This last line is not using the XTABLES_VERSION variable, so it does
not need to be a continuation line from the previous commands.

Also, use % as a sed separator instead of / so that you don't have to
escape all the slashes.

But overall, is there a better way ? Like some official way to pass
these values at build time as setup.py options, with the environment
variable taking precedence if available ? That would make this
hopefully acceptable by upstream. Perhaps the setup.py logic could even
check the xtables-version.h by itself ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
