From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 22:29:29 +0100
Subject: [Buildroot] [Buildroot PATCH Selinux v10 02/11] linux-pam:
 selinux audit dependencies
In-Reply-To: <1455603506-26138-2-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
 <1455603506-26138-2-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <20160223222929.59589097@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Niranjan Reddy,

There is no commit log, and the commit title is really unclear. Maybe
it should be:

	linux-pam: add optional libselinux and audit dependencies

On Tue, 16 Feb 2016 11:48:17 +0530, Niranjan Reddy wrote:

> diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
> index 26b627e..c2897df 100644
> --- a/package/linux-pam/linux-pam.mk
> +++ b/package/linux-pam/linux-pam.mk
> @@ -8,15 +8,18 @@ LINUX_PAM_VERSION = 1.1.8
>  LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2
>  LINUX_PAM_SITE = http://linux-pam.org/library
>  LINUX_PAM_INSTALL_STAGING = YES
> +# cracklib and libdb are not currently present in buildroot

Why are you specifically talking about cracklib and libdb, and not
about --disable-prelude, --disable-nis, and so on? While I'm generally
all for adding comments, I believe in this case it is not very useful.

>  LINUX_PAM_CONF_OPTS = \
>  	--disable-prelude \
>  	--disable-isadir \
>  	--disable-nis \
>  	--disable-db \
> +	--disable-cracklib \

This change seemingly has nothing to do with the commit title, so it
should be part of a separate patch (unless there is a justification for
this change to be related).

>  	--disable-regenerate-docu \
>  	--enable-securedir=/lib/security \
>  	--libdir=/lib
> -LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf
> +# host-linux-pam is needed for creating pam conf files
> +LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf host-linux-pam

But how is the current linux-pam package working? What change makes
this host-linux-pam dependency now necessary? How is this related to
adding the selinux and audit dependencies?

Also, this patch is PATCH 2 in your series, but the host variant of
linux-pam only gets introduced in PATCH 4. So if I apply the patches in
order from your series, and stop after PATCH 2 or PATCH 3, things will
be broken.

>  LINUX_PAM_AUTORECONF = YES
>  LINUX_PAM_LICENSE = BSD-3c
>  LINUX_PAM_LICENSE_FILES = Copyright
> @@ -26,6 +29,20 @@ LINUX_PAM_DEPENDENCIES += gettext
>  LINUX_PAM_MAKE_OPTS += LIBS=-lintl
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +LINUX_PAM_CONF_OPTS += --enable-selinux
> +LINUX_PAM_DEPENDENCIES += libselinux
> +else
> +LINUX_PAM_CONF_OPTS += --disable-selinux
> +endif
> +
> +ifeq ($(BR2_PACKAGE_AUDIT),y)
> +LINUX_PAM_CONF_OPTS += --enable-audit
> +LINUX_PAM_DEPENDENCIES += audit
> +else
> +LINUX_PAM_CONF_OPTS += --disable-audit
> +endif

This part looks good, and seems to be the only part related to the
commit title.

> +
>  # Install default pam config (deny everything)
>  define LINUX_PAM_INSTALL_CONFIG
>  	$(INSTALL) -m 0644 -D package/linux-pam/other.pam \

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
