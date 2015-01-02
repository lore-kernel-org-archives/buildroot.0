From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 12:43:18 +0100
Subject: [Buildroot] [PATCH 05/10] package/lockdev: handle static/shared
 only build
In-Reply-To: <1419717508-11627-6-git-send-email-romain.naour@openwide.fr>
References: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
 <1419717508-11627-6-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150102124318.593ec365@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 27 Dec 2014 22:58:23 +0100, Romain Naour wrote:

>  ifeq ($(BR2_STATIC_LIBS),y)
> -define LOCKDEV_BUILD_CMDS
> -	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) static
> +LOCKDEV_BUILD_ARGS = static
> +LOCKDEV_INSTALL_ARGS = install_dev
> +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +LOCKDEV_BUILD_ARGS = static shared
> +LOCKDEV_INSTALL_ARGS = install_dev install_run
> +else # BR2_SHARED_LIBS
> +LOCKDEV_BUILD_ARGS = shared
> +LOCKDEV_INSTALL_ARGS = install_run

This case doesn't work: if you don't use the install_dev target, the
header files of lockdev will not be installed to the staging directory.
So you have to use install_dev, or rework the makefile to have two
separate targets to install the static library and the header files.

I'll mark your patch as Changes Requested in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
