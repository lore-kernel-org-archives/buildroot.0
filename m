From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:06:31 +0200
Subject: [Buildroot] [PATCH 48/50 v2] package/busybox: invert dependency
 with bash
In-Reply-To: <d7be2552df2b3ee3f2bd1ffc79f9980f1cb6b2b4.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
 <d7be2552df2b3ee3f2bd1ffc79f9980f1cb6b2b4.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <dd401801-1967-ac20-b714-94139cbe47bf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-07-18 11:46, Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/bash/bash.mk       | 4 +---
>  package/busybox/busybox.mk | 1 +
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
> index bb52bf3259..7fb7192e2c 100644
> --- a/package/bash/bash.mk
> +++ b/package/bash/bash.mk
> @@ -6,9 +6,7 @@
>  
>  BASH_VERSION = 4.4.18
>  BASH_SITE = $(BR2_GNU_MIRROR)/bash
> -# Build after since bash is better than busybox shells
> -BASH_DEPENDENCIES = ncurses readline host-bison \
> -	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
> +BASH_DEPENDENCIES = ncurses readline host-bison
>  BASH_CONF_OPTS = --with-installed-readline --without-bash-malloc
>  BASH_LICENSE = GPL-3.0+
>  BASH_LICENSE_FILES = COPYING
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 75a2dc4c6d..0a9af9f17b 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
>  
>  # Packages that provide commands that may also be busybox applets:
>  BUSYBOX_DEPENDENCIES = \
> +	$(if $(BR2_PACKAGE_BASH),bash) \

 Actually, which applet does busybox have that bash also provides? The shell,
obviously, but that's handled by the BR2_SYSTEM_BIN_SH choice...

 I'm going to apply this patch anyway, but it's something to think about.

 Regards,
 Arnout


>  	$(if $(BR2_PACKAGE_BC),bc) \
>  	$(if $(BR2_PACKAGE_BINUTILS),binutils) \
>  	$(if $(BR2_PACKAGE_COREUTILS),coreutils) \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
