From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Sep 2014 09:23:06 +0200
Subject: [Buildroot] [PATCH 1/2] libtirpc: add dependency on atomic
	operations
In-Reply-To: <1410157964-8422-2-git-send-email-abrodkin@synopsys.com>
References: <1410157964-8422-1-git-send-email-abrodkin@synopsys.com>
 <1410157964-8422-2-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140908092306.12308c5a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon,  8 Sep 2014 10:32:43 +0400, Alexey Brodkin wrote:
> Fixes:
> http://autobuild.buildroot.net/results/6bb90d3f2b840a1faacf152a1d93a909a2dc98d3
> http://autobuild.buildroot.net/results/994a84d192848b90a70e28e5ebaa769701bcaec9
> 
> Following packages select "libtirpc", so adding dependency as well:
>  * argus
>  * conntrack-tools
>  * lmbench
>  * nfs-utils
>  * quota
>  * rpcbind
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

That's not that simple because you forget to update the comments: they
should not be displayed if the architecture doesn't have the atomic
intrinsics. And this is where things start to be really, really weird.


> diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
> index ec19d8e..36b12b7 100644
> --- a/package/conntrack-tools/Config.in
> +++ b/package/conntrack-tools/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
>  	depends on BR2_INET_IPV6
>  	depends on BR2_LARGEFILE
>  	depends on BR2_USE_MMU # fork()
> +	depends on BR2_ARCH_HAS_ATOMICS # libtirpc

That's not correct: if the toolchain has native RPC support, we do not
need libtirpc, so there is no need to depend on BR2_ARCH_HAS_ATOMICS in
this case.

I already tried to solve this thing, but it's much more complicated
than just adding a bunch of "depends on".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
