From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 19 Mar 2015 08:07:15 -0500
Subject: [Buildroot] [PATCH] package: add shadow 4.2.1
In-Reply-To: <1426736888-29437-3-git-send-email-steven@uplinklabs.net>
References: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
 <1426736888-29437-3-git-send-email-steven@uplinklabs.net>
Message-ID: <CAMQcK5+vc28fNVjp46CCYpPB-Gv9c7gukv_OPGo1DqAqtoquzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steven,

On Wed, Mar 18, 2015 at 10:48 PM, Steven Noonan <steven@uplinklabs.net> wrote:

[...]

> diff --git a/package/Config.in b/package/Config.in
> index c938326..c557010 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1341,6 +1341,7 @@ endif
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>         source "package/rsyslog/Config.in"
>  endif
> +       source "package/shadow/Config.in"
>         source "package/smack/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>         source "package/start-stop-daemon/Config.in"
> diff --git a/package/shadow/Config.in b/package/shadow/Config.in
> new file mode 100644
> index 0000000..0c3d6e1
> --- /dev/null
> +++ b/package/shadow/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_SHADOW
> +       bool "shadow"
> +       select BR2_PACKAGE_ACL
> +       select BR2_PACKAGE_LINUX_PAM
> +       select BR2_PACKAGE_UTIL_LINUX

Thanks for you contribution!

This package has already been submitted to the buildroot mailing list
as part of the SELinux patchset. It can be found here:

http://patchwork.ozlabs.org/patch/427124/

I was curious to know why Shadow requires linux-pam and util-linux as
these seem like large packages that I think should be optionally
enabled. I believe that it will work with busybox in place of
util-linux. If util-linux is required, could you give a explanation as
to why util-linux is preferred over busybox's implementation? (Curious
to know)

> +       help
> +         Password and account management tool suite with support for shadow files
> +         and PAM
> +
> +         http://pkg-shadow.alioth.debian.org/

[...]

> diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
> new file mode 100644
> index 0000000..e2fd209
> --- /dev/null
> +++ b/package/shadow/shadow.mk
> @@ -0,0 +1,43 @@
> +################################################################################
> +#
> +# shadow
> +#
> +################################################################################
> +
> +SHADOW_VERSION = 4.2.1
> +SHADOW_SITE = http://pkg-shadow.alioth.debian.org/releases/
> +SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
> +SHADOW_LICENSE = BSD-3c
> +SHADOW_LICENSE_FILES = LICENCE
> +SHADOW_AUTORECONF = YES
> +SHADOW_CONF_OPTS = \
> +       --sysconfdir=/etc \
> +       --enable-subordinate-ids=yes \
> +       --with-libpam \
> +       --with-group-name-max-length=32 \
> +       --without-selinux
> +SHADOW_DEPENDENCIES = acl linux-pam util-linux
> +
> +define SHADOW_INSTALL_PAMFILES
> +       $(INSTALL) -m 0644 package/shadow/chgpasswd.pam \
> +               $(TARGET_DIR)/etc/pam.d/chgpasswd
> +       $(INSTALL) -m 0644 package/shadow/chpasswd.pam \
> +               $(TARGET_DIR)/etc/pam.d/chpasswd
> +       $(INSTALL) -m 0644 package/shadow/newusers.pam \
> +               $(TARGET_DIR)/etc/pam.d/newusers
> +       $(INSTALL) -m 0644 package/shadow/passwd.pam \
> +               $(TARGET_DIR)/etc/pam.d/passwd
> +endef
> +SHADOW_POST_INSTALL_TARGET_HOOKS += SHADOW_INSTALL_PAMFILES

To make shadow optionally dependent on linux-pam, these should only be
install if linux-pam package is selected. The util-linux package has
an example of this:

http://git.buildroot.net/buildroot/tree/package/util-linux/util-linux.mk#n139


> +define SHADOW_PERMISSIONS
> +       /usr/bin/chage f 4755 0 0 - - - - -
> +       /usr/bin/expiry f 4755 0 0 - - - - -
> +       /usr/bin/gpasswd f 4755 0 0 - - - - -
> +       /usr/bin/newgidmap f 4755 0 0 - - - - -
> +       /usr/bin/newuidmap f 4755 0 0 - - - - -
> +       /usr/bin/passwd f 4755 0 0 - - - - -
> +       /usr/bin/newgrp f 4755 0 0 - - - - -
> +endef

Does the install stop not install these with the correct permissions?
I believe that they should already be getting the correct permissions
when 'make install' is getting called. This SHADOW_PERMISSIONS should
be removed.

Would you be willing to take a look at the proposed patch above and
rework this to make util-linux optional (or not need at all)? I think
you have added useful features onto of this package that weren't a
part of the originally proposed patch.

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
