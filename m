From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 May 2020 10:14:55 +0200
Subject: [Buildroot] [PATCH 2/8] support/dependencies: check that host
 have gcc plugin headers
In-Reply-To: <20200519072850.898877-3-kamel.bouhara@bootlin.com>
References: <20200519072850.898877-1-kamel.bouhara@bootlin.com>
 <20200519072850.898877-3-kamel.bouhara@bootlin.com>
Message-ID: <20200519101455.136f0c40@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 19 May 2020 09:28:44 +0200
Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:

> Some packages requires host gcc headers to build gcc plugins. This
> checks they are indeed installed.
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>

This should have been squashed with PATCH 3/8.

> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 98469bd70c..fcf52818f1 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -240,6 +240,16 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BR2_CONFIG ; then
>  	fi
>  fi
>  
> +if grep ^BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT=y $BR2_CONFIG ; then
> +	if ! echo "#include <gcc-plugin.h>" | g++ -I$(g++ -print-file-name=plugin)/include -x c++ -c - -o /dev/null ; then

use $HOSTCXX_NOCCACHE instead of g++.

No need to send a new iteration just for that, it can be fixed when
applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
