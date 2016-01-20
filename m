From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 10:18:07 +0100
Subject: [Buildroot] [PATCH] mpd: disable for sparcv8
In-Reply-To: <20160119224338.GA16884@waldemar-brodkorb.de>
References: <20160119224338.GA16884@waldemar-brodkorb.de>
Message-ID: <20160120101807.33930860@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Tue, 19 Jan 2016 23:43:38 +0100, Waldemar Brodkorb wrote:
> Even the main source code in mpd requires some missing
> atomic ops. So only disable some failing plugins, does not
> solve the following autobuild error:
> http://autobuild.buildroot.net/results/e2207280f3a177e12dba502b1c01f5aeb431d04c/
> 
> Leon3 works fine.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/mpd/Config.in |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index be0843f..b88c0ca 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -6,6 +6,7 @@ menuconfig BR2_PACKAGE_MPD
>  	depends on BR2_USE_MMU # libglib2
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
>  	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
> +	depends on !BR2_sparc_v8 # feature need atomic ops

To be honest, I don't really like this solution. I know it is the
easiest quick fix, but it's not the long-term proper solution.

Instead, I've started looking at all architectures, to see which of the
__sync_*() and __atomic_*() builtins are supported, when -latomic is
needed or not needed, etc. Once we have this picture, we can then
design how such dependencies should be expressed rather than adding
more and more architecture exclusions.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
