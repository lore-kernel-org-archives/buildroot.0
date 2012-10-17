From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Oct 2012 22:12:15 +0200
Subject: [Buildroot] [PATCH] lcdapi: new package
In-Reply-To: <1350482898-5980-1-git-send-email-spdawson@gmail.com>
References: <1350482898-5980-1-git-send-email-spdawson@gmail.com>
Message-ID: <507F111F.1070107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/10/12 16:08, spdawson at gmail.com wrote:
> From: Simon Dawson<spdawson@gmail.com>
>
> Signed-off-by: Simon Dawson<spdawson@gmail.com>
[snip]
> diff --git a/package/lcdapi/lcdapi-make-toString-static.patch b/package/lcdapi/lcdapi-make-toString-static.patch
> new file mode 100644
> index 0000000..0ef95fc
> --- /dev/null
> +++ b/package/lcdapi/lcdapi-make-toString-static.patch
> @@ -0,0 +1,19 @@
> +make the toString function defined in the LCDCallback.h header into a static
> +function, to fix link-time errors like the following.
> +
> +  multiple definition of `toString(char)'
> +
> +Signed-off-by: Simon Dawson<spdawson@gmail.com>
> +
> +diff -Nurp a/keys/LCDCallback.h b/keys/LCDCallback.h
> +--- a/keys/LCDCallback.h	2004-07-27 19:06:27.000000000 +0100
> ++++ b/keys/LCDCallback.h	2012-10-01 10:59:52.685708010 +0100
> +@@ -77,7 +77,7 @@ class LCDCallback
> +
> + typedef std::map<KeyEvent, LCDCallback *>  CallbackMap;
> +
> +-std::string toString(KeyEvent t)
> ++static std::string toString(KeyEvent t)

  Making it inline sounds more appropriate.

  BTW, did you upstream the patches?

> + {
> +   std::string s(1, (char)t);
> +   return s;
> diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
> new file mode 100644
> index 0000000..37e276c
> --- /dev/null
> +++ b/package/lcdapi/lcdapi.mk
> @@ -0,0 +1,73 @@
> +#############################################################
> +#
> +# lcdapi
> +#
> +#############################################################
> +LCDAPI_VERSION = 0.2
> +LCDAPI_SITE = ftp://ftp2.c-sait.net/csait
> +LCDAPI_DEPENDENCIES = host-lcdapi

  Why is this needed?  Or rather: I can build without this.
If it is not needed, the whole host-lcdapi can be removed BTW.

> +LCDAPI_INSTALL_STAGING = YES
> +
> +LCDAPI_LICENSE = LGPLv2.1+
> +LCDAPI_LICENSE_FILES = COPYING
> +
> +LCDAPI_MAKE_OPT = \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	LD="$(TARGET_CXX)" \
> +	LDFLAGS="$(TARGET_LDFLAGS) -shared"

  It would make sense to also add CC="$(TARGET_CXX)" (although not strictly
necessary, because gcc recognizes the .cpp extension).

  More importantly, the CFLAGS overrides the CFLAGS of lcdapi's
Makefile, and that contains the all-important -fPIC.  I wonder
how you got it built without that...  So either:

- Set CFLAGS to "$(TARGET_CFLAGS) -fPIC"
- Patch the Makefile to append to CFLAGS
- Set CC to "$(TARGET_CXX) $(TARGET_CFLAGS)" and leave CFLAGS alone

  Finally, it would make sense to call it LCDAPI_MAKE_OPTS,
similar to TARGET_CONFIGURE_OPTS.

> +
> +HOST_LCDAPI_MAKE_OPT = \
> +	$(HOST_CONFIGURE_OPTS) \
> +	LD="$(HOSTCXX)" \
> +	LDFLAGS="$(HOST_LDFLAGS) -shared"
> +
> +define LCDAPI_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(LCDAPI_MAKE_OPT) -C $(@D)
> +endef
> +
> +define HOST_LCDAPI_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) $(HOST_LCDAPI_MAKE_OPT) -C $(@D)
> +endef
> +
> +define DO_LCDAPI_INSTALL
> +	$(INSTALL) -m 0755 -d $(1)/usr/lib
> +	$(INSTALL) -m 0755 -t $(1)/usr/lib $(@D)/lib/liblcdapi.so

  We would typically use
	$(INSTALL) -m 0755 -D $(@D)/lib/liblcdapi.so $(1)/usr/lib
(which does the mkdir and the install in one shot).

> +	$(INSTALL) -m 0755 -d $(1)/usr/include/lcdapi
> +	for i in api include keys sensors; do \
> +		$(INSTALL) -m 0755 -d $(1)/usr/include/lcdapi/$$i&&  \
> +		$(INSTALL) -m 0644 -t $(1)/usr/include/lcdapi/$$i \
> +			$(@D)/$$i/*.h; \

  Same here, but then iterating over api/*.h include/*.h keys/*.h sensors/*.h


  But wouldn't it be cleaner to add (and upstream) an 'install' target
to the Makefile?


  Regards,
  Arnout

> +	done
> +endef
> +
> +define DO_LCDAPI_UNINSTALL
> +	$(RM) $(1)/usr/lib/liblcdapi.so
> +	$(RM) -r $(1)/usr/include/lcdapi
> +endef
> +
> +define HOST_LCDAPI_INSTALL_CMDS
> +	$(call DO_LCDAPI_INSTALL,$(HOST_DIR))
> +endef
> +
> +define LCDAPI_INSTALL_STAGING_CMDS
> +	$(call DO_LCDAPI_INSTALL,$(STAGING_DIR))
> +endef
> +
> +define LCDAPI_INSTALL_TARGET_CMDS
> +	$(call DO_LCDAPI_INSTALL,$(TARGET_DIR))
> +endef
> +
> +define LCDAPI_UNINSTALL_STAGING_CMDS
> +	$(call DO_LCDAPI_UNINSTALL,$(STAGING_DIR))
> +endef
> +
> +define LCDAPI_UNINSTALL_TARGET_CMDS
> +	$(call DO_LCDAPI_UNINSTALL,$(TARGET_DIR))
> +endef
> +
> +define LCDAPI_CLEAN_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(LCDAPI_MAKE_OPT) -C $(@D) clean
> +endef
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
