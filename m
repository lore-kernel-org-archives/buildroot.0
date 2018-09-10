From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 10 Sep 2018 18:35:21 +0000
Subject: [Buildroot] [PATCH v2 1/1] qemu: add support for python3
In-Reply-To: <20180904183934.12291-1-aduskett@gmail.com>
References: <20180904183934.12291-1-aduskett@gmail.com>
Message-ID: <1536604521.22056.20.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2018-09-04 at 14:39 -0400, Adam Duskett wrote:
> qemu 2.12.0 now supports building against python3.
> see: https://wiki.qemu.org/ChangeLog/2.12#Build_Dependencies
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Split the python version check into two seperate checks for
>     readability, one for the target, one for the host.
>   - Fix location of the python version check for target and host.


>  
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +HOST_QEMU_DEPENDENCIES += host-python3
> +HOST_QEMU_CONFIGURE_CMDS += --python=$(HOST_DIR)/bin/python3
> +else
> +HOST_QEMU_DEPENDENCIES += host-python
> +HOST_QEMU_CONFIGURE_CMDS += --python=$(HOST_DIR)/bin/python2
> +endif

This will mean that if the target system does not have python at all,
then one is forced to use host python 2.

Which is an existing buildroot problem.  But I wish it could be fixed
instead of further ingraining the concept of "host python version is
target python version or python 2 if no target python."  Because that
concept just isn't right.
