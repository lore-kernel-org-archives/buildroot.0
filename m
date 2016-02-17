From: Atul Singh Mandla <atul.singh.mandla@rockwellcollins.com>
Date: Wed, 17 Feb 2016 12:42:51 +0530
Subject: [Buildroot] [PATCH 1/1] font-awesome:new package
In-Reply-To: <20160216220359.6b79146a@free-electrons.com>
References: <1455601427-20322-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
 <20160216220359.6b79146a@free-electrons.com>
Message-ID: <CAKAAa9Tior_B0b7D7+gmN3F_zHkLKOtAibt5y7Uop5Vu=3y8wA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

>  Font Awesome is a full suite of 605 pictographic icons for easy
>  scalable vector graphics on websites.
*Initial space at the beginning of each line is not needed.*
ASM : I did not understand this exactly Since I have followed the usual
convention of a tab and 2 spaces. Could you please elaborate a bit more on
this.

> diff --git a/package/Config.in b/package/Config.in
> index a5b31aa..a2bd46e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -854,6 +854,7 @@ menu "Graphics"
>       source "package/cairomm/Config.in"
>       source "package/exiv2/Config.in"
>       source "package/fltk/Config.in"
> +     source "package/font-awesome/Config.in"
>       source "package/fontconfig/Config.in"
>       source "package/freetype/Config.in"
>       source "package/gd/Config.in"


*This package should rather go in the "Fonts, cursors, icons, sounds
andthemes" menu, sub-menu "Icons".*
ASM: I have added the package in the Fonts submenu under  "Fonts, cursors,
icons, sounds and
themes" menu, sub-menu "Icons".

> diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/
font-awesome.mk
> new file mode 100644
> index 0000000..acaa3d8
> --- /dev/null
> +++ b/package/font-awesome/font-awesome.mk
> @@ -0,0 +1,23 @@
>
+################################################################################
> +#
> +# font-awesome
> +#
>
+################################################################################
> +
> +FONT_AWESOME_VERSION = v4.5.0
> +FONT_AWESOME_SITE = $(call github,FortAwesome,Font
-Awesome,$(FONT_AWESOME_VERSION))
> +FONT_AWESOME_LICENSE = OFLv1.1, MIT


*License would be more precise with:        OFLv1.1 (font), MIT (CSS, LESS
and Sass files)*
ASM: Updated the license information as suggested.

*> +FONT_AWESOME_LICENSE_FILES = css/font-awesome.css*


*This is not a license text, it only repeats that it's under OFLv1.1(font)
and MIT (CSS). So I'd say, just don't specify any LICENSE_FILES.*ASM:
Removed the FONT_AWESOME_LICENSE_FILES variable.


*> +FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss*

*Out of curiosity, can you explain in which situation are the "less"
and"scss" directories useful ?*
ASM: As per my understanding less and scss are used for customization of
font awesome. There may be other reasons too.
source : *https://fortawesome.github.io/Font-Awesome/get-started/
<https://fortawesome.github.io/Font-Awesome/get-started/>*




*> +define FONT_AWESOME_INSTALL_TARGET_CMDS> +     # Install required
directories**Comment is not very useful.*
ASM: Removed the comment.








*> +     for dir in $(FONT_AWESOME_DIRECTORIES_LIST); \> +     do \> +
       $(INSTALL) -d $(TARGET_DIR)/usr/share/font-awesome/$$dir && \> +
         $(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/font-awesome/$$dir
\> +                     $(@D)/$$dir/*.* || exit 1; \*



*We generally use "cp -dpfr" to copy full directories. What about simply:
      mkdir -p $(TARGET_DIR)/usr/share/font-awesome/        $(foreach
d,$(FONT_AWESOME_DIRECTORIES_LIST),\                cp -dpfr $(@D)/$(d)
$(TARGET_DIR)/usr/share/font-awesome$(sep))*
ASM: Updated the file as per your suggestion.


Best Regards,
Atul Singh.

On Wed, Feb 17, 2016 at 2:33 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello Atul,
>
> Thanks for this contribution! Looks mostly good, I have a few comments
> though, see below.
>
> On Tue, 16 Feb 2016 11:13:47 +0530, Atul Singh wrote:
> >  Font Awesome is a full suite of 605 pictographic icons for easy
> >  scalable vector graphics on websites.
>
> Initial space at the beginning of each line is not needed.
>
> > diff --git a/package/Config.in b/package/Config.in
> > index a5b31aa..a2bd46e 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -854,6 +854,7 @@ menu "Graphics"
> >       source "package/cairomm/Config.in"
> >       source "package/exiv2/Config.in"
> >       source "package/fltk/Config.in"
> > +     source "package/font-awesome/Config.in"
> >       source "package/fontconfig/Config.in"
> >       source "package/freetype/Config.in"
> >       source "package/gd/Config.in"
>
> This package should rather go in the "Fonts, cursors, icons, sounds and
> themes" menu, sub-menu "Icons".
>
> > diff --git a/package/font-awesome/font-awesome.mk
> b/package/font-awesome/font-awesome.mk
> > new file mode 100644
> > index 0000000..acaa3d8
> > --- /dev/null
> > +++ b/package/font-awesome/font-awesome.mk
> > @@ -0,0 +1,23 @@
> >
> +################################################################################
> > +#
> > +# font-awesome
> > +#
> >
> +################################################################################
> > +
> > +FONT_AWESOME_VERSION = v4.5.0
> > +FONT_AWESOME_SITE = $(call
> github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
> > +FONT_AWESOME_LICENSE = OFLv1.1, MIT
>
> License would be more precise with:
>
>         OFLv1.1 (font), MIT (CSS, LESS and Sass files)
>
> > +FONT_AWESOME_LICENSE_FILES = css/font-awesome.css
>
> This is not a license text, it only repeats that it's under OFLv1.1
> (font) and MIT (CSS). So I'd say, just don't specify any LICENSE_FILES.
>
> > +FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
>
> Out of curiosity, can you explain in which situation are the "less" and
> "scss" directories useful ?
>
> > +define FONT_AWESOME_INSTALL_TARGET_CMDS
> > +     # Install required directories
>
> Comment is not very useful.
>
> > +     for dir in $(FONT_AWESOME_DIRECTORIES_LIST); \
> > +     do \
> > +             $(INSTALL) -d $(TARGET_DIR)/usr/share/font-awesome/$$dir
> && \
> > +             $(INSTALL) -m 0644 -t
> $(TARGET_DIR)/usr/share/font-awesome/$$dir \
> > +                     $(@D)/$$dir/*.* || exit 1; \
>
> We generally use "cp -dpfr" to copy full directories. What about simply:
>
>         mkdir -p $(TARGET_DIR)/usr/share/font-awesome/
>         $(foreach d,$(FONT_AWESOME_DIRECTORIES_LIST),\
>                 cp -dpfr $(@D)/$(d)
> $(TARGET_DIR)/usr/share/font-awesome$(sep))
>
> Could you take into account those comments, and send an updated version?
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160217/b81603ca/attachment.html>
