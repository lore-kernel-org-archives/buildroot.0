From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Jul 2014 00:40:33 +0200
Subject: [Buildroot] [PATCH] package/libconfuse: switch to the new
	upstream
In-Reply-To: <1405549965-22539-1-git-send-email-yann.morin.1998@free.fr>
References: <1405549965-22539-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <53C6FF61.2070100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/07/14 00:32, Yann E. MORIN wrote:
> From: Alvaro Gamez <alvaro.gamez@hazent.com>
> 
> libconfuse is being migrated to github (see http://www.nongnu.org/confuse/)
> So, just follow suite.

 suit (pronounced [set]), not suite (pronounced [swi.t]).

> 
> Needs a bit of a hack so gettextize + autoreconf does not step on each
> other's toes. See comment in the patch.
> 
> Based on a patch by: Alvaro Gamez <alvaro.gamez@hazent.com>

 Kind of unnecessary since you kept him as author.

> 
> [me: fix gettextizing, write commit log]

 Once it's committed, it won't be clear anymore who the 'me' is.


> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 You should keep Alvaro's SoB. Well, except that he didn't sign it off :-)
Alvaro, can you provide your SoB?


 But it basically looks good to me :-)

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  .../libconfuse-0000-fix-configure-ac.patch         | 27 ++++++++++++++++++++++
>  package/libconfuse/libconfuse.mk                   |  9 +++++---
>  2 files changed, 33 insertions(+), 3 deletions(-)
>  create mode 100644 package/libconfuse/libconfuse-0000-fix-configure-ac.patch
> 
> diff --git a/package/libconfuse/libconfuse-0000-fix-configure-ac.patch b/package/libconfuse/libconfuse-0000-fix-configure-ac.patch
> new file mode 100644
> index 0000000..6d61b48
> --- /dev/null
> +++ b/package/libconfuse/libconfuse-0000-fix-configure-ac.patch
> @@ -0,0 +1,27 @@
> +configure: remove po/Makefile.in from AC_CONFIG_FILES
> +
> +Since we are gettextizing the package, gettextize updates configure.ac
> +to add po/Makefile.in to AC_CONFIG_FILES>
> +
> +Unfortunately, it's already present, and gettextize does not detect it,
> +and insists on adding its own. Later on, autoreconf barfs on the double
> +occurences.
> +
> +As suggested by Arnout, just patch configure.ac to remove the
> +po/Makefile.in occurence, so gettextize can safely add its own
> +
> +Reported-by: Arnout Vandecappelle <arnout@mind.be>
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Cc: Alvaro Gamez <alvaro.gamez@hazent.com>
> +
> +diff -durN libconfuse-V2_7.orig/configure.ac libconfuse-V2_7/configure.ac
> +--- libconfuse-V2_7.orig/configure.ac	2010-02-20 10:14:10.000000000 +0100
> ++++ libconfuse-V2_7/configure.ac	2014-07-17 00:19:18.816785340 +0200
> +@@ -49,7 +49,6 @@
> + AC_CONFIG_FILES([Makefile \
> + 		 src/Makefile \
> + 		 examples/Makefile \
> +-                 po/Makefile.in \
> + 		 m4/Makefile \
> + 		 tests/Makefile \
> + 		 doc/Makefile \
> diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
> index 8a0d80f..e9a1114 100644
> --- a/package/libconfuse/libconfuse.mk
> +++ b/package/libconfuse/libconfuse.mk
> @@ -4,13 +4,16 @@
>  #
>  ################################################################################
>  
> -LIBCONFUSE_VERSION = 2.7
> -LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.gz
> -LIBCONFUSE_SITE = http://savannah.nongnu.org/download/confuse/
> +LIBCONFUSE_VERSION = V2_7
> +LIBCONFUSE_SITE = $(call github,martinh,libconfuse,$(LIBCONFUSE_VERSION))
>  LIBCONFUSE_INSTALL_STAGING = YES
>  LIBCONFUSE_CONF_OPT = --disable-rpath
>  LIBCONFUSE_LICENSE = ISC
>  LIBCONFUSE_LICENSE_FILES = src/confuse.c
>  
> +# Fresh from the repository, no configure et al.
> +LIBCONFUSE_AUTORECONF = YES
> +LIBCONFUSE_GETTEXTIZE = YES
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
