From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Jul 2020 09:46:45 +0200
Subject: [Buildroot] [PATCH 1/1] boot/optee-os: Depend on host-python3
In-Reply-To: <20200719190244.30172-1-hi@senzilla.io>
References: <20200719190244.30172-1-hi@senzilla.io>
Message-ID: <20200720094645.5bb9c7ee@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dick,

On Sun, 19 Jul 2020 19:03:01 +0000
Dick Olsson <hi@senzilla.io> wrote:

> Recent versions of OP-TEE depend on Python 3. Currently, OP-TEE is building with
> the Python interpreter provided by the user. This patch includes an upstream
> patch that makes the interpreter configurable, and makes use of this
> configuration with host-python3.
> 
> Signed-off-by: Dick Olsson <hi@senzilla.io>

Thanks for your contribution. I'm happy that you have Cc'ed Etienne,
because I really would like to have his feedback on this patch.

> diff --git a/boot/optee-os/0003-mk-core-ta-Configurable-Python-interpreter.patch b/boot/optee-os/0003-mk-core-ta-Configurable-Python-interpreter.patch
> new file mode 100644
> index 0000000000..155ee89c64
> --- /dev/null
> +++ b/boot/optee-os/0003-mk-core-ta-Configurable-Python-interpreter.patch
> @@ -0,0 +1,222 @@
> +From b267decbe19b88adaea32946bd67ea40de9f612b Mon Sep 17 00:00:00 2001
> +From: Dick Olsson <hi@senzilla.io>
> +Date: Mon, 13 Jul 2020 16:57:12 +0200
> +Subject: [PATCH 3/3] mk: core: ta: Configurable Python interpreter
> +
> +Build systems that manage multiple different python interpreters need explicit
> +control over which version of the interpreter to use. This patch enables one to
> +override the default interpreter with the path to a specific one.
> +
> +Signed-off-by: Dick Olsson <hi@senzilla.io>

If the scripts in OP-TEE do need python3, why don't they use it
explicitly ?

> diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
> index 5a786833ef..20ff053767 100644
> --- a/boot/optee-os/Config.in
> +++ b/boot/optee-os/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_TARGET_OPTEE_OS
>  	bool "optee_os"
>  	depends on BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A
> +	select BR2_PACKAGE_PYTHON3

This is clearly annoying as it brings the python3 interpreter on the
target, which clearly isn't a dependency of OP-TEE, so we definitely
don't want that.

> diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
> index c6d1bbd48a..e397e4b26e 100644
> --- a/boot/optee-os/optee-os.mk
> +++ b/boot/optee-os/optee-os.mk
> @@ -21,7 +21,7 @@ else
>  OPTEE_OS_SITE = $(call github,OP-TEE,optee_os,$(OPTEE_OS_VERSION))
>  endif
>  
> -OPTEE_OS_DEPENDENCIES = host-openssl host-python-pycryptodomex host-python-pyelftools
> +OPTEE_OS_DEPENDENCIES = host-openssl host-python3 host-python-pycryptodomex host-python-pyelftools
>  
>  # On 64bit targets, OP-TEE OS can be built in 32bit mode, or
>  # can be built in 64bit mode and support 32bit and 64bit
> @@ -32,7 +32,8 @@ OPTEE_OS_MAKE_OPTS = \
>  	CROSS_COMPILE="$(TARGET_CROSS)" \
>  	CROSS_COMPILE_core="$(TARGET_CROSS)" \
>  	CROSS_COMPILE_ta_arm64="$(TARGET_CROSS)" \
> -	CROSS_COMPILE_ta_arm32="$(TARGET_CROSS)"
> +	CROSS_COMPILE_ta_arm32="$(TARGET_CROSS)" \
> +	CFG_PYTHON="$(HOST_DIR)/bin/python"

Unless the OP-TEE scripts are changed to use python3, you will have to
use CFG_PYTHON="$(HOST_DIR)/bin/python3" here.

However, when you'll drop "select BR2_PACKAGE_PYTHON3", it means that
python3 will no longer be the default host Python interpreter. And
therefore, if you want to have host-python-pycryptodomex and
host-python-pyelftools guaranteed to be installed for Python3, you have
to use host-python3-pyelftools (which exists) and
host-python3-pycryptodomex (which doesn't exist, you'll have to create
it).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
