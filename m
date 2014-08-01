From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Aug 2014 08:29:00 +0200
Subject: [Buildroot] [PATCH v3 1/3] libgtk3: new package
In-Reply-To: <53DAEE2E.9060907@gmail.com>
References: <1406565218-12653-1-git-send-email-hadrien.boutteville@gmail.com>
 <1406565218-12653-2-git-send-email-hadrien.boutteville@gmail.com>
 <20140728202729.0c16d3fe@free-electrons.com>
 <53DAEE2E.9060907@gmail.com>
Message-ID: <20140801082900.5df86078@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hadrien Boutteville,

On Fri, 01 Aug 2014 03:32:30 +0200, Hadrien Boutteville wrote:

> > So, you should replace that with:
> > 
> > HOST_LIBGTK3_FLAGS = \
> > 	$(shell $(HOST_CONFIGURE_OPTS) $(PKG_CONFIG_HOST_BINARY) --cflags --libs gdk-pixbuf-2.0)
> > 
> > Note the rename from CFLAGS to just FLAGS, because it will contain both
> > the --cflags and --libs flags.
> 
> OK, I fixed this with your solution but I still need to use CFLAGS
> instead of FLAGS otherwise I have this error:
> 
>  updateiconcache.c:38:18: fatal error: glib.h: No such file or directory

Well of course if you change to HOST_LIBGTK3_FLAGS, you also need to
change it...

> 
> >> +define HOST_LIBGTK3_CONFIGURE_CMDS
> >> +	echo "#define GETTEXT_PACKAGE \"gtk30\"" >> $(@D)/gtk/config.h
> >> +	echo "#define HAVE_UNISTD_H 1" >> $(@D)/gtk/config.h
> >> +	echo "#define HAVE_FTW_H 1" >> $(@D)/gtk/config.h
> >> +endef
> >> +
> >> +define HOST_LIBGTK3_BUILD_CMDS
> >> +	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
> >> +		$(@D)/gtk/updateiconcache.c \
> >> +		$(HOST_LIBGTK3_CFLAGS) \


... here.

> >> +		-o $(@D)/gtk/gtk-update-icon-cache
> >> +endef
> >> +
> >> +define HOST_LIBGTK3_INSTALL_CMDS
> >> +	cp $(@D)/gtk/gtk-update-icon-cache $(HOST_DIR)/usr/bin
> > 
> > 	$(INSTALL) -D -m 0755 $(@D)/gtk/gtk-update-icon-cache $(HOST_DIR)/usr/bin/gtk-update-icon-cache

But anyway, that's fine. I'll see at applying your v4.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
