From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Mar 2016 17:47:49 +0100
Subject: [Buildroot] [PATCH v2] libglib2: improve dev file removal
In-Reply-To: <1457541577-21773-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457541577-21773-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160309174749.46cf1ea0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 Mar 2016 13:39:37 -0300, Gustavo Zacarias wrote:
> * Remove /usr/share/glib-2.0 rmdir from DEV_FILES hook, if we are not
> using gdb the GDB_FILES hook will hit and remove it anway, and if we are
> indeed using gdb we need it.
> 
> * Remove glib-compile-resources and glib-compile-schemas binaries, these
> aren't used for runtime purposes.
> 
> * Remove /usr/share/glib-2.0/codegen and /usr/share/glib-2.0/schemas, as
> with the binaries these aren't used for runtime purposes either.
> 
> Size savings delta +800 KB.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libglib2/libglib2.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index ea45f4a..f162cd4 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -128,9 +128,8 @@ endif
>  
>  define LIBGLIB2_REMOVE_DEV_FILES
>  	rm -rf $(TARGET_DIR)/usr/lib/glib-2.0
> -	rm -rf $(TARGET_DIR)/usr/share/glib-2.0/gettext
> -	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/glib-2.0
> -	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,glib-genmarshal glib-gettextize glib-mkenums gobject-query gtester gtester-report)
> +	rm -rf $(addprefix $(TARGET_DIR)/usr/share/glib-2.0/,codegen gettext schemas)
> +	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,glib-compile-resources glib-compile-schemas glib-genmarshal glib-gettextize glib-mkenums gobject-query gtester gtester-report)
>  endef
>  
>  LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_DEV_FILES

Seems better, at least I understand. There is one minor point I don't
entirely like is that you make an assumption on the ordering of the
install target hooks calls.

Therefore, I think I would have preferred:

ifneq ($(BR2_PACKAGE_GDB),y)
define LIBGLIB2_REMOVE_GDB_FILES
        rm -rf $(TARGET_DIR)/usr/share/glib-2.0/gdb
endef
endif

define LIBGLIB2_REMOVE_DEV_FILES
	rm -rf $(TARGET_DIR)/usr/lib/glib-2.0
	rm -rf $(addprefix $(TARGET_DIR)/usr/share/glib-2.0/,codegen gettext schemas)
	$(LIBGLIB2_REMOVE_GDB_FILES)
	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/glib-2.0
	...
endef

But it's really a minor point, and somewhat pedantic, I admit, so I'm
also fine with your patch as-is.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
