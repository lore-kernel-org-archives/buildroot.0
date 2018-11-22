From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 22 Nov 2018 22:18:35 +0200
Subject: [Buildroot] [PATCH 1/5] boot/optee-os: OP-TEE secure world
In-Reply-To: <1542900177-17343-1-git-send-email-etienne.carriere@linaro.org>
References: <1542900177-17343-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <87tvk8euhw.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Etienne,

Thanks for your contribution. I have a few comments below.

Etienne Carriere writes:
> OP-TEE OS is maintained by the OP-TEE project. It provides an
> open source solution for development and integration of secure
> services for Armv7-A and Armv8-A CPU based platforms supporting
> the TrustZone technology. This technology enables CPUs to
> concurrently host a secure world as the OP-TEE OS and a non-secure
> world as a Linux based OS.
>
> The OP-TEE project maintains other packages to leverage OP-TEE on
> Linux kernel based OSes. An OP-TEE interface driver is available
> in the Linux kernel since 4.12 upon CONFIG_OPTEE.
>
> https://www.op-tee.org/
> https://github.com/OP-TEE/optee_os
>
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>

...

> diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
> new file mode 100644
> index 0000000..5968531
> --- /dev/null
> +++ b/boot/optee-os/Config.in
> @@ -0,0 +1,102 @@
> +config BR2_TARGET_OPTEE_OS
> +	bool "optee_os"
> +	depends on BR2_aarch64 || BR2_arm
> +	select BR2_PACKAGE_OPENSSL # host tool

Which host? Is that the host below which OPTEE OS runs? This is usually
called target in the Buildroot lingo. Please clarify in a comment.

Is that a build time dependency? If so you need to add openssl to
_DEPENDENCIES.

> +	help
> +	  OP-TEE OS provides the secure world boot image and the trust
> +	  application development kit of the OP-TEE project. OP-TEE OS
> +	  also provides generic trusted application one can embedded
> +	  into its system.
> +
> +	  http://github.org/OP-TEE/optee_os
> +
> +if BR2_TARGET_OPTEE_OS
> +
> +choice
> +	prompt "OP-TEE OS version"
> +	default BR2_TARGET_OPTEE_OS_LATEST
> +	help
> +	  Select the version of OP-TEE OS you want to use

Is there a practical need to support selection separate version
selection for each OPTEE component? If not then I think this version
selection should apply to all other components.

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
