From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jun 2012 12:08:12 +0200
Subject: [Buildroot] [PATCH] New package: cJSON (v2)
In-Reply-To: <1338856703-4082-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Mon, 4 Jun 2012 20:38:23 -0400")
References: <1338856703-4082-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87txyif9f7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 Danomi> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
 Danomi> ---
 Danomi>  package/Config.in       |    1 +
 Danomi>  package/cjson/Config.in |    7 +++++++
 Danomi>  package/cjson/cjson.mk  |   41 +++++++++++++++++++++++++++++++++++++++++

 Danomi> +++ b/package/cjson/cjson.mk
 Danomi> @@ -0,0 +1,41 @@
 Danomi> +#############################################################
 Danomi> +#
 Danomi> +# cjson
 Danomi> +#
 Danomi> +#############################################################
 Danomi> +CJSON_VERSION         = undefined
 Danomi> +CJSON_SOURCE          = cJSONFiles.zip
 Danomi> +CJSON_SITE            = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/cjson/
 Danomi> +CJSON_INSTALL_STAGING = YES
 Danomi> +
 Danomi> +define CJSON_EXTRACT_CMDS
 Danomi> +	unzip -d $(@D) $(DL_DIR)/$(CJSON_SOURCE)
 Danomi> +endef
 Danomi> +
 Danomi> +define CJSON_BUILD_CMDS
 Danomi> +	cd $(@D)/cJSON && $(TARGET_CC) -Wall -O2 -shared -fpic cJSON.c -o libcJSON.so

I'm not sure it makes sense to build a .so of something as simple (and
unversioned) as this. How about just doing a static .a like ezxml? You
also shouldn't hardcode compiler flags like -Wall / -O2 but use
$(TARGET_CFLAGS) instead - E.G.

cd $(@D)/cJSON && $(TARGET_CC) $(TARGET_CFLAGS) -o cJSON.o cJSON.c
cd $(@D)/cJSON && $(TARGET_AR) rcs libcJSON.a cJSON.o



 Danomi> +endef
 Danomi> +
 Danomi> +define CJSON_INSTALL_STAGING_CMDS
 Danomi> +	$(INSTALL) -D $(@D)/cJSON/cJSON.h $(STAGING_DIR)/usr/include/cJSON.h
 Danomi> +	$(INSTALL) -D $(@D)/cJSON/libcJSON.so $(STAGING_DIR)/usr/lib/libcJSON.so
 Danomi> +endef
 Danomi> +
 Danomi> +define CJSON_INSTALL_TARGET_CMDS
 Danomi> +	$(INSTALL) -D $(@D)/cJSON/libcJSON.so $(TARGET_DIR)/usr/lib/libcJSON.so

You should also install the header file into TARGET_DIR. It will get
removed by target-finalize if it isn't needed.

Care to fix and resend?
 
-- 
Bye, Peter Korsgaard
