From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 11:16:13 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: fix build break in sdk target
In-Reply-To: <20180326072332.30808-1-chemobejk@gmail.com>
References: <20180326072332.30808-1-chemobejk@gmail.com>
Message-ID: <20180326111613.002ee281@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Mar 2018 10:23:32 +0300, Stefan Becker wrote:
> After commit 6729050f3a49dba42d2d881d31dbefd6b82b8dad nothing creates
> $(HOST_DIR)/share/buildroot anymore, causing sdk to fail with:
> 
>  /bin/bash: .../output/host/share/buildroot/sdk-location: No such file or directory
> 
> Add creation of that directory to the "sdk" build steps itself.
> 
> Signed-off-by: Stefan Becker <chemobejk@gmail.com>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index a3a9d290d9..9e2402d7d9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -574,6 +574,7 @@ sdk: world
>  	$(TOPDIR)/support/scripts/fix-rpath host
>  	$(TOPDIR)/support/scripts/fix-rpath staging
>  	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
> +	mkdir -p $(HOST_DIR)/share/buildroot

While this is OK, I am still not sure to understand why you are seeing
this problem. My commit 6729050f3a49dba42d2d881d31dbefd6b82b8dad moved
the creation of the $(HOST_DIR)/share/buildroot folder from a
dependency of the toolchain package, to a post-install staging hook of
the toolchain package.

But in both cases, the logic should be executed way before
the sdk target is called.

So, I'm puzzled.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
