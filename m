From: Julian Lunz <git@jlunz.de>
Date: Wed, 30 May 2012 19:53:34 +0200
Subject: [Buildroot] [PATCH] New package: freerdp
In-Reply-To: <4FC51F9D.6000503@mind.be>
References: <1337809509-29526-1-git-send-email-git@jlunz.de>
 <4FC51F9D.6000503@mind.be>
Message-ID: <20120530195334.06a0bad1@jl-desk-LL>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

thanks for your input!


On Tue, 29 May 2012 21:12:29 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> On 05/23/12 23:45, Julian Lunz wrote:
> [snip]
> > +if BR2_PACKAGE_FREERDP
> > +
> > +config BR2_PACKAGE_FREERDP_WITHCUPS
> > +    bool "CUPS support"
>   You need to add 'select BR2_PACKAGE_CUPS'.
Yep, missing for the others as well.

> 
>   But in fact, in this case I think it could be turned around:
> compile with cups support if BR2_PACKAGE_CUPS is selected.  I.e.,
> remove these config options and in the .mk file:
> [snip]
> > +ifeq ($(BR2_PACKAGE_FREERDP_WITHCUPS),y)
>   replace with
> ifeq ($(BR2_PACKAGE_CUPS),y)
> 
True, but I tend to have it stated more explicitly that these options
could but mustn't be used.
So it is more a question of how would I buildroot like to behave.
A lot of other packages use the mechanism you describe, so what about
merging both like that:

(make "logical or")

ifneq (,$(filter y, $(BR2_PACKAGE_CUPS) \
$(BR2_PACKAGE_FREERDP_WITHCUPS)))
...
endif

> 
>   On the other hand, for some of these (particularly alsa and
> Xinerama) it's probably more user-friendly to have a config option
> like you have now.
> 
> > +FREERDP_CONF_OPT += -DWITH_CUPS=ON
> > +FREERDP_DEPENDENCIES += cups
> > +else
> > +FREERDP_CONF_OPT += -DWITH_CUPS=OFF
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_FREERDP_WITHFFMPEG),y)
> > +FREERDP_CONF_OPT += -DWITH_FFMPEG=ON
> > +FREERDP_DEPENDENCIES += ffmpeg
> > +else
> > +FREERDP_CONF_OPT += -DWITH_FFMPEG=OFF
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_FREERDP_WITHALSA),y)
> > +FREERDP_CONF_OPT += -DWITH_ALSA=ON
> > +FREERDP_DEPENDENCIES += alsa-utils
>   Shouldn't this be alsa-lib, rather than alsa-utils?
Indeed, alsa-lib here.
> 
> [snip]
> 
> 
>   Regards,
>   Arnout
> 

Best regards,
Julian
