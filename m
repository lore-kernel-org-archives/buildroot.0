From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 7 Jul 2017 06:23:01 +0300
Subject: [Buildroot] [PATCH 2/3] mtd: host variant needs host-util-linux,
 host-e2fsprogs
In-Reply-To: <20170706205849.22298-2-thomas.petazzoni@free-electrons.com>
References: <20170706205849.22298-1-thomas.petazzoni@free-electrons.com>
 <20170706205849.22298-2-thomas.petazzoni@free-electrons.com>
Message-ID: <20170707032301.5cubeqtcubznibhp@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Jul 06, 2017 at 10:58:48PM +0200, Thomas Petazzoni wrote:
> Since mtd was converted to the package infrastructure in commit
> de4cf4e9135e198d4c3beefc8ad63c03870eb78a ("mtd: convert to gentargets,
> add host package"), its host variant depended on host-e2fsprogs. At
> the time, only a host variant of the mtd package was available.
> 
> When a target variant of mtd was introduced in commit
> b50e0fa113bf641a3764ae99b94bb7ba4e1e8f85 ("mtd: add option to build
> mkfs.ubifs for target"), it depended on util-linux.
> 
> So today, the target variant continues to depend on util-linux, while
> the target variant depends on e2fsprogs. What mkfs.ubifs really needs
> is libuuid, which is provided by util-linux. It was in fact provided
> by the fact that host-e2fsprogs depends on host-util-linux.
>
> But really, host-e2fsprogs is not needed as a dependency, so use
> host-util-linux to be consistent with the target variant.

Missing 'not' in the subject line.

baruch

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/mtd/mtd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index 043f1c7..3bac2d5 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -44,7 +44,7 @@ else
>  MTD_CONF_OPTS += --without-xattr
>  endif
>  
> -HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-e2fsprogs
> +HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-util-linux
>  HOST_MTD_CONF_OPTS = --disable-tests
>  
>  MKFS_JFFS2 = $(HOST_DIR)/sbin/mkfs.jffs2

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
