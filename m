From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2020 14:39:41 +0100
Subject: [Buildroot] [PATCH v3 03/11] package/edk2-platforms: new package
In-Reply-To: <20201218202646.1060123-4-hi@senzilla.io>
References: <20201218202646.1060123-1-hi@senzilla.io>
 <20201218202646.1060123-4-hi@senzilla.io>
Message-ID: <20201230133941.GR1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dick, All,

On 2020-12-18 20:27 +0000, Dick Olsson via buildroot spake thusly:
> EDK2 firmware is usually built from two sources; the core EDK2
> environment, and additional platform description files maintained
> separately. This host package adds the latter set of description files
> that the core EDK2 package will depend on for certain platforms during
> the building process.
> 
> Signed-off-by: Dick Olsson <hi@senzilla.io>
[--SNIP--]
> diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
> new file mode 100644
> index 0000000000..6ba8bf130b
> --- /dev/null
> +++ b/package/edk2-platforms/edk2-platforms.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# edk2-platforms
> +#
> +################################################################################
> +
> +EDK2_PLATFORMS_VERSION = 7aab81a35aef7b295e73d7d6dfd528cc812790ed
> +EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
> +EDK2_PLATFORMS_LICENSE = BSD-2-Clause
> +EDK2_PLATFORMS_LICENSE_FILE = License.txt
> +
> +# There is nothing to build for edk2-platforms. All we need to do is to copy
> +# all description files to the host directory for other packages to build with.
> +define HOST_EDK2_PLATFORMS_INSTALL_CMDS
> +	cp -rf $(@D) $(HOST_DIR)/share/edk2-platforms

I know Thomas said to copy the files there, but I disagree; see below..

> +endef
> +
> +$(eval $(host-generic-package))

edk2-platforms provides files for the target, not for the host. As such,
it should not be a host package, but a target package.

The platform descriptions are like a small library of stuff for the
target (like a .a or a .h or any other description), and thus should be
installed in staging.

    EDK2_PLATFORMS_INSTALL_TARGET = NO
    EDK2_PLATFORMS_INSTALL_STAGING = YES

    define EDK2_PLATFORMS_INSTALL_STAGING_CMDS
        mkdir -p $(STAGING_DIR)/usr/share/edk2-platforms
        cp -a $(@D)/* $(STAGING_DIR)/usr/share/edk2-platforms/
    endef

    $(eval $(generic-package))

Regards,
Yann E. MORIN.

> -- 
> 2.25.1
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
