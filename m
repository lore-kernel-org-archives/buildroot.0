From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Nov 2015 16:49:13 +0100
Subject: [Buildroot] [PATCH 1/1] INSTALL for autotools packages with
 hardcoded '-s'
In-Reply-To: <1448206276-6260-1-git-send-email-yba@tkos.co.il>
References: <1448206276-6260-1-git-send-email-yba@tkos.co.il>
Message-ID: <20151122154913.GA3603@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan, All,

On 2015-11-22 17:31 +0200, Jonathan Ben-Avraham spake thusly:
> From: Jonathan Ben Avraham <yba@tkos.co.il>
> 
> The Makefile.in's of some autotools packages such as yp-tools and ypbind-mt do

Are you planning on submitting those two packages?

If so, you should probably have sent a patch series with this patch as
patch 1/3, followed by patches 2/3 and 3/3 to add the two packages.

Having this single patch on its own does not make sense. It needs to
have users for it in the tree.

However... See below...

> not use the "install-sh" script for installing executables but instead call the
> detected BSD compatible 'install' binary directly with hardcoded '-s' parameter.
> This results in a build failure when the host 'strip' is invoked on binaries
> compiled for a different arch. The 'install-without-strip' script removes the
> '-s' parameter and execs the 'install' binary in PATH to solve this problem.
> These autotools packages can then be build under Buildroot by specifying
> <package>_CONF_ENV = INSTALL=support/scripts/install-without-strip

Could you not just set:
    YP_TOOLS_AUTORECONF = YES
    YPBIND_MT_AUTORECONF = YES

to force re-generation of the autostuff?

(Note: it will need to depend on host-gettext, since it wants to run
autotopint)

Regards,
Yann E. MORIN.

> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
> ---
>  support/scripts/install-without-strip |   11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100755 support/scripts/install-without-strip
> 
> diff --git a/support/scripts/install-without-strip b/support/scripts/install-without-strip
> new file mode 100755
> index 0000000..f167c28
> --- /dev/null
> +++ b/support/scripts/install-without-strip
> @@ -0,0 +1,11 @@
> +#!/bin/sh -e
> +# Needed for autotools packages with hardcoded "install -s"
> +
> +INSTALL=$(which install)
> +if [ -x "${INSTALL}" ]
> +then 
> +	exec ${INSTALL} $(echo ${@} | sed 's/-s//g')
> +fi
> +
> +echo "error: $0 needs an executable \"install\" in PATH"
> +exit 1
> -- 
> 1.7.9.5
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
