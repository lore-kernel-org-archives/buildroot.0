From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Tue, 25 Jun 2013 15:23:56 -0300
Subject: [Buildroot] Some issues found while trying to add JimTcl to
	buildroot
Message-ID: <CALF0-+V5oWQ_zo6pzs8WOEj02H2Q9W7rzBvioabK0u_nuAaXDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm working on adding JimTcl [1] to Buildroot. The first issue you
found is that Jim Tcl uses autosetup [2]
instead of autotools. So my first approach is creating a
"generic-package" jimtcl.mk.

Now, the problem is that apparently autosetup is expecting the
toolchain to be available
in the path, so there's no prefix-like parameter. I've done an ugly
workaround (pasted below).
Knowing it's ugly, I'd like to ask what's the 'nice' way of doing it:

#############################################################
#
# Jim Tcl 0.73
#
#############################################################

JIMTCL_VERSION = 0.73
JIMTCL_SITE = git://repo.or.cz/jimtcl.git
JIMTCL_SITE_METHOD = git

JIMTCL_INSTALL_STAGING = YES

define JIMTCL_CONFIGURE_CMDS
	(cd $(@D); PATH=$(PATH):/home/foo/buildroot/buildroot/output/host/usr/bin \
		./configure --host=$(GNU_TARGET_NAME) --prefix=$(STAGING_DIR))
endef

define JIMTCL_BUILD_CMDS
	PATH=$(PATH):/home/foo/buildroot/buildroot/output/host/usr/bin \
		$(MAKE) -C $(@D)
endef

define JIMTCL_INSTALL_STAGING_CMDS
	PATH=$(PATH):/home/foo/buildroot/buildroot/output/host/usr/bin \
		$(MAKE) -C $(@D) install
endef

$(eval $(generic-package))
---

[1] http://jim.tcl.tk/
[2] http://msteveb.github.io/autosetup/

Thanks,
-- 
    Ezequiel
