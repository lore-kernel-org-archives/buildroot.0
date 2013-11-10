From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 10 Nov 2013 21:33:32 +0100
Subject: [Buildroot] [PATCH 1/1] Generation of locales: made call to tr
 more robust and added LOWERCASE macro
In-Reply-To: <1384104772-30097-1-git-send-email-thierry.bultel@wanadoo.fr>
References: <1384104772-30097-1-git-send-email-thierry.bultel@wanadoo.fr>
Message-ID: <CAAXf6LVniLhJMD6e0gJnaVZ6N-g8b=TAOghG9ydAhm0wHEkmWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thierry,

On Sun, Nov 10, 2013 at 6:32 PM, Thierry Bultel
<thierry.bultel@wanadoo.fr> wrote:
> When calling 'tr' without quoting braces, bash can make really weird things
> if there are existing 'single-letter-named' directories
> eg:
> thierry at thierry-desktop:~$ echo AAA | tr [A-Z] [a-z]
> aaa
> thierry at thierry-desktop:~$ mkdir m
> thierry at thierry-desktop:~$ echo AAA | tr [A-Z] [a-z]
> AAA
>
>
> The (quick) analysis is that the callee (tr) argvs then
> contain 'm' thus the translation does not work
>
> Using quotes works around it:
> thierry at thierry-desktop:~$ echo AAA | tr '[A-Z]' '[a-z]'
> aaa
>
>
> Changes v1->v2
>   - Added the LOWERCASE macro, following Thomas De Schampheleire's advice
>

This 'Changes' text should be below the --- line, otherwise it ends up
in the commit log which is not supposed to happen.

>
> Signed-off-by: Thierry Bultel <thierry.bultel@wanadoo.fr>
> ---
>  Makefile             |    2 +-
>  package/pkg-utils.mk |    8 ++++++++
>  2 files changed, 9 insertions(+), 1 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 1496bd7..a006615 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -548,7 +548,7 @@ target-generatelocales: host-localedef
>                 I18NPATH=$(STAGING_DIR)/usr/share/i18n:/usr/share/i18n \
>                 $(HOST_DIR)/usr/bin/localedef \
>                         --prefix=$(TARGET_DIR) \
> -                       --`echo $(BR2_ENDIAN) | tr [A-Z] [a-z]`-endian \
> +                       --$(call LOWERCASE,$(BR2_ENDIAN))-endian \
>                         -i $${inputfile} -f $${charmap} \
>                         $${locale} ; \
>         done
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 5930f2c..0ef433d 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -23,6 +23,14 @@ UPPERCASE = $(strip $(eval __tmp := $1) \
>         $(__tmp)))) \
>         $(__tmp))
>
> +# LOWERCASE macro -- transforms its arguments to lowercase
> +# The above non-tr implementation is not needed, because LOWERCASE is not
> +# called very often
> +
> +define LOWERCASE
> +$(shell echo $1 | tr '[:upper:]' '[:lower:]')
> +endef
> +

Not sure if a 'define' was needed here (compared to a simple
assignment), but I have no strong feelings about that.

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
