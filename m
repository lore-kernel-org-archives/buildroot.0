From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Dec 2012 23:42:44 +0100
Subject: [Buildroot] [PATCH] Add package for mongoose web server
In-Reply-To: <1355349796-4165-1-git-send-email-cdhmanning@gmail.com>
References: <1355349796-4165-1-git-send-email-cdhmanning@gmail.com>
Message-ID: <50CA59E4.5090706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Charles,

On 12/12/12 23:03, Charles Manning wrote:
> Signed-off-by: Charles Manning<cdhmanning@gmail.com>
[snip]
> diff --git a/package/mongoose/Config.in b/package/mongoose/Config.in
> new file mode 100644
> index 0000000..39806f9
> --- /dev/null
> +++ b/package/mongoose/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_MONGOOSE
> +	bool "mongoose wen server"

 All other web servers just give their name, so:

	bool "mongoose"

 Missing:
	depends on BR2_TOOLCHAIN_HAS_THREADS
	depends on BR2_USE_WCHAR

> +	help
> +	  Mongoose small web server
> +
> +	  https://github.com/valenok/mongoose
> +
> +config BR2_PACKAGE_MONGOOSE_NO_PUT_AUTH
> +	bool "Disable PUT authorization"
> +	depends on BR2_PACKAGE_MONGOOSE
> +	default n

 default n is redundant because it is the default.

 I prefer package-specific extra options to be wrapped in a if...endif 
instead of using 'depends on'.


> +	help
> +	  Sometimes you don't need PUT authorization.
[snip]
> diff --git a/package/mongoose/mongoose-3.3-no-auth.patch b/package/mongoose/mongoose-3.3-no-auth.patch
> new file mode 100644
> index 0000000..a470f5e
> --- /dev/null
> +++ b/package/mongoose/mongoose-3.3-no-auth.patch
> @@ -0,0 +1,55 @@
> +From db714636f86d79be33ffe8f2408c8731b5969208 Mon Sep 17 00:00:00 2001
> +From: Charles Manning<cdhmanning@gmail.com>
> +Date: Mon, 10 Dec 2012 10:14:20 +1300
> +Subject: [PATCH] Add NO_PUT_AUTH option to allow put with not authorization
> +
> +Sometimes you really don't want the security.
> +
> +Signed-off-by: Charles Manning<cdhmanning@gmail.com>

 Although this is a useful addition, it's really a new feature and not
a cross-compilation fix. We normally don't include new features in buildroot
patches.

 Could you upstream this patch?  Sergey is pretty quick with accepting patches.

[snip]
> diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
> new file mode 100644
> index 0000000..ef06f41
> --- /dev/null
> +++ b/package/mongoose/mongoose.mk
> @@ -0,0 +1,38 @@
> +# Package for mongoose web server.
> +# This has been patched with an extension to allow PUT with no authorization.
> +#

 Although on the last buildroot developer meeting some doubts were voices
about its usefulness, the rule is still that the .mk file should have the
following header:

#############################################################
#
# mongoose
#
#############################################################

> +MONGOOSE_VERSION = 3.3
> +MONGOOSE_SITE = http://github.com/valenok/mongoose/tarball/master
> +MONGOOSE_LICENSE = MIT
> +MONGOOSE_LICENSE_FILES = COPYING
> +MONGOOSE_INSTALL_STAGING = YES

 Why install in staging? You're not installing libraries or headers.

 That said, mongoose is often used as an embedded web server, so it
would be useful to have the option to:

- install the library and include file in staging;
- not install the executable and init script to target.

 But it's OK if you're not ready to do this; in that case, just
remove the INSTALL_STAGING line.

> +MONGOOSE_INSTALL_TARGET = YES

 This is the default.

> +
> +MONGOOSE_OPTIONAL_DEFINES = -DNO_SSL

 Ideally, SSL should be enabled if BR2_PACKAGE_OPENSSL is y.

 Adding support for HAVE_MD5, NDEBUG, NO_CGI and USE_LUA would also be
nice.

> +ifeq ($(BR2_PACKAGE_MONGOOSE_NO_PUT_AUTH),y)
> +MONGOOSE_OPTIONAL_DEFINES += -DNO_PUT_AUTH

 If the patch is removed then obviously this should also be removed.

> +endif
> +
> +define MONGOOSE_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" LD="$TARGETLD)" -C $(@D) linux COPT="$(MONGOOSE_OPTIONAL_DEFINES)"

 Missing ( in $(TARGET_LD). But the Makefile doesn't use LD so it's
redundant.

 TARGET_CFLAGS and TARGET_LDFLAGS should also be passed - but mongoose's
Makefile doesn't support that. Your options are:

- Patch the Makefile to use CFLAGS += instead of CFLAGS =; if you do that,
also rename LINFLAGS to LDFLAGS, and use += instead of = for that as well.
And of course upstream this patch.

- Add TARGET_CFLAGS to COPT. You could also ad TARGET_LDFLAGS because
there is anyway no object file compilation, but it's not ideal. If you
leave out TARGET_LDFLAGS it's not such a big deal anyway because it's
not often used.

- Don't use the Makefile, but just run:

	cd $(@D); $(TARGET_CC) $(TARGET_CFLAGS) mongoose.c main.c \
		$(TARGET_LDFLAGS) -ldl -pthread


> +endef
> +
> +define MONGOOSE_INSTALL_STAGING_CMDS
> +	$(INSTALL) -d $(STAGING_DIR)/sbin
> +	$(INSTALL) -d $(STAGING_DIR)/etc
> +	$(INSTALL) -d $(STAGING_DIR)/etc/init.d
> +	$(INSTALL) -D -m 755 $(@D)/mongoose $(STAGING_DIR)/sbin/mongoose
> +	$(INSTALL) -D -m 755 $(@D)/mongoose.init $(STAGING_DIR)/etc/init.d/mongoose

 Neither of these should be installed in staging. As I said earlier, it does
make sense to install the header and the .so.

> +endef
> +
> +define MONGOOSE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -d $(TARGET_DIR)/sbin
> +	$(INSTALL) -d $(TARGET_DIR)/etc
> +	$(INSTALL) -d $(TARGET_DIR)/etc/init.d

 The install -D below already creates the directories, so these three are redundant.

> +	$(INSTALL) -D -m 755 $(@D)/mongoose $(TARGET_DIR)/sbin/mongoose
> +	$(INSTALL) -D -m 755 $(@D)/mongoose.init $(TARGET_DIR)/etc/init.d/mongoose
> +endef
> +
> +
> +$(eval $(generic-package))
> +

 Redundant empty line.


 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
