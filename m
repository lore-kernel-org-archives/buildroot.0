From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 22:32:02 +0200
Subject: [Buildroot] [PATCH 3/3] alsaequal: new package
In-Reply-To: <1398374384-8814-3-git-send-email-martin@barkynet.com>
References: <1398374384-8814-1-git-send-email-martin@barkynet.com>
 <1398374384-8814-3-git-send-email-martin@barkynet.com>
Message-ID: <20140804223202.62f5c129@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Thu, 24 Apr 2014 22:19:44 +0100, Martin Bark wrote:

> diff --git a/package/alsaequal/alsaequal-01-cross-compile-fix.patch b/package/alsaequal/alsaequal-01-cross-compile-fix.patch
> new file mode 100644
> index 0000000..6133106
> --- /dev/null
> +++ b/package/alsaequal/alsaequal-01-cross-compile-fix.patch
> @@ -0,0 +1,17 @@

Description + Signed-off-by.

> +--- alsaequal-0.6.original/Makefile	2010-03-05 17:30:39.000000000 +0000
> ++++ alsaequal-0.6/Makefile	2014-04-24 16:25:59.468030181 +0100
> +@@ -4,10 +4,10 @@
> + #Q	?=
> + 
> + # Build Tools
> +-CC 	:= gcc
> +-CFLAGS := -I. -O2 -Wall -funroll-loops -ffast-math -fPIC -DPIC
> +-LD := gcc
> +-LDFLAGS := -O2 -Wall -shared -lasound
> ++CC 	?= gcc
> ++CFLAGS += -I. -Wall -ffast-math -fPIC -DPIC
> ++LD := $(CC)
> ++LDFLAGS := -shared -lasound
> + 
> + SND_PCM_OBJECTS = pcm_equal.o ladspa_utils.o
> + SND_PCM_LIBS =
> diff --git a/package/alsaequal/alsaequal-05_fix-eq-name.patch b/package/alsaequal/alsaequal-05_fix-eq-name.patch

Should be alsaequal-02-fix-eq-name.patch (notice the sequence number
and the difference between - and _).

Also description + Signed-off-by.


> diff --git a/package/alsaequal/alsaequal.mk b/package/alsaequal/alsaequal.mk
> new file mode 100644
> index 0000000..5669b55
> --- /dev/null
> +++ b/package/alsaequal/alsaequal.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# alsaequal
> +#
> +################################################################################
> +
> +ALSAEQUAL_VERSION = 0.6
> +ALSAEQUAL_SOURCE = alsaequal-$(ALSAEQUAL_VERSION).tar.bz2
> +ALSAEQUAL_SITE = http://www.thedigitalmachine.net/tools/
> +ALSAEQUAL_LICENSE = LGPLv2.1
> +ALSAEQUAL_LICENSE_FILES = COPYING
> +ALSAEQUAL_DEPENDENCIES = alsa-lib
> +
> +define ALSAEQUAL_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
> +endef
> +
> +define ALSAEQUAL_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
> +endef

Same comments here for $(TARGET_MAKE_ENV) and $(TARGET_CONFIGURE_OPTS)
as the ones made on the 'caps' package.

So there's really no build dependency on ladspa or caps in alsaequal ?

Like the ladspa-sdk and caps patches, I've marked this one as
"Changes requested" in our patch tracking system. Could you resubmit an
updated version of those patches?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
