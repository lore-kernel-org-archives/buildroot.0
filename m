From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Mar 2016 16:53:10 +0100
Subject: [Buildroot] [PATCH] openpgm: depends on sync2/sync4
In-Reply-To: <1458138013-18031-1-git-send-email-gustavo@zacarias.com.ar>
References: <1458138013-18031-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160316165310.1b536bc3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Wed, 16 Mar 2016 11:20:13 -0300, Gustavo Zacarias wrote:
> Add dependency on BR2_TOOLCHAIN_HAS_SYNC_2/4 since it uses both
> __sync_fetch_and_add_2() and __sync_fetch_and_add_4() atomic builtins.
> Fixes:
> http://autobuild.buildroot.net/results/8f2/8f2a3571611dc9414c23808e7615f87b677557dd/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/openpgm/Config.in | 4 ++++
>  package/zeromq/Config.in  | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/package/openpgm/Config.in b/package/openpgm/Config.in
> index 94816d8..632c289 100644
> --- a/package/openpgm/Config.in
> +++ b/package/openpgm/Config.in
> @@ -1,5 +1,7 @@
>  config BR2_PACKAGE_OPENPGM
>  	bool "openpgm"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_2
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	# This toolchain lack required compiler intrinsics
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX

Maybe we can remove this dependency then?

Blackfin provides __sync_*() for 4-bytes, but not for 2 bytes.

And indeed, the original commit that added this dependency points to
http://autobuild.buildroot.org/results/3bd/3bda860a269dd9a4e38533cc9350892c68102618/build-end.log,
which shows undefined reference for the two bytes variants.

Could you submit an updated patch that removes the Blackfin dependency?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
