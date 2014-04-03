From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Apr 2014 23:23:50 +0200
Subject: [Buildroot] [PATCH 04/11] gdb: Fix on-target threads debugging
In-Reply-To: <1396558881-29631-4-git-send-email-paul@crapouillou.net>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
 <1396558881-29631-4-git-send-email-paul@crapouillou.net>
Message-ID: <20140403212350.GD17328@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul, Maarten, All,

On 2014-04-03 23:01 +0200, Paul Cercueil spake thusly:
> From: Maarten ter Huurne <maarten@treewalker.org>
> 
> Signed-Off-By: Maarten ter Huurne <maarten@treewalker.org>
> Acked-By: Paul Cercueil <paul@crapouillou.net>
> ---
>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 09be13c..69ef7a5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -506,6 +506,10 @@ $(BUILD_DIR)/.root:
>  
>  $(TARGET_DIR): $(BUILD_DIR)/.root
>  
> +ifeq ($(BR2_PACKAGE_GDB),y)
> +BR2_STRIP_EXCLUDE_FILES += libpthread*.so*
> +endif

Is that really needed? The exclude code already excludes that file:

Makefile at 513:
    [...] $(call findfileclauses,libpthread*.so* $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) [...]

So, libpthread*.so* is always excluded from being stripped.

Do you have a case where libpthread*.so* is still stripped?

Regards,
Yann E. MORIN.

>  STRIP_FIND_CMD = find $(TARGET_DIR)
>  ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)))
>  STRIP_FIND_CMD += \( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) -prune -o
> -- 
> 1.9.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
