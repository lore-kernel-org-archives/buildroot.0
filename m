From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:42:33 +0100
Subject: [Buildroot] [PATCH 1/1] duktape: new package
In-Reply-To: <20171103195343.29670-1-fontaine.fabrice@gmail.com>
References: <20171103195343.29670-1-fontaine.fabrice@gmail.com>
Message-ID: <20171203234233.1393250e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Nov 2017 20:53:43 +0100, Fabrice Fontaine wrote:
> Duktape is an embeddable Javascript engine, with a focus on
> portability and compact footprint.
> 
> Duktape is easy to integrate into a C/C++ project: add duktape.c,
> duktape.h, and duk_config.h to your build, and use the Duktape API
> to call Ecmascript functions from C code and vice versa.
> 
> http://www.duktape.org
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

In addition to the comments already made by Peter and me, I have one
more comment below.


> +# For static library, nothing is provided by duktape so build and install it
> +ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> +define DUKTAPE_BUILD_STATIC
> +	$(TARGET_CC) $(TARGET_CFLAGS) -c $(@D)/src/duktape.c \
> +		-o $(@D)/libduktape.a
> +	$(TARGET_CC) $(TARGET_CFLAGS) -g -c $(@D)/src/duktape.c \
> +		-o $(@D)/libduktaped.a
> +endef
> +
> +define DUKTAPE_INSTALL_STATIC
> +	$(INSTALL) -m 0644 -D $(@D)/libduktape.a \
> +		$(STAGING_DIR)/usr/lib/libduktape.a
> +	$(INSTALL) -m 0644 -D $(@D)/libduktaped.a \
> +		$(STAGING_DIR)/usr/lib/libduktaped.a
> +endef
> +endif

Is duktape build system doesn't support building/installing a static
library, then just don't support it (or submit a patch upstream to add
that support). In the mean time, make the package depends
on !BR2_STATIC_LIBS and just don't support static library building.

I'll mark your patch as Changes Requested in patchwork.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
