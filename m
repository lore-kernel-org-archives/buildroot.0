From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 May 2020 10:02:31 +0200
Subject: [Buildroot] [PATCH 2/6] boot/uboot: support building U-Boot
 with Python 3.x
In-Reply-To: <20200502212812.51219-3-thomas.petazzoni@bootlin.com>
References: <20200502212812.51219-1-thomas.petazzoni@bootlin.com>
 <20200502212812.51219-3-thomas.petazzoni@bootlin.com>
Message-ID: <20200503080231.GV15673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-05-02 23:28 +0200, Thomas Petazzoni spake thusly:
> U-Boot versions newer than 2020.01 use Python 3.x instead of Python
> 2.x in various scripts.
> 
> We already had the BR2_TARGET_UBOOT_NEEDS_PYLIBFDT and
> BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS options, but depending on the U-Boot
> version, we now need to indicate if Python 2.x or Python 3.x should be
> used.
> 
> In addition, it turns out that some U-Boot configurations need a
> Python interpreter, without needing pylibfdt or pyelftools. Some of
> our defconfigs were abusing the BR2_TARGET_UBOOT_NEEDS_PYLIBFDT option
> to make sure a Python interpreter was built.
> 
> To solve both issues, we add a new option
> BR2_TARGET_UBOOT_NEEDS_PYTHON, which itself has a choice to choose
> between Python 2.x and Python 3.x. It defaults to Python 2.x to
> preserve backward compatibility.
> 
> The existing BR2_TARGET_UBOOT_NEEDS_PYLIBFDT and
> BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS options select
> BR2_TARGET_UBOOT_NEEDS_PYTHON.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  boot/uboot/Config.in | 29 +++++++++++++++++++++++++++++
>  boot/uboot/uboot.mk  | 12 +++++++++++-
>  2 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 7a6f5053fd..e10166a113 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -147,14 +147,43 @@ config BR2_TARGET_UBOOT_NEEDS_DTC
>  	  Select this option if your U-Boot board configuration
>  	  requires the Device Tree compiler to be available.
>  
> +config BR2_TARGET_UBOOT_NEEDS_PYTHON
> +	bool "U-Boot needs host Python"
> +
> +if BR2_TARGET_UBOOT_NEEDS_PYTHON
> +
> +choice
> +	prompt "Python version"
> +	default BR2_TARGET_UBOOT_NEEDS_PYTHON2
> +
> +config BR2_TARGET_UBOOT_NEEDS_PYTHON2
> +	bool "python 2.x"
> +	help
> +	  Select this option if U-Boot needs a host Python 2.x
> +	  interpreter. This is the case for some U-Boot
> +	  configurations, prior to U-Boot 2020.01.
> +
> +config BR2_TARGET_UBOOT_NEEDS_PYTHON3
> +	bool "python 3.x"
> +	help
> +	  Select this option if U-Boot needs a host Python 3.x
> +	  interpreter. This is the case for some U-Boot
> +	  configurations, after U-Boot 2020.01.
> +
> +endchoice

I don't like it much that construct, where a boolean hides a choice.
Instead, we can siumply use a choice (options names abbreviated as I'm
lazy to type them full):

    choice
        "Python support needed"

    config UBOOT_PY_NONE
        "none"

    config UBOOT_PY2
        "python2"

    config UBOOT_PY3
        "python3"

    endchoice

> +endif
> +
>  config BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
>  	bool "U-Boot needs pylibfdt"
> +	select BR2_TARGET_UBOOT_NEEDS_PYTHON
>  	help
>  	  Select this option if your U-Boot board configuration
>  	  requires the Python libfdt library to be available.
>  
>  config BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS
>  	bool "U-Boot needs pyelftools"
> +	select BR2_TARGET_UBOOT_NEEDS_PYTHON

Of course here (both pylibfdt and pyelftools), you'd have to switch to a
depends-on, but that does not change much afterall.

Regards,
Yann E. MORIN.

>  	help
>  	  Select this option if your U-Boot board configuration
>  	  requires the Python pyelftools library to be available.
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 7bd9cbae52..1d50e72846 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -159,12 +159,22 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
>  UBOOT_DEPENDENCIES += host-dtc
>  endif
>  
> +ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON2),y)
> +UBOOT_DEPENDENCIES += host-python
> +else ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON3),y)
> +UBOOT_DEPENDENCIES += host-python3
> +endif
> +
>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
> -UBOOT_DEPENDENCIES += host-python host-swig
> +UBOOT_DEPENDENCIES += host-swig
>  endif
>  
>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS),y)
> +ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON2),y)
>  UBOOT_DEPENDENCIES += host-python-pyelftools
> +else ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON3),y)
> +UBOOT_DEPENDENCIES += host-python3-pyelftools
> +endif
>  endif
>  
>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSSL),y)
> -- 
> 2.26.2
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
