From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 May 2013 23:03:49 +0200
Subject: [Buildroot] [PATCH] Add package for mongoose web server
In-Reply-To: <1355349796-4165-1-git-send-email-cdhmanning@gmail.com> (Charles
 Manning's message of "Thu, 13 Dec 2012 11:03:16 +1300")
References: <1355349796-4165-1-git-send-email-cdhmanning@gmail.com>
Message-ID: <87hail14cq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Manning <cdhmanning@gmail.com> writes:

 Charles> Signed-off-by: Charles Manning <cdhmanning@gmail.com>
 Charles> ---
 Charles>  package/Config.in                             |    1 +
 Charles>  package/mongoose/Config.in                    |   13 ++++++
 Charles>  package/mongoose/mongoose-3.3-init-file.patch |   44 ++++++++++++++++++++
 Charles>  package/mongoose/mongoose-3.3-no-auth.patch   |   55 +++++++++++++++++++++++++
 Charles>  package/mongoose/mongoose.mk                  |   38 +++++++++++++++++

Hi,

I fixed up a number of issues here (see below) and committed, thanks.

A lot of the issues were also pointed out by Arnout in his review.


 Charles>  5 files changed, 151 insertions(+), 0 deletions(-)
 Charles>  create mode 100644 package/mongoose/Config.in
 Charles>  create mode 100644 package/mongoose/mongoose-3.3-init-file.patch
 Charles>  create mode 100644 package/mongoose/mongoose-3.3-no-auth.patch
 Charles>  create mode 100644 package/mongoose/mongoose.mk

 Charles> diff --git a/package/Config.in b/package/Config.in
 Charles> index 5ba1f05..a3d2590 100644
 Charles> --- a/package/Config.in
 Charles> +++ b/package/Config.in
 Charles> @@ -603,6 +603,7 @@ source "package/linphone/Config.in"
 Charles>  source "package/lrzsz/Config.in"
 Charles>  source "package/macchanger/Config.in"
 Charles>  source "package/mii-diag/Config.in"
 Charles> +source "package/mongoose/Config.in"
 Charles>  source "package/mrouted/Config.in"
 Charles>  source "package/msmtp/Config.in"
 Charles>  source "package/mutt/Config.in"
 Charles> diff --git a/package/mongoose/Config.in b/package/mongoose/Config.in
 Charles> new file mode 100644
 Charles> index 0000000..39806f9
 Charles> --- /dev/null
 Charles> +++ b/package/mongoose/Config.in
 Charles> @@ -0,0 +1,13 @@
 Charles> +config BR2_PACKAGE_MONGOOSE

It needs threads support in toolchain.


 Charles> +	bool "mongoose wen server"

I simply made this "mongoose"

 Charles> +	help
 Charles> +	  Mongoose small web server
 Charles> +
 Charles> +	  https://github.com/valenok/mongoose
 Charles> +
 Charles> +config BR2_PACKAGE_MONGOOSE_NO_PUT_AUTH
 Charles> +	bool "Disable PUT authorization"
 Charles> +	depends on BR2_PACKAGE_MONGOOSE
 Charles> +	default n
 Charles> +	help
 Charles> +	  Sometimes you don't need PUT authorization.

We really don't want to carry feature patches in buildroot, so I've
dropped the patch and this option.

 Charles> diff --git a/package/mongoose/mongoose-3.3-init-file.patch b/package/mongoose/mongoose-3.3-init-file.patch

This should just be a file in package/mongoose, instead of a patch
adding it in the build directory.


 Charles> +++ b/package/mongoose/mongoose.mk
 Charles> @@ -0,0 +1,38 @@
 Charles> +# Package for mongoose web server.
 Charles> +# This has been patched with an extension to allow PUT with no authorization.

I've changed this to use our normal file header.

 Charles> +#
 Charles> +MONGOOSE_VERSION = 3.3
 Charles> +MONGOOSE_SITE = http://github.com/valenok/mongoose/tarball/master

This doesn't seem to download the real 3.3 version, so I've changed it
to the google code download location.


 Charles> +MONGOOSE_LICENSE = MIT
 Charles> +MONGOOSE_LICENSE_FILES = COPYING
 Charles> +MONGOOSE_INSTALL_STAGING = YES
 Charles> +MONGOOSE_INSTALL_TARGET = YES

INSTALL_TARGET defaults to yes, and installing the webserver to staging
doesn't make much sense. I know mongoose can be embedded in
applications, but this is done by copying mongoose.{c,h} into your
project, not by linking to a library.


 Charles> +
 Charles> +MONGOOSE_OPTIONAL_DEFINES = -DNO_SSL
 Charles> +ifeq ($(BR2_PACKAGE_MONGOOSE_NO_PUT_AUTH),y)
 Charles> +MONGOOSE_OPTIONAL_DEFINES += -DNO_PUT_AUTH
 Charles> +endif
 Charles> +
 Charles> +define MONGOOSE_BUILD_CMDS
 Charles> +	$(MAKE) CC="$(TARGET_CC)" LD="$TARGETLD)" -C $(@D) linux COPT="$(MONGOOSE_OPTIONAL_DEFINES)"

It is TARGET_LD, not TARGETLD.

We should also ensure TARGET_CFLAGS and TARGET_LDFLAGS are used, so I've
added those to COPTS (and called the variable MONGOOSE_CFLAGS).

 Charles> +endef
 Charles> +
 Charles> +define MONGOOSE_INSTALL_STAGING_CMDS
 Charles> +	$(INSTALL) -d $(STAGING_DIR)/sbin
 Charles> +	$(INSTALL) -d $(STAGING_DIR)/etc
 Charles> +	$(INSTALL) -d $(STAGING_DIR)/etc/init.d
 Charles> +	$(INSTALL) -D -m 755 $(@D)/mongoose $(STAGING_DIR)/sbin/mongoose
 Charles> +	$(INSTALL) -D -m 755 $(@D)/mongoose.init $(STAGING_DIR)/etc/init.d/mongoose
 Charles> +endef

This can be dropped.

 Charles> +
 Charles> +define MONGOOSE_INSTALL_TARGET_CMDS
 Charles> +	$(INSTALL) -d $(TARGET_DIR)/sbin
 Charles> +	$(INSTALL) -d $(TARGET_DIR)/etc
 Charles> +	$(INSTALL) -d $(TARGET_DIR)/etc/init.d
 Charles> +	$(INSTALL) -D -m 755 $(@D)/mongoose $(TARGET_DIR)/sbin/mongoose
 Charles> +	$(INSTALL) -D -m 755 $(@D)/mongoose.init $(TARGET_DIR)/etc/init.d/mongoose
 Charles> +endef

install -D creates the needed directories, so all the -d lines can be
dropped. As mentioned above, the init script should just be a file in
package/mongoose, and be copied to etc/init.d/SXXmongoose, where XX is a
number. To match E.G. tinyhttpd I've used XX = 85.

 Charles> +
 Charles> +$(eval $(generic-package))
 Charles> +

No empty line after generic-package.

-- 
Bye, Peter Korsgaard
