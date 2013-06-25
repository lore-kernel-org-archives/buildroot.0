From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jun 2013 21:20:43 +0200
Subject: [Buildroot] Some issues found while trying to add JimTcl to
 buildroot
In-Reply-To: <CALF0-+V5oWQ_zo6pzs8WOEj02H2Q9W7rzBvioabK0u_nuAaXDg@mail.gmail.com>
References: <CALF0-+V5oWQ_zo6pzs8WOEj02H2Q9W7rzBvioabK0u_nuAaXDg@mail.gmail.com>
Message-ID: <20130625212043.3d224da3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Tue, 25 Jun 2013 15:23:56 -0300, Ezequiel Garcia wrote:

> I'm working on adding JimTcl [1] to Buildroot. The first issue you
> found is that Jim Tcl uses autosetup [2]
> instead of autotools. So my first approach is creating a
> "generic-package" jimtcl.mk.

Gustavo already pointed you on IRC to
http://repo.or.cz/w/buildroot-gz.git/commitdiff/651525c5c4f66c0f8fbc3ac518632c514bee4866.
Any reason not to use it? This patch is also in our patchwork at
http://patchwork.ozlabs.org/patch/181627/.


> Knowing it's ugly, I'd like to ask what's the 'nice' way of doing it:
> 
> #############################################################
> #
> # Jim Tcl 0.73
> #
> #############################################################
> 
> JIMTCL_VERSION = 0.73
> JIMTCL_SITE = git://repo.or.cz/jimtcl.git
> JIMTCL_SITE_METHOD = git
> 
> JIMTCL_INSTALL_STAGING = YES
> 
> define JIMTCL_CONFIGURE_CMDS
> 	(cd $(@D); PATH=$(PATH):/home/foo/buildroot/buildroot/output/host/usr/bin \
> 		./configure --host=$(GNU_TARGET_NAME) --prefix=$(STAGING_DIR))

prefix of STAGING_DIR is most likely wrong. It should be /usr in most
cases.

> endef
> 
> define JIMTCL_BUILD_CMDS
> 	PATH=$(PATH):/home/foo/buildroot/buildroot/output/host/usr/bin \
> 		$(MAKE) -C $(@D)
> endef
> 
> define JIMTCL_INSTALL_STAGING_CMDS
> 	PATH=$(PATH):/home/foo/buildroot/buildroot/output/host/usr/bin \
> 		$(MAKE) -C $(@D) install
> endef

	$(TARGET_MAKE_ENV) $(MAKE) ...

TARGET_MAKE_ENV already sets a PATH variable that has the toolchain
directory in it. See package/Makefile.in for the definition of
TARGET_MAKE_ENV.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
