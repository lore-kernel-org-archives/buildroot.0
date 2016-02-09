From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 09 Feb 2016 16:16:57 -0200
Subject: [Buildroot] [PATCH 1/1] Allow imagemagick to find ghostscript
 fonts.
References: <20160209172336.GA3682@free.fr>
Message-ID: <56ba2d195b10_34eb16c180c2959d@ultri2.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann E. MORIN, All,

I tried to reply to 2 mails at once. Sorry I created some confusion.

On Tue, Feb 09, 2016 at 03:23 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> On 2016-02-09 02:29 -0200, Ricardo Martincoski spake thusly:
[SNIP]
>> On Tue, 29 Dec 2015 17:45:04 +0100, Thomas Petazzoni wrote:
>> > Could you give a specific example use of imagemagick that triggers this
>> > problem, so that we can reproduce the problem on our side and
>> > investigate the possible solutions?
>> 
>> Using this config with the master branch:
>> BR2_PACKAGE_IMAGEMAGICK=y  
>> BR2_PACKAGE_GHOSTSCRIPT_FONTS=y
>> BR2_PACKAGE_FREETYPE=y
>> The problem can be triggered by converting any text file to ps
>> $ cd /tmp ; echo -e 'text 1\ntext 2' > file.txt ; convert file.txt file.ps
> 
> Aha, so that is the root of the problem. Thanks for the explanations.

---------------------------------------------------------------
--- end of the reply to Thomas and begin of reply to Baruch ---
---------------------------------------------------------------

> 
> [--SNIP--]

[UN-SNIP]
On Tue, Feb 09, 2016 at 03:23 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> On 2016-02-09 02:29 -0200, Ricardo Martincoski spake thusly:
>> On Tue Jun 16 20:01:02 UTC 2015, Baruch Siach wrote:
>> > On Tue, Jun 16, 2015 at 02:27:23PM -0400, grepper wrote:
>> >> On 15/06/15 11:39 PM, Baruch Siach wrote:
>> >> > On Mon, Jun 15, 2015 at 10:12:26PM -0400, grepper wrote:
[/UN-SNIP]

>> The wrong path is the default for debian-based distros
>> /usr/share/fonts/type1/gsfonts/ # debian non-x11, default for imagemagick
>> /usr/share/fonts/X11/Type1/     # debian x11
>> 
>> An alternative solution would be to have the fonts installed to this location
>> +++ b/package/ghostscript-fonts/ghostscript-fonts.mk
>> @@@ -13,1 -13,1 +13,1 @@@ GHOSTSCRIPT_FONTS_LICENSE_FILES = COPYI
>> --GHOSTSCRIPT_FONTS_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/gs
>> ++GHOSTSCRIPT_FONTS_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/type1/gsfonts
>> 
>> I don't see from
>> grep -w '\(gs\|ghostscript-fonts\|GHOSTSCRIPT_FONTS_\)' -R package/
>> any explicit use of this path nor hard dependency.
>> But changing it can potentially break packages (in runtime!) if them expect
>> the fonts to be installed in the current location.
> 
> And why not symlink the former to the latter?

Symlink seems an acceptable solution to me. 

