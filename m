From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 12:18:45 +0200
Subject: [Buildroot] [PATCH 1/1 v4] ubus: new package
In-Reply-To: <1413382225-31276-1-git-send-email-swexru@gmail.com>
References: <1413382225-31276-1-git-send-email-swexru@gmail.com>
Message-ID: <20141019101845.GM4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2014-10-15 18:10 +0400, Alexey Mednyy spake thusly:
> Signed-off-by: Alexey Mednyy <swexru@gmail.com>
> ---
>  package/Config.in                                  |  1 +
>  ...c-dependency-Werror-off-build-examples-of.patch | 49 ++++++++++++++++++++++
>  package/ubus/Config.in                             | 14 +++++++
>  package/ubus/ubus-01-json-definition-fix.patch     | 27 ++++++++++++
>  package/ubus/ubus.mk                               | 28 +++++++++++++
>  5 files changed, 119 insertions(+)
>  create mode 100644 package/ubus/0001-fixed-json-c-dependency-Werror-off-build-examples-of.patch
>  create mode 100644 package/ubus/Config.in
>  create mode 100644 package/ubus/ubus-01-json-definition-fix.patch
>  create mode 100644 package/ubus/ubus.mk

Please, be consistent in the naming of the patches. The correct naming
is: NNNN-title.patch

So, your 0001 patch is correctly named, but your ubus-01 should be
something like: 0002-fix-json-definition.patch

Anyway, those two patches are incorrect (IMHO). I'd prefer you split
them in semantically separated patches:
  - one to remove Werror
  - one to disable examples
  - one to fix cjson dependency
  - one to fix json definition

Maybe patches 3 and 4 could be squashed into a single patch, since they
both deal with some json stuff (but one is about 'cjson', the other
about just 'json', so I don't know; exercise your neurons! ;-) )

[--SNIP--]
> diff --git a/package/ubus/Config.in b/package/ubus/Config.in
> new file mode 100644
> index 0000000..b0f5de9
> --- /dev/null
> +++ b/package/ubus/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_UBUS
> +	bool "ubus"
> +	select BR2_PACKAGE_LIBUBOX
> +	select BR2_PACKAGE_JSON_C
> +	depends on !BR2_PREFER_STATIC_LIB

Unless ubus itself requires shared libraries, I'd state that the
dependencies is inherited from libubox:

    depends on !BR2_PREFER_STATIC_LIB # libubox

> diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
> new file mode 100644
> index 0000000..7728a0c
> --- /dev/null
> +++ b/package/ubus/ubus.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# UBUS
> +#
> +################################################################################
> +
> +UBUS_VERSION = 4c4f35cf2230d70b9ddd87638ca911e8a563f2f3
> +UBUS_SITE = git://nbd.name/luci2/ubus.git

We prefer http URLs, because the git protocol is often blocked by
enterprise firewalls.

Unfortunately, it looks like there is no http access to that repository.
Sigh... :-(

> +UBUS_LICENSE = LGPLv2.1

Indeed, that's LGPLv2.1, there is no 'or later'.
Also, there is no license file.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
