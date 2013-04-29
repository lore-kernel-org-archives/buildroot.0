From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 29 Apr 2013 22:55:15 +0200
Subject: [Buildroot] [PATCH] libjson: new package
In-Reply-To: <1364416080-10797-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Wed, 27 Mar 2013 20:28:00 +0000")
References: <1364416080-10797-1-git-send-email-spdawson@gmail.com>
Message-ID: <8761z53vm4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>
 spdawson> ---
 spdawson>  package/Config.in                                  |    1 +
 spdawson>  package/libjson/Config.in                          |   11 ++++
 spdawson>  .../libjson/libjson-0001-fix-broken-makefile.patch |   16 ++++++
 spdawson>  package/libjson/libjson.mk                         |   53 ++++++++++++++++++++
 spdawson>  4 files changed, 81 insertions(+)
 spdawson>  create mode 100644 package/libjson/Config.in
 spdawson>  create mode 100644 package/libjson/libjson-0001-fix-broken-makefile.patch
 spdawson>  create mode 100644 package/libjson/libjson.mk

Committed with some modifications (see below) - Thanks.

 spdawson> +LIBJSON_LICENSE_FILES = License.txt
 spdawson> +
 spdawson> +LIBJSON_MAKE_OPT = BUILD_TYPE= SHARED=1

 spdawson> +
 spdawson> +define LIBJSON_EXTRACT_CMDS
 spdawson> +	unzip -d $(@D) $(DL_DIR)/$(LIBJSON_SOURCE)
 spdawson> +	mv $(@D)/libjson/* $(@D)
 spdawson> +	$(RM) -r $(@D)/libjson
 spdawson> +endef
 spdawson> +
 spdawson> +define LIBJSON_BUILD_CMDS
 spdawson> +	mkdir -p $(@D)/Objects_shared $(@D)/_internal/Source/Dependencies

It should be built statically if BR2_PREFER_STATIC_LIB is enabled, so
SHARED=0 and Objects_static.

It complains loudly that the assert checks are still enabled, so I've
changed it to pass -NDEBUG in CXXFLAGS, like the makefile normally does.

 spdawson> +define LIBJSON_INSTALL_TARGET_CMDS
 spdawson> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 spdawson> +		$(LIBJSON_MAKE_OPT) prefix=$(TARGET_DIR)/usr install -C $(@D)
 spdawson> +endef

It runs ldconfig after installation, which doesn't make sense for cross
compilation, and the host version is normally not in the path, so I've
stripped that.

-- 
Bye, Peter Korsgaard
