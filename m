From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Aug 2012 14:54:41 +0200
Subject: [Buildroot] [PATCH 3/3] buildroot: toolchain: Allow to build
 gdbserver when external toolchain is selected.
In-Reply-To: <1344251847-7709-3-git-send-email-sonic.adi@gmail.com>
References: <1344251847-7709-1-git-send-email-sonic.adi@gmail.com>
 <1344251847-7709-3-git-send-email-sonic.adi@gmail.com>
Message-ID: <20120806145441.4dbc10ab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 6 Aug 2012 19:17:27 +0800,
Sonic Zhang <sonic.adi@gmail.com> a ?crit :

> From: Sonic Zhang <sonic.zhang@analog.com>
> 
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> ---
>  toolchain/gdb/Config.in |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
> index fd6956b..8a440d8 100644
> --- a/toolchain/gdb/Config.in
> +++ b/toolchain/gdb/Config.in
> @@ -14,14 +14,13 @@ comment "Gdb debugger for the target needs WCHAR support in toolchain"
>  
>  config BR2_PACKAGE_GDB_SERVER
>  	bool "Build gdb server for the Target"
> -	depends on !BR2_TOOLCHAIN_EXTERNAL
>  	help
>  	    Build the gdbserver stub to run on the target.
>  	    A full gdb is needed to debug the progam.
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
>  	bool "Copy gdb server to the Target"
> -	depends on BR2_TOOLCHAIN_EXTERNAL
> +	depends on BR2_TOOLCHAIN_EXTERNAL && !BR2_PACKAGE_GDB_SERVER
>  	help
>  	  Copy the gdbserver provided by the external toolchain to the
>  	  target.

Is this really a good idea? For compatibility reasons, we generally
want the gdbserver on the target to have the same version as the cross
gdb on the development machine. Therefore, in the external toolchain
case, it sounds like a really bad idea to let the user build its own
gdbserver instead of using the one of the external toolchain.

I know the Blackfin toolchains are not providing their own gdbserver
(but they provide a cross gdb), but in my opinion, it's a bug that
should be fixed in the build process of the Blackfin toolchains: they
should include their own gdbserver, just like the Linaro and Sourcery
CodeBench toolchains do.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
