From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Sep 2013 17:04:06 +0200
Subject: [Buildroot] Broken generation of locales
In-Reply-To: <523A9508.7040403@wanadoo.fr>
References: <523A9508.7040403@wanadoo.fr>
Message-ID: <20130919170406.0e04a348@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Thu, 19 Sep 2013 08:09:12 +0200, Thierry Bultel wrote:

> When setting BR2_GENERATE_LOCALE, for instance like that:
> BR2_GENERATE_LOCALE="fr_FR en_US es_ES es_ES.ISO-8859-1 hu_HU"
> 
> nothing is generated.
> 
> next patch fixes that issue:
> 
> diff --git a/Makefile b/Makefile
> index 7997e3b..98afd7e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -543,8 +543,8 @@ ifneq ($(GENERATE_LOCALE),)
>   target-generatelocales: host-localedef
>          $(Q)mkdir -p $(TARGET_DIR)/usr/lib/locale/
>          $(Q)for locale in $(GENERATE_LOCALE) ; do \
> -               inputfile=`echo $${locale} | cut -f1 -d'.' -s` ; \
> -               charmap=`echo $${locale} | cut -f2 -d'.' -s` ; \
> +               inputfile=`echo $${locale} | cut -f1 -d'.'` ; \
> +               charmap=`echo $${locale} | cut -s -f2 -d'.'` ; \
>                  if test -z "$${charmap}" ; then \
>                          charmap="UTF-8" ; \
>                  fi ; \

This exactly reverts commit 8e2696eab6a781727c09408528678d4d29edd7a3
which was merged in August. I've added Arnout in Cc so that you can
discuss the issue together and decide who wins :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
