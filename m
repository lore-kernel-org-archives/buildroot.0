From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Dec 2010 15:43:07 +0100
Subject: [Buildroot] [PATCH v2] whetstone: new benchmark package
In-Reply-To: <1290235409-31995-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Sat, 20 Nov 2010 01:43:29 -0500")
References: <1290233458-23229-1-git-send-email-vapier@gentoo.org>
	<1290235409-31995-1-git-send-email-vapier@gentoo.org>
Message-ID: <87ipz5skxw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
 Mike> ---
 Mike> v2
 Mike> 	- tweak flag passing when building

 Mike> diff --git a/package/whetstone/Config.in b/package/whetstone/Config.in
 Mike> new file mode 100644
 Mike> index 0000000..7a68160
 Mike> --- /dev/null
 Mike> +++ b/package/whetstone/Config.in
 Mike> @@ -0,0 +1,6 @@
 Mike> +config BR2_PACKAGE_WHETSTONE
 Mike> +	bool "whetstone"
 Mike> +	help
 Mike> +	  C Converted Whetstone Double Precision Benchmark
 Mike> +
 Mike> +	  http://www.netlib.org/benchmark/
 Mike> diff --git a/package/whetstone/whetstone.mk b/package/whetstone/whetstone.mk
 Mike> new file mode 100644
 Mike> index 0000000..ab3c147
 Mike> --- /dev/null
 Mike> +++ b/package/whetstone/whetstone.mk
 Mike> @@ -0,0 +1,37 @@
 Mike> +#############################################################
 Mike> +#
 Mike> +# whetstone
 Mike> +#
 Mike> +#############################################################
 Mike> +
 Mike> +WHETSTONE_VERSION = 1.2
 Mike> +WHETSTONE_SOURCE = whetstone.c
 Mike> +WHETSTONE_SITE = http://www.netlib.org/benchmark/
 Mike> +
 Mike> +define WHETSTONE_BUILD_CMDS
 Mike> +	CFLAGS="$(TARGET_CFLAGS) -Wall -DNO_PROTOTYPES=1" \
 Mike> +	$(MAKE) \
 Mike> +		CC="$(TARGET_CC)" \
 Mike> +		LDLIBS="-lm" \
 Mike> +		-C $(@D) whetstone

Please don't add hardcoded cflags like -Wall. As it's a single file, I
would prefer to call $(TARGET_CC) directly instead of using make.

Also don't forget TARGET_LDFLAGS.

 Mike> +endef
 Mike> +
 Mike> +define WHETSTONE_CLEAN_CMDS
 Mike> +	rm -f $(@D)/whetstone
 Mike> +endef
 Mike> +
 Mike> +define WHETSTONE_INSTALL_TARGET_CMDS
 Mike> +	$(INSTALL) -D $(@D)/whetstone $(TARGET_DIR)/bin/whetstone

I would have expected it to get installed into /usr/bin

-- 
Bye, Peter Korsgaard
