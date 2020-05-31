From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 May 2020 22:57:13 +0200
Subject: [Buildroot] [PATCH] package/linux-headers: add support for CIP
 with same-as-kernel
In-Reply-To: <20200513174809.30110-1-yann.morin.1998@free.fr>
References: <20200513174809.30110-1-yann.morin.1998@free.fr>
Message-ID: <20200531225713.26992f0d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 13 May 2020 19:48:09 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> When the linux-headers are configured to use the same source as the
> kernel (BR2_KERNEL_HEADERS_AS_KERNEL), and the kernel is configured
> to be one of the two CIP version (BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> or BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION), the build fails if the
> kernel sources are not already downloaded:
> 
>     $ cat defconfig
>     BR2_LINUX_KERNEL=y
>     BR2_LINUX_KERNEL_LATEST_CIP_VERSION=y
>     $ make defconfig BR2_DEFCONFIG=$pwd)/defconfig
>     $ make linux-headers-source
> 
>     >>> linux-headers 4.19.118-cip25 Downloading  
>     --2020-05-13 19:28:44--  https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.19.118-cip25.tar.xz
>     Resolving cdn.kernel.org (cdn.kernel.org)... 2a04:4e42:1d::432, 151.101.121.176
>     Connecting to cdn.kernel.org (cdn.kernel.org)|2a04:4e42:1d::432|:443... connected.
>     HTTP request sent, awaiting response... 404 Not Found
>     2020-05-13 19:28:45 ERROR 404: Not Found.
> 
>     make[1]: *** [package/pkg-generic.mk:171: /home/ymorin/dev/buildroot/O/build/linux-headers-4.19.118-cip25/.stamp_downloaded] Error 1
>     make: *** [Makefile:23: _all] Error 2
> 
> We fix that by addingyet another duplication of information out of the
> linux.mk, to use the CIP-specific git tree where to get the archives as
> snapshots.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/linux-headers/linux-headers.mk | 5 +++++
>  1 file changed, 5 insertions(+)

I've applied to master after fixing small typos in the commit log.
However, this linux-headers/linux duplication is really getting out of
control...

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
