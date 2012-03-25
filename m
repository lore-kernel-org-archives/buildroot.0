From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Mar 2012 22:03:50 +0200
Subject: [Buildroot] [PATCH 1/1] fix help comment Signed-off-by: JoM
	<johann.mercadier@imerir.com>
In-Reply-To: <1332426413-11634-1-git-send-email-johann.mercadier@imerir.com>
References: <1332426413-11634-1-git-send-email-johann.mercadier@imerir.com>
Message-ID: <201203252203.50771.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hoi Johann,

 There seems to be something wrong with your commit messages: the
commit message itself is missing, and the Signed-off-by is squashed
into the same line as the rest.  Your commit message should look
something like this:

fbterm: new package

Signed-off-by: Johann Mercardier <johann.mercadier@imerir.com>
---
v3: fix help comment
v2: package check for libexpat and zlib



 Note also that the Signed-off-by line should have your full name,
since it's a legal statement that you license the patch under buildroot's
GPL license and that you have the right to do so [1].


On Thursday 22 March 2012 15:26:53 JoM wrote:
[snip]
> +++ b/package/fbterm/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_FBTERM
> +	bool "fbterm"
> +	  select BR2_PACKAGE_FREETYPE
> +	  select BR2_PACKAGE_FONTCONFIG
> +	  select BR2_PACKAGE_ZLIB
> +	  select BR2_PACKAGE_EXPAT

 The select statement should just have a tab in front of them, not two 
spaces like for the help text.

> +	help
> +	  FbTerm (Frame buffer terminal emulator) is a fast terminal emulator and a 
> +	  standalone replacement of GNU/Linux terminal that can function outside of
> +	  Xorg with the frame buffer device or VESA video card.

 Please wrap the help text at +- 80 columns (where the tab counts for 8 
columns).

> +	  
> +	  http://code.google.com/p/fbterm/
> diff --git a/package/fbterm/fbterm.mk b/package/fbterm/fbterm.mk
> new file mode 100644
> index 0000000..44f63f1
> --- /dev/null
> +++ b/package/fbterm/fbterm.mk
> @@ -0,0 +1,23 @@
> +#############################################################
> +#
> +# fbterm
> +#
> +#############################################################
> +FBTERM_BINARY = fbterm
> +FBTERM_TARGET_BINARY = usr/bin/$(FBTERM_BINARY)

 FBTERM_BINARY and FBTERM_TARGET_BINARY are useless, since they are
used only once.  And as I mentioned before, they're not likely to
change in the future anyway so there's no reason to make variables
for them.

> +FBTERM_VERSION = 1.7.0
> +FBTERM_SITE = http://fbterm.googlecode.com/files
> +FBTERM_DEPENDENCIES += freetype fontconfig
> +
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +	FBTERM_DEPENDENCIES += zlib
> +endif
> +
> +FBTERM_DEPENDENCIES += $(if $(BR2_PACKAGE_EXPAT),expat)

 Please use only one of the two possible styles, otherwise things
get confusing.

> +
> +define FBTERM_UNINSTALL_CMDS
> +	rm -f $(TARGET_DIR)/$(FBTERM_TARGET_BINARY)
> +endef

 Why do you need to define this?  The autotools-generated uninstall
target should do this already.  And anyway, the PKG_UNINSTALL_CMDS
are only used for host packages; in this case it should have been
PKG_UNINSTALL_TARGET_CMDS.  And finally, uninstall is on its way
out so don't do too much effort to implement it.


 Regards,
 Arnout

[1] http://kerneltrap.org/files/Jeremy/DCO.txt

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
