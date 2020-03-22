From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 08:19:38 +0100
Subject: [Buildroot] [PATCH] linux: do not run depmod during the
 installation
In-Reply-To: <20200321235703.10622-1-unixmania@gmail.com>
References: <20200321235703.10622-1-unixmania@gmail.com>
Message-ID: <20200322071938.GP4290@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2020-03-21 20:57 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> The kernel "install" target runs depmod by means of a wrapper script
> (scripts/depmod.sh), so passing a dummy depmod (e.g. /dev/null) would
> cause warning messages like this:
> 
>     DEPMOD  5.4.27
>     ./scripts/depmod.sh: 46: /dev/null: Permission denied
>     make[2]: *** [Makefile:1326: _modinst_post] Error 126
> 
> We can avoid running the script by overriding the cmd_depmod variable,
> which contains the command line to run depmod.
> 
> As a safety measure, setting DEPMOD to /bin/false makes the installation
> fail if overriding cmd_depmod does not work in a future kernel version.

Really, what's the problem with running this demod here?

The default AArch64 kernel defconfig takes almost 12 minutes to build on
my machine, and the install, including running depmod, takes just under
14 seconds (including parsing all Buildroot Makefiles!).

So running depmod is hardly a time hog...

> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> CC: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  linux/linux.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 2e3ea52053..383d1908d6 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -134,7 +134,8 @@ LINUX_MAKE_FLAGS = \
>  	ARCH=$(KERNEL_ARCH) \
>  	INSTALL_MOD_PATH=$(TARGET_DIR) \
>  	CROSS_COMPILE="$(TARGET_CROSS)" \
> -	DEPMOD=$(HOST_DIR)/sbin/depmod
> +	DEPMOD=/bin/false \
> +	cmd_depmod=":"

This is touching the internals of the kernel, so no.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_REPRODUCIBLE),y)
>  LINUX_MAKE_ENV += \
> -- 
> 2.18.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
