From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Mar 2012 00:09:42 +0100
Subject: [Buildroot] [PATCH 1/1] Add FbTerm package for OMAP4
	(targetting pandaboard) Signed-off-by: JoM
	<johann.mercadier@imerir.com>
In-Reply-To: <1332281066-364-1-git-send-email-johann.mercadier@imerir.com>
References: <1332281066-364-1-git-send-email-johann.mercadier@imerir.com>
Message-ID: <201203210009.42454.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 The Signed-off-by should be on a separate line.

On Tuesday 20 March 2012 23:04:26 JoM wrote:
> ---
>  package/Config.in        |  644 ++++------------------------------------------

 I don't suppose it was your intention to remove all packages :-)

>  package/fbterm/Config.in |   39 +++
>  package/fbterm/fbterm.mk |   47 ++++
>  3 files changed, 133 insertions(+), 597 deletions(-)
>  create mode 100644 package/fbterm/Config.in
>  create mode 100644 package/fbterm/fbterm.mk
> 
[snip]
> diff --git a/package/fbterm/Config.in b/package/fbterm/Config.in
> new file mode 100644
> index 0000000..aca2462
> --- /dev/null
> +++ b/package/fbterm/Config.in
> @@ -0,0 +1,39 @@
> +config BR2_PACKAGE_FBTERM
> +	bool "fbterm"
> +	select BR2_PACKAGE_FREETYPE
> +	select BR2_PACKAGE_FONTCONFIG
> +	select BR2_PACKAGE_ZLIB
> +	
> +	help
> +	FbTerm (Frame buffer terminal emulator) is a fast terminal emulator and a 
 help indentation should be one tab + two spaces, and no space at the end of the line.

> +	standalone replacement of GNU/Linux terminal that can function outside of
> +	Xorg with the frame buffer device or VESA video card.
> +
> +	Features include: 
> +	* mostly as fast as terminal of linux kernel while accelerated scrolling
> +	is enabled.
 Indent this so the second line is aligned after the *

> +	* internationalization support (UTF-8)
> +	* select font with fontconfig and draw text with freetype2, same as Qt/Gtk+
> +	based GUI apps.
> +	* dynamically create/destroy up to 10 windows initially running default 
> +	shell.
> +	* record scroll-back history for every window.
> +	* auto-detect text encoding with current locale, support double width 
> +	scripts like Chinese, Japanese etc...
> +	* switch between configurable additional text encodings with hot keys on
> +	the fly.
> +	* keyboard bindings such as Shift-Pageup to move the terminal up a page...
> +	* multiple framebuffer "windows," creating new ones with Ctrl-Alt-c and
> +	moving between windows with Shift-Left and Shift-Right.
> +	* jump directly to a specific window with Ctrl-Alt-number. The FbTerm
> +	windows are independent of the multiple getty sessions that are available 
> +	with Alt-function keys.
> +	* copy/past selected text between windows with mouse when gpm server is 
> +	running.
> +	* change the orientation of screen display, i.e screen rotation.
> +	* lightweight input method framework with client-server architecture.
> +	* background image for eye candy.
> +	* you can create up to 10 differents terminals windows on the same 
> +	framebuffer, each window having scrollback history.
> +	  
> +	http://code.google.com/p/fbterm/
> diff --git a/package/fbterm/fbterm.mk b/package/fbterm/fbterm.mk
> new file mode 100644
> index 0000000..96e077a
> --- /dev/null
> +++ b/package/fbterm/fbterm.mk
> @@ -0,0 +1,47 @@
> +#############################################################
> +#
> +# fbterm
> +#
> +#############################################################
> +FBTERM_BINARY = fbterm
> +FBTERM_TARGET_BINARY = usr/bin/$(FBTERM_BINARY)

 These two variables aren't very useful.  It's not as if the name of
the binary is likely to change, and "usr/bin/fbterm" is shorter
than FBTERM_TARGET_BINARY

> +FBTERM_VERSION_MAJOR = 1.7
> +FBTERM_VERSION = $(FBTERM_VERSION_MAJOR).0

 The _VERSION should be the upstream version, and upstream seems to
call it 1.7.

> +FBTERM_SOURCE = $(FBTERM_BINARY)-$(FBTERM_VERSION_MAJOR).tar.gz
> +FBTERM_SITE = http://fbterm.googlecode.com/files
> +#FBTERM_SITE_METHOD =
 Don't leave commented-out lines in your patch.

> +FBTERM_DIR = $(BUILD_DIR)/$(FBTERM_BINARY)-$(FBTERM_VERSION_MAJOR)
 This variable is defined already by AUTOTARGETS.

> +#FBTERM_AUTORECONF = NO
> +FBTERM_INSTALL_STAGING = YES

 Does fbterm export a shared library or anything else that is necessary
to compile other applications?  Else, there is no need to install it
to staging.

> +FBTERM_INSTALL_TARGET = YES
 INSTALL_TARGET is YES by default, so leave this out.

> +#FBTERM_CONF_OPT = --enable-shared
> +FBTERM_DEPENDENCIES += freetype fontconfig
 Not zlib?

> +FBTERM_CAT = $(ZCAT)
 What is this supposed to do?

> +
> +
> +define FBTERM_CONFIGURE_CMDS
> +	(cd $(FBTERM_DIR); rm -f config.cache; \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		$(TARGET_CONFIGURE_ARGS) \
> +		./configure \
> +		--build=arm-linux- --target=arm-linux- --host=i686-pc-linux-gnu \
> +		build_alias=arm-linux- target_alias=arm-linux- \
> +		CXX=arm-linux-g++ \
> +	)
> +endef

 Err... buildroot supports more architectures than just ARM, and more hosts
than 32-bit linux.  The default CONFIGURE_CMDS of AUTOTARGETS will probably
set things correctly.  If any additional options are needed, add them to
FBTERM_CONF_OPT.

> +
> +define FBTERM_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(@D)
> +endef

 This is just the default, so remove.

> +
> +define FBTERM_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D $(@D)/src/$(FBTERM_BINARY) $(TARGET_DIR)/$(FBTERM_TARGET_BINARY)
> +endef

 Doesn't the 'make install' work for this package?  The default from
AUTOTARGETS probably works...

> +
> +define FBTERM_CLEAN_CMDS
> +	rm -f $(TARGET_DIR)/$(FBTERM_TARGET_BINARY)
> +	-$(MAKE) -C $(@D) clean
> +endef

 Same here.  Removing the binary from TARGET_DIR actually belongs
to FBTERM_UNINSTALL_TARGET_CMDS, but that one is on its way out.

> +
> +
> +$(eval $(call AUTOTARGETS,package,fbterm))

 The arguments to AUTOTARGETS have been removed.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
