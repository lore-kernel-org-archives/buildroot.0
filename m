From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 13 Jul 2011 21:11:18 +0200
Subject: [Buildroot] [PATCH 3/3] gvfs: fix installation of gsettings
 schemas
In-Reply-To: <20110713191135.25b4454b@skate>
References: <1310576089-9207-1-git-send-email-s.neumann@raumfeld.com>
 <1310576089-9207-3-git-send-email-s.neumann@raumfeld.com>
 <20110713191135.25b4454b@skate>
Message-ID: <1310584278.11691.10.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2011-07-13 at 19:11 +0200, Thomas Petazzoni wrote:
> Le Wed, 13 Jul 2011 18:54:49 +0200,
> Sven Neumann <s.neumann@raumfeld.com> a ?crit :
> 
> > -GVFS_POST_INSTALL_TARGET_HOOKS += GVFS_REMOVE_USELESS_BINARY
> > +define GVFS_REMOVE_TARGET_SCHEMAS
> > +	rm $(TARGET_DIR)/usr/share/glib-2.0/schemas/*.xml
> > +endef
> > +
> > +define GVFS_COMPILE_SCHEMAS
> > +	$(HOST_DIR)/usr/bin/glib-compile-schemas --targetdir=$(TARGET_DIR)/usr/share/glib-2.0/schemas $(STAGING_DIR)/usr/share/glib-2.0/schemas
> > +endef
> > +
> > +GVFS_POST_INSTALL_TARGET_HOOKS += \
> > +	GVFS_REMOVE_USELESS_BINARY	\
> > +	GVFS_REMOVE_TARGET_SCHEMAS	\
> > +	GVFS_COMPILE_SCHEMAS
> 
> I have no idea what those schemas are, but why do you remove them in
> GVFS_REMOVE_TARGET_SCHEMAS to generate them again in
> GVFS_COMPILE_SCHEMAS ?

The schemas are XML files, usually installed
in /usr/share/glib-2.0/schemas. In that directory there's also a
pre-compiled summary of all schemas, called gschemas.compiled. And this
file is what is actually used at run-time. So each package that provides
such schemas is supposed to add their XML files
to /usr/share/glib-2.0/schemas and then run glib-compile-schemas to
update gschemas.compiled.

The solution I went with is to install the schemas in staging-dir and to
use these as the source for the schema compilation. The compiled form is
then put into the target-dir.


Sven
