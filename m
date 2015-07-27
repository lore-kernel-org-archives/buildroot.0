From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 27 Jul 2015 16:49:02 +0200
Subject: [Buildroot] [PATCHv2 1/1] xterm: x-includes and x-libraries
 must be set for cross-compiling
In-Reply-To: <20150726232515.7e959c25@free-electrons.com>
References: <1437932796-16216-1-git-send-email-bas@bmail.ru>
 <20150726214700.68302c4a@free-electrons.com> <55B54B11.1090200@openwide.fr>
 <20150726232515.7e959c25@free-electrons.com>
Message-ID: <55B644DE.6020705@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 26/07/2015 23:25, Thomas Petazzoni a ?crit :
> Romain,
> 
> On Sun, 26 Jul 2015 23:03:13 +0200, Romain Naour wrote:
> 
>> I don't know much the xterm package but indeed the freetype support seems
>> optional. However, it depends on libXft.
> 
> No, I think it's not the way it works. What xterm calls "freetype" is
> *not* freetype, it's libXft, i.e X Freetype. If you look at the
> definition of CF_X_FREETYPE, it searches for xft, and never for
> freetype.

Thanks for the explanation, I was completely confused between (the real)
freetype and libXft...
Let me (or Mikhail) look again at the issue ;-)

Best regards,
Romain
> 
>> # freetype support needs libXft, so enable it only when
>> # libxft package is selected.
>> # Note: freetype is automatically selected by libXft.
> 
> Don't add this comment.
> 
>> ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
>> XTERM_DEPENDENCIES += freetype xlib_libXft
> 
> Don't add the freetype dependency here.
> 
>> XTERM_CONF_OPTS += --enable-freetype \
>> 	--with-freetype-cflags="-I$(STAGING_DIR)/usr/include/freetype2" \
>> 	--with-freetype-libs="-L$(STAGING_DIR)/usr/lib"
> 
> I think these are wrong. Instead, do:
> 
> 	--with-freetype-config=auto
> 
> It will use pkg-config to find libXft. Of course, make sure
> host-pkgconf is in the dependencies.
> 
>> It doesn't work when freetype-config is used directly with:
>> --with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
> 
> Yes, because it's not looking for freetype, but Xft.
> 
> Best regards,
> 
> Thomas
> 
