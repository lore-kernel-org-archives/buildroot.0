From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 14:53:49 +0100
Subject: [Buildroot] [PATCH/RFC 1/1] package/pkg-utils.mk: fix
 per-package build
In-Reply-To: <20210117125354.GF2375@scaer>
References: <20210117122444.2409286-1-bernd.kuhls@t-online.de>
 <20210117125354.GF2375@scaer>
Message-ID: <20210117135349.GG2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-01-17 13:53 +0100, Yann E. MORIN spake thusly:
> On 2021-01-17 13:24 +0100, Bernd Kuhls spake thusly:
> > While host-fontconfig provides share/gettext as a directory
> > in host-libglib2 share/gettext is a link
> > causing an error with rsync.
> [--SNIP--]
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > ---
> > This patch is a RFC because I am unsure whether this is the correct fix
> > as I do not have much experience with rsync. But nonetheless I would like
> > to point into the imho right direction for the fix.
> I think the proper approach is to fix either package so that they
> provide dentries of the same type.

Now that I thought about it a bit more, I wonder if in fact, we would
not be better adding a post-install hook to host-gettext-tiny, so that:

  - it does not create a symlink
  - renames the 'gettext-tiny' directory to jsut 'gettext'

That way, we're back to a more clasic situation, as we'd have with the
full-blown gettext.

And the symlink is already our doing, anyway, so probably something
along those lines:

    diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
    index c297cb1fe5..473c58a94f 100644
    --- a/package/gettext-tiny/gettext-tiny.mk
    +++ b/package/gettext-tiny/gettext-tiny.mk
    @@ -52,6 +52,7 @@ define HOST_GETTEXT_TINY_BUILD_CMDS
     	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
     		$(HOST_CONFIGURE_OPTS) \
     		prefix=$(HOST_DIR) \
    +		datadir=$(HOST_DIR)/usr/share/gettext \
     		CFLAGS="$(HOST_CFLAGS) -fPIC" \
     		LIBINTL=NONE
     
    @@ -70,8 +71,8 @@ define HOST_GETTEXT_TINY_BUILD_CMDS
     endef
     
     define HOST_GETTEXT_TINY_INSTALL_CMDS
    -	$(Q)mkdir -p $(HOST_DIR)/share/gettext-tiny/po
    -	$(Q)mkdir -p $(HOST_DIR)/share/gettext-tiny/m4
    +	$(Q)mkdir -p $(HOST_DIR)/share/gettext/po
    +	$(Q)mkdir -p $(HOST_DIR)/share/gettext/m4
     
     	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
     		$(HOST_CONFIGURE_OPTS) \
    @@ -81,21 +82,21 @@ define HOST_GETTEXT_TINY_INSTALL_CMDS
     	$(SED) '/read dummy/d' $(@D)/gettextize
     
     	$(INSTALL) -m 0755 -D $(@D)/gettextize $(HOST_DIR)/bin/gettextize
    -	$(INSTALL) -m 0644 -D $(@D)/build-aux/config.rpath $(HOST_DIR)/share/gettext-tiny/config.rpath
    -	$(INSTALL) -m 0644 -D $(@D)/extra/Makefile.in.in $(HOST_DIR)/share/gettext-tiny/po/Makefile.in.in
    -	$(INSTALL) -m 0644 -D $(@D)/extra/boldquot.sed $(HOST_DIR)/share/gettext-tiny/po/boldquot.sed
    -	$(INSTALL) -m 0644 -D $(@D)/extra/en at boldquot.header $(HOST_DIR)/share/gettext-tiny/po/en at boldquot.header
    -	$(INSTALL) -m 0644 -D $(@D)/extra/en at quot.header $(HOST_DIR)/share/gettext-tiny/po/en at quot.header
    -	$(INSTALL) -m 0644 -D $(@D)/extra/insert-header.sin $(HOST_DIR)/share/gettext-tiny/po/insert-header.sin
    -	$(INSTALL) -m 0644 -D $(@D)/extra/quot.sed $(HOST_DIR)/share/gettext-tiny/po/quot.sed
    -	$(INSTALL) -m 0644 -D $(@D)/extra/remove-potcdate.sin $(HOST_DIR)/share/gettext-tiny/po/remove-potcdate.sin
    -	$(INSTALL) -m 0644 -D $(@D)/extra/Rules-quot $(HOST_DIR)/share/gettext-tiny/po/Rules-quot
    -	$(INSTALL) -m 0644 -D $(@D)/extra/Makevars.template $(HOST_DIR)/share/gettext-tiny/po/Makevars.template
    +	$(INSTALL) -m 0644 -D $(@D)/build-aux/config.rpath $(HOST_DIR)/share/gettext/config.rpath
    +	$(INSTALL) -m 0644 -D $(@D)/extra/Makefile.in.in $(HOST_DIR)/share/gettext/po/Makefile.in.in
    +	$(INSTALL) -m 0644 -D $(@D)/extra/boldquot.sed $(HOST_DIR)/share/gettext/po/boldquot.sed
    +	$(INSTALL) -m 0644 -D $(@D)/extra/en at boldquot.header $(HOST_DIR)/share/gettext/po/en at boldquot.header
    +	$(INSTALL) -m 0644 -D $(@D)/extra/en at quot.header $(HOST_DIR)/share/gettext/po/en at quot.header
    +	$(INSTALL) -m 0644 -D $(@D)/extra/insert-header.sin $(HOST_DIR)/share/gettext/po/insert-header.sin
    +	$(INSTALL) -m 0644 -D $(@D)/extra/quot.sed $(HOST_DIR)/share/gettext/po/quot.sed
    +	$(INSTALL) -m 0644 -D $(@D)/extra/remove-potcdate.sin $(HOST_DIR)/share/gettext/po/remove-potcdate.sin
    +	$(INSTALL) -m 0644 -D $(@D)/extra/Rules-quot $(HOST_DIR)/share/gettext/po/Rules-quot
    +	$(INSTALL) -m 0644 -D $(@D)/extra/Makevars.template $(HOST_DIR)/share/gettext/po/Makevars.template
     
     	$(Q)touch $(HOST_DIR)/share/gettext-tiny/ABOUT-NLS
     
    -	# for gettextize
    -	ln -sf $(HOST_DIR)/usr/share/gettext-tiny $(HOST_DIR)/usr/share/gettext
    +	# for legacy
    +	ln -sf gettext-tiny $(HOST_DIR)/usr/share/gettext-tiny
     endef
     
     # Install simple echo wrapper for gettext tool

Disclaimer: totally untested, as usual! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
