From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Sep 2015 14:13:08 +0200
Subject: [Buildroot] [PATCHv3] system: add options for /bin /sbin and
 /lib to be symlinks into /usr
In-Reply-To: <55EAB410.1070300@mind.be>
References: <1441397852-23461-1-git-send-email-yann.morin.1998@free.fr>
 <55EAB410.1070300@mind.be>
Message-ID: <20150905121308.GA3604@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-09-05 11:21 +0200, Arnout Vandecappelle spake thusly:
> On 04-09-15 22:17, Yann E. MORIN wrote:
> [snip]
> > diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> > index 1aa74b3..a005f45 100644
> > --- a/package/eudev/eudev.mk
> > +++ b/package/eudev/eudev.mk
> > @@ -22,16 +22,18 @@ EUDEV_CONF_ENV += LIBS=-lrt
> >  EUDEV_CONF_OPTS =		\
> >  	--disable-manpages	\
> >  	--sbindir=/sbin		\
> > -	--with-rootlibdir=/lib	\
> >  	--libexecdir=/lib	\
> >  	--with-firmware-path=/lib/firmware	\
> >  	--disable-introspection			\
> > -	--enable-split-usr			\
> >  	--enable-libkmod
> >  
> >  EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
> >  EUDEV_PROVIDES = udev
> >  
> > +ifeq ($(BR2_ROOTFS_MERGED_USR),)
> > +EUDEV_CONF_OPTS += --with-rootlibdir=/lib --enable-split-usr
> > +endif
>  It would be nice if someone could do a runtime test with eudev, both the merged
> and the split case.

I did.

The split-usr case is what we have had until now, and it works (I'm
using it daily with Kodi).

The merged-usr case I build-tested and slightly runtime-tested in the
same conditions (Kodi), and could see no difference in behaviour with
the split-usr case.

It's the systemd case that I did not runtime-test (only build-tested).

> >  ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
> >  EUDEV_CONF_OPTS += --enable-rule_generator
> >  endif
> > diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> [snip]
> >  define SKELETON_INSTALL_TARGET_CMDS
> >  	rsync -a --ignore-times $(SYNC_VCS_EXCLUSIONS) \
> >  		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
> >  		$(SKELETON_PATH)/ $(TARGET_DIR)/
> > -	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
> > -		$(TARGET_DIR_WARNING_FILE)
> > +	$(SKELETON_USR_SYMLINKS_OR_DIRS)
> >  	ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
> > -	mkdir -p $(TARGET_DIR)/usr
>  Huh, where did the mkdir go? Did you remove it because /usr is already in the
> skeleton?

Yes, it's not needed because we indeed already have it in the skeleton.
I should probably have said so in the commit log, indeed.

> >  	ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
> > +	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
> > +		$(TARGET_DIR_WARNING_FILE)
>  And why did you move this one around?

IMHO, it makes more sense to add it last, after the skeleton has been
entirely constructed. Granted, it's mostly eye-candy, still I find it
much nicer to look at this code now than as it was before.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
