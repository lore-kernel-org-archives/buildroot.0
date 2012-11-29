From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Nov 2012 00:19:52 +0100
Subject: [Buildroot] [PATCH] flex: fix build for nommu systems
In-Reply-To: <1354113314-30687-1-git-send-email-gustavo@zacarias.com.ar>
References: <1354113314-30687-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <50B7ED98.1030501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/11/12 15:35, Gustavo Zacarias wrote:
> The flex binary uses fork() so it breaks on !MMU builds.
> Since we usually don't require flex in the target and the common
> scenario is that we just want libfl in staging reverse the options so
> that BR2_PACKAGE_FLEX just builds and install libfl.a and change the
> LIBFL option to BR2_PACKAGE_FLEX_BINARY to install the binary in the
> target.
>
> Signed-off-by: Gustavo Zacarias<gustavo@zacarias.com.ar>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (untested, visual review only)

  Two small comments.

[snip]
> +ifeq ($(BR2_PACKAGE_FLEX_BINARY),)

  I would prefer to compare with y and swap the two branches
(that will also make the diff much more readable...)

> +define FLEX_DISABLE_PROGRAM
> +	$(SED) 's/^bin_PROGRAMS.*//' $(@D)/Makefile.in
>   endef
>
> -define FLEX_UNINSTALL_LEX
> -	-rm $(TARGET_DIR)/usr/bin/lex
> -endef
> +FLEX_POST_EXTRACT_HOOKS += FLEX_DISABLE_PROGRAM

  POST_PATCH_HOOKS would be more appropriate.


  Regards,
  Arnout

>
> -FLEX_POST_INSTALL_HOOKS += FLEX_INSTALL_LEX
> -FLEX_POST_CLEAN_HOOKS += FLEX_UNINSTALL_LEX
> +else
>
> -# libfl installation
> -ifeq ($(BR2_PACKAGE_FLEX_LIBFL),y)
> -define FLEX_INSTALL_LIBFL
> -	install -D $(FLEX_DIR)/libfl.a $(STAGING_DIR)/usr/lib/libfl.a
> +# lex ->  flex
> +define FLEX_INSTALL_LEX
> +	cd $(TARGET_DIR)/usr/bin&&  ln -snf flex lex
>   endef
>
> -define FLEX_UNINSTALL_LIBFL
> -	-rm $(STAGING_DIR)/lib/libfl.a
> -endef
> +FLEX_POST_INSTALL_HOOKS += FLEX_INSTALL_LEX
>
> -FLEX_POST_INSTALL_HOOKS += FLEX_INSTALL_LIBFL
> -FLEX_POST_CLEAN_HOOKS += FLEX_UNINSTALL_LIBFL
>   endif
>
>   $(eval $(autotools-package))
[snip]

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
