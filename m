From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Feb 2015 16:36:05 +0100
Subject: [Buildroot] Batctl Package try 2
In-Reply-To: <CAFNoKatfchjqJaQ11rgBWbh02jdiDnSUGU6=B-AMP6AaGbroww@mail.gmail.com>
References: <CAFNoKatfchjqJaQ11rgBWbh02jdiDnSUGU6=B-AMP6AaGbroww@mail.gmail.com>
Message-ID: <20150208153605.GF4028@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jens, All,

On 2015-02-08 11:58 +0000, Jens Zettelmeyer spake thusly:
> after a review from Yann E. MORIN i made some adjustments to the package. I
> this version is ok i'll use git send mail to send in an propper patch.

git-send-email can (should) be used always, not only to send preliminary
patches for review.

Not doing so means your patch gets mangled by your mailer.

First, you sent an HTML mail, which is frowned upon, and sometime even
rejected by the list (yours managed to slip trhough, though). Using
git-send-email ensures the mail is plain-text only.

Then, what if your patch was already correct? If you had sent it with
git-send-email, we could have applied it as-is. Now, doing the way you
did means we'd have to ask you to resend it, even if it was correct.

Just always use git-send-email, it makes life easier for you and for us.
And easy life is better! ;-)

> Thank you
> Jens
> 
> diff --git a/package/batctl/Config.in b/package/batctl/Config.in
> new file mode 100644
> index 0000000..56badd3
> --- /dev/null
> +++ b/package/batctl/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_BATCTL
> + bool "batctl"
> + depends on BR2_INET_IPV6
> + depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
> + select BR2_PACKAGE_LIBNL
> + help
> +  Batctl is the configuration and debugging tool for batman-adv.
> +
> +  http://www.open-mesh.org/projects/batman-adv/wiki/Using-batctl

The indentation gets broken here. As I said in my previous reply,
indentation should be:
  - one tab for the options,
  - one tab + two spaces for the help text,
like so:

   |config BR2_PACKAGE_BATCTL
   |	bool "batctl"
   |	depends on BR2_INET_IPV6
   |	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
   |	select BR2_PACKAGE_LIBNL
   |	help
   |	  Batctl is the configuration and debugging tool for batman-adv.
   |
   |	  http://www.open-mesh.org/projects/batman-adv/wiki/Using-batctl

Here, not using git-send-email (probably you cut-n-pasted in gmail's
compose window) probably broke the indentation, but there's no way we
can know if your patch is correct, or if it was your mailer breaking it.
Using git-send-email guarantees this won't happen, and that the patch is
sent un-mangled.

> diff --git a/package/batctl/batctl.hash b/package/batctl/batctl.hash
> new file mode 100644
> index 0000000..663e602
> --- /dev/null
> +++ b/package/batctl/batctl.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 77509ed70232ebc0b73e2fa9471ae13b12d6547d167dda0a82f7a7fad7252c36
>  batctl-2014.4.0.tar.gz

Ditto, overly long lines got mangled. Using git-send-email would keep
long lines.

> diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
> new file mode 100644
> index 0000000..a65a5cd
> --- /dev/null
> +++ b/package/batctl/batctl.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# batman-adv control
> +#
> +################################################################################
> +
> +BATCTL_VERSION = 2014.4.0
> +BATCTL_SOURCE = batctl-$(BATCTL_VERSION).tar.gz
> +BATCTL_SITE =
> http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL_VERSION)
> +BATCTL_LICENSE = GPLv2
> +BATCTL_DEPENDENCIES += libnl
> +
> +define BATCTL_BUILD_CMDS
> + $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" \
> + CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3" \
> + LDFLAGS="$(TARGET_LDFLAGS)"

Ditto the indentation: _CMDS are indented by one tab, and continuation
lines are indented by one additional tab, like so:

   |define BATCTL_BUILD_CMDS
   |	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" \
   |		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3" \
   |		LDFLAGS="$(TARGET_LDFLAGS)"
   |endef

> +endef
> +
> +define BATCTL_INSTALL_TARGET_CMDS
> + $(INSTALL) -m 755 -D $(@D)/batctl $(TARGET_DIR)/usr/sbin/batctl

Ditto the indentation: one tab.

Otherwise, there's nothing that really stands out.

Please, resend using git-send-email. ;-)

Regards,
Yann E. MORIN.

> +endef
> +
> +$(eval $(generic-package))

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
