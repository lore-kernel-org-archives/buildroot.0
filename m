From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Jul 2015 01:06:16 +0200
Subject: [Buildroot] [PATCH 1/7 v2] check: new package
In-Reply-To: <1436458921-4199-2-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1436458921-4199-2-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <20150710230616.GF5469@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sylvain, All,

On 2015-07-09 18:21 +0200, Sylvain Raybaud spake thusly:
> Add package check: a unit test library.
> 
> Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
> ---
> 
> Changes v1 -> v2:
>  - Fixed Config.in (suggested by Yann E. Morin)
>  - Fixed hash file (suggested by Yann E. Morin)
>  - Changed dependency from pgkconf to host-pkgconf (suggested by Yann E. Morin)
>  - Fixed license (suggested by Yann E. Morin)
>  - Leave CHECK_INSTALL_STAGING and CHECK_INSTALL_TARGET to their default values (suggested by Yann E. Morin)

No, you should have kept staging, because it installs a library.

The rule is:
  - only executable: keep the defaults (target=Y, staging=N)
  - only installs static libs: target=N, staging=Y
  - install shared libs: target=Y, staging=Y

So, in your case, you want to keep the default for target, but also
instal in staging.

Regards,
Yann E. MORIN.

>  package/Config.in        |  1 +
>  package/check/Config.in  |  7 +++++++
>  package/check/check.hash |  2 ++
>  package/check/check.mk   | 17 +++++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/check/Config.in
>  create mode 100644 package/check/check.hash
>  create mode 100644 package/check/check.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 13a7e74..72ec372 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1014,6 +1014,7 @@ menu "Other"
>  	source "package/atf/Config.in"
>  	source "package/bdwgc/Config.in"
>  	source "package/boost/Config.in"
> +	source "package/check/Config.in"
>  	source "package/clapack/Config.in"
>  	source "package/classpath/Config.in"
>  	source "package/cppcms/Config.in"
> diff --git a/package/check/Config.in b/package/check/Config.in
> new file mode 100644
> index 0000000..4bdb4c8
> --- /dev/null
> +++ b/package/check/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_CHECK
> +	bool "check"
> +	select BR2_PACKAGE_LIBTOOL
> +	select BR2_PACKAGE_PKGCONF
> +	help
> +	  Unit testing framework for C
> +	  http://check.sourceforge.net/
> diff --git a/package/check/check.hash b/package/check/check.hash
> new file mode 100644
> index 0000000..8ade191
> --- /dev/null
> +++ b/package/check/check.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha1	4b79e2d485d014ddb438e322b64235347d57b0ff	check-0.9.14.tar.gz
> diff --git a/package/check/check.mk b/package/check/check.mk
> new file mode 100644
> index 0000000..83fd4fb
> --- /dev/null
> +++ b/package/check/check.mk
> @@ -0,0 +1,17 @@
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
> +CHECK_DEPENDENCIES = libtool host-pkgconf
> +
> +CHECK_LICENSE =  LGPLv2.1+
> +CHECK_LICENSE_FILES = COPYING.LESSER
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> -- 
> 1.9.1
> 
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
