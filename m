From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Feb 2020 21:57:03 +0100
Subject: [Buildroot] [RFC PATCH] package/sdbusplus: fix the build
In-Reply-To: <20200210191131.2520-1-michael@walle.cc>
References: <20200210191131.2520-1-michael@walle.cc>
Message-ID: <20200210205703.GY23769@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On 2020-02-10 20:11 +0100, Michael Walle spake thusly:
> Commit d255b67972b4b7f27572581fe0c8c8aa03d850c8 fixed the handling of
> the a package local m4/ directory which might be missing. But this only
> works if it is the very first argument. But for this package this is not
> possible because we already occupy this with the extra include directory
> for autoconf-archive. Bring back the hook to create the m4/ directory to
> fix this.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> 
> IMHO keeping this hook if the package has an include directory in its
> _AUTORECONF_OPTS variable is the least bad thing to do.
> 
> Unfortunately, I've only been able to test this briefly with the host
> build.
> 
>  package/sdbusplus/sdbusplus.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/sdbusplus/sdbusplus.mk b/package/sdbusplus/sdbusplus.mk
> index 9d3d1e8cf4..b771576a1d 100644
> --- a/package/sdbusplus/sdbusplus.mk
> +++ b/package/sdbusplus/sdbusplus.mk
> @@ -22,5 +22,14 @@ SDBUSPLUS_INSTALL_STAGING = YES
>  SDBUSPLUS_LICENSE = Apache-2.0
>  SDBUSPLUS_LICENSE_FILES = LICENSE
>  
> +# Autoreconf is missing the m4/ directory, which might actually be missing
> +# iff it was the first argument, but unfortunately we are overriding the
> +# first include directory above. Thus we need that hook here.
> +define SDBUSPLUS_CREATE_M4
> +       mkdir -p $(@D)/m4
> +endef
> +SDBUSPLUS_POST_PATCH_HOOKS += SDBUSPLUS_CREATE_M4
> +HOST_SDBUSPLUS_POST_PATCH_HOOKS += SDBUSPLUS_CREATE_M4

I have to say that I am not happy that we so fast resort to reintroducing
such hooks, when the goal of the initial patch from you was that we
should not have to meddle with the include directive to begin with...

I would favour trying to fix it in a cleaner way, either my previous
patchset (or something similar) to conditionally add the correct list
of directories, or to mege back autoconf-archive back into the main
include directory and see what package break and fix those instead.

However, we currently have a single package that depends on
autoconf-archive, so I would not put too much effort in it either...

Thomas, Arnout, Peter: thoghts?

Regards,
Yann E. MORIN.

>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
