From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Sep 2020 11:20:57 +0200
Subject: [Buildroot] [PATCH 2/2] fs/jffs2: copy xattrs
In-Reply-To: <20200908085106.3197433-2-antoine.tenart@bootlin.com>
References: <20200908085106.3197433-1-antoine.tenart@bootlin.com>
 <20200908085106.3197433-2-antoine.tenart@bootlin.com>
Message-ID: <20200908112057.6e2c3caf@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  8 Sep 2020 10:51:06 +0200
Antoine Tenart <antoine.tenart@bootlin.com> wrote:

> This patch sets the --with-xattr option when generating an image with
> mkfs.jffs2 if BR2_PACKAGE_REFPOLICY is selected, so that SELinux
> security contexts will be kept and available in jffs2 images.
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
> ---
>  fs/jffs2/jffs2.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/fs/jffs2/jffs2.mk b/fs/jffs2/jffs2.mk
> index 2adbc2320e38..ac00a522cc28 100644
> --- a/fs/jffs2/jffs2.mk
> +++ b/fs/jffs2/jffs2.mk
> @@ -35,6 +35,10 @@ JFFS2_OPTS += -n
>  SUMTOOL_OPTS += -n
>  endif
>  
> +ifeq ($(BR2_PACKAGE_REFPOLICY),y)
> +JFFS2_OPTS += --with-xattr
> +endif

I'm not sure this condition should be on BR2_PACKAGE_REFPOLICY. Since
libselinux.mk is in charge of enabling xattr support in the Linux
kernel filesystem drivers, I'm tempted to say that we should be
consistent and use BR2_PACKAGE_LIBSELINUX=y as a condition here as well;

What do you think?

Note: no need to resend a new version, this can be changed when
applying.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