> 
>> Does anyone know an example of package that would break?
>> 
>> >> >> Magick: unable to read font `(null)' @ error/annotate.c/RenderFreetype/1153
>> >> >> They are non-fatal but could get annoying fast if you are using 'convert'
>> 
>> The error is non-fatal in a batch conversion.
>> But each error means a file failed to be converted.
>> The output is not generated for the failed file.
> 
> This is a sad decision not to fail in that case... :-(
> 
>> >> >> on a lot of files.
>> >> >>
>> >> >> Signed-off-by: Robert Sohn <grepper@gmail.com>
>> >> >> ---
>> >> >>  package/imagemagick/imagemagick.mk | 3 ++-
>> >> >>  1 file changed, 2 insertions(+), 1 deletion(-)
>> >> >>
>> >> >> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
>> >> >> index 298d0a8..1abb2a8 100644
>> >> >> --- a/package/imagemagick/imagemagick.mk
>> >> >> +++ b/package/imagemagick/imagemagick.mk
>> >> >> @@ -33,7 +33,8 @@ IMAGEMAGICK_CONF_OPTS = \
>> >> >>  	--without-dps \
>> >> >>  	--without-gslib \
>> >> >>  	--without-fpx \
>> >> >> -	--without-x
>> >> >> +	--without-x \
>> >> >> +	--with-gs-font-dir=/usr/share/fonts/gs
>> 
>> Configuring unconditionally does not seem so bad in this case, IMO.
>> The configured path will be added to an XML that will be used at runtime.
>> If freetype support is not compiled in or the fonts are not installed,
>> /convert/ would fail anyway.
> 
> The best would probbly to do something like Thomas suggested:

Actually it was Baruch who suggested, see my UN-SNIP above

> 
>> >> > ifeq ($(BR2_PACKAGE_GHOSTSCRIPT_FONTS),y)
>> >> > IMAGEMAGICK_CONF_OPTS += --with-gs-font-dir=/usr/share/fonts/gs
>> >> > endif
>> BR2_PACKAGE_FREETYPE is also needed.
> 
>     ifeq ($(BR2_PACKAGE_FREETYPE)$(BR2_PACKAGE_GHOSTSCRIPT_FONTS),yy)
>     IMAGEMAGICK_CONF_OPTS += --with-gs-font-dir=/usr/share/fonts/gs
>     endif
> 
> But with the symlink I suggested above, that might not even be
> necessary, would it?

No. Not necessary.

> 
>> >> > Or maybe we should use $(GHOSTSCRIPT_FONTS_TARGET_DIR) here, instead of 
>> >> > duplicating it?
>> 
>> It seems good practice to me.
>> But we can't use GHOSTSCRIPT_FONTS_TARGET_DIR as is, it is prefixed with
>> TARGET_DIR. We could create an auxiliary symbol
> 
> Then what about:
> 
>     package/ghostscript-fonts/ghostscript-fonts.mk;
>         GHOSTSCRIPT_FONTS_DIR = /usr/share/fonts/gs
>         GHOSTSCRIPT_FONTS_TARGET_DIR = $(TARGET_DIR)/$(GHOSTSCRIPT_FONTS_DIR)
> 
>     package/imagemagick/imagemagick.mk:
>         ifeq ($(BR2_PACKAGE_FREETYPE)$(BR2_PACKAGE_GHOSTSCRIPT_FONTS),yy)
>         IMAGEMAGICK_CONF_OPTS += --with-gs-font-dir=$(GHOSTSCRIPT_FONTS_DIR)
>         endif

I have no strong opinion among the discussed solutions (or any combination):
1) symlink for font dir
2) configure path
3) user-friendly entry on the menu

> 
>> >> Hm, the problem is that the issue will remain if ghostscript-fonts are
>> >> not installed. I don't know the solution to that.
>> >
>> >The usual way to set a dependency package is to add a 'select' statement for 
>> >that package in Config.in. In this case ghostscript-fonts is not a hard 
>> >dependency, because imagemagick is quite functional without it, and its size 
>> >is non negligible. Maybe adding a comment to the help text in Config.in would 
>> >suffice.
>> >
>> >What do others think?
>> 
>> Adding a comment to the Config.in sounds reasonable to me.
>> One would need both BR2_PACKAGE_FREETYPE as optional build dependency and
>> BR2_PACKAGE_GHOSTSCRIPT_FONTS as optional runtime dependency to get the
>> conversion txt -> ps to work.
> 
> Well, since it is an *optional* and *runtime* dependency, then there is
> rally nothing to do, neither in the Config.in nor in the .mk.
> 
> However, if we want to be a little bit user-friendly, we could add a
> Config.in opiton in ImageMagick, like:
> 
>     config BR2_PACKAGE_IMAGEMAGICK_TXT_PS
>         bool "support txt->ps conversion"
>         select BR2_PACKAGE_FREETYPE # runtime

freetype is build time

>         select BR2_PACKAGE_GHOSTSCRIPT_FONTS # runtime
> 
> (with the appropriate "depends on" to propagate freetype's and
> ghostscript-fonts' own dependencies...
> 
> Anyway, thanks a lot Ricardo for the thorough and detailed explanations.
> It was really useful. :-)

You are welcome.

Regards,
Ricardo
