From: Ryan Coe <bluemrp9@gmail.com>
Date: Fri, 30 Dec 2016 06:54:33 -0800
Subject: [Buildroot] [PATCH] mysql: don't allow selection when
 dependencies are missing
In-Reply-To: <3856d587295ee2a012519bbfe782cddf257b2729.1483086547.git.baruch@tkos.co.il>
References: <3856d587295ee2a012519bbfe782cddf257b2729.1483086547.git.baruch@tkos.co.il>
Message-ID: <697d2049-8118-b415-9590-ada3c5cbb35d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/30/2016 12:29 AM, Baruch Siach wrote:
> Commit 3d707d2b4f (mysql: rename package to oracle-mysql, make a virtual
> package) removed all dependencies of BR2_PACKAGE_MYSQL. Now BR2_PACKAGE_MYSQL
> is selectable when no actual implementation is selectable. This confuses
> packages like open2300 that expect mysql.h when BR2_PACKAGE_MYSQL is enabled.
> Make BR2_PACKAGE_MYSQL inherit the dependencies of BR2_PACKAGE_ORACLE_MYSQL,
> since oracle mysql is the default mysql implementation.
>
> Fixes:
> http://autobuild.buildroot.net/results/c4d/c4d86cad20251a690a1d99af3740f44435f6de13/
> http://autobuild.buildroot.net/results/919/919ab62cedc25fc7c60864d99c208628edfbe472/
> http://autobuild.buildroot.net/results/bb7/bb73189b9d0850c9c4ef89c7efab2c1a261700a7/
>
> Cc: Ryan Coe <bluemrp9@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Ryan Coe <bluemrp9@gmail.com>
> ---
>   package/mysql/Config.in | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/package/mysql/Config.in b/package/mysql/Config.in
> index e485d6b99fbe..899fcfb0d304 100644
> --- a/package/mysql/Config.in
> +++ b/package/mysql/Config.in
> @@ -1,5 +1,12 @@
> +comment "mysql support needs a toolchain w/ C++, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> +
>   config BR2_PACKAGE_MYSQL
>   	bool "mysql support"
> +	depends on BR2_INSTALL_LIBSTDCPP # oracle mysql
> +	depends on BR2_USE_MMU # oracle mysql
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # oracle mysql
>   	help
>   	  Select the desired mysql provider.
>   
