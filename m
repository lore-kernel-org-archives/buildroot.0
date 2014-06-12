From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 12 Jun 2014 09:32:39 +0200
Subject: [Buildroot] [PATCH] system: move system.mk recipes inside the
 "target-finalize" rule
In-Reply-To: <CAHkwnC-dnWUJf=QR-6DEBwmkEoOoUuwDAWRj0EcQt5Cx8fOX0Q@mail.gmail.com>
References: <1402390367-25418-1-git-send-email-fabio.porcedda@gmail.com>
 <20140610223358.69a70e6e@free-electrons.com>
 <CAHkwnC8N3v9ULfbqUeyjtCnb3Cpd6y=PPnwgjXBwSme6hywM5w@mail.gmail.com>
 <539884A4.5060705@mind.be>
 <CAHkwnC-dnWUJf=QR-6DEBwmkEoOoUuwDAWRj0EcQt5Cx8fOX0Q@mail.gmail.com>
Message-ID: <CAHkwnC_exQsbt7e9CJrzO6FA8HQGjJMWmVOkevUxjSYpHbdvJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 12, 2014 at 9:20 AM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> My first patch will be like this:
>
> diff --git a/Makefile b/Makefile
> index dc86060..f8e446d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -525,13 +525,14 @@ define TARGET_PURGE_LOCALES
>                 done; \
>         done
>  endef
> +TARGET_FINALIZE_HOOKS += TARGET_PURGE_LOCALES
>  endif
>
>  $(TARGETS_ROOTFS): target-finalize
>
>  target-finalize: $(TARGETS)
>         @$(call MESSAGE,"Finalizing target directory")
> -       $(TARGET_PURGE_LOCALES)
> +       $(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
>         rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
>                 $(TARGET_DIR)/usr/lib/pkgconfig
> $(TARGET_DIR)/usr/share/pkgconfig \
>                 $(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake
>
>
> I will send an updated patch set that will use hooks.

I think it's best to use PURGE_LOCALES_HOOK instead of TARGET_PURGE_LOCALES.


diff --git a/Makefile b/Makefile
index dc86060..bb51727 100644
--- a/Makefile
+++ b/Makefile
@@ -513,7 +513,7 @@ ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST = $(BUILD_DIR)/locales.nopurge
 LOCALE_NOPURGE = $(call qstrip,$(BR2_ENABLE_LOCALE_WHITELIST))

-define TARGET_PURGE_LOCALES
+define PURGE_LOCALES_HOOK
        rm -f $(LOCALE_WHITELIST)
        for i in $(LOCALE_NOPURGE); do echo $$i >> $(LOCALE_WHITELIST); done

@@ -525,13 +525,14 @@ define TARGET_PURGE_LOCALES
                done; \
        done
 endef
+TARGET_FINALIZE_HOOKS += PURGE_LOCALES_HOOK
 endif

 $(TARGETS_ROOTFS): target-finalize

 target-finalize: $(TARGETS)
        @$(call MESSAGE,"Finalizing target directory")
-       $(TARGET_PURGE_LOCALES)
+       $(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
        rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
                $(TARGET_DIR)/usr/lib/pkgconfig
$(TARGET_DIR)/usr/share/pkgconfig \
                $(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake


Best regards
-- 
Fabio Porcedda
