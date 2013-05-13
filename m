From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 May 2013 19:10:16 +0200
Subject: [Buildroot] [PATCH 1/6] package infra: remove CPPFLAGS from
 CFLAGS
In-Reply-To: <1368463259-18958-1-git-send-email-gustavo@zacarias.com.ar>
References: <1368463259-18958-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130513191016.15f0a3f4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 13 May 2013 13:40:54 -0300, Gustavo Zacarias wrote:

> -TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
> +TARGET_CFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
>  TARGET_CXXFLAGS = $(TARGET_CFLAGS)
>  TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
>  
> @@ -179,7 +179,6 @@ SED:=$(shell which sed || type -p sed) -i -e
>  
>  HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
>  HOST_CFLAGS   ?= -O2
> -HOST_CFLAGS   += $(HOST_CPPFLAGS)
>  HOST_CXXFLAGS += $(HOST_CFLAGS)
>  HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
>  HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)

Do we have packages that pass TARGET_CFLAGS and/or HOST_CFLAGS, and are
not passing TARGET_CPPFLAGS / HOST_CPPFLAGS ?

One example: the bsdiff package:

define BSDIFF_BUILD_CMDS
        $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
                $(@D)/bsdiff.c -lbz2 -o $(@D)/bsdiff
        $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
                $(@D)/bspatch.c -lbz2 -o $(@D)/bspatch
endef

After your patch, the -D_LARGEFILE_BLABLA stuff is no longer passed
when building this package.

Another example, the feh package. Another one, input-tools. And I'm
sure there are more.

So, I agree with the change, but I think it needs a much thorough
investigation of which packages are using $(TARGET_CFLAGS) without
passing $(TARGET_CPPFLAGS).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
