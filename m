From: =?UTF-8?B?QmVub8OudA==?= Allard <benoit.allard@greenbone.net>
Date: Fri, 5 Aug 2016 14:07:21 +0200
Subject: [Buildroot] [git commit] ncurses: factorize terminfo files
 installation
In-Reply-To: <20160803205324.76B9C81972@busybox.osuosl.org>
References: <20160803205324.76B9C81972@busybox.osuosl.org>
Message-ID: <20160805140721.59c6d8ae@armant.core.local.os.greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas,

It looks like this commit introduces a regression on our side, the
"linux" terminfo is not installed anymore (see inlined comment).

Do you want me to provide a patch, or is that 'small enough' that you
can take care of it ?

Regards,
Ben.


On Wed, 3 Aug 2016 22:52:24 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> commit:
> https://git.buildroot.net/buildroot/commit/?id=33ba5188351ece027455e460f6cba4245af49f3a
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> This long list of commands to copy the terminfo files from staging to
> target is really silly and can be factorized using a
> NCURSES_TERMINFO_FILES variable, which is then iterated through.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/ncurses/ncurses.mk | 47
> ++++++++++++++++++++++------------------------ 1 file changed, 22
> insertions(+), 25 deletions(-)
> 
> diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
> index 55e5c81..0ae8835 100644
> --- a/package/ncurses/ncurses.mk
> +++ b/package/ncurses/ncurses.mk
> @@ -55,6 +55,20 @@ NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_MENU) +=
> menu NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_PANEL) += panel
>  NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_FORM) += form
>  
> +NCURSES_TERMINFO_FILES = \
> +	a/ansi \

l/linux is missing here.

> +	p/putty \
> +	p/putty-vt100 \
> +	s/screen \
> +	v/vt100 \
> +	v/vt100-putty \
> +	v/vt102 \
> +	v/vt200 \
> +	v/vt220 \
> +	x/xterm \
> +	x/xterm-color \
> +	x/xterm-xfree86 \
> +
>  ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
>  NCURSES_CONF_OPTS += --enable-widec
>  NCURSES_LIB_SUFFIX = w
> @@ -95,11 +109,10 @@ NCURSES_LINK_STAGING_PC = $(call
> NCURSES_LINK_PC,$(STAGING_DIR)) 
>  NCURSES_CONF_OPTS += --enable-ext-colors
>  NCURSES_ABI_VERSION = 6
> -define NCURSES_INSTALL_TARGET_256_COLORS_TERMINFO
> -	cp -dpf $(STAGING_DIR)/usr/share/terminfo/p/putty-256color
> $(TARGET_DIR)/usr/share/terminfo/p
> -	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm+256color
> $(TARGET_DIR)/usr/share/terminfo/x
> -	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-256color
> $(TARGET_DIR)/usr/share/terminfo/x -endef
> +NCURSES_TERMINFO_FILES += \
> +	p/putty-256color \
> +	x/xterm+256color \
> +	x/xterm-256color
>  
>  NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_LIBS
>  NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_PC
> @@ -145,26 +158,10 @@ define NCURSES_INSTALL_TARGET_CMDS
>  	$(NCURSES_LINK_TARGET_LIBS)
>  	$(NCURSES_INSTALL_TARGET_PROGS)
>  	ln -snf /usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo
> -	mkdir -p $(TARGET_DIR)/usr/share/terminfo/x
> -	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm
> $(TARGET_DIR)/usr/share/terminfo/x
> -	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-color
> $(TARGET_DIR)/usr/share/terminfo/x
> -	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-xfree86
> $(TARGET_DIR)/usr/share/terminfo/x
> -	mkdir -p $(TARGET_DIR)/usr/share/terminfo/v
> -	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt100
> $(TARGET_DIR)/usr/share/terminfo/v
> -	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt100-putty
> $(TARGET_DIR)/usr/share/terminfo/v
> -	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt102
> $(TARGET_DIR)/usr/share/terminfo/v
> -	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt200
> $(TARGET_DIR)/usr/share/terminfo/v
> -	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt220
> $(TARGET_DIR)/usr/share/terminfo/v
> -	mkdir -p $(TARGET_DIR)/usr/share/terminfo/a
> -	cp -dpf $(STAGING_DIR)/usr/share/terminfo/a/ansi
> $(TARGET_DIR)/usr/share/terminfo/a

l/linux was installed here:

> -	mkdir -p $(TARGET_DIR)/usr/share/terminfo/l
> -	cp -dpf $(STAGING_DIR)/usr/share/terminfo/l/linux
> $(TARGET_DIR)/usr/share/terminfo/l
> -	mkdir -p $(TARGET_DIR)/usr/share/terminfo/p
> -	cp -dpf $(STAGING_DIR)/usr/share/terminfo/p/putty
> $(TARGET_DIR)/usr/share/terminfo/p
> -	cp -dpf $(STAGING_DIR)/usr/share/terminfo/p/putty-vt100
> $(TARGET_DIR)/usr/share/terminfo/p
> -	mkdir -p $(TARGET_DIR)/usr/share/terminfo/s
> -	cp -dpf $(STAGING_DIR)/usr/share/terminfo/s/screen
> $(TARGET_DIR)/usr/share/terminfo/s
> -	$(NCURSES_INSTALL_TARGET_256_COLORS_TERMINFO)
> +	$(foreach terminfo,$(NCURSES_TERMINFO_FILES),\
> +		$(INSTALL) -D -m 0644
> $(STAGING_DIR)/usr/share/terminfo/$(terminfo) \
> +			$(TARGET_DIR)/usr/share/terminfo/$(terminfo)
> +	)
>  endef # NCURSES_INSTALL_TARGET_CMDS
>  
>  #
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160805/cbbad5af/attachment.asc>
