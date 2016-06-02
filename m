From: daggs <daggs@gmx.com>
Date: Thu, 2 Jun 2016 16:39:48 +0200
Subject: [Buildroot] [PATCH v2] libamcodec: New Package
In-Reply-To: <20160602092018.5bda1cf0@free-electrons.com>
References: <20160601211607.31807-1-daggs@gmx.com>
 <20160601233202.4b87a7d1@free-electrons.com>
 <trinity-c4682c6f-5d4c-4b50-a55e-c13bce625378-1464844554036@3capp-mailcom-bs13>,
 <20160602092018.5bda1cf0@free-electrons.com>
Message-ID: <trinity-74a6aaf9-2569-4f66-ad89-8c795d3d1689-1464878388130@3capp-mailcom-bs05>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

> Hello,
> 
> On Thu, 2 Jun 2016 07:15:54 +0200, daggs wrote:
> 
> > > However, this also means that a number of other variables from your
> > > package Makefile will be overridden, such as CFLAGS, CXXFLAGS, LDFLAGS,
> > > etc. This sometimes causes some problems.  
> > seems like I've encountered such an issue,
> > using the format above resulted in missing includes error, e.g. local paths are not part of the flags.
> > what is the proper way to fix it?
> 
> In the package Makefile, whenever there is:
> 
> CFLAGS = foo
> LDFLAGS = foo
> 
> change it to:
> 
> override CFLAGS += foo
> override LDFLAGS += foo
thanks, it worked for amavutils and amadec.

the problem is with amcodec which doesn't seems to respect it.
from what I can understand, the makefile do does this: include $(SRCTREE)/rules.mk
and in rules.mk I see that it does this:  $(MAKE) -C ${1} -f ${SRCTREE}/depends.mk;\
this seems to reverts the CFLAGS and LDFLAGS back to their default.
have you encountered such issue before?

> 
> > > > +	$(INSTALL) -D -m 0755 $(@D)/amavutils/libamavutils.so $(STAGING_DIR)/usr/lib
> > > > +	$(INSTALL) -D -m 0555 $(@D)/amadec/libamadec.so $(STAGING_DIR)/usr/lib
> > > > +	$(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(STAGING_DIR)/usr/lib  
> > > 
> > > Full destination path needed.
> > >   
> > not sure what you mean by Full destination path needed, can you elaborate please?
> 
>    $(STAGING_DIR)/usr/lib/libavmavutils.so
> 
> as opposed to
> 
>    $(STAGING_DIR)/usr/lib
> 
> as you're doing currently.
> 
> If you do:
> 
>    $(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(STAGING_DIR)/usr/lib
> 
> and $(STAGING_DIR)/usr/lib doesn't already exists as a directory, then
> libamcodec.so will be copied as a file named "lib" under
> $(STAGING_DIR)/usr.
> 
> Best regards,
> 
> Thomas
done.
