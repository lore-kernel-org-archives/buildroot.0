From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 21 Nov 2019 18:35:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/minicom: make default port and
 lock directory config options
In-Reply-To: <0102016e8e961113-8b7cfd63-a693-49fd-93a3-70b7bb311860-000000@eu-west-1.amazonses.com>
References: <0102016e8e961113-8b7cfd63-a693-49fd-93a3-70b7bb311860-000000@eu-west-1.amazonses.com>
Message-ID: <adb50ede-6956-7a39-8271-48aee0bc388a@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James,

On 11/21/19 4:30 PM, James Byrne wrote:
> Minicom's configure script will set values for the default port and lock
> directory based on the configuration of the host machine, which is not
> useful for cross-compiling, so make them config options that can be set
> to suit the target system.

Good idea.

> Signed-off-by: James Byrne <james.byrne@origamienergy.com>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   package/minicom/Config.in  | 16 ++++++++++++++++
>   package/minicom/minicom.mk |  3 +++
>   2 files changed, 19 insertions(+)
> 
> diff --git a/package/minicom/Config.in b/package/minicom/Config.in
> index efc4f1b709..cb25d5710e 100644
> --- a/package/minicom/Config.in
> +++ b/package/minicom/Config.in
> @@ -14,3 +14,19 @@ config BR2_PACKAGE_MINICOM
>   comment "minicom needs a toolchain w/ wchar"
>   	depends on BR2_USE_MMU
>   	depends on !BR2_USE_WCHAR
> +
> +if BR2_PACKAGE_MINICOM
> +
> +config BR2_PACKAGE_MINICOM_DFL_PORT
> +	string "Default port"
> +	default "/dev/ttyS1"
> +	help
> +	  This option defines Minicom's default modem device.
> +
> +config BR2_PACKAGE_MINICOM_LOCK_DIR
> +	string "Lock directory"
> +	default "/var/lock"
> +	help
> +	  This option defines the com line lock directory.
> +
> +endif
> diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
> index 11d69d4d0e..7892b1f669 100644
> --- a/package/minicom/minicom.mk
> +++ b/package/minicom/minicom.mk
> @@ -22,4 +22,7 @@ define MINICOM_MKDIR_M4
>   endef
>   MINICOM_POST_PATCH_HOOKS += MINICOM_MKDIR_M4
>   
> +MINICOM_CONF_OPTS = --enable-dfl-port=$(BR2_PACKAGE_MINICOM_DFL_PORT) \
> +	--enable-lock-dir=$(BR2_PACKAGE_MINICOM_LOCK_DIR)
> +
>   $(eval $(autotools-package))
> 
