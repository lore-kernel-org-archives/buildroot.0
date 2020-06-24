From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 10:05:02 +0200
Subject: [Buildroot] [PATCH v2] package/irrlicht: fix libraries linking
In-Reply-To: <6a29bbc7-1399-16aa-2e7b-4945f217a9b5@grinn-global.com>
References: <20200622184515.312030-1-b.bilas@grinn-global.com>
 <20200622212642.1be946f3@windsurf.home>
 <46d65bc1-310b-c21a-22e7-11df0ef164b7@grinn-global.com>
 <20200622223626.78bc07e1@windsurf.home>
 <6a29bbc7-1399-16aa-2e7b-4945f217a9b5@grinn-global.com>
Message-ID: <20200624100502.0f899606@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 23 Jun 2020 20:08:47 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> >> Due to the fact that it points to the host system libraries. This -L
> >> argument is set correctly within package makefile.  
> > Yes, of course. My question is why do you have two patches? They touch
> > exactly the same line, simply do the change in two steps instead of
> > one. Am I missing something here ?  
> Ah, I didn't want to combine everything into one patch because there 
> were 2 different changes (adding keyword and removing paths) but I'm 
> gonna combine it into one patch then.

OK, it's true you can see it as: one allows to override the LDFLAGS,
the other drops a bogus hardcoded path.


> >>> IRRLICHT_CONF_OPTS += CPPFLAGS="$(IRRLICHT_CPPFLAGS)"  
> >> Good hint, I was thinking about a bit different approach but it wasn't
> >> working as I expected therefore I did it as it's above.  
> > So I guess you'll rework accordingly? If needed, you can also have a
> > preparation patch that reworks this IRRLICHT_CPPFLAGS thing for the
> > NEON stuff, and then another patch that fixes the library linking issue.
> >
> > Thomas  
> 
> It turned out that -I$(STAGING_DIR)/usr/include isn't necessary anymore 
> so I've decided not to touch that.

-I$(STAGING_DIR)/usr/include is definitely useless as it's the default
search path for headers for the Buildroot cross-compiler, but that's
not what you were adding: you were adding
-I$(STAGING_DIR)/usr/include/X11R6, which is not in the default search
path for headers.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
