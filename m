From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Jul 2018 18:01:29 +0200
Subject: [Buildroot] [PATCH v3 1/6] tini: new package
In-Reply-To: <20180715010732.21765-7-christian@paral.in>
References: <20180715010732.21765-1-christian@paral.in>
 <20180715010732.21765-7-christian@paral.in>
Message-ID: <20180715160129.GF2516@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

Gah, I previously replied to the unversioned series.... Please consider
my reply there, plus a little extra below...

On 2018-07-14 18:07 -0700, Christian Stewart spake thusly:
> Tini is a minimal init process to act as PID 1 for containers.
> 
> Tini can be used to satisfy docker-engine's docker-init binary
> requirement.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
[--SNIP--]
> diff --git a/package/tini/Config.in b/package/tini/Config.in
> new file mode 100644
> index 0000000000..235fc1a8fb
> --- /dev/null
> +++ b/package/tini/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_TINI
> +	bool "tini"

Since you want to do a static build (which I questioned in my previous
reply), you should depend on static libs being actually available,
i.e.:

    depends on !BR2_SHARED_LIBS # Static build

Regards,
Yann E. MORIN.

> +	help
> +	  tini is a simple but valid init binary to
> +	  act as PID 1 for containers.
> +
> +	  https://github.com/krallin/tini
> +
> +if BR2_PACKAGE_TINI
> +
> +config BR2_PACKAGE_TINI_MINIMAL
> +	bool "build minimal variant"
> +	help
> +	  Disables argument parsing and verbose output.
> +
> +endif
> diff --git a/package/tini/tini.hash b/package/tini/tini.hash
> new file mode 100644
> index 0000000000..c4f85c43b0
> --- /dev/null
> +++ b/package/tini/tini.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256	5244691718f6856db74dcf6dbb3576a901e737f41412e7895747f0ccb4ccaff0	tini-v0.17.0.tar.gz
> +sha256	e5f46bca81266bdd511cf08018d66866870531794569c04f9b45f50dd23c28b0	LICENSE
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
> +
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
