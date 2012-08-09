From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Aug 2012 10:34:19 +0200
Subject: [Buildroot] [PATCH] yasm: New package
In-Reply-To: <5022CB63.9020908@petroprogram.com>
References: <5022CB63.9020908@petroprogram.com>
Message-ID: <20120809103419.076cadd9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stefan,

Thanks for this contribution!

Le Wed, 08 Aug 2012 23:26:11 +0300,
Stefan Fr?berg <stefan.froberg@petroprogram.com> a ?crit :

> My first git format patch. 
> This is needed by Firefox WebM support. Firefox is almost ready too
> but need few changes to cairo and libpng.
> 
> Hopefully it went right (can somebody suggest some good, git online
> tutorial or book?).
> 
> Stefan
> 
> Signed-off-by: Stefan Froberg <stefan.froberg@petroprogram.com>

You shouldn't include "personal" messages in the commit log here. This
part of the commit log will remain forever in the Git history, so we
don't want to have messages like "Hopefully it went right...".

If you have something to say beyond the commit log itself, then I think
the easiest solution is to use git send-email --compose, which will
prompt you for the text of an introduction e-mail. Then git send-email
will send N+1 e-mails: your introduction e-mail + the N patches you
told send-email to send. And git send-email is smart enough to make
those N emails replies to the introduction e-mail.

> ---
>  package/Config.in      |    1 +
>  package/yasm/Config.in |    9 +++++++++
>  package/yasm/yasm.mk   |   23 +++++++++++++++++++++++
>  3 files changed, 33 insertions(+), 0 deletions(-)
>  create mode 100644 package/yasm/Config.in
>  create mode 100644 package/yasm/yasm.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index f308de7..bde4318 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -91,6 +91,7 @@ source "package/sstrip/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  source "package/tar/Config.in"
>  endif
> +source "package/yasm/Config.in"
>  endmenu
>  
>  menu "Games"
> diff --git a/package/yasm/Config.in b/package/yasm/Config.in
> new file mode 100644
> index 0000000..f8fbc9b
> --- /dev/null
> +++ b/package/yasm/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_YASM
> +    bool "yasm"

depends on BR2_i386 || BR2_x86_64

> +    help
> +      Yasm is a complete rewrite of the NASM-2.10.01 assembler.
> +      It supports the x86 and AMD64 instruction sets, accepts NASM
> +      and GAS assembler syntaxes and outputs binary, ELF32 and ELF64
> +      object formats.
> +
> +

Remove one newline here.

> diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
> new file mode 100644
> index 0000000..280efd2
> --- /dev/null
> +++ b/package/yasm/yasm.mk
> @@ -0,0 +1,23 @@
> +#############################################################
> +#
> +# yasm
> +#
> +#############################################################
> +YASM_VERSION = 1.2.0
> +YASM_SOURCE = yasm-$(YASM_VERSION).tar.gz
> +YASM_SITE = http://www.tortall.net/projects/yasm/releases/
> +YASM_CONF_OPT = --enable-shared

This is useless, --enable-shared is passed by default.

> +
> +define YASM_PRE_CONFIGURE_FIXUP
> +# This sed prevents it compiling 2 programs (vsyasm and ytasm)
> +# that are only of use on Microsoft Windows.
> +#    cd $(@D)

Remove this last line of comment.

> +    sed -i 's#) ytasm.*#)#' $(@D)/Makefile.in
> +endef
> +
> +YASM_PRE_CONFIGURE_HOOKS += YASM_PRE_CONFIGURE_FIXUP
> +
> +
> +

Make this only one empty new line.

> +$(eval $(call AUTOTARGETS))
> +$(eval $(call AUTOTARGETS,host))

And this should now be:

$(eval $(autotools-package))
$(eval $(host-autotools-package))

(It has changed between 2012.05 and the current Git version).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
