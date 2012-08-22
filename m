From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 22 Aug 2012 09:09:52 +0200
Subject: [Buildroot] [PATCH] Add package linux-pam
In-Reply-To: <1344594434-22756-1-git-send-email-golubovsky@gmail.com>
References: <1344594434-22756-1-git-send-email-golubovsky@gmail.com>
Message-ID: <503485C0.1000406@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dmitry,

This looks fine for me, I still have some comments however.

Le 10/08/2012 12:27, Dmitry a ?crit :
> Signed-off-by: Dmitry <golubovsky@gmail.com>
> ---
>  package/Config.in                                 |    1 +
>  package/linux-pam/Config.in                       |   15 +++++++++
>  package/linux-pam/linux-pam-configure.patch       |   20 ++++++++++++
>  package/linux-pam/linux-pam-doc-makefile-am.patch |   33 +++++++++++++++++++++
>  package/linux-pam/linux-pam-group.patch           |   26 ++++++++++++++++
>  package/linux-pam/linux-pam-rhosts.patch          |   24 +++++++++++++++
>  package/linux-pam/linux-pam-succeed.patch         |   31 +++++++++++++++++++
>  package/linux-pam/linux-pam-time.patch            |   26 ++++++++++++++++
>  package/linux-pam/linux-pam.mk                    |   25 ++++++++++++++++
>  9 files changed, 201 insertions(+), 0 deletions(-)
>  create mode 100644 package/linux-pam/Config.in
>  create mode 100644 package/linux-pam/linux-pam-configure.patch
>  create mode 100644 package/linux-pam/linux-pam-doc-makefile-am.patch
>  create mode 100644 package/linux-pam/linux-pam-group.patch
>  create mode 100644 package/linux-pam/linux-pam-rhosts.patch
>  create mode 100644 package/linux-pam/linux-pam-succeed.patch
>  create mode 100644 package/linux-pam/linux-pam-time.patch
>  create mode 100644 package/linux-pam/linux-pam.mk

From what I can see, this patchset only removes calls to ruserok and
innetgr. Could you merge them together so that all the conditionnal
removal of ruserok is only in one patch and all the conditional removal
of inetgr in another ?

Basically, you would have two patches:
  - the ruserok one, which is the merge of linux-pam-configure.patch and
linux-pam-rhosts.patch,
  - the innetgr one, which is the merge of linux-pam-group.patch,
linux-pam-succeed.patch and linux-pam-time.patch

Also, could you be more explicit with regard to patch names ? Like
linux-pam-disable-ruserok.patch.

[...]

> +############################################
> +#
> +# linux-pam
> +# 
> +############################################
> +
> +LINUX_PAM_VERSION = 1.1.4
> +LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2

Since gz archives are also available, I guess you can drop this line.

> +LINUX_PAM_SITE = http://linux-pam.org/library/
> +LINUX_PAM_INSTALL_STAGING = YES
> +LINUX_PAM_CONF_OPT = \
> +	--disable-prelude \
> +	--disable-isadir \
> +	--disable-nis \
> +	--disable-regenerate-docu \
> +	--enable-securedir=/lib/security \
> +	--libdir=/lib
> +LINUX_PAM_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) flex

You can drop the libintl here. I know that a lot of packages do that,
but this is useless, since the libintl package doesn't exist.

> +LINUX_PAM_AUTORECONF = YES
> +
> +define LINUX_PAM_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC) -lintl -lfl" LD="$(TARGET_LD)" -C $(@D) all
> +endef

Why do you need to set -lintl -lfl options ?

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
