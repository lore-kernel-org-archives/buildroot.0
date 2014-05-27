From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 May 2014 14:38:20 +0200
Subject: [Buildroot] [PATCH v3] mongoose: provide libmongoose.a static
	library
In-Reply-To: <1401183103-16716-1-git-send-email-d.viti@infosolution.it>
 (Davide Viti's message of "Tue, 27 May 2014 11:31:43 +0200")
References: <1401183103-16716-1-git-send-email-d.viti@infosolution.it>
Message-ID: <87a9a3e6rn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Davide" == Davide Viti <zinosat@tiscali.it> writes:

 > The package provides a webserver and, eventually, a library: this is
 > what Centos, among other distros, is doing.

 > Signed-off-by: Davide Viti <d.viti@infosolution.it>
 > ---
 >      - unconditionally create static rather than shared library (Peter
 >        Korsgaard)
 >      - honour $(MONGOOSE_CFLAGS) when building mongoose.c (Peter Korsgaard)
 >      - don't exceed 80 columns in mongoose.mk
 >      - install libmongoose.a as 644 rather than 755
 >      - update github URL in Config.in

 >  package/mongoose/Config.in   |  2 +-
 >  package/mongoose/mongoose.mk | 13 +++++++++++--
 >  2 files changed, 12 insertions(+), 3 deletions(-)

 > diff --git a/package/mongoose/Config.in b/package/mongoose/Config.in
 > index 2526112..8060942 100644
 > --- a/package/mongoose/Config.in
 > +++ b/package/mongoose/Config.in
 > @@ -6,7 +6,7 @@ config BR2_PACKAGE_MONGOOSE
 >  	help
 >  	  Mongoose is a small and easy to use web server
 
 > -	  https://github.com/valenok/mongoose
 > +	  https://github.com/cesanta/mongoose
 
 >  comment "mongoose needs a toolchain w/ threads, largefile"
 >  	depends on BR2_USE_MMU
 > diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
 > index 75a4d3f..bb1bed3 100644
 > --- a/package/mongoose/mongoose.mk
 > +++ b/package/mongoose/mongoose.mk
 > @@ -8,6 +8,7 @@ MONGOOSE_VERSION = 5.3
 >  MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 >  MONGOOSE_LICENSE = GPLv2
 >  MONGOOSE_LICENSE_FILES = LICENSE
 > +MONGOOSE_INSTALL_STAGING = YES
 
 >  MONGOOSE_CFLAGS = $(TARGET_CFLAGS) $(TARGET_LDFLAGS)
 
 > @@ -20,12 +21,20 @@ endif
 >  define MONGOOSE_BUILD_CMDS
 >  	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)/examples \
 >  		CFLAGS_EXTRA="$(MONGOOSE_CFLAGS)" server
 > +	$(TARGET_CC) -c $(@D)/mongoose.c $(MONGOOSE_CFLAGS) -o $(@D)/mongoose.o
 > +	$(TARGET_AR) rcs $(@D)/libmongoose.a $(@D)/mongoose.o
 >  endef
 
 >  define MONGOOSE_INSTALL_TARGET_CMDS
 > -	$(INSTALL) -D -m 755 $(@D)/examples/server $(TARGET_DIR)/usr/sbin/mongoose
 > +	$(INSTALL) -D -m 755 $(@D)/examples/server \
 > +		$(TARGET_DIR)/usr/sbin/mongoose
 >  	$(INSTALL) -D -m 755 package/mongoose/S85mongoose \
 > -		$(TARGET_DIR)/etc/init.d/S85mongoose
 > +		$(TARGET_DIR)/etc/init.d

This is wrong. install -D creates the needed destination directories,
but you need to specify the destination file name. If the init.d
directory doesn't exist yet, then you end up with an init.d file with
the content of S85mongoose.

 > +endef
 > +
 > +define MONGOOSE_INSTALL_STAGING_CMDS
 > +	$(INSTALL) -D -m 644 $(@D)/libmongoose.a $(STAGING_DIR)/usr/lib
 > +	$(INSTALL) -D -m 644 $(@D)/mongoose.h $(STAGING_DIR)/usr/include

Same comment as for S85mongoose.

Committed with these fixes to next, thanks.

-- 
Bye, Peter Korsgaard
