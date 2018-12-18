From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Dec 2018 20:47:32 +0100
Subject: [Buildroot] [PATCH 4/4] dropbear: use BR2_SYSTEM_DEFAULT_PATH
 as default PATH
In-Reply-To: <20181218005116.17435-5-mmayer@broadcom.com>
References: <20181218005116.17435-1-mmayer@broadcom.com>
 <20181218005116.17435-5-mmayer@broadcom.com>
Message-ID: <20181218194732.GF24194@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2018-12-17 16:51 -0800, Markus Mayer spake thusly:
> We use the configuration option BR2_SYSTEM_DEFAULT_PATH to set the
> default PATH in dropbear sessions.

Ditto, string already quoted blah-blah-blah... ;-)

> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  package/dropbear/dropbear.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index 7b1468cfb100..7dc5f46bcc81 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -81,6 +81,14 @@ define DROPBEAR_DISABLE_STANDALONE
>  	echo '#define NON_INETD_MODE 0'                 >> $(@D)/localoptions.h
>  endef
>  
> +ifneq ($(BR2_SYSTEM_DEFAULT_PATH),"")
> +define DROPBEAR_CUSTOM_PATH
> +	echo '#define DEFAULT_PATH $(BR2_SYSTEM_DEFAULT_PATH)' >>$(@D)/localoptions.h
> +endef

Why is it conditional here, and not in the two other patches, then?

In fact I think I missed that in the initial patch: we should ensure
that it can't be empty (unelss there is a good reason to accept a
system-wide empty PATH). Maybe something in system/system.mk:

    ifeq ($(BR_BUILDLING)$(BR2_SYSTEM_DEFAULT_PATH)),y"")
    $(error BR2_SYSTEM_DEFAULT_PATH can't be empty)
    endif

(no need to properly finish the sentence, the $(error) will do it for
you.)

And then we can safely use it as-is, unconditionally, in the three other
locations (profile, openssh, dropbear).

Of course, if we decide that an empty BR2_SYSTEM_DEFAULT_PATH is valid,
then we should also use it as-is in dropbear and openssh, because we
should just abide by the user's decision.

Regards,
Yann E. MORIN.

> +DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_CUSTOM_PATH
> +endif
> +
>  define DROPBEAR_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 644 package/dropbear/dropbear.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/dropbear.service
> -- 
> 2.17.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
