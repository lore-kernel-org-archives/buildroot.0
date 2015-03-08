From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 08:53:56 +0100
Subject: [Buildroot] [PATCH] openpgm: Blacklist Blackfin ADI 2014R1
 toolchain
In-Reply-To: <1425754315-524-1-git-send-email-romain.naour@openwide.fr>
References: <1425754315-524-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150308085356.11aae236@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat,  7 Mar 2015 19:51:55 +0100, Romain Naour wrote:
> Openpgm requires compiler intrinsics not available with Blackfin ADI toolchains.
> 
> Fixes:
> http://autobuild.buildroot.net/results/394/394cf96cc0ab9029e5baa84b19e2b4d7a553f077/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/openpgm/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/openpgm/Config.in b/package/openpgm/Config.in
> index 3a26212..8d03c84 100644
> --- a/package/openpgm/Config.in
> +++ b/package/openpgm/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_OPENPGM
>  	bool "openpgm"
>  	# The following toolchains lack required compiler intrinsics
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS

When you add a new dependency to a symbol, you need to propagate this
dependency to the other symbols select that one. In this specific case,
zeromq PGM support was selecting openpgm, so you need to replicate this
dependency. I've applied after fixing that.

Also, at some point, we will need to really on the ARCH_HAS_ATOMICS
stuff for this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
