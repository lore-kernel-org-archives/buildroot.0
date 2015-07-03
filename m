From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Jul 2015 20:34:34 +0200
Subject: [Buildroot] [PATCH 1/7] Add package check: unit test library
In-Reply-To: <1435929086-21205-2-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1435929086-21205-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1435929086-21205-2-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <20150703183433.GD3652@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sylvian, All,

On 2015-07-03 15:11 +0200, Sylvain Raybaud spake thusly:
> Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
[--SNIP--]
> diff --git a/package/check/Config.in b/package/check/Config.in
> new file mode 100644
> index 0000000..8e7e3bc
> --- /dev/null
> +++ b/package/check/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_CHECK
> +	bool "host check"

No, this is not 'host check', this is just 'check'.

This location is not about the host packages, but about the target
packages.

Besides, nothing in your series depends on host-check.

[--SNIP--]
> diff --git a/package/check/check.hash b/package/check/check.hash
> new file mode 100644
> index 0000000..7d7e19b
> --- /dev/null
> +++ b/package/check/check.hash
> @@ -0,0 +1,2 @@
> +# Hash from: http://downloads.sourceforge.net/project/check/check/check-0.9.14.tar.gz

Correct URL is:
    http://sourceforge.net/projects/check/files/check/0.9.14/

> +sha1	4b79e2d485d014ddb438e322b64235347d57b0ff	check-0.9.14.tar.gz

Manually checked the hash to be OK.

> diff --git a/package/check/check.mk b/package/check/check.mk
> new file mode 100644
> index 0000000..3c2021c
> --- /dev/null
> +++ b/package/check/check.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# check
> +#
> +################################################################################
> +
> +CHECK_VERSION = 0.9.14
> +CHECK_SOURCE = check-$(CHECK_VERSION).tar.gz
> +CHECK_SITE = http://downloads.sourceforge.net/project/check/check/$(CHECK_VERSION)/
> +
> +CHECK_DEPENDENCIES = libtool pkgconf

This is probably host-pkgconf instead of pkgconf.

> +CHECK_INSTALL_STAGING = YES
> +CHECK_INSTALL_TARGET = NO

Why don't you install on the target? check installs a shared library by
default, so you really want to install in the target.

Otherwise, explain why you don't.

> +CHECK_LICENSE =  LGPLv2.1

This is "or any later version", so:

    CHECK_LICENSE =  LGPLv2.1+

> +CHECK_LICENSE_FILES = COPYING.LESSER
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))

As said above, nothing in this series depends on host-check, so why are
you adding a host variant?

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
