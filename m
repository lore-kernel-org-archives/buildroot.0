From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Jan 2015 22:01:51 +0100
Subject: [Buildroot] [PATCH 1/1] new package: freeradius-client
In-Reply-To: <1421954572-10445-1-git-send-email-codehero@gmail.com>
References: <1421954572-10445-1-git-send-email-codehero@gmail.com>
Message-ID: <20150125210151.GG3937@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, All,

On 2015-01-22 14:22 -0500, David Bender spake thusly:
> Signed-off-by: David Bender <codehero@gmail.com>
> ---
>  package/Config.in                              |    1 +
>  package/freeradius-client/Config.in            |    6 ++++++
>  package/freeradius-client/freeradius-client.mk |   20 ++++++++++++++++++++
>  3 files changed, 27 insertions(+), 0 deletions(-)
>  create mode 100644 package/freeradius-client/Config.in
>  create mode 100644 package/freeradius-client/freeradius-client.mk
[--SNIP--]
> diff --git a/package/freeradius-client/freeradius-client.mk b/package/freeradius-client/freeradius-client.mk
> new file mode 100644
> index 0000000..672c9c2
> --- /dev/null
> +++ b/package/freeradius-client/freeradius-client.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# freeradius-client
> +#
> +################################################################################
> +
> +FREERADIUS_CLIENT_VERSION = release_1_1_7
> +FREERADIUS_CLIENT_SITE =  $(call github,FreeRADIUS,freeradius-client,$(FREERADIUS_CLIENT_VERSION))
> +FREERADIUS_CLIENT_LICENSE = BSD-3c
> +FREERADIUS_CLIENT_LICENSE_FILES = COPYRIGHT
> +FREERADIUS_CLIENT_INSTALL_STAGING = YES
> +
> +FREERADIUS_CLIENT_CONF_ENV = ac_cv_func_memcmp_working=yes \
> +	ac_cv_func_uname=no

Why do you need to override those two?

> +FREERADIUS_CLIENT_CONF_OPTS = \
> +	"--sysconfdir=/etc", \
> +	"--enable-static"

Wy do you force --enable-static?
Normally, Buildroot takes care of that, and pases appropriate
--enable-{static,shared} based on which kind of libraries are enabled by
the user in the config, see:

    Build options  --->
        libraries  --->
            ( ) static only
            (X) shared only
            ( ) both static and shared

The default is to build only shared libraries.

Also, there is no need to quote the options.

There are a few other tweaks to be made, so I'll look to that, and will
respin a new patch later tonight (if I have enought time...).

Regards,
Yann E. MORIN.

> +$(eval $(autotools-package))
> -- 
> 1.7.8.6
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
