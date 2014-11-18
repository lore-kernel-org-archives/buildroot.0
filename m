From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Tue, 18 Nov 2014 14:06:10 -0300
Subject: [Buildroot] [PATCH v3 4/5] package: matchbox-keyboard: use
 install instead of cp
In-Reply-To: <20141117214446.GH12473@free.fr>
References: <1416244750-24256-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416244750-24256-5-git-send-email-guido@vanguardiasur.com.ar>
 <20141117214446.GH12473@free.fr>
Message-ID: <20141118170610.GC20682@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

On Mon, Nov 17, 2014 at 10:44:46PM +0100, Yann E. MORIN wrote:
> Guido, All,
> 
> On 2014-11-17 14:19 -0300, Guido Mart?nez spake thusly:
> > in order to not depend on the previous permissions of the file
> > 
> > Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> > ---
> >  package/matchbox/matchbox-keyboard/matchbox-keyboard.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
> > index ebf23e4..48a50de 100644
> > --- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
> > +++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
> > @@ -15,7 +15,7 @@ MATCHBOX_KEYBOARD_DEPENDENCIES = host-pkgconf matchbox-lib matchbox-fakekey expa
> >  MATCHBOX_KEYBOARD_CONF_ENV = expat=yes
> >  
> >  define MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
> > -	cp -dpf ./package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh $(TARGET_DIR)/usr/bin/
> > +	$(INSTALL) -m 0755 ./package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh $(TARGET_DIR)/usr/bin/
> 
> This should be:
> 
>     $(INSTALL) -D -m 0755 package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh \
>                           $(TARGET_DIR)/usr/bin/mb-applet-kbd-wrapper.sh
> 
> That is:
>   - full path to the destination file. Otherwise, if $(TARGET_DIR)/usr/bin
>     does not exist (in case of a custom skeleton, for example),
>     'install' will create a file named "$(TARGET_DIR)/usr/bin" instead
>     of creating a directory and copying into it;
>   - the leading ./ to the source is not needed.
Actually the trailing slash prevents the file being created as /usr/bin,
but the build would fail anyway. I changed it to your suggestion to be
skeleton-agnostic.

Thanks!

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
