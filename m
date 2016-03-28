From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Mar 2016 15:15:18 +0200
Subject: [Buildroot] [PATCH] redis: needs BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <1459161143-4434-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459161143-4434-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160328151518.740749de@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Mar 2016 07:32:23 -0300, Gustavo Zacarias wrote:
> Uses 32-bit atomics, fixes:
> http://autobuild.buildroot.net/results/dfd/dfdfd77463b0ddd7016202372afcad7fb6fc9ce4/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/redis/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/redis/Config.in b/package/redis/Config.in
> index 3b7b743..20d3a13 100644
> --- a/package/redis/Config.in
> +++ b/package/redis/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_REDIS
>  	bool "redis"
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4

No, that's not good. BR2_TOOLCHAIN_HAS_SYNC_4 is, as its name suggest,
for the __sync_*() built-ins, not the __atomic_*() ones. And the
autobuild failure you point at indicates:

  undefined reference to `__atomic_fetch_add_4'

So what you need instead is:

 1/ depends on BR2_TOOLCHAIN_HAS_ATOMIC in Config.in

 2/ in the .mk file, pass -latomic if BR2_TOOLCHAIN_HAS_LIBATOMIC

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
