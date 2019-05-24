From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 May 2019 23:15:47 +0200
Subject: [Buildroot] [PATCH v2 4/7] package/libnss: re-enable package if
 BUG_85862 is present
In-Reply-To: <20190522135906.30796-5-giulio.benetti@micronovasrl.com>
References: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
 <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
 <20190522135906.30796-5-giulio.benetti@micronovasrl.com>
Message-ID: <20190524231547.35975ecf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 May 2019 15:59:03 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

>  # --gc-sections triggers binutils ld segfault
>  # https://sourceware.org/bugzilla/show_bug.cgi?id=21180
>  ifeq ($(BR2_microblaze),y)
> @@ -33,7 +34,6 @@ LIBNSS_BUILD_VARS = \
>  	MOZILLA_CLIENT=1 \
>  	NSPR_INCLUDE_DIR=$(STAGING_DIR)/usr/include/nspr \
>  	NSPR_LIB_DIR=$(STAGING_DIR)/usr/lib \
> -	BUILD_OPT=1 \

In fact why are we building with BUILD_OPT=1 at all ? This adds some
semi-random optimization flags decided by libnss. I guess we should not
pass BUILD_OPT=1 at all, and simply pass CFLAGS=$(LIBNSS_CFLAGS), with
LIBNSS_CFLAGS = $(TARGET_CFLAGS), with -O0 added to work around the
Microblaze bug.

What do you think ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
