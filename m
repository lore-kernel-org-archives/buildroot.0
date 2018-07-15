From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Jul 2018 17:57:14 +0200
Subject: [Buildroot] [PATCH 1/6] tini: new package
In-Reply-To: <20180715010732.21765-1-christian@paral.in>
References: <20180715010732.21765-1-christian@paral.in>
Message-ID: <20180715155714.GE2516@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2018-07-14 18:07 -0700, Christian Stewart spake thusly:
> Tini is a minimal init process to act as PID 1 for containers.
> 
> Tini can be used to satisfy docker-engine's docker-init binary
> requirement.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
[--SNIP--]
> diff --git a/package/tini/tini.mk b/package/tini/tini.mk
> new file mode 100644
> index 0000000000..9f9d986745
> --- /dev/null
> +++ b/package/tini/tini.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# tini
> +#
> +################################################################################
> +
> +TINI_VERSION = v0.17.0
> +TINI_SITE = $(call github,krallin,tini,$(TINI_VERSION))
> +
> +TINI_LICENSE = MIT
> +TINI_LICENSE_FILES = LICENSE
> +
> +TINI_CFLAGS = $(TARGET_CFLAGS) -DTINI_VERSION=\"$(TINI_VERSION)\" -DTINI_GIT=\"\"
> +TINI_CFLAGS += -static

I know the rationale behind doing a static build here. However, I ahve a
more profound concern. Lemme explain:

If you are going to be runnin "something" inside a docker-based container,
surely you will have to provide said "something". Probalby a system on
its own, build with Buildroot, or not.

So, why would not that system provide its own init process, how complex
might it ever be (ranging from the simplest like tini, to a full-blown
systemd for example).

So, why would it be the responsibility of the host system to provide the
init program, rather that the responsibility of the guest system?

Note that I did not say we did not want tini. We do want it so that we
can build an image that can later server as a guest, bringing its own
tini (or dumb-init or whatever).

So, I still question the reason to have tini built as a static binary,
provided from the host to the guest...

Regards,
Yann E. MORIN.

> +ifeq ($(BR2_PACKAGE_TINI_MINIMAL),y)
> +TINI_CFLAGS += -DTINI_MINIMAL
> +endif
> +
> +define TINI_CONFIGURE_CMDS
> +	printf "#pragma once\n" > $(@D)/src/tiniConfig.h
> +endef
> +
> +define TINI_BUILD_CMDS
> +	$(TARGET_CC) \
> +		$(TINI_CFLAGS) \
> +		-o $(@D)/tini $(@D)/src/tini.c
> +endef
> +
> +define TINI_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/tini $(TARGET_DIR)/usr/bin/tini
> +endef
> +
> +# Tini's CMakeLists.txt is not suitable for Buildroot.
> +$(eval $(generic-package))
> -- 
> 2.16.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
