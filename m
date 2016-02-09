From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Feb 2016 18:23:36 +0100
Subject: [Buildroot] [PATCH 1/1] Allow imagemagick to find ghostscript
 fonts.
In-Reply-To: <56b96b4422432_3e71e0793c203d6@ultri2.mail>
References: <56b96b4422432_3e71e0793c203d6@ultri2.mail>
Message-ID: <20160209172336.GA3682@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2016-02-09 02:29 -0200, Ricardo Martincoski spake thusly:
> I don't need this patch for my own personal use, but I took a look into it.

Thank you, this is very much appreciated! :-)

> On Tue, 29 Dec 2015 17:45:04 +0100, Thomas Petazzoni wrote:
> > Could you give a specific example use of imagemagick that triggers this
> > problem, so that we can reproduce the problem on our side and
> > investigate the possible solutions?
> 
> Using this config with the master branch:
> BR2_PACKAGE_IMAGEMAGICK=y  
> BR2_PACKAGE_GHOSTSCRIPT_FONTS=y
> BR2_PACKAGE_FREETYPE=y
> The problem can be triggered by converting any text file to ps
> $ cd /tmp ; echo -e 'text 1\ntext 2' > file.txt ; convert file.txt file.ps

Aha, so that is the root of the problem. Thanks for the explanations.

[--SNIP--]
> The wrong path is the default for debian-based distros
> /usr/share/fonts/type1/gsfonts/ # debian non-x11, default for imagemagick
> /usr/share/fonts/X11/Type1/     # debian x11
> 
> An alternative solution would be to have the fonts installed to this location
> +++ b/package/ghostscript-fonts/ghostscript-fonts.mk
> @@@ -13,1 -13,1 +13,1 @@@ GHOSTSCRIPT_FONTS_LICENSE_FILES = COPYI
> --GHOSTSCRIPT_FONTS_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/gs
> ++GHOSTSCRIPT_FONTS_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/type1/gsfonts
> 
> I don't see from
> grep -w '\(gs\|ghostscript-fonts\|GHOSTSCRIPT_FONTS_\)' -R package/
> any explicit use of this path nor hard dependency.
> But changing it can potentially break packages (in runtime!) if them expect
> the fonts to be installed in the current location.

And why not symlink the former to the latter?

> Does anyone know an example of package that would break?
> 
> >> >> Magick: unable to read font `(null)' @ error/annotate.c/RenderFreetype/1153
> >> >> They are non-fatal but could get annoying fast if you are using 'convert'
> 
> The error is non-fatal in a batch conversion.
> But each error means a file failed to be converted.
> The output is not generated for the failed file.

This is a sad decision not to fail in that case... :-(

> >> >> on a lot of files.
> >> >>
> >> >> Signed-off-by: Robert Sohn <grepper@gmail.com>
> >> >> ---
> >> >>  package/imagemagick/imagemagick.mk | 3 ++-
> >> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >> >>
> >> >> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> >> >> index 298d0a8..1abb2a8 100644
> >> >> --- a/package/imagemagick/imagemagick.mk
> >> >> +++ b/package/imagemagick/imagemagick.mk
> >> >> @@ -33,7 +33,8 @@ IMAGEMAGICK_CONF_OPTS = \
> >> >>  	--without-dps \
> >> >>  	--without-gslib \
> >> >>  	--without-fpx \
> >> >> -	--without-x
> >> >> +	--without-x \
> >> >> +	--with-gs-font-dir=/usr/share/fonts/gs
> 
> Configuring unconditionally does not seem so bad in this case, IMO.
> The configured path will be added to an XML that will be used at runtime.
> If freetype support is not compiled in or the fonts are not installed,
> /convert/ would fail anyway.

The best would probbly to do something like Thomas suggested:

> >> > ifeq ($(BR2_PACKAGE_GHOSTSCRIPT_FONTS),y)
> >> > IMAGEMAGICK_CONF_OPTS += --with-gs-font-dir=/usr/share/fonts/gs
> >> > endif
> BR2_PACKAGE_FREETYPE is also needed.

    ifeq ($(BR2_PACKAGE_FREETYPE)$(BR2_PACKAGE_GHOSTSCRIPT_FONTS),yy)
    IMAGEMAGICK_CONF_OPTS += --with-gs-font-dir=/usr/share/fonts/gs
    endif

But with the symlink I suggested above, that might not even be
necessary, would it?

> >> > Or maybe we should use $(GHOSTSCRIPT_FONTS_TARGET_DIR) here, instead of 
> >> > duplicating it?
> 
> It seems good practice to me.
> But we can't use GHOSTSCRIPT_FONTS_TARGET_DIR as is, it is prefixed with
> TARGET_DIR. We could create an auxiliary symbol

Then what about:

    package/ghostscript-fonts/ghostscript-fonts.mk;
        GHOSTSCRIPT_FONTS_DIR = /usr/share/fonts/gs
        GHOSTSCRIPT_FONTS_TARGET_DIR = $(TARGET_DIR)/$(GHOSTSCRIPT_FONTS_DIR)

    package/imagemagick/imagemagick.mk:
        ifeq ($(BR2_PACKAGE_FREETYPE)$(BR2_PACKAGE_GHOSTSCRIPT_FONTS),yy)
        IMAGEMAGICK_CONF_OPTS += --with-gs-font-dir=$(GHOSTSCRIPT_FONTS_DIR)
        endif

> >> Hm, the problem is that the issue will remain if ghostscript-fonts are
> >> not installed. I don't know the solution to that.
> >
> >The usual way to set a dependency package is to add a 'select' statement for 
> >that package in Config.in. In this case ghostscript-fonts is not a hard 
> >dependency, because imagemagick is quite functional without it, and its size 
> >is non negligible. Maybe adding a comment to the help text in Config.in would 
> >suffice.
> >
> >What do others think?
> 
> Adding a comment to the Config.in sounds reasonable to me.
> One would need both BR2_PACKAGE_FREETYPE as optional build dependency and
> BR2_PACKAGE_GHOSTSCRIPT_FONTS as optional runtime dependency to get the
> conversion txt -> ps to work.

Well, since it is an *optional* and *runtime* dependency, then there is
rally nothing to do, neither in the Config.in nor in the .mk.

However, if we want to be a little bit user-friendly, we could add a
Config.in opiton in ImageMagick, like:

    config BR2_PACKAGE_IMAGEMAGICK_TXT_PS
        bool "support txt->ps conversion"
        select BR2_PACKAGE_FREETYPE # runtime
        select BR2_PACKAGE_GHOSTSCRIPT_FONTS # runtime

(with the appropriate "depends on" to propagate freetype's and
ghostscript-fonts' own dependencies...

Anyway, thanks a lot Ricardo for the thorough and detailed explanations.
It was really useful. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
