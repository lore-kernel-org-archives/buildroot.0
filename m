From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 12:35:51 +0200
Subject: [Buildroot] [PATCH v7 21/22] mtd: Add xattr support
In-Reply-To: <1433251718-3167-22-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-22-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150706123551.1715abd3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Tue,  2 Jun 2015 08:28:37 -0500, Clayton Shotwell wrote:

> -HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-e2fsprogs
> +MTD_MAKE_OPTS = WITHOUT_LARGEFILE=1
> +
> +# If extended attributes are required, the acl package must
> +# also be enabled which will also include the attr package.
> +ifeq ($(BR2_PACKAGE_ACL),y)
> +MTD_DEPENDENCIES += acl
> +MTD_MAKE_OPTS += WITHOUT_XATTR=0
> +else
> +MTD_MAKE_OPTS += WITHOUT_XATTR=1
> +endif
> +
> +HOST_MTD_DEPENDENCIES += host-zlib host-lzo host-e2fsprogs

The change from = to += for HOST_MTD_DEPENDENCIES was unnecessary.

I've applied your patch after changing this.

However, this basically only changes mkfs.jffs2 on the target. Do you
really use mkfs.jffs2 on the target? Don't you also need xattr support
in the host mkfs.jffs2 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
