From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 23:03:13 +0200
Subject: [Buildroot] [PATCHv2 1/1] xterm: x-includes and x-libraries
 must be set for cross-compiling
In-Reply-To: <20150726214700.68302c4a@free-electrons.com>
References: <1437932796-16216-1-git-send-email-bas@bmail.ru>
 <20150726214700.68302c4a@free-electrons.com>
Message-ID: <55B54B11.1090200@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Le 26/07/2015 21:47, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sun, 26 Jul 2015 20:46:36 +0300, kyak wrote:
>> From: Mikhail Peselnik <bas@bmail.ru>
>>
>> These flags need to be set so that the configure script would
>> correctly use libICE from cross-toolchain rather than from host.
>> Also, the xterm package is missing the freetype2 dependency, as
>> noted by Romain Naour.
> 
> So it should be two patches.
> 
> Basically, if your patch does something that isn't summarized in the
> commit title, then probably something wrong is going on.
> 
> So, one patch for x-includes/x-libraries, one patch for the missing
> freetype2 dependency.
> 
> However, I believe Romain was maybe wrong: the freetype dependency
> seems to be optional, according to configure.in. So it should probably
> just be:
> 
> ifeq ($(BR2_PACKAGE_FREETYPE),y)
> XTERM_DEPENDENCIES += freetype
> XTERM_CONF_OPTS += --enable-freetype
> else
> XTERM_CONF_OPTS += --disable-freetype
> endif
> 
> Romain, can you confirm?

I don't know much the xterm package but indeed the freetype support seems
optional. However, it depends on libXft.

So I made this change:

# freetype support needs libXft, so enable it only when
# libxft package is selected.
# Note: freetype is automatically selected by libXft.
ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
XTERM_DEPENDENCIES += freetype xlib_libXft
XTERM_CONF_OPTS += --enable-freetype \
	--with-freetype-cflags="-I$(STAGING_DIR)/usr/include/freetype2" \
	--with-freetype-libs="-L$(STAGING_DIR)/usr/lib"
else
XTERM_CONF_OPTS += --disable-freetype
endif

It doesn't work when freetype-config is used directly with:
--with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config

Mikhail, can you resend an updated version with this change?

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
> 
