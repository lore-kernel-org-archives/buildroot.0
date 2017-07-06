From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 7 Jul 2017 00:57:59 +0200
Subject: [Buildroot] [PATCH 3/3] mtd: be explicit about config options
 for the host
In-Reply-To: <20170706205849.22298-3-thomas.petazzoni@free-electrons.com>
References: <20170706205849.22298-1-thomas.petazzoni@free-electrons.com>
 <20170706205849.22298-3-thomas.petazzoni@free-electrons.com>
Message-ID: <b44bd05b-2ba9-d91a-803a-bb35cf4be5ee@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-07-17 22:58, Thomas Petazzoni wrote:
> Instead of letting auto-detection do its job, be explicit about the
> fact that we want the JFFS2 and UBIFS utilities when building the host
> variant of mtd.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/mtd/mtd.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index 3bac2d5..807f559 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -45,7 +45,10 @@ MTD_CONF_OPTS += --without-xattr
>  endif
>  
>  HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-util-linux
> -HOST_MTD_CONF_OPTS = --disable-tests
> +HOST_MTD_CONF_OPTS = \
> +	--with-jffs \
> +	--with-ubifs \

 If you do this, it would also seem natural to add

--without-xattr --with-lzo

(although we probably want xattr support in ubifs images, at least if
BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES is set, but that's for
another day :-).

 Regards,
 Arnout

> +	--disable-tests
>  
>  MKFS_JFFS2 = $(HOST_DIR)/sbin/mkfs.jffs2
>  SUMTOOL = $(HOST_DIR)/sbin/sumtool
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
