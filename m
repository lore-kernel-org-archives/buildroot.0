From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 May 2018 08:03:15 +0200
Subject: [Buildroot] [PATCH] skeleton: create include/ directory
In-Reply-To: <9873d2e0023b87545478d0615eb5d97bcbd82c2c.1526268236.git.baruch@tkos.co.il>
References: <9873d2e0023b87545478d0615eb5d97bcbd82c2c.1526268236.git.baruch@tkos.co.il>
Message-ID: <20180514080315.049085b2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 May 2018 06:23:56 +0300, Baruch Siach wrote:
> Don't rely on a random host package to create the include/ directory for
> us. Some packages do the wrong thing since they implicitly assume that
> this directory exists already. Commit a557aedad2 (zstd: fix host headers
> installation) shows an example of that.
> 
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/skeleton/skeleton.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> index efcf420d7243..9d97f02f08bf 100644
> --- a/package/skeleton/skeleton.mk
> +++ b/package/skeleton/skeleton.mk
> @@ -16,6 +16,7 @@ SKELETON_ADD_SKELETON_DEPENDENCY = NO
>  define HOST_SKELETON_INSTALL_CMDS
>  	$(Q)ln -snf . $(HOST_DIR)/usr
>  	$(Q)mkdir -p $(HOST_DIR)/lib
> +	$(Q)mkdir -p $(HOST_DIR)/include

Following the zstd patch, I was discussing this with Yann on IRC, and
my thinking is that we normally shouldn't have to do something like
this. Packages that install stuff in ${prefix}/include should create
this folder as needed.

Now, it is true that we already create $(STAGING_DIR)/include, and it
doesn't cost much to create such a directory ahead of time.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
