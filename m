From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Feb 2012 17:30:49 +0100
Subject: [Buildroot] [PATCH] [PATCH] usb_modeswitch: upgrade to 1.2.3
In-Reply-To: <1328830956-11154-1-git-send-email-jwoltz@gmail.com>
References: <1328830956-11154-1-git-send-email-jwoltz@gmail.com>
Message-ID: <201202111730.50135.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 10 February 2012 00:42:36 J.C. Woltz wrote:
>  define USB_MODESWITCH_BUILD_CMDS
> -       $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +       $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
>  endef

 Don't remove TARGET_MAKE_ENV.  The CC= is good, however.

>  
>  define USB_MODESWITCH_INSTALL_TARGET_CMDS
> -       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> -       $(INSTALL) -D $(@D)/usb_modeswitch.setup -m 0644 \
> -               $(TARGET_DIR)/etc/usb_modeswitch.setup
> +       $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
>  endef

 Same here.


> +

 Redundant whitespace.

>  define USB_MODESWITCH_CLEAN_CMDS
> +       $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) clean
>         rm -f $(TARGET_DIR)/usr/sbin/usb_modeswitch
>         rm -f $(TARGET_DIR)/etc/usb_modeswitch.setup
>         rm -f $(TARGET_DIR)/usr/share/man/man1/usb_modeswitch.1

 Actually, the rm -f lines should be in UNINSTALL_CMDS.  And should use 
$(RM) instead of rm -f.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
