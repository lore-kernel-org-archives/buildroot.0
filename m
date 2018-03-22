From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 22 Mar 2018 09:22:05 -0300 (BRT)
Subject: [Buildroot] [PATCH] tpm2-tools: propagate dependencies of
 selected packages
In-Reply-To: <0bc695b6c1b76b30190ebddff065b6adb5d755f9.1521659099.git.baruch@tkos.co.il>
References: <0bc695b6c1b76b30190ebddff065b6adb5d755f9.1521659099.git.baruch@tkos.co.il>
Message-ID: <2128061294.712847.1521721325466.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Baruch Siach" <baruch@tkos.co.il>
> To: "buildroot" <buildroot@busybox.net>
> Cc: "Baruch Siach" <baruch@tkos.co.il>, "Carlos Santos" <casantos@datacom.ind.br>
> Sent: Wednesday, March 21, 2018 4:04:59 PM
> Subject: [PATCH] tpm2-tools: propagate dependencies of selected packages

> Fixes (libglib):
> http://autobuild.buildroot.net/results/786/786859fccc477de1519d85d8a180626bb8ebe062/
> http://autobuild.buildroot.net/results/df6/df6518f331c16b477c6e934914d0e56dc102c228/
> 
> Cc: Carlos Santos <casantos@datacom.ind.br>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> package/tpm2-tools/Config.in | 7 +++++++
> 1 file changed, 7 insertions(+)
> 
> diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
> index 6429b24531b1..3bde934daef5 100644
> --- a/package/tpm2-tools/Config.in
> +++ b/package/tpm2-tools/Config.in
> @@ -1,5 +1,8 @@
> config BR2_PACKAGE_TPM2_TOOLS
> 	bool "tpm2-tools"
> +	depends on BR2_USE_MMU # dbus, libglib
> +	depends on BR2_USE_WCHAR # libglib -> gettext
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib
> 	select BR2_PACKAGE_DBUS
> 	select BR2_PACKAGE_LIBCURL
> 	select BR2_PACKAGE_LIBGLIB2
> @@ -14,3 +17,7 @@ config BR2_PACKAGE_TPM2_TOOLS
> 	  implementation.
> 
> 	  https://github.com/tpm2-software/tpm2-tools
> +
> +comment "tpm2-tools need a toolchain w/ wchar, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

It needs C++ too, due to tpm2-tss. I'm already working on a patch to
solve this problem.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
