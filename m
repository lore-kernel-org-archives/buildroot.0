From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jan 2013 16:23:39 +0100
Subject: [Buildroot] [PATCH 2/3] rpi-userland: new package
In-Reply-To: <0e55a309b9f4a9b8ee175d301d40e7574e9227b0.1357394983.git.maxime.hadjinlian@gmail.com>
References: <cover.1357394983.git.maxime.hadjinlian@gmail.com>
 <0e55a309b9f4a9b8ee175d301d40e7574e9227b0.1357394983.git.maxime.hadjinlian@gmail.com>
Message-ID: <201301051623.39522.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On Saturday 05 January 2013 Maxime Hadjinlian wrote:
> Introducing a package to build the userland part of the Raspberry,
> needed by anyone who would want to build a rootfs for a RaspberryPi.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
[--SNIP--]
> diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
> new file mode 100644
> index 0000000..3d4585f
> --- /dev/null
> +++ b/package/rpi-userland/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_RPI_USERLAND
> +	bool "rpi-userland"
> +	select BR2_PACKAGE_LIBCOFI

Do not forget to add this dependency in the .mk (see below)

> +	help
> +	  Raspberry Pi Userland contains the necessary library to use the
> +	  VideoCore driver.

Then, what about calling this package something like 'videocore'.
I guess there areaother boards out there that use this GPU.

[--SNIP--]
> diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
> new file mode 100644
> index 0000000..5bae06d
> --- /dev/null
> +++ b/package/rpi-userland/rpi-userland.mk
> @@ -0,0 +1,25 @@
> +#############################################################
> +#
> +# rpi-userland
> +#
> +#############################################################
> +RPI_USERLAND_VERSION = 9852ce28826889e50c4d6786b942f51bccccac54
> +RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/master
> +RPI_USERLAND_LICENSE = FOSS
> +RPI_USERLAND_LICENSE_FILE = LICENCE
> +RPI_USERLAND_INSTALL_STAGING = YES

RPI_USERLAND_DPENDENCIES = libcofi

Although, is libcofi really required? I just greped for 'cofi', and found
no occurence, so I'd say it is not.

> +define RPI_USERLAND_POST_TARGET_CLEANUP
> +    rm -Rf $(TARGET_DIR)/opt/vc/include
> +    rm -Rf $(TARGET_DIR)/opt/vc/share
> +    rm -Rf $(TARGET_DIR)/opt/vc/src
> +    rm -f  $(TARGET_DIR)/etc/init.d/vcfiled
> +    rm -f  $(TARGET_DIR)/opt/vc/lib/*.a
> +    rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/etc/init.d || true
> +    mv $(TARGET_DIR)/opt/vc/lib/* $(TARGET_DIR)/usr/lib/
> +    rm -Rf $(TARGET_DIR)/opt/vc/
> +endef
> +
> +RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP
> +
> +$(eval $(cmake-package))

Untested so far, will do shortly.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
