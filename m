From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Jan 2013 21:47:12 +0100
Subject: [Buildroot] [PATCH v2] pkg-infra: add <pkg>_CONFIG_FIXUP to fix
	*-config files
In-Reply-To: <20130110211926.564113ba@skate>
References: <1357847559-31530-1-git-send-email-stefan.froberg@petroprogram.com>
 <1357847559-31530-2-git-send-email-stefan.froberg@petroprogram.com>
 <20130110211926.564113ba@skate>
Message-ID: <201301102147.12993.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On Thursday 10 January 2013 Thomas Petazzoni wrote:
> On Thu, 10 Jan 2013 21:52:39 +0200, Stefan Fr?berg wrote:
> > For example:
> > 
> > DIVINE_CONFIG_FIXUP = divine-config
> > 
> > or for multiple files:
> > 
> > IMAGEMAGICK_CONFIG_FIXUP = Magick-config Wand-config
> 
> I personally still believe that it is wrong to give just the filename
> here and not the full path, i.e:
> 
> IMAGEMAGICK_CONFIG_FIXUP = \
> 	$(STAGING_DIR)/usr/bin/Magick-config \
> 	$(SATGING_DIR)/usr/bin/Wand-config
> 
> With just the filename, my impression is that it is just too much magic
> happening behind the scene.

Agreed. But I'd leave away the $(STAGING_DIR), and give full paths relative
to the staging dir:

IMAGEMAGICK_CONFIG_FIXUP = \
	/usr/bin/Magick-config \
	/usr/bin/Wand-config

And the infrastructure automatically adds it, instead of adding
$(STAGING_DIR)/usr/bin as it does in this patch.

Also, I find the _FIXUP suffix to be misleading. 'fixup' conveys the
meaning that the flaws are fixed, so I'd naturally expect that the
*-config scripts are fixed, while this implementation removes them.
With _FIXUP, the developper may incorrectly conclude that some sed/awk/..
magic is done on these scripts.

I'd suggest FOO_CONFIG_SCRIPTS which is neutral, and does not say what
is done with these scripts, so reading the documentation is mandatory to
understand what is done.

But, as Thomas, I don't have a strong opinion either. The current situation
is OK, if not the "best in my eyes". ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
