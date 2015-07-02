From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 12:00:02 +0200
Subject: [Buildroot] [PATCH 2/2] xen: new package
In-Reply-To: <20150702094308.GK2266@lukather>
References: <1435241096-23969-1-git-send-email-maxime.ripard@free-electrons.com>
 <1435241096-23969-2-git-send-email-maxime.ripard@free-electrons.com>
 <20150629121202.23c1ebae@free-electrons.com>
 <20150702094308.GK2266@lukather>
Message-ID: <20150702120002.60c92692@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Jul 2015 11:43:08 +0200, Maxime Ripard wrote:

> > > +	select BR2_PACKAGE_DTC
> > > +	select BR2_PACKAGE_LIBAIO
> > > +	select BR2_PACKAGE_LIBGLIB2
> > > +	select BR2_PACKAGE_NCURSES
> > > +	select BR2_PACKAGE_OPENSSL
> > > +	select BR2_PACKAGE_PIXMAN
> > > +	select BR2_PACKAGE_UTIL_LINUX
> > > +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> > > +	select BR2_PACKAGE_YAJL
> > 
> > Are all these dependencies needed when you don't install the Xen tools?
> 
> Probably not, the hypervisor is completely standalone, so I don't
> think it would require any of these.

Ok, so all those select can be moved to the "tools" option, then.

Also, and maybe this is something Ian could clarify: do we really need
pixman or ncurses when you just want to start text-only Xen VMs ?

> BTW, I just found out that I left something out of this patch. The
> initscripts are using some bashism that don't work with busybox'
> ash. What's the way Buildroot deal with this usually? Add a dependency
> on bash?

We generally prefer to have the scripts fixed so that they don't use
bashisms. If that's not doable, then selecting bash is a possibility
(but don't add it to XEN_DEPENDENCIES, since it's a runtime dependency
only). Of course, make sure the scripts use bash explicitly in their
shebang, because you're not guaranteed that bash will be the default
shell.

> > Also, if neither the hypervisor nor the tools are enabled, what gets
> > built? Nothing? If so, maybe you want:
> > 
> > 	select BR2_PACKAGE_XEN_HYPERVISOR if !BR2_PACKAGE_XEN_TOOLS
> > 
> > in the top-level option.
> 
> I think it would make more sense to have the tools built by default,
> which would reverse the select statement I guess?

Correct.


> > Missing LICENSE + LICENSE_FILES.
> 
> Ah, right.
> 
> It uses the GPL as its license, with some 2c and 3c BSD
> exceptions. How is that usually dealt with ?
> 
> Using 
> LICENSE = GPLv2 with exceptions
> 
> Or making an exhaustive list of the licenses used?

GPLv2 with expections means "the license is the text of the GPLv2 to
which some additional clauses/wording has been added". Which is not
really what you have IIUC.

Maybe:

LICENSE = GPLv2, BSD-2c, BSD-3c

or better (if doable):

LICENSE = GPLv2 (this), BSD-2c (that), BSD-3c (this other thing)

> > > +	CROSS_COMPILE=$(TARGET_CROSS) \
> > > +	CXXFLAGS="$(TARGET_CXXFLAGS) -D_FILE_OFFSET_BITS=64" \
> > > +	CFLAGS="$(TARGET_CFLAGS) -D_FILE_OFFSET_BITS=64" \
> > 
> > Why do you pass -D_FILE_OFFSET_BITS=64 ? It is already in
> > TARGET_CFLAGS / TARGET_CXXFLAGS.
> 
> It was required during the make invocation, while Buildroot only
> passes it during the configure.

Alright. Xen's build system could use some improvement, but I guess
that outside of the scope of Buildroot packaging :-)

> > > +	PKG_CONFIG=$(PKG_CONFIG_HOST_BINARY)
> > > +
> > > +XEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)
> > 
> > This seems weird, you're losing the "install" target.
> 
> It's actually on purpose. Xen has a specific install target for the
> tools (install-target), that is added a bit later when compiling the
> tools.

Then why not do it just in one go, since you're using install-tools
only?

Like:

XEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-tools

Or maybe it's because you don't want "make install" to be called when
only the hypervisor is enabled. In this case, just do
XEN_INSTALL_TARGET = NO.

ifeq ($(...hypervisor...),y)
XEN_INSTALL_IMAGES = YES
XEN_INSTALL_TARGET = NO
...
else ifeq ($(...tools...),y)
XEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-tools
...
endif

> > Ah, so here it comes. So maybe instead you want to do
> > XEN_INSTALL_TARGET = NO by default, and do XEN_INSTALL_TARGET_OPTS =
> > DESTDIR=$(TARGET_DIR) install-tools when BR2_PACKAGE_XEN_TOOLS=y.
> 
> Now I see that I forgot that as well, but the hypervisor can be
> installed in /boot using install-xen.
> 
> Maybe I could just add a new option to ask whether we want to install
> it to /boot, and add install-xen to INSTALL_TARGET_OPTS if relevant.

Right. So you would have to change the above proposal, though :)

> > > +define XEN_RENAME_INIT_SCRIPTS
> > > +	mv $(TARGET_DIR)/etc/init.d/xencommons $(TARGET_DIR)/etc/init.d/S50xencommons
> > > +	mv $(TARGET_DIR)/etc/init.d/xen-watchdog $(TARGET_DIR)/etc/init.d/S50xen-watchdog
> > > +	mv $(TARGET_DIR)/etc/init.d/xendomains $(TARGET_DIR)/etc/init.d/S60xendomains
> > 
> > Don't know if it's better or not:
> > 
> > 	(cd $(TARGET_DIR)/etc/init.d; \
> > 		mv xencommons S50xencommons; \
> > 		mv ... ; \
> > 		mv ...)
> 
> I don't really have a preference. I'll change this if you want.

Maybe your proposal is simpler. You can keep it as is.

> 
> > > +endef
> > > +else
> > > +XEN_CONF_OPTS += --disable-tools
> > > +endif
> > > +
> > > +XEN_POST_INSTALL_TARGET_HOOKS += XEN_RENAME_INIT_SCRIPTS
> > 
> > Should be part of the ifeq BR2_PACKAGE_XEN_TOOLS=y.
> 
> Is it? My understanding was that the macro wouldn't be defined and it
> would call an empty one in such a case?

Correct: it works fine. But we generally prefer to register the hook
only when needed.

> > You need to change:
> > 
> > AC_CHECK_LIB([yajl], [yajl_alloc], [],
> >     [AC_MSG_ERROR([Could not find yajl])])
> > 
> > to:
> > 
> > AC_CHECK_LIB([yajl], [yajl_alloc], [],
> >     [AC_MSG_ERROR([Could not find yajl])], [m])
> 
> Ack.

Note that I haven't tested this change, it was purely based on a quick
reading of Xen's configure.ac.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
