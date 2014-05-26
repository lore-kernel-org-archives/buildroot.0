From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 May 2014 14:14:47 +0200
Subject: [Buildroot] [PATCH v2 2/2] mongoose: optionally provide shared
	library
In-Reply-To: <1399923087-5550-2-git-send-email-zinosat@tiscali.it> (Davide
 Viti's message of "Mon, 12 May 2014 21:31:27 +0200")
References: <1399923087-5550-1-git-send-email-zinosat@tiscali.it>
 <1399923087-5550-2-git-send-email-zinosat@tiscali.it>
Message-ID: <87oaykhh3c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Davide" == Davide Viti <zinosat@tiscali.it> writes:

Hi,

 > From: Davide Viti <d.viti@infosolution.it>
 > Signed-off-by: Davide Viti <zinosat@tiscali.it>
 > ---
 > Changes v1 -> v2:
 >   - rebase
 >   - add dot at the end of help messages

 > Original patch content:
 > mongoose package can provide a webserver and, optionally, a shared
 > library: this is what Centos, among other distros, is doing.

 > It's now possible to include in the build both the mongoose executable
 > and libmongoose.so

 > Not too sure how should be handled the situation where mongoose is
 > select and neither the webserver nor libmongoose.so are not selected

 > I'd also appreciate some feedback on the shared library compilation
 > flags

Most of this should go above the '---' line so it becomes part of the
commit description.

Why a shared library and not a static one? If upstream doesn't
officially support shared libraries (and versioning of it), then I think
it makes more sense to build a static library instead, especially for
something like this you most likely are not going to use from a lot of
different applications in your rootfs.


 > regards,
 > Davide

 >  package/mongoose/Config.in   |   14 ++++++++++++++
 >  package/mongoose/mongoose.mk |   32 +++++++++++++++++++++++++++++---
 >  2 files changed, 43 insertions(+), 3 deletions(-)

 > diff --git a/package/mongoose/Config.in b/package/mongoose/Config.in
 > index 2526112..2b93ab8 100644
 > --- a/package/mongoose/Config.in
 > +++ b/package/mongoose/Config.in
 > @@ -8,6 +8,20 @@ config BR2_PACKAGE_MONGOOSE
 
 >  	  https://github.com/valenok/mongoose
 
 > +if BR2_PACKAGE_MONGOOSE
 > +
 > +config BR2_PACKAGE_MONGOOSE_INSTALL_WEBSERVER
 > +	bool "Install standalone webserver"
 > +	help
 > +	  Install mongoose webserver.
 > +
 > +config BR2_PACKAGE_MONGOOSE_INSTALL_SHARED_LIBRARY
 > +	bool "Install shared library"
 > +	help
 > +	  Install shared library.
 > +

Are these options really needed? The webserver is tiny and the library
only requires a single .c file to be built, so I think we should just
unconditionally build/install both. If you really want to save the ~50k
from your rootfs you can always remove it in your post build script.


 > +endif
 > +
 >  comment "mongoose needs a toolchain w/ threads, largefile"
 >  	depends on BR2_USE_MMU
 >  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
 > diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
 > index a7164bb..3628c0c 100644
 > --- a/package/mongoose/mongoose.mk
 > +++ b/package/mongoose/mongoose.mk
 > @@ -8,6 +8,7 @@ MONGOOSE_VERSION = 5.3
 >  MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 >  MONGOOSE_LICENSE = GPLv2
 >  MONGOOSE_LICENSE_FILES = LICENSE
 > +MONGOOSE_INSTALL_STAGING = YES
 
 >  MONGOOSE_CFLAGS = $(TARGET_CFLAGS) $(TARGET_LDFLAGS)
 
 > @@ -17,15 +18,40 @@ MONGOOSE_DEPENDENCIES += openssl
 >  MONGOOSE_CFLAGS += -DNS_ENABLE_SSL -lssl -lcrypto -lz
 >  endif
 
 > +ifeq ($(BR2_PACKAGE_MONGOOSE_INSTALL_SHARED_LIBRARY),y)
 > +define MONGOOSE_INSTALL_SHARED_LIBRARY_CMDS
 > +	$(INSTALL) -D -m 755 $(@D)/libmongoose.so $(TARGET_DIR)/usr/lib
 > +endef
 > +
 > +define MONGOOSE_INSTALL_STAGING_SHARED_LIBRARY_CMDS
 > +	$(INSTALL) -D -m 755 $(@D)/libmongoose.so $(STAGING_DIR)/usr/lib
 > +	$(INSTALL) -D -m 644 $(@D)/mongoose.h $(STAGING_DIR)/usr/include
 > +endef
 > +
 > +endif
 > +
 > +ifeq ($(BR2_PACKAGE_MONGOOSE_INSTALL_WEBSERVER),y)
 > +define MONGOOSE_INSTALL_WEBSERVER_CMDS
 > +        $(INSTALL) -D -m 755 $(@D)/mongoose $(TARGET_DIR)/usr/sbin
 > +        $(INSTALL) -D -m 755 package/mongoose/S85mongoose \
 > +		$(TARGET_DIR)/etc/init.d
 > +endef
 > +endif
 > +
 >  define MONGOOSE_BUILD_CMDS
 >  	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)/examples \
 >  		COPT="$(MONGOOSE_CFLAGS)"
 > +	$(TARGET_CC) $(@D)/mongoose.c -shared -fpic \
 > +		-o $(@D)/libmongoose.so -pthread -ldl

It should also use MONGOOSE_CFLAGS to ensure it gets built with openssl
support if present like the example server.

Care to send an opdated patch fixing these issues?

-- 
Bye, Peter Korsgaard
